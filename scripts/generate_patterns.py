#!/usr/bin/env python3
# ---------------------------------------------------------------------------
#  generate_patterns.py
#
#  Generates the area fill pattern files listed in patterns.yaml from the
#  pattern sources in symbols/generating_patterns/.  See patterns.yaml for
#  how patterns are defined and symbols/generating_patterns/README.md for
#  how to make a new pattern or change an existing one.
#
#  Mapnik renders only a subset of SVG in area fill patterns, so every
#  pattern is turned into plain filled paths:
#
#   - <use> references, groups and transforms are resolved
#   - strokes are converted into filled outlines
#   - all shapes of a layer are merged into a single path in the layer color
#   - shapes are clipped exactly to the pattern size; Mapnik does not
#     support clip paths and takes the pattern size from the bounding box of
#     all path points (Bezier control points included), so no point may lie
#     outside the pattern, and an invisible rectangle spans the full size
#
#  Curves stay curves throughout, so the patterns can be rendered at any
#  resolution.
#
#  Requirements: python3 with skia-pathops, fonttools and pyyaml
#
#  Usage (run from the repository root):
#
#    scripts/generate_patterns.py              # all patterns
#    scripts/generate_patterns.py scrub reef   # selected patterns
#    scripts/generate_patterns.py --check      # verify without writing
#
#  The generated files must not be edited by hand.
# ---------------------------------------------------------------------------

import argparse
import filecmp
import math
import os
import re
import sys
import tempfile
import xml.etree.ElementTree as ET

import pathops
import yaml
from fontTools.misc.transform import Identity, Transform
from fontTools.pens.filterPen import FilterPen
from fontTools.svgLib.path.parser import parse_path

CONFIG = 'patterns.yaml'
SOURCE_DIR = 'symbols/generating_patterns'
OUTPUT_DIR = 'symbols'

PATTERN_KEYS = {'layers'}
LAYER_KEYS = {'source', 'color', 'opacity', 'erase', 'casing', 'pixel-aligned', 'min-area'}

SVG = '{http://www.w3.org/2000/svg}'
XLINK_HREF = '{http://www.w3.org/1999/xlink}href'

# Elements that are not drawn; symbols are drawn only through <use>.
NOT_DRAWN = {'defs', 'clipPath', 'metadata', 'title', 'desc', 'symbol'}
# Presentation attributes that are inherited, with their initial values
INHERITED = {'fill': 'black', 'fill-rule': 'nonzero', 'stroke': 'none',
             'stroke-width': '1', 'stroke-linecap': 'butt',
             'stroke-linejoin': 'miter', 'stroke-miterlimit': '4'}
LINECAPS = {'butt': pathops.LineCap.BUTT_CAP, 'round': pathops.LineCap.ROUND_CAP,
            'square': pathops.LineCap.SQUARE_CAP}
LINEJOINS = {'miter': pathops.LineJoin.MITER_JOIN, 'round': pathops.LineJoin.ROUND_JOIN,
             'bevel': pathops.LineJoin.BEVEL_JOIN}
NAMED_COLORS = {'black': '#000000', 'white': '#ffffff'}

# All path operations are done with keep_starting_points=False.  Keeping the
# starting points of contours has no effect on the shapes, and skia-pathops
# (0.9.2) unbalances the reference counts of True, False and small integers
# doing it, by billions for these patterns, which breaks Python 3.14.

# Precision (px) of curve approximations: round joins of strokes and casings
TOLERANCE = 0.005
# Parts of the neighboring tiles within this distance (px) of the pattern
# edges are taken into account when cutting casings
EDGE_MARGIN = 16


def fail(message):
    sys.exit('generate_patterns.py: ' + message)


# ---------------------------------------------------------------------------
#  reading pattern sources
# ---------------------------------------------------------------------------

def number(value):
    m = re.match(r'\s*([-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?)', value or '')
    if not m:
        fail('cannot read number from "%s"' % value)
    return float(m.group(1))


