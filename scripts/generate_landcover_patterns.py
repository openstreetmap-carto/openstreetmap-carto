#!/usr/bin/env python3
# ---------------------------------------------------------------------------
#  generate_landcover_patterns.py
#
#  Generates the landcover area pattern SVGs in symbols/ from the jsdotpattern
#  sources in symbols/generating_patterns/.
#
#  Mapnik only supports a small subset of SVG, and it scales SVG pattern images
#  with the rendering scale factor while PNG pattern images are always used at
#  their native pixel size.  To get patterns that render consistently at high
#  resolutions (scale_factor 2, printing, ...) all landcover patterns therefore
#  have to be SVGs.  This script turns the raw jsdotpattern output (which uses
#  <defs>, <use> and <clipPath>) into flat, Mapnik compatible pattern files.
#  Mapnik 4.3 supports definitions and references, but not SVG clip paths.
#  Expanding references here allows boundary clipping and transparent casing
#  subtraction to be resolved before Mapnik reads the file:
#
#   - <use> references are expanded into plain <path> elements
#   - shapes crossing the pattern boundary are clipped to it (Mapnik derives
#     the pattern size from the geometry bounding box, not from width/height)
#   - an invisible rectangle pins the bounding box to the full pattern size
#   - the pattern color (and opacity) is set here, not in the source
#
#  Two pattern families need more than that:
#
#   - The wetland patterns are composed from the generic wetland dash pattern
#     (256 px tile, tiled 2x2) and a symbol pattern.  Dash pixels within a
#     casing of about 2 px around each symbol are removed, mirroring the
#     ImageMagick raster process these patterns were originally built with
#     (see generating_patterns/wetland.md).  The dashes stay pixel aligned so
#     the result matches the former PNGs at scale factor 1.
#   - The bare_rock pattern source draws a white stroke around every rock so
#     overlapping rocks stay distinguishable.  The pattern is drawn over
#     arbitrary fills, so that casing has to be transparent: it is cut out of
#     the underlying rocks geometrically.
#
#  Requirements: python3 with numpy, shapely (>= 2.0) and svgpathtools.
#
#  Usage (run from the repository root):
#
#    scripts/generate_landcover_patterns.py             # all patterns
#    scripts/generate_landcover_patterns.py scrub reef  # selected patterns
#    scripts/generate_landcover_patterns.py --check     # verify without writing
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
from collections import namedtuple

import numpy as np
import shapely
from shapely.geometry import Polygon, MultiPolygon, GeometryCollection, box
from shapely.geometry.polygon import orient
from shapely.ops import unary_union
from shapely.strtree import STRtree
from svgpathtools import parse_path, Line, CubicBezier, QuadraticBezier, Arc
from svgpathtools.path import transform as transform_path

SOURCE_DIR = 'symbols/generating_patterns'
OUTPUT_DIR = 'symbols'

# The generic wetland pattern: 7x1 px dashes, 256 px tile.  Also the base of
# the composed wetland patterns.
WETLAND_DASHES = 'wetland.svg'
# Opacity of the dashes in the composed wetland patterns (the generic wetland
# pattern uses fully opaque dashes).
WETLAND_DASH_OPACITY = 0.8
# Dash pixels whose area is covered at least 50% by a casing of this width
# (px) around the symbols are removed.  The width was calibrated against the
# former PNG patterns, which were built with an ImageMagick raster process
# (see wetland.md); it reproduces their dashes to within about 0.1%.
WETLAND_CASING = 1.9

