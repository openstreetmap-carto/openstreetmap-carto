#!/usr/bin/env python3

import collections, os, re, sys, lxml.etree

INDIVIDUAL_PATH_LIMIT = 45
size = 0
style = ""
patterns = []
current = {}
add_canvas = False
offset = (0, 0)

for file in sys.argv[1:]:
    for line in open(file, "r"):
        if line.startswith("Size: "):
            new_size = int(line[6:])
            if size == 0:
                size = new_size
            elif not new_size == size:
                # Concatenating two patterns is allowed, but only if they are the same size
                raise Exception('found two patterns with different tile sizes')
        elif line.startswith("Workaround: "):
            workarounds = line[12:].strip().split()
            for action in workarounds:
                if action == 'canvas':
                    add_canvas = True
                elif ',' in action:
                    xy = action.split(",")
                    offset = (float(xy[0]), float(xy[1]))
                else:
                    raise Exception('unknown workaround: ' + action)
        elif line.startswith("Path: "):
            if 'path' in current:
                if not 'style' in current:
                    current['style'] = style
                patterns.append(current)
            name = os.path.splitext(os.path.basename(file))[0] + str(len(patterns) + 1)
            path = line[6:].strip()
            if not path.islower():
                raise Exception('found path with absolute commands')
            # FIXME: parse first path moveto
            current = {'name': name, 'path': path, 'points': []}
        elif line.startswith("Style: "):
            style = line[7:].rstrip()
            current['style'] = style
        elif line.startswith("Casing: "):
            casing_parts = line[8:].strip().split()
            top = int(casing_parts[0])
            bbox_left = size
            bbox_right = -size
            casing_lines = []
            for casing_part in casing_parts[1:]:
                left_right = casing_part.split('|')
                left = float(left_right[0])
                right = float(left_right[1])
                if left < bbox_left:
                    bbox_left = left
                if right > bbox_right:
                    bbox_right = right
                casing_lines.append((left, right))
            current['casing'] = {
                'top': top,
                'left': bbox_left,
                'right': bbox_right,
                'bottom': top + len(casing_lines),
                'lines': casing_lines
            }
        else:
            xy = line.rstrip().split(",")
            if not len(xy) == 2:
                raise Exception('invalid coordinate ', line.rstrip())
            x = float(xy[0])
            y = float(xy[1])
            # Apply offset workaround
            if not (offset[0] == 0 and offset[1] == 0):
                x = (x + offset[0] + size) % size
                y = (y + offset[1] + size) % size
            current['points'].append((x, y))
if not 'style' in current:
    current['style'] = style
patterns.append(current)



use_defs = False
for pattern in patterns:
    if len(pattern['path']) > INDIVIDUAL_PATH_LIMIT:
        use_defs = True
        break

svg_namespace = 'http://www.w3.org/2000/svg'
xlink_namespace = 'http://www.w3.org/1999/xlink'
svgns = '{' + svg_namespace + '}'
nsmap = {None: svg_namespace}
if use_defs:
    nsmap['xlink'] = xlink_namespace

svg = lxml.etree.Element('svg', nsmap=nsmap)
svg.set('width', str(size))
svg.set('height', str(size))
svg.set('viewBox', '0 0 ' + str(size) + ' ' + str(size))

if use_defs == True:
    defs = lxml.etree.SubElement(svg, svgns + 'defs')
    for pattern in patterns:
        if len(pattern['path']) > INDIVIDUAL_PATH_LIMIT:
            symbol = lxml.etree.SubElement(defs, svgns + 'path')
            symbol.set('id', pattern['name'])
            for attr in pattern['style'].split():
                (name, value) = attr.split('=')
                symbol.set(name, value.strip('"'))
            symbol.set('d', pattern['path'])

if add_canvas:
    canvas = lxml.etree.SubElement(svg, svgns + 'rect')
    canvas.set('id', "mapnik_workaround")
    canvas.set('width', str(size))
    canvas.set('height', str(size))
    canvas.set('fill', "none")


def moveto(new_x, new_y):
    global current_pos
    if new_x == current_pos[0]:
        d = ' m0,' + '{:g}'.format(new_y - current_pos[1])
    elif new_y == current_pos[1]:
        d = ' m' + '{:g}'.format(new_x - current_pos[0]) + ',0'
    else:
        d = '\nM' + '{:g}'.format(new_x) + ',' + '{:g}'.format(new_y)
    current_pos = new_x, new_y
    return d

def lineto(new_x, new_y):
    global current_pos
    if new_y == current_pos[1]:
        d = ' h' + '{:g}'.format(new_x - current_pos[0])
    elif new_x == current_pos[0]:
        d = ' v' + '{:g}'.format(new_y - current_pos[1])
    else:
        d = ' l' + '{:g}'.format(new_x - current_pos[0]) + ',' + '{:g}'.format(new_y - current_pos[1])
    current_pos = new_x, new_y
    return d