def numbers(value):
    return [float(v) for v in re.findall(r'[-+]?(?:\d+\.?\d*|\.\d+)(?:[eE][-+]?\d+)?', value or '')]


def normalize_color(value):
    value = NAMED_COLORS.get(value.strip().lower(), value.strip().lower())
    if re.fullmatch(r'#[0-9a-f]{3}', value):
        value = '#' + ''.join(c * 2 for c in value[1:])
    return value


def parse_transform(text):
    result = Identity
    for name, args in re.findall(r'(\w+)\s*\(([^)]*)\)', text or ''):
        v = numbers(args)
        if name == 'matrix':
            t = Transform(*v)
        elif name == 'translate':
            t = Identity.translate(v[0], v[1] if len(v) > 1 else 0)
        elif name == 'scale':
            t = Identity.scale(v[0], v[1] if len(v) > 1 else v[0])
        elif name == 'rotate':
            t = Identity.rotate(math.radians(v[0]))
            if len(v) == 3:
                t = Identity.translate(v[1], v[2]).transform(t).translate(-v[1], -v[2])
        elif name == 'skewX':
            t = Identity.skew(math.radians(v[0]), 0)
        elif name == 'skewY':
            t = Identity.skew(0, math.radians(v[0]))
        else:
            fail('unsupported transform "%s"' % name)
        result = result.transform(t)
    return result


def presentation(element, inherited):
    """The inherited presentation attributes of an element; style
    declarations take precedence over attributes."""
    result = dict(inherited)
    for name in INHERITED:
        if element.get(name) is not None:
            result[name] = element.get(name).strip()
    for declaration in element.get('style', '').split(';'):
        name, _, value = declaration.partition(':')
        if name.strip() in INHERITED and value.strip():
            result[name.strip()] = value.strip()
    return result


def is_hidden(element):
    return element.get('display') == 'none' or re.search(r'display\s*:\s*none', element.get('style', ''))


def shape_path_data(element, tag):
    """SVG path data of a basic shape element."""
    g = lambda name: number(element.get(name, '0'))
    if tag == 'path':
        return element.get('d', '')
    if tag == 'rect':
        x, y, w, h = g('x'), g('y'), g('width'), g('height')
        rx = number(element.get('rx', element.get('ry', '0')))
        ry = number(element.get('ry', element.get('rx', '0')))
        rx, ry = min(rx, w / 2), min(ry, h / 2)
        if rx <= 0 or ry <= 0:
            return 'M%r %rh%rv%rh%rz' % (x, y, w, h, -w)
        a = lambda dx, dy: 'a%r %r 0 0 1 %r %r' % (rx, ry, dx, dy)
        return ('M%r %r' % (x + rx, y) + 'h%r' % (w - 2 * rx) + a(rx, ry) + 'v%r' % (h - 2 * ry) +
                a(-rx, ry) + 'h%r' % (2 * rx - w) + a(-rx, -ry) + 'v%r' % (2 * ry - h) + a(rx, -ry) + 'z')
    if tag in ('circle', 'ellipse'):
        cx, cy = g('cx'), g('cy')
        rx = g('r') if tag == 'circle' else g('rx')
        ry = g('r') if tag == 'circle' else g('ry')
        return ('M%r %r' % (cx - rx, cy) + 'a%r %r 0 1 0 %r 0' % (rx, ry, 2 * rx) +
                'a%r %r 0 1 0 %r 0z' % (rx, ry, -2 * rx))
    if tag in ('polygon', 'polyline'):
        v = numbers(element.get('points'))
        points = ' '.join('%r %r' % (v[i], v[i + 1]) for i in range(0, len(v) - 1, 2))
        return 'M' + points + ('z' if tag == 'polygon' else '')
    if tag == 'line':
        return 'M%r %rL%r %r' % (g('x1'), g('y1'), g('x2'), g('y2'))
    fail('unsupported element <%s>' % tag)


class ClosingPen(FilterPen):
    """Closes open subpaths - fills always enclose an area."""
    def endPath(self):
        self._outPen.closePath()


