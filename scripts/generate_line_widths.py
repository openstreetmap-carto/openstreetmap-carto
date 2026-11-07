#!/usr/bin/env python3
'''
Generates line-widths.sql from line-widths.yaml.

line-widths.sql creates the table carto_line_widths_data, one row per class and zoom level, and
the function carto_line_widths(zoom), which the roads layers join on the class of a line to get
its widths at the zoom level being rendered. The file begins with a plain text table of all the
widths by zoom level for checking.

Run as
  scripts/generate_line_widths.py > line-widths.sql
'''

import argparse
import os
import re
import sys

import yaml

MAX_ZOOM = 20  # above this zoom level the widths of MAX_ZOOM apply
SECTIONS = ('casings', 'bridge-casings', 'lines')
LINE_KEYS = ('width', 'casing', 'bridge-casing')
NAME = re.compile(r'^[a-z][a-z0-9_]*$')  # names of classes and casings, also used as SQL strings


class WidthError(Exception):
    pass


class UniqueKeyLoader(yaml.SafeLoader):
    '''A YAML loader that refuses duplicate keys, which YAML itself silently resolves to the last.'''

    def construct_mapping(self, node, deep=False):
        keys = set()
        for key_node, _ in node.value:
            key = self.construct_object(key_node, deep=deep)
            if key in keys:
                raise WidthError('row {}: {!r} is given twice'.format(key_node.start_mark.line + 1, key))
            keys.add(key)
        return super().construct_mapping(node, deep)


def number(value):
    return '%g' % value


def progression(widths, where):
    '''Checks a {zoom: width} mapping and returns it as a list of MAX_ZOOM + 1 widths or None.'''
    if not isinstance(widths, dict) or not widths:
        raise WidthError('{}: expected widths by zoom level, like {{12: 0.5, 15: 0.7}}'.format(where))
    zooms = list(widths)
    for zoom in zooms:
        if not isinstance(zoom, int) or not 0 <= zoom <= MAX_ZOOM:
            raise WidthError('{}: {!r} is not a zoom level from 0 to {}'.format(where, zoom, MAX_ZOOM))
        width = widths[zoom]
        if isinstance(width, bool) or not isinstance(width, (int, float)) or width < 0:
            raise WidthError('{}, z{}: {!r} is not a width'.format(where, zoom, width))
    if zooms != sorted(zooms):
        raise WidthError('{}: zoom levels must be listed in increasing order'.format(where))
    result = [None] * (MAX_ZOOM + 1)
    current = None
    for zoom in range(MAX_ZOOM + 1):
        current = widths.get(zoom, current)
        result[zoom] = current
    return result


def casing(value, named, used, where):
    if value is None:
        return [None] * (MAX_ZOOM + 1)
    if isinstance(value, str):
        if value not in named:
            raise WidthError('{}: there is no casing named {!r}'.format(where, value))
        used.add(value)
        return named[value]
    return progression(value, where)


def load(path):
    with open(path) as f:
        data = yaml.load(f, Loader=UniqueKeyLoader)
    if not isinstance(data, dict) or set(data) - set(SECTIONS) or 'lines' not in data:
        raise WidthError('{}: expected the sections {}'.format(path, ', '.join(SECTIONS)))
    for section in SECTIONS:
        if not isinstance(data.get(section) or {}, dict):
            raise WidthError('{}: expected names under {}'.format(path, section))
        for name in data.get(section) or {}:
            if not isinstance(name, str) or not NAME.match(name):
                raise WidthError('{}: {!r} is not a name of lower case letters, digits and _'.format(section, name))

    casings = {name: progression(widths, 'casing ' + name)
               for name, widths in (data.get('casings') or {}).items()}
    bridge_casings = {name: progression(widths, 'bridge casing ' + name)
                      for name, widths in (data.get('bridge-casings') or {}).items()}
    used_casings, used_bridge_casings = set(), set()

    lines = {}
    aliases = {}
    for name, line in data['lines'].items():
        if isinstance(line, str):
            aliases[name] = line
            continue
        if not isinstance(line, dict) or 'width' not in line or set(line) - set(LINE_KEYS):
            raise WidthError('line {}: expected width and optionally casing and bridge-casing'.format(name))
        width = progression(line['width'], 'line {}'.format(name))
        lines[name] = {
            'width': width,
            'casing': casing(line.get('casing'), casings, used_casings, 'line {}, casing'.format(name)),
            'bridge-casing': casing(line.get('bridge-casing'), bridge_casings, used_bridge_casings,
                                    'line {}, bridge-casing'.format(name)),
        }
    for name, target in aliases.items():
        if target not in lines:
            raise WidthError('line {}: there is no line {!r} to draw it like'.format(name, target))
        lines[name] = dict(lines[target], like=target)

    for name in sorted(set(casings) - used_casings):
        print('warning: casing {} is not used'.format(name), file=sys.stderr)
    for name in sorted(set(bridge_casings) - used_bridge_casings):
        print('warning: bridge casing {} is not used'.format(name), file=sys.stderr)

    return lines, casings, bridge_casings


