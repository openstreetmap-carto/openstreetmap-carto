# Generating landcover patterns

`scripts/generate_landcover_patterns.py` converts the sources in this directory
into the 14 landcover SVGs listed in its `PATTERNS` table. That table specifies
the source, color, opacity and composition mode. Other existing SVG patterns
are maintained separately.

Run from the repository root; dependencies are listed in `INSTALL.md`:

```sh
scripts/generate_landcover_patterns.py -h
scripts/generate_landcover_patterns.py            # regenerate all 14
scripts/generate_landcover_patterns.py scrub reef # regenerate selected patterns
scripts/generate_landcover_patterns.py --check    # compare without changing files
python3 scripts/test_landcover_patterns.py        # geometry checks
```

Edit the source SVG to change symbols or their placements; edit the generator's
color settings to recolor them. Keep periodic copies of symbols crossing the
repeat boundary. Do not manually edit generated SVGs. Each pattern family's
Markdown file describes its sources and composition. In particular, `scrub.md`
records the fixed-seed recipe used to regenerate the pixel-aligned scrub pattern.
It reproduces the former PNG's symbol positions without a raster recovery step.

## Mapnik compatibility

Mapnik 4.3 supports SVG definitions and `<use>` references, but does not implement
SVG clip paths. The generator expands references so it can clip geometry to the
repeat boundary and subtract transparent rock casings. It emits filled paths and
an invisible rectangle that fixes the geometry bounding box to the repeat size.
The rectangle matters because Mapnik uses geometry bounds when sizing a pattern.

This is a converter for the closed, filled paths in these pattern sources, not a
general SVG renderer. Rock strokes represent casings to subtract, rather than
ordinary painted outlines. Shapes wholly inside the repeat preserve their curves;
geometry operations flatten curves and simplify the result at 0.1 logical pixels.
Wetland dash removal deliberately preserves the former pixel-aligned composition.

SVG pattern dimensions scale with Mapnik's rendering scale factor; PNG patterns
retain their native pixel dimensions. A 256-pixel SVG repeat therefore becomes
512 device pixels at scale factor 2, preserving its apparent size. The conversion
closely preserves the appearance at scale factor 1, but rasterizer and casing
differences mean it does not promise pixel-identical output to the former PNGs.