def painted_areas(d, transform, attrs):
    """The areas painted by the fill and the stroke of a shape, in pattern
    coordinates, as (area, color) in paint order."""
    result = []
    scale = math.sqrt(abs(transform.xx * transform.yy - transform.xy * transform.yx)) or 1
    if attrs['fill'] != 'none':
        area = pathops.Path()
        parse_path(d, ClosingPen(area.getPen()))
        if attrs['fill-rule'] == 'evenodd':
            area.fillType = pathops.FillType.EVEN_ODD
        area = area.transform(*transform)
        area.simplify(keep_starting_points=False)
        result.append((area, normalize_color(attrs['fill'])))
    if attrs['stroke'] != 'none' and number(attrs['stroke-width']) > 0:
        line = pathops.Path()
        parse_path(d, line.getPen())
        # stroked in the local coordinate system, as the stroke width is given there
        area = stroked(line, number(attrs['stroke-width']), LINECAPS[attrs['stroke-linecap']],
                       LINEJOINS[attrs['stroke-linejoin']], number(attrs['stroke-miterlimit']),
                       TOLERANCE / scale)
        area = area.transform(*transform)
        area.simplify(keep_starting_points=False)
        result.append((area, normalize_color(attrs['stroke'])))
    return result


def read_source(filename):
    """Width, height and the painted areas (area, color) of an SVG file in
    paint order."""
    try:
        root = ET.parse(filename).getroot()
    except (OSError, ET.ParseError) as e:
        fail('cannot read %s: %s' % (filename, e))
    width, height = number(root.get('width')), number(root.get('height'))
    transform = Identity
    if root.get('viewBox'):
        vx, vy, vw, vh = numbers(root.get('viewBox'))
        transform = Identity.scale(width / vw, height / vh).translate(-vx, -vy)
    ids = {e.get('id'): e for e in root.iter() if e.get('id')}
    areas = []

    def draw(element, transform, inherited, referenced=False):
        if not element.tag.startswith(SVG):
            return  # editor metadata (Inkscape, ...)
        tag = element.tag[len(SVG):]
        if is_hidden(element) or (tag in NOT_DRAWN and not (tag == 'symbol' and referenced)):
            return
        transform = transform.transform(parse_transform(element.get('transform')))
        attrs = presentation(element, inherited)
        if tag in ('g', 'symbol'):
            for child in element:
                draw(child, transform, attrs)
        elif tag == 'use':
            href = element.get(XLINK_HREF) or element.get('href') or ''
            if href[1:] not in ids:
                fail('%s: <use> of unknown element "%s"' % (filename, href))
            x, y = number(element.get('x', '0')), number(element.get('y', '0'))
            draw(ids[href[1:]], transform.translate(x, y), attrs, referenced=True)
        else:
            areas.extend(painted_areas(shape_path_data(element, tag), transform, attrs))

    for child in root:
        draw(child, transform, presentation(root, INHERITED))
    return width, height, areas


# ---------------------------------------------------------------------------
#  area operations
# ---------------------------------------------------------------------------

def union(areas):
    # all areas are results of path operations (consistently wound, nonzero
    # fill), so their union is the simplified combination
    result = pathops.Path()
    for area in areas:
        result.addPath(area)
    result.simplify(keep_starting_points=False)
    return result


def operation(a, b, op):
    # Path operations occasionally fail for degenerate configurations; a
    # minimal shift of the second operand avoids them.
    for shift in (0, 1e-4, -1e-4, 2e-4, -2e-4):
        try:
            return pathops.op(a, translated(b, shift, shift) if shift else b, op, keep_starting_points=False)
        except pathops.PathOpsError:
            pass
    fail('a path operation failed')


def difference(area, cut):
    return operation(area, cut, pathops.PathOp.DIFFERENCE)


def rectangle(x0, y0, x1, y1):
    area = pathops.Path()
    area.moveTo(x0, y0)
    area.lineTo(x1, y0)
    area.lineTo(x1, y1)
    area.lineTo(x0, y1)
    area.close()
    return area


def translated(area, dx, dy):
    return area.transform(1, 0, 0, 1, dx, dy)