# name -> source, fill color, optional opacity, optional mode
#
# The colors are those of the former PNG files.  'beach' has an opacity
# because its source shapes are grey (#9a9a9a) and the former PNG derived its
# alpha from the negated grey level: 1 - 0x9a/255 = 0.4.
PATTERNS = {
    'wetland':          dict(source=WETLAND_DASHES, fill='#4aa5fa', mode='dashes'),
    'wetland_marsh':    dict(source='marsh.svg',    fill='#73b386', mode='wetland'),
    'wetland_reed':     dict(source='reed.svg',     fill='#73b386', mode='wetland'),
    'wetland_bog':      dict(source='bog.svg',      fill='#73b386', mode='wetland'),
    'wetland_mangrove': dict(source='mangrove.svg', fill='#709b6f', mode='wetland'),
    'wetland_swamp':    dict(source='swamp.svg',    fill='#93b685', mode='wetland'),
    'scrub':            dict(source='scrub.svg',    fill='#b0be93'),
    'beach':            dict(source='beach.svg',    fill='#685d45', opacity=0.4),
    'beach_coarse':     dict(source='reef.svg',     fill='#969696'),
    'reef':             dict(source='reef.svg',     fill='#549ccd'),
    'scree_overlay':    dict(source='reef.svg',     fill='#cbc9c6'),  # scree.svg == reef.svg
    'rock_overlay':     dict(source='rock.svg',     fill='#cfcdca', mode='casing'),
    'salt-dots-2':      dict(source='salt-dots-2.svg', fill='#ffffff'),
    'salt_pond':        dict(source='salt_pond.svg',  fill='#ffffff'),
}

SVG_NS = '{http://www.w3.org/2000/svg}'
XLINK_HREF = '{http://www.w3.org/1999/xlink}href'

# Flattening step (px) for curves that have to go through geometry operations.
FLATTEN_STEP = 0.05
# Simplification tolerance (px) for polygons produced by geometry operations.
SIMPLIFY = 0.1

# One drawn path of a pattern symbol: an svgpathtools Path in pattern
# coordinates plus its stroke width (px, 0 if not stroked).
Shape = namedtuple('Shape', 'path stroke_width')


# ---------------------------------------------------------------------------
#  parsing jsdotpattern SVGs
# ---------------------------------------------------------------------------

def parse_transform(text):
    m = np.eye(3)
    for name, args in re.findall(r'(\w+)\s*\(([^)]*)\)', text or ''):
        v = [float(t) for t in re.split(r'[\s,]+', args.strip()) if t]
        if name == 'matrix':
            a, b, c, d, e, f = v
            t = np.array([[a, c, e], [b, d, f], [0, 0, 1]])
        elif name == 'translate':
            t = np.array([[1, 0, v[0]], [0, 1, v[1] if len(v) > 1 else 0], [0, 0, 1]])
        elif name == 'scale':
            sy = v[1] if len(v) > 1 else v[0]
            t = np.array([[v[0], 0, 0], [0, sy, 0], [0, 0, 1]])
        elif name == 'rotate':
            r = math.radians(v[0])
            t = np.array([[math.cos(r), -math.sin(r), 0], [math.sin(r), math.cos(r), 0], [0, 0, 1]])
            if len(v) == 3:
                tr = np.array([[1, 0, v[1]], [0, 1, v[2]], [0, 0, 1]])
                t = tr @ t @ np.linalg.inv(tr)
        else:
            sys.exit("unsupported transform '%s' in source" % name)
        m = m @ t
    return m


def style_value(element, name):
    if element.get(name) is not None:
        return element.get(name)
    m = re.search(r'(?:^|;)\s*' + re.escape(name) + r'\s*:\s*([^;]+)', element.get('style', ''))
    return m.group(1).strip() if m else None


def collect_paths(element, matrix, stroke_width, out):
    """Recursively collect (path d, matrix, stroke width) below a <defs> group."""
    matrix = matrix @ parse_transform(element.get('transform'))
    sw = style_value(element, 'stroke-width')
    stroke = style_value(element, 'stroke')
    if stroke is not None and stroke != 'none':
        stroke_width = float(sw) if sw is not None else 1.0
    for child in element:
        tag = child.tag.replace(SVG_NS, '')
        if tag == 'g':
            collect_paths(child, matrix, stroke_width, out)
        elif tag == 'path':
            cm = matrix @ parse_transform(child.get('transform'))
            csw = style_value(child, 'stroke-width')
            cs = style_value(child, 'stroke')
            csw_px = stroke_width
            if cs is not None and cs != 'none':
                csw_px = float(csw) if csw is not None else 1.0
            # stroke width is given in the local coordinate system
            scale = math.sqrt(abs(np.linalg.det(cm[:2, :2])))
            out.append((child.get('d'), cm, csw_px * scale))
        else:
            sys.exit("unsupported element <%s> in pattern source" % tag)