def grid(title, rows):
    '''A plain text table of widths by zoom level, as SQL comment lines.'''
    first = min((zoom for widths in rows.values() for zoom, w in enumerate(widths) if w is not None),
                default=0)
    zooms = range(first, MAX_ZOOM + 1)
    name_width = max(len(name) for name in rows)
    out = ['-- ' + title, '--   {:<{}}'.format('', name_width) + ''.join('{:>6}'.format('z%d' % z) for z in zooms)]
    for name, widths in rows.items():
        cells = ''.join('{:>6}'.format('' if widths[z] is None else number(widths[z])) for z in zooms)
        out.append(('--   {:<{}}'.format(name, name_width) + cells).rstrip())
    return out


def generate(lines, casings, bridge_casings, source):
    out = [
        '-- This is generated code; do not change this file manually.',
        '-- To change the line widths, edit {} and run:'.format(source),
        '--   scripts/generate_line_widths.py > line-widths.sql',
        '-- and load it again with psql -d gis -f line-widths.sql',
        '--',
    ]
    out += grid('Widths of the lines, in pixels (for roads including the casing)',
                {name: line['width'] for name, line in lines.items()})
    out.append('--')
    out += grid('Casings, on either side of the line', casings)
    out.append('--')
    out += grid('Casings on bridges', bridge_casings)
    out.append('--')
    like = ['{} like {}'.format(name, line['like']) for name, line in lines.items() if 'like' in line]
    if like:
        out.append('-- Drawn like another line: ' + ', '.join(like))
        out.append('')

    out += [
        '',
        'DROP TABLE IF EXISTS carto_line_widths_data;',
        'CREATE TABLE carto_line_widths_data (',
        '    zoom integer NOT NULL,',
        '    class text NOT NULL,',
        '    line_width float NOT NULL,',
        '    casing_width float NOT NULL,',
        '    bridge_casing_width float NOT NULL,',
        '    PRIMARY KEY (zoom, class));',
        '-- If there are permission problems reading the carto_line_widths_data table,',
        '-- uncomment the line below, setting <render user> to the relevant database user',
        '-- GRANT SELECT ON carto_line_widths_data TO <render user>;',
        '',
        'INSERT INTO carto_line_widths_data (zoom, class, line_width, casing_width, bridge_casing_width) VALUES',
    ]
    rows = []
    for zoom in range(MAX_ZOOM + 1):
        for name, line in lines.items():
            width = line['width'][zoom]
            if width is None:
                continue
            casing_width = line['casing'][zoom] or 0
            bridge_casing_width = line['bridge-casing'][zoom] or 0
            rows.append("    ({}, '{}', {}, {}, {})".format(
                zoom, name, number(width), number(casing_width), number(bridge_casing_width)))
    out.append(',\n'.join(rows) + ';')
    out += [
        'ANALYZE carto_line_widths_data;',
        '',
        '-- The widths at a zoom level, those of z{0} above it, none for no zoom level. The roads layers'.format(MAX_ZOOM),
        '-- join this on the class of the line. A plain SQL function like this is inlined into the',
        '-- queries, so the planner reads the table directly.',
        'CREATE OR REPLACE FUNCTION carto_line_widths(zoom integer)',
        '  RETURNS TABLE (class text, line_width float, casing_width float, bridge_casing_width float)',
        '  LANGUAGE SQL',
        '  STABLE PARALLEL SAFE',
        'AS $$',
        'SELECT class, line_width, casing_width, bridge_casing_width',
        '  FROM carto_line_widths_data',
        '  WHERE carto_line_widths_data.zoom = CASE WHEN $1 > {0} THEN {0} ELSE $1 END'.format(MAX_ZOOM),
        '$$;',
    ]
    return '\n'.join(out) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('yaml', nargs='?', default=os.path.join(os.path.dirname(__file__), '..', 'line-widths.yaml'))
    args = parser.parse_args()
    try:
        lines, casings, bridge_casings = load(args.yaml)
    except WidthError as e:
        sys.exit('error: {}'.format(e))
    sys.stdout.write(generate(lines, casings, bridge_casings, 'line-widths.yaml'))


if __name__ == '__main__':
    main()
