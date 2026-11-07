The wetland patterns are composed from two separately generated jsdotpattern sources:

* `wetland.svg`: the generic wetland pattern of 7x1 px dashes aligned to the pixel grid (256 px tile). It is used on its own as `symbols/wetland.svg` and as the base of the other wetland patterns.
* `marsh.svg`, `reed.svg`, `bog.svg`, `mangrove.svg` and `swamp.svg`: the symbols of the specific wetland types (512 px tiles).

The patterns `symbols/wetland.svg`, `symbols/wetland_marsh.svg`, `symbols/wetland_reed.svg`, `symbols/wetland_bog.svg`, `symbols/wetland_mangrove.svg` and `symbols/wetland_swamp.svg` are defined in [`patterns.yaml`](../../patterns.yaml) and generated with

```
scripts/generate_patterns.py wetland wetland_marsh wetland_reed wetland_bog wetland_mangrove wetland_swamp
```

In the composed patterns the dashes are a layer below the symbols, repeated 2x2, drawn at 80% opacity and kept free around the symbols: dash pixels covered at least half by a casing of 1.95 px around the symbols (including the areas they enclose) are removed, so the dashes stay aligned to the pixel grid, and dash parts of a single pixel left over are dropped.

This is the vector equivalent of the ImageMagick raster process the patterns were originally built with: rasterizing the symbols at 8x resolution, growing them with `-morphology Erode Disk:5.3` and `Disk:10.3` (5.3 + 10.3 px at 8x = 1.95 px) and filling the enclosed areas, masking the dashes with the result at 50% and removing isolated pixels with `-morphology hitandmiss peaks:1.9`.