def clipped(area, x0, y0, x1, y1):
    return pathops.op(area, rectangle(x0, y0, x1, y1), pathops.PathOp.INTERSECTION, keep_starting_points=False)


def with_neighbors(area, width, height, margin):
    """A pattern tile with the adjoining parts of the neighboring tiles, up to
    margin from the tile edges."""
    ranges = {-1: (lambda size: (size - margin, size)), 0: (lambda size: (0, size)),
              1: (lambda size: (0, margin))}
    parts = [area]
    for i in (-1, 0, 1):
        for j in (-1, 0, 1):
            if i or j:
                (x0, x1), (y0, y1) = ranges[i](width), ranges[j](height)
                parts.append(translated(clipped(area, x0, y0, x1, y1), i * width, j * height))
    return union(parts)


def is_empty(area):
    return not any(True for _ in area.contours)


def stroked(path, width, cap, join, miter_limit, tolerance, fill=None):
    """The area covered by a stroke of the path, plus fill if given."""
    # Path operations on stroke outlines occasionally fail for degenerate
    # configurations; a minimal change of the width avoids them.
    for attempt in range(5):
        outline = pathops.Path(path)
        outline.stroke(width * (1 + attempt * 1e-4), cap, join, miter_limit)
        outline.convertConicsToQuads(tolerance)
        if fill is not None:
            outline.addPath(fill)
        try:
            outline.simplify(keep_starting_points=False)
            return outline
        except pathops.PathOpsError:
            pass
    fail('cannot convert a stroke of width %g into an area' % width)


def grown(area, width):
    """The area, including what it encloses, plus everything within width of
    it."""
    # each outer contour separately, as operations on large stroke outlines
    # are slow and less robust; holes are filled
    return union(stroked(c, 2 * width, pathops.LineCap.ROUND_CAP, pathops.LineJoin.ROUND_JOIN, 4,
                         TOLERANCE, fill=c)
                 for c in area.contours if not c.clockwise)


def pixels_covered(area, cut):
    """The whole pixels of area that are covered at least half by cut."""
    covered = operation(area, cut, pathops.PathOp.INTERSECTION)
    grid = {}
    for contour in covered.contours:
        x0, y0, x1, y1 = contour.bounds
        for x in range(math.floor(x0), math.ceil(x1)):
            for y in range(math.floor(y0), math.ceil(y1)):
                grid.setdefault((x, y), []).append(contour)
    pixels = []
    for (x, y), contours in grid.items():
        pixel = rectangle(x, y, x + 1, y + 1)
        part = pathops.Path()
        for contour in contours:
            part.addPath(contour)
        if pathops.op(part, pixel, pathops.PathOp.INTERSECTION, keep_starting_points=False).area >= 0.5:
            pixels.append(pixel)
    return union(pixels)


def without_small_parts(area, min_area):
    """The area without separate parts smaller than min_area (in px2)."""
    contours = list(area.contours)
    # outer contours are counterclockwise in the result of path operations
    small = [c.bounds for c in contours if not c.clockwise and c.area < min_area]
    inside = lambda b, o: o[0] <= b[0] and o[1] <= b[1] and b[2] <= o[2] and b[3] <= o[3]
    result = pathops.Path()
    for c in contours:
        if not any(inside(c.bounds, s) for s in small):
            result.addPath(c)
    return result


def overlapping_cells(bounds, cell=8.0):
    x0, y0, x1, y1 = bounds
    for x in range(math.floor(x0 / cell), math.floor(x1 / cell) + 1):
        for y in range(math.floor(y0 / cell), math.floor(y1 / cell) + 1):
            yield x, y