for pattern in patterns:
    if len(pattern['path']) > INDIVIDUAL_PATH_LIMIT:
        for xy in pattern['points']:
            use = lxml.etree.SubElement(svg, svgns + 'use')
            use.set('x', "{:g}".format(xy[0]))
            use.set('y', "{:g}".format(xy[1]))
            use.set('{' + xlink_namespace + '}href', '#' + pattern['name'])
    elif pattern['name'].startswith('wetland'):
        d = ''
        current_pos = (-size, -size) # doesn't matter, as long as it is outside the pattern area
        for (x1, y) in pattern['points']:
            x2 = x1 + 7
            for pattern_casing in patterns:
                if not 'casing' in pattern_casing:
                    break
                casing = pattern_casing['casing']
                top = casing['top']
                bottom = casing['bottom']
                left = casing['left']
                right = casing['right']
                casing_lines = casing['lines']
                for (symbol_x, symbol_y) in pattern_casing['points']:
                    # Try to move the symbol to an adjacent tile if there is no match
                    if symbol_x + right < x1:
                        symbol_x += size
                    elif symbol_x + left > x2:
                        symbol_x -= size
                    if symbol_y + bottom < y:
                        symbol_y += size
                    elif symbol_y + top > y:
                        symbol_y -= size
                    # Quick check if the line falls inside the boundig box of the symbol
                    if (y <= symbol_y + top) or (y >= symbol_y + bottom) or (x2 <= symbol_x + left) or (x1 >= symbol_x + right):
                        continue
                    # Apply the casing
                    index_y = int(y) - int(symbol_y) - top
                    (casing_left, casing_right) = casing_lines[index_y]
                    if x1 >= symbol_x + casing_left and x2 <= symbol_x + casing_right:
                        # line is completely behind this symbol
                        x2 = x1
                        break
                    elif (x2 > symbol_x + casing_right):
                        if (x1 < symbol_x + casing_left):
                            x3 = symbol_x + casing_left
                            # Special case: the line is broken in two by the symbol
                            if (x3 - x1 > 1):
                                d += moveto(x1, y)
                                d += lineto(x3, y)
                        x1 = max(symbol_x + casing_right, x1)
                    elif x1 < symbol_x + casing_left:
                        x2 = min(symbol_x + casing_left, x2)
            # Draw the line, wrapping around on the tile edge
            if x2 - x1 > 1:
                if x1 > size:
                    x1 -= size
                    x2 -= size
                if x2 > size:
                    d += moveto(x1, y)
                    d += lineto(size, y)
                    d += moveto(0, y)
                    d += lineto(x2 - size, y)
                else:
                    d += moveto(x1, y)
                    d += lineto(x2, y)
        path = lxml.etree.SubElement(svg, svgns + 'path')
        for attr in pattern['style'].split():
            (name, value) = attr.split('=')
            path.set(name, value.strip('"'))
        path.set('d', d)
    else:
        # Most of what follows are for optimizations:
        # - parse the initial moveto of the path, so that we can combine it with the x and y of the insertion point
        # - determine the endpoint of the path (when easy) so the next moveto can be relative
        path = pattern['path']
        d = ''
        current_pos = (-size, -size) # doesn't matter, as long as it is outside the pattern area
        # Parse initial moveto
        i = 0
        for path_segment in re.finditer('[, ]*[MmZzLlHhVvCcSsQqTtAa]|(-?[0-9]*\.?[0-9]+([eE]-?[0-9]+)?)', path):
            if i == 0 and path_segment[0] != 'm':
                raise Exception('found path with missing moveto: ', path)
            if i == 1:
                mx = float(path_segment[0])
            if i == 2:
                my = float(path_segment[0])
                path = path[path_segment.end():].lstrip()
            i += 1
        # Can we easily determine the end coordinate of the path?
        if re.fullmatch('[vh] *-?[0-9]*\.?[0-9]+', path):
            if path.startswith('h'):
                length = float(path[1:].lstrip())
                if length == 0:
                    length = 0.0001 # mapnik fails to render zero-length (sub)paths
                end = (length, 0)
            elif path.startswith('v'):
                length = float(path[1:].lstrip())
                if length == 0:
                    length = 0.0001 # mapnik fails to render zero-length (sub)paths
                end = (0, length)
            for (x, y) in pattern['points']:
                d += moveto(x + mx, y + my)
                d += lineto(x + mx + end[0], y + my + end[1])
        else:
            for (x, y) in pattern['points']:
                d += '\n' + 'M' + "{:g}".format(x + mx) + ',' + "{:g}".format(y + my) + ' ' + path
        path = lxml.etree.SubElement(svg, svgns + 'path')
        for attr in pattern['style'].split():
            (name, value) = attr.split('=')
            path.set(name, value.strip('"'))
        path.set('d', d)

print(lxml.etree.tostring(svg, encoding='unicode', pretty_print=True).replace('&#10;', '\n')[:-1])

