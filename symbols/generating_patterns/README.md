# Area fill patterns

The area fill patterns listed in [`patterns.yaml`](../../patterns.yaml) are
generated: `scripts/generate_patterns.py` turns the pattern sources in this
directory into the pattern files `symbols/<name>.svg` that the style uses.
`patterns.yaml` defines for each pattern its source(s), color and opacity
and, where needed, how layers are combined.  Other patterns (the forest,
flowerbed, quarry and unpaved road patterns and hand made ones in `symbols/`)
are not generated this way yet.

The generator needs Python 3 with skia-pathops, fonttools and PyYAML (see
[`INSTALL.md`](../../INSTALL.md)).  Run it from the repository root:

```sh
scripts/generate_patterns.py               # all patterns
scripts/generate_patterns.py scrub reef    # selected patterns
scripts/generate_patterns.py --check       # check that the pattern files are up to date
```

The generated files must not be edited by hand.  The CI checks that they are
up to date with the sources and `patterns.yaml`.

## Changing the color of a pattern

Change the color in `patterns.yaml` and run the generator for the pattern.

## Making a new pattern or changing a design

1. Draw the pattern source: an SVG file whose `width` and `height` are the
   size of the repeating tile in pixels at scale factor 1.  Shapes crossing an
   edge of the tile need a copy at the opposite edge, so the pattern repeats
   without seams.  [jsdotpattern](https://www.imagico.de/map/jsdotpattern.php)
   produces such sources - save the SVG it generates ("get pattern SVG data")
   as it is, no further processing is needed.  Drawing in Inkscape or by hand
   works as well.  The colors in the source do not matter, the generator
   draws the pattern in the color from `patterns.yaml`.
2. Save the source in this directory and document how it was made in a
   Markdown file next to it - for jsdotpattern the link with the recorded
   command sequence, so the pattern can be reproduced and modified.
3. Add the pattern to `patterns.yaml` and run the generator for it.
4. Use `symbols/<name>.svg` as `polygon-pattern-file` in the style and commit
   the source, the documentation, `patterns.yaml` and the generated file.

The sources can use paths and the basic shapes (`rect`, `circle`,
`ellipse`, `polygon`, `polyline`, `line`), groups, `<use>`, transforms,
fills and strokes.  Strokes are drawn as the area they cover.  Not
supported are text, images, gradients and masks; clip paths are ignored, as
everything is clipped to the tile anyway.

Patterns can be combined from several layers, for example symbols on top of a
base pattern kept free around the symbols (`casing`) - see the wetland
patterns in `patterns.yaml` and [`wetland.md`](wetland.md).  A source can also
draw gaps in a dedicated color (`erase`), for example to separate overlapping
symbols - see the rock pattern and [`bare_ground.md`](bare_ground.md).

## Why the pattern files are generated

Mapnik renders SVG pattern files with the rendering scale factor, so they
stay sharp at high resolution, but it supports only part of SVG in them: it
does not support clip paths, and it takes the size of the repeating tile from
the bounding box of all path points (including the control points of curves)
rather than from the SVG size.  The generator therefore resolves the sources
into plain filled paths, one per layer, clips them exactly to the tile, keeps
all points within the tile and adds an invisible rectangle spanning the whole
tile.  Curves stay curves - where a shape crosses the tile edge it is cut
exactly, not approximated - so the patterns can be rendered at any
resolution.