def painted(areas, erase=None):
    """The total painted area.  Areas painted in the erase color do not draw
    but cut out what was painted before them."""
    if erase is None:
        return union(area for area, _ in areas)
    erase = normalize_color(erase)
    erasers = [(i, area) for i, (area, color) in enumerate(areas) if color == erase]
    grid = {}
    for k, (_, area) in enumerate(erasers):
        for cell in overlapping_cells(area.bounds):
            grid.setdefault(cell, []).append(k)
    parts = []
    for i, (area, color) in enumerate(areas):
        if color == erase:
            continue
        later = {k for cell in overlapping_cells(area.bounds)
                 for k in grid.get(cell, ()) if erasers[k][0] > i}
        if later:
            area = difference(area, union(erasers[k][1] for k in sorted(later)))
        parts.append(area)
    return union(parts)


# ---------------------------------------------------------------------------
#  patterns
# ---------------------------------------------------------------------------

def pattern_layers(name, spec):
    if not isinstance(spec, dict):
        fail('pattern %s: expected a mapping' % name)
    if 'layers' in spec:
        if set(spec) - PATTERN_KEYS:
            fail('pattern %s: layers and %s cannot be combined' % (name, ', '.join(set(spec) - PATTERN_KEYS)))
        layers = spec['layers']
    else:
        layers = [spec]
    for layer in layers:
        unknown = set(layer) - LAYER_KEYS
        if unknown:
            fail('pattern %s: unknown setting %s' % (name, ', '.join(sorted(unknown))))
        for key in ('source', 'color'):
            if key not in layer:
                fail('pattern %s: %s is missing' % (name, key))
        for key in ('pixel-aligned', 'min-area'):
            if key in layer and 'casing' not in layer:
                fail('pattern %s: %s needs casing' % (name, key))
    return layers