def _wrap(element):
    g = ET.Element(SVG_NS + 'g')
    g.append(element)
    return g


class PatternSource:
    """A pattern source SVG: symbol definitions and their placements.

    Either a jsdotpattern SVG (symbols in <defs>, placed with <use>) or a
    plain SVG with the pattern drawn directly as <path> elements."""

    def __init__(self, filename):
        root = ET.parse(filename).getroot()
        self.width = float(root.get('width'))
        self.height = float(root.get('height'))
        self.defs = {}
        defs = root.find(SVG_NS + 'defs')
        if defs is not None:
            for g in defs:
                if g.tag == SVG_NS + 'g':
                    paths = []
                    collect_paths(g, np.eye(3), 0.0, paths)
                    self.defs[g.get('id')] = paths
        # placements in paint order: (symbol id, translation matrix)
        self.uses = []
        for use in root.iter(SVG_NS + 'use'):
            ref = use.get(XLINK_HREF) or use.get('href')
            x = float(use.get('x', 0))
            y = float(use.get('y', 0))
            t = np.array([[1, 0, x], [0, 1, y], [0, 0, 1]]) @ parse_transform(use.get('transform'))
            self.uses.append((ref.lstrip('#'), t))
        if not self.uses:
            # plain SVG: everything drawn directly below the root element
            paths = []
            for child in root:
                if child.tag in (SVG_NS + 'g', SVG_NS + 'path'):
                    collect_paths(_wrap(child), np.eye(3), 0.0, paths)
            self.defs['root'] = paths
            self.uses.append(('root', np.eye(3)))
        self._path_cache = {}

    def shapes(self, ref, matrix):
        """The Shapes of one symbol placement, in pattern coordinates."""
        result = []
        for d, m, sw in self.defs[ref]:
            if d not in self._path_cache:
                self._path_cache[d] = parse_path(d)
            path = transform_path(self._path_cache[d], matrix @ m)
            result.append(Shape(path, sw))
        return result

    def placements(self):
        for ref, t in self.uses:
            yield self.shapes(ref, t)


# ---------------------------------------------------------------------------
#  geometry helpers
# ---------------------------------------------------------------------------

def path_bbox(path):
    xmin, xmax, ymin, ymax = path.bbox()
    return xmin, ymin, xmax, ymax


def flatten_rings(path, step=FLATTEN_STEP):
    """Closed subpaths of a Path as coordinate rings (curves subdivided)."""
    rings = []
    for sub in path.continuous_subpaths():
        pts = []
        for seg in sub:
            if isinstance(seg, Line):
                pts.append(seg.start)
            else:
                # control polygon length is an upper bound of the arc length
                cp = seg.bpoints() if not isinstance(seg, Arc) else (seg.start, seg.end)
                length = sum(abs(cp[i + 1] - cp[i]) for i in range(len(cp) - 1))
                n = max(2, int(math.ceil(length / step)))
                pts.extend(seg.point(i / n) for i in range(n))
        pts.append(sub[-1].end)
        ring = [(p.real, p.imag) for p in pts]
        if len(ring) >= 4:
            rings.append(ring)
    return rings


def signed_area(ring):
    a = 0.0
    for i in range(len(ring) - 1):
        a += ring[i][0] * ring[i + 1][1] - ring[i + 1][0] * ring[i][1]
    return a / 2.0


