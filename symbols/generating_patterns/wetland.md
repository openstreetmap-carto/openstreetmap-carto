The wetland patterns are composed from two separately generated jsdotpattern sources:

* `wetland.svg`: the generic wetland pattern of 7x1 px dashes (256 px tile). It is used on its own as `symbols/wetland.svg` and, tiled 2x2, as the base of the other wetland patterns.
* `marsh.svg`, `reed.svg`, `bog.svg`, `mangrove.svg` and `swamp.svg`: the symbols of the specific wetland types (512 px tiles).

The patterns `symbols/wetland.svg`, `symbols/wetland_marsh.svg`, `symbols/wetland_reed.svg`, `symbols/wetland_bog.svg`, `symbols/wetland_mangrove.svg` and `symbols/wetland_swamp.svg` are generated from them by

```
scripts/generate_landcover_patterns.py wetland wetland_marsh wetland_reed wetland_bog wetland_mangrove wetland_swamp
```

In the composed patterns the dashes are drawn at 80% opacity and every dash pixel within a casing of 1.9 px around a symbol is removed (as are isolated single dash pixels), so the symbols stand free of the dashes. The dashes stay aligned to whole pixels. The symbol colors are set by the script.

This mirrors the ImageMagick raster process the patterns were originally built with (rasterizing the symbols at 8x resolution, growing them with `-morphology Erode Disk:5.3` and `Disk:10.3`, masking the dashes with the result and removing isolated pixels with `-morphology hitandmiss peaks:1.9`); the casing width was calibrated against the former PNG patterns.