def generate(name, spec, output_dir, sources):
    """Generate one pattern file, returns its file name."""
    layers = pattern_layers(name, spec)
    for layer in layers:
        if layer['source'] not in sources:
            sources[layer['source']] = read_source(os.path.join(SOURCE_DIR, layer['source']))
    width = max(sources[layer['source']][0] for layer in layers)
    height = max(sources[layer['source']][1] for layer in layers)

    # The painted area of every layer within the pattern
    areas = []
    for layer in layers:
        w, h, source_areas = sources[layer['source']]
        if width % w or height % h:
            fail('pattern %s: the size of %s (%gx%g) does not divide the pattern size (%gx%g)'
                 % (name, layer['source'], w, h, width, height))
        area = clipped(painted(source_areas, layer.get('erase')), 0, 0, w, h)
        # smaller layers are repeated
        areas.append(union(translated(area, i * w, j * h)
                           for i in range(int(width // w)) for j in range(int(height // h))))

    for n, layer in enumerate(layers):
        if 'casing' in layer and n + 1 < len(layers):
            # Cut and drop small parts with the adjoining parts of the
            # neighboring tiles, so parts crossing the pattern edges are
            # treated as a whole.
            above = with_neighbors(union(areas[n + 1:]), width, height, layer['casing'] + EDGE_MARGIN)
            area = with_neighbors(areas[n], width, height, EDGE_MARGIN)
            cut = grown(above, layer['casing'])
            if layer.get('pixel-aligned'):
                cut = pixels_covered(area, cut)
            area = difference(area, cut)
            if 'min-area' in layer:
                area = without_small_parts(area, layer['min-area'])
            areas[n] = clipped(area, 0, 0, width, height)

    paths = []
    for layer, area in zip(layers, areas):
        if not is_empty(area):
            paths.append((layer['color'], layer.get('opacity', 1), path_data(area, width, height)))
    filename = os.path.join(output_dir, name + '.svg')
    sources_list = ', '.join(sorted({os.path.join(SOURCE_DIR, layer['source']) for layer in layers}))
    write_svg(filename, width, height, paths,
              'Generated by scripts/generate_patterns.py as defined in %s from %s - do not edit by hand'
              % (CONFIG, sources_list))
    return filename


# ---------------------------------------------------------------------------
#  writing patterns
# ---------------------------------------------------------------------------

def fmt(v):
    s = ('%.3f' % v).rstrip('0').rstrip('.')
    return '0' if s in ('-0', '') else s


def split_bezier(points):
    """de Casteljau split of a Bezier curve (list of points) at t = 0.5."""
    left, right = [points[0]], [points[-1]]
    while len(points) > 1:
        points = [((a[0] + b[0]) / 2, (a[1] + b[1]) / 2) for a, b in zip(points, points[1:])]
        left.append(points[0])
        right.append(points[-1])
    return left, right[::-1]


def contained_curves(points, width, height, depth=0):
    """A curve whose control points all lie within the pattern area.  A curve
    can lie within the pattern area while its control points do not; it is
    split until they do and the remaining tiny excess is clamped."""
    excess = max(max(-x, x - width, -y, y - height) for x, y in points[1:])
    if excess <= 0:
        return [points]
    if excess < 0.001 or depth == 12:
        return [[points[0]] + [(min(max(x, 0), width), min(max(y, 0), height)) for x, y in points[1:]]]
    left, right = split_bezier(points)
    return contained_curves(left, width, height, depth + 1) + contained_curves(right, width, height, depth + 1)


def path_data(area, width, height):
    out = []
    point = lambda p: fmt(p[0]) + ' ' + fmt(p[1])
    current = start = None
    for verb, pts in area.segments:
        if verb == 'moveTo':
            current = start = pts[0]
            out.append('M' + point(current))
        elif verb == 'lineTo':
            current = pts[0]
            out.append('L' + point(current))
        elif verb in ('curveTo', 'qCurveTo'):
            if verb == 'curveTo':
                curves = [[current] + list(pts)]
            else:
                curves, p0 = [], current
                for control, end in pathops.decompose_quadratic_segment(pts):
                    curves.append([p0, control, end])
                    p0 = end
            for curve in curves:
                for c in contained_curves(curve, width, height):
                    out.append(('C' if len(c) == 4 else 'Q') + ' '.join(point(p) for p in c[1:]))
            current = pts[-1]
        elif verb == 'closePath':
            out.append('Z')
            current = start
    return ''.join(out)


def write_svg(filename, width, height, paths, comment):
    w, h = fmt(width), fmt(height)
    lines = ['<svg xmlns="http://www.w3.org/2000/svg" width="%s" height="%s" viewBox="0 0 %s %s">' % (w, h, w, h),
             '  <!-- %s -->' % comment,
             '  <!-- Mapnik takes the pattern size from the bounding box of the shapes, this rectangle makes it the full size -->',
             '  <rect width="%s" height="%s" fill="none"/>' % (w, h)]
    for color, opacity, d in paths:
        attrs = 'fill="%s"' % color
        if opacity < 1:
            attrs += ' fill-opacity="%s"' % fmt(opacity)
        lines.append('  <path %s d="%s"/>' % (attrs, d))
    lines.append('</svg>')
    with open(filename, 'w') as f:
        f.write('\n'.join(lines) + '\n')


def main():
    parser = argparse.ArgumentParser(description='Generate the area fill patterns defined in %s.' % CONFIG)
    parser.add_argument('--check', action='store_true',
                        help='check that the pattern files are up to date instead of writing them')
    parser.add_argument('patterns', nargs='*', help='patterns to generate (default: all)')
    args = parser.parse_args()
    if not os.path.isfile(CONFIG):
        fail('run this script from the repository root')
    with open(CONFIG) as f:
        patterns = yaml.safe_load(f)['patterns']
    for name in args.patterns:
        if name not in patterns:
            fail('unknown pattern %s' % name)
    names = args.patterns or list(patterns)
    sources = {}
    if args.check:
        stale = []
        with tempfile.TemporaryDirectory() as output_dir:
            for name in names:
                generated = generate(name, patterns[name], output_dir, sources)
                committed = os.path.join(OUTPUT_DIR, name + '.svg')
                if not os.path.isfile(committed) or not filecmp.cmp(generated, committed, shallow=False):
                    stale.append(committed)
        if stale:
            fail('patterns are not up to date, run scripts/generate_patterns.py: ' + ', '.join(stale))
        print('all %d patterns are up to date' % len(names))
    else:
        for name in names:
            print(generate(name, patterns[name], OUTPUT_DIR, sources))


if __name__ == '__main__':
    main()