def path_to_geometry(path):
    """Filled area of a path (nonzero fill rule) as a shapely geometry."""
    rings = []
    for ring in flatten_rings(path):
        poly = Polygon(ring)
        if not poly.is_valid:
            poly = poly.buffer(0)
        if poly.is_empty:
            continue
        rings.append((signed_area(ring) > 0, poly))
    rings.sort(key=lambda r: -r[1].area)
    result = None
    placed = []
    for ccw, poly in rings:
        if result is None:
            result = poly
        else:
            pt = poly.representative_point()
            parent = next((p for p in placed if p[1].contains(pt)), None)
            if parent is not None and parent[0] != ccw:
                result = result.difference(poly)      # a hole
            else:
                result = result.union(poly)
        placed.append((ccw, poly))
    return result if result is not None else Polygon()


def polygons(geometry):
    if geometry.is_empty:
        return []
    if isinstance(geometry, Polygon):
        return [geometry]
    if isinstance(geometry, (MultiPolygon, GeometryCollection)):
        result = []
        for g in geometry.geoms:
            result.extend(polygons(g))
        return result
    return []


# ---------------------------------------------------------------------------
#  SVG path data output
# ---------------------------------------------------------------------------

def num(v):
    s = ('%.3f' % v).rstrip('0').rstrip('.')
    return '0' if s in ('-0', '') else s


def pt(c):
    return num(c.real) + ' ' + num(c.imag)


def path_d(path):
    """Path data for a Path, keeping curves."""
    out = []
    for sub in path.continuous_subpaths():
        out.append('M ' + pt(sub[0].start))
        for seg in sub:
            if isinstance(seg, Line):
                if abs(seg.end - seg.start) > 1e-9:
                    out.append('L ' + pt(seg.end))
            elif isinstance(seg, CubicBezier):
                out.append('C ' + pt(seg.control1) + ' ' + pt(seg.control2) + ' ' + pt(seg.end))
            elif isinstance(seg, QuadraticBezier):
                out.append('Q ' + pt(seg.control) + ' ' + pt(seg.end))
            else:
                # arcs (not used by the current sources): flatten
                n = 16
                out.extend('L ' + pt(seg.point(i / n)) for i in range(1, n + 1))
        out.append('Z')
    return ' '.join(out)


def geometry_d(geometry):
    """Path data for a polygon geometry (nonzero fill rule)."""
    out = []
    for poly in polygons(geometry):
        if SIMPLIFY:
            poly = poly.simplify(SIMPLIFY, preserve_topology=True)
        if poly.is_empty or poly.area < 1e-6:
            continue
        poly = orient(poly, 1.0)
        for ring in [poly.exterior] + list(poly.interiors):
            coords = list(ring.coords)[:-1]
            out.append('M ' + ' L '.join(num(x) + ' ' + num(y) for x, y in coords) + ' Z')
    return ' '.join(out)


def write_svg(filename, width, height, layers, comment):
    """layers: list of (fill, opacity or None, path data)."""
    w, h = num(width), num(height)
    lines = ['<svg xmlns="http://www.w3.org/2000/svg" width="%s" height="%s" viewBox="0 0 %s %s">' % (w, h, w, h),
             '  <!-- %s -->' % comment,
             '  <!-- Mapnik sizes a pattern by its geometry bounding box; this rectangle pins it to the full tile -->',
             '  <rect id="mapnik_workaround" width="%s" height="%s" fill="none"/>' % (w, h)]
    for fill, opacity, d in layers:
        attrs = 'fill="%s"' % fill
        if opacity is not None and opacity < 1:
            attrs += ' fill-opacity="%s"' % num(opacity)
        lines.append('  <path %s d="%s"/>' % (attrs, d))
    lines.append('</svg>')
    with open(filename, 'w') as f:
        f.write('\n'.join(lines) + '\n')


# ---------------------------------------------------------------------------
#  pattern generation
# ---------------------------------------------------------------------------

