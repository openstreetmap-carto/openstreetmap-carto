#!/usr/bin/env python3
'''
Generates line-widths.sql from line-widths.yaml.

line-widths.sql creates the table carto_line_widths_data, with one row per class and zoom level
and a column for every kind of width the classes in line-widths.yaml give, and the function
carto_line_widths(zoom), which the layers join on the class of a line to get its widths at the
zoom level being rendered. The file begins with plain text tables of the widths by zoom level for
checking.

Run as
  scripts/generate_line_widths.py > line-widths.sql
'''

import argparse
import os
import re
import sys

import yaml

MAX_ZOOM = 20  # above this zoom level the widths of MAX_ZOOM apply
SECTIONS = ('progressions', 'classes')
NAME = re.compile(r'^[a-z][a-z0-9_]*$')  # names of progressions, classes and columns
KEY_COLUMNS = ('zoom', 'class')


class WidthError(Exception):
    pass


class UniqueKeyLoader(yaml.SafeLoader):
    '''A YAML loader that refuses duplicate keys, which YAML itself silently resolves to the last.'''

    def construct_mapping(self, node, deep=False):
        keys = set()
        for key_node, _ in node.value:
            if key_node.tag == 'tag:yaml.org,2002:merge':
                continue
            key = self.construct_object(key_node, deep=deep)
            if key in keys:
                raise WidthError('row {}: {!r} is given twice'.format(key_node.start_mark.line + 1, key))
            keys.add(key)
        return super().construct_mapping(node, deep)


def number(value):
    return 'NULL' if value is None else '%g' % value


def check_name(name, what):
    if not isinstance(name, str) or not NAME.match(name):
        raise WidthError('{}: {!r} is not a name of lower case letters, digits and _'.format(what, name))


def progression(widths, where):
    '''Checks a {zoom: width} mapping and returns it as a list of MAX_ZOOM + 1 widths or None.'''
    if not isinstance(widths, dict) or not widths:
        raise WidthError('{}: expected widths by zoom level, like {{12: 0.5, 15: 0.7}}'.format(where))
    zooms = list(widths)
    for zoom in zooms:
        if isinstance(zoom, bool) or not isinstance(zoom, int) or not 0 <= zoom <= MAX_ZOOM:
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


def load(path):
    '''Returns the columns, the widths of the classes as {class: {column: [width by zoom]}} and
    the classes that have the widths of another one as {class: other class}.'''
    with open(path) as f:
        try:
            data = yaml.load(f, Loader=UniqueKeyLoader)
        except yaml.YAMLError as e:
            raise WidthError(str(e))
    if not isinstance(data, dict) or set(data) - set(SECTIONS) or 'classes' not in data:
        raise WidthError('{}: expected the sections progressions (optional) and classes'.format(path))

    progressions = data.get('progressions') or {}
    classes = data['classes']
    for section, value in (('progressions', progressions), ('classes', classes)):
        if not isinstance(value, dict) or not (value or section == 'progressions'):
            raise WidthError('{}: expected names with their widths'.format(section))
        for name in value:
            check_name(name, section)
    for name in set(progressions) & set(classes):
        raise WidthError('{} is the name of both a progression and a class'.format(name))
    progressions = {name: progression(widths, 'progression ' + name) for name, widths in progressions.items()}
    used = set()

    def widths_of(value, where):
        '''The widths given inline or by the name of a progression.'''
        if isinstance(value, str):
            if value not in progressions:
                raise WidthError('{}: there is no progression named {!r}'.format(where, value))
            used.add(value)
            return progressions[value]
        return progression(value, where)

    # the columns are the ones the classes give, in the order they first appear
    columns, table, aliases = [], {}, {}
    for name, widths in classes.items():
        if isinstance(widths, str):
            aliases[name] = widths
            continue
        if not isinstance(widths, dict) or not widths:
            raise WidthError('class {}: expected widths by column, like line_width: {{12: 0.5}}, '
                             'or the name of another class'.format(name))
        for column in widths:
            check_name(column, 'class {}'.format(name))
            if column in KEY_COLUMNS:
                raise WidthError('class {}: {} can not be a column'.format(name, column))
            if column not in columns:
                columns.append(column)
        table[name] = {column: widths_of(value, 'class {}, {}'.format(name, column))
                       for column, value in widths.items()}
    for name, other in aliases.items():
        if other not in table:
            raise WidthError('class {}: there is no class {!r} to take the widths of'.format(name, other))
    # the classes in the order they are listed
    table = {name: table[aliases.get(name, name)] for name in classes}

    for name in progressions:
        if name not in used:
            print('warning: progression {} is not used'.format(name), file=sys.stderr)

    return columns, table, aliases