def clipped_symbols_d(source, tile):
    """Path data of all placements, clipped to the tile.

    Shapes entirely inside the tile keep their curves; shapes crossing the
    tile boundary are clipped geometrically."""
    parts = []
    for shapes in source.placements():
        for shape in shapes:
            x0, y0, x1, y1 = path_bbox(shape.path)
            if x1 <= 0 or y1 <= 0 or x0 >= source.width or y0 >= source.height:
                continue
            if x0 >= 0 and y0 >= 0 and x1 <= source.width and y1 <= source.height:
                parts.append(path_d(shape.path))
            else:
                geom = path_to_geometry(shape.path).intersection(tile)
                d = geometry_d(geom)
                if d:
                    parts.append(d)
    return ' '.join(parts)


def dash_mask(dash_source, size):
    """Pixel mask of the (pixel aligned) wetland dashes, tiled to size."""
    tile = int(dash_source.width)
    mask = np.zeros((tile, tile), dtype=bool)
    for shapes in dash_source.placements():
        for shape in shapes:
            x0, y0, x1, y1 = path_bbox(shape.path)
            for k in (x0, y0, x1, y1):
                if abs(k - round(k)) > 1e-6:
                    sys.exit("wetland dashes are expected to be pixel aligned")
            xa, xb = max(0, int(round(x0))), min(tile, int(round(x1)))
            ya, yb = max(0, int(round(y0))), min(tile, int(round(y1)))
            if xa < xb and ya < yb:
                mask[ya:yb, xa:xb] = True
    reps = int(size) // tile
    return np.tile(mask, (reps, reps))


def mask_d(mask):
    """Path data drawing the true pixels of a mask as horizontal runs."""
    out = []
    for y in range(mask.shape[0]):
        row = mask[y]
        x = 0
        while x < row.size:
            if row[x]:
                start = x
                while x < row.size and row[x]:
                    x += 1
                out.append('M%d %dh%dv1h-%dz' % (start, y, x - start, x - start))
            else:
                x += 1
    return ' '.join(out)


def knock_out_casing(mask, source):
    """Remove dash pixels covered >= 50% by the casing around the symbols."""
    n = 8  # subsamples per pixel edge, as in the 8x raster process
    offs = (np.arange(n) + 0.5) / n
    sub_x, sub_y = np.meshgrid(offs, offs)
    sub_x, sub_y = sub_x.ravel(), sub_y.ravel()
    h, w = mask.shape
    for shapes in source.placements():
        symbol = unary_union([path_to_geometry(s.path) for s in shapes])
        if symbol.is_empty:
            continue
        casing = symbol.buffer(WETLAND_CASING, quad_segs=8)
        x0, y0, x1, y1 = casing.bounds
        xa, xb = max(0, int(math.floor(x0))), min(w, int(math.ceil(x1)))
        ya, yb = max(0, int(math.floor(y0))), min(h, int(math.ceil(y1)))
        if xa >= xb or ya >= yb:
            continue
        ys, xs = np.nonzero(mask[ya:yb, xa:xb])
        if ys.size == 0:
            continue
        xs = xs + xa
        ys = ys + ya
        px = (xs[:, None] + sub_x[None, :]).ravel()
        py = (ys[:, None] + sub_y[None, :]).ravel()
        inside = shapely.contains_xy(casing, px, py).reshape(xs.size, -1).sum(axis=1)
        remove = inside * 2 >= n * n
        mask[ys[remove], xs[remove]] = False
    # remove single isolated dash pixels (no dash pixel among the 8 neighbours)
    padded = np.pad(mask, 1)
    neighbours = np.zeros_like(mask, dtype=int)
    for dy in (-1, 0, 1):
        for dx in (-1, 0, 1):
            if dx or dy:
                neighbours += padded[1 + dy:1 + dy + mask.shape[0], 1 + dx:1 + dx + mask.shape[1]]
    mask &= neighbours > 0
    return mask