def grid(column, table):
    '''A plain text table of the widths in one column by class and zoom level, as SQL comments.'''
    rows = {name: widths[column] for name, widths in table.items() if column in widths}
    if not rows:
        return ['-- ' + column + ': none']
    first = min(zoom for widths in rows.values() for zoom, w in enumerate(widths) if w is not None)
    zooms = range(first, MAX_ZOOM + 1)
    name_width = max(len(name) for name in rows)
    out = ['-- ' + column,
           '--   {:<{}}'.format('', name_width) + ''.join('{:>6}'.format('z%d' % z) for z in zooms)]
    for name, widths in rows.items():
        cells = ''.join('{:>6}'.format('' if widths[z] is None else number(widths[z])) for z in zooms)
        out.append(('--   {:<{}}'.format(name, name_width) + cells).rstrip())
    return out


def generate(columns, table, aliases, source):
    out = [
        '-- This is generated code; do not change this file manually.',
        '-- To change the line widths, edit {} and run:'.format(source),
        '--   scripts/generate_line_widths.py > line-widths.sql',
        '-- and load it again with psql -d gis -f line-widths.sql',
        '--',
        '-- The widths by class and zoom level, in pixels:',
        '--',
    ]
    for column in columns:
        out += grid(column, table)
        out.append('--')
    if aliases:
        out.append('-- Aliases: ' + ', '.join('{} has the widths of {}'.format(name, other)
                                             for name, other in aliases.items()))
    out.append('')

    column_list = ', '.join(columns)
    out += [
        '',
        'DROP TABLE IF EXISTS carto_line_widths_data;',
        'CREATE TABLE carto_line_widths_data (',
        '    zoom integer NOT NULL,',
        '    class text NOT NULL,',
    ] + ['    {} float,'.format(column) for column in columns] + [
        '    PRIMARY KEY (zoom, class));',
        '-- If there are permission problems reading the carto_line_widths_data table,',
        '-- uncomment the line below, setting <render user> to the relevant database user',
        '-- GRANT SELECT ON carto_line_widths_data TO <render user>;',
        '',
        'INSERT INTO carto_line_widths_data (zoom, class, {}) VALUES'.format(column_list),
    ]
    rows = []
    for zoom in range(MAX_ZOOM + 1):
        for name, widths in table.items():
            values = [widths[column][zoom] if column in widths else None for column in columns]
            if all(value is None for value in values):
                continue
            rows.append("    ({}, '{}', {})".format(zoom, name, ', '.join(number(value) for value in values)))
    out.append(',\n'.join(rows) + ';')
    out += [
        'ANALYZE carto_line_widths_data;',
        '',
        '-- The widths at a zoom level, those of z{0} above it, none for no zoom level. The layers'.format(MAX_ZOOM),
        '-- join this on the class of the line. A plain SQL function like this is inlined into the',
        '-- queries, so the planner reads the table directly. It is dropped first, as its columns',
        '-- may have changed.',
        'DROP FUNCTION IF EXISTS carto_line_widths(integer);',
        'CREATE FUNCTION carto_line_widths(zoom integer)',
        '  RETURNS TABLE (class text, {})'.format(', '.join(column + ' float' for column in columns)),
        '  LANGUAGE SQL',
        '  STABLE PARALLEL SAFE',
        'AS $$',
        'SELECT class, {}'.format(column_list),
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
        columns, table, aliases = load(args.yaml)
    except WidthError as e:
        sys.exit('error: {}'.format(e))
    sys.stdout.write(generate(columns, table, aliases, 'line-widths.yaml'))


if __name__ == '__main__':
    main()