def casing_flattened_d(source, tile):
    """Path data of overlapping shapes whose stroke casings are cut out of
    the shapes below them (jsdotpattern draws them as white strokes)."""
    fills = []     # (geometry, casing geometry) per placement, paint order
    for shapes in source.placements():
        geoms = [path_to_geometry(s.path) for s in shapes]
        shape = unary_union(geoms)
        if shape.is_empty:
            continue
        casings = [g.boundary.buffer(s.stroke_width / 2.0, quad_segs=8)
                   for g, s in zip(geoms, shapes) if s.stroke_width > 0]
        casing = unary_union(casings).difference(shape) if casings else None
        fills.append((shape, casing))
    casing_geoms = [c if c is not None else Polygon() for _, c in fills]
    tree = STRtree(casing_geoms)
    result = []
    for i, (shape, _) in enumerate(fills):
        later = [j for j in tree.query(shape) if j > i and not casing_geoms[j].is_empty]
        if later:
            shape = shape.difference(unary_union([casing_geoms[j] for j in later]))
        if not shape.is_empty:
            result.append(shape)
    return geometry_d(unary_union(result).intersection(tile))


def generate(name, spec, sources, output_dir=OUTPUT_DIR):
    def load(fn):
        if fn not in sources:
            sources[fn] = PatternSource(os.path.join(SOURCE_DIR, fn))
        return sources[fn]

    source = load(spec['source'])
    tile = box(0, 0, source.width, source.height)
    mode = spec.get('mode', 'symbols')
    comment = 'Generated by scripts/generate_landcover_patterns.py from %s/%s - do not edit by hand' % (
        SOURCE_DIR, spec['source'])
    if mode == 'symbols':
        layers = [(spec['fill'], spec.get('opacity'), clipped_symbols_d(source, tile))]
    elif mode == 'dashes':
        layers = [(spec['fill'], spec.get('opacity'), mask_d(dash_mask(source, source.width)))]
    elif mode == 'wetland':
        dashes = load(WETLAND_DASHES)
        comment += ' and %s/%s' % (SOURCE_DIR, WETLAND_DASHES)
        mask = knock_out_casing(dash_mask(dashes, source.width), source)
        layers = [('#4aa5fa', WETLAND_DASH_OPACITY, mask_d(mask)),
                  (spec['fill'], spec.get('opacity'), clipped_symbols_d(source, tile))]
    elif mode == 'casing':
        layers = [(spec['fill'], spec.get('opacity'), casing_flattened_d(source, tile))]
    else:
        sys.exit('unknown mode ' + mode)
    out = os.path.join(output_dir, name + '.svg')
    write_svg(out, source.width, source.height, layers, comment)
    print('%s (%dx%d, %d kB)' % (out, source.width, source.height, os.path.getsize(out) // 1024))


def main():
    parser = argparse.ArgumentParser(description='Generate the landcover area pattern SVGs from their sources.')
    parser.add_argument('--check', action='store_true',
                        help='regenerate in a temporary directory and check committed SVGs are up to date')
    parser.add_argument('patterns', nargs='*', help='pattern names to generate (default: all)')
    args = parser.parse_args()
    names = args.patterns or list(PATTERNS)
    for name in names:
        if name not in PATTERNS:
            sys.exit('unknown pattern %s, known: %s' % (name, ', '.join(PATTERNS)))
    if not os.path.isdir(SOURCE_DIR):
        sys.exit('run this script from the repository root')
    sources = {}
    if args.check:
        with tempfile.TemporaryDirectory(prefix='landcover-patterns-') as output_dir:
            stale = []
            for name in names:
                generate(name, PATTERNS[name], sources, output_dir)
                expected = os.path.join(OUTPUT_DIR, name + '.svg')
                actual = os.path.join(output_dir, name + '.svg')
                if not os.path.isfile(expected) or not filecmp.cmp(expected, actual, shallow=False):
                    stale.append(expected)
            if stale:
                sys.exit('Patterns need regeneration: ' + ', '.join(stale))
            print('All %d patterns are up to date.' % len(names))
    else:
        for name in names:
            generate(name, PATTERNS[name], sources)


if __name__ == '__main__':
    main()
