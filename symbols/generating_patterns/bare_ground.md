The bare ground patterns `symbols/rock_overlay.svg` and `symbols/scree_overlay.svg` are generated from the jsdotpattern sources `rock.svg` and `scree.svg` (the latter is identical to `reef.svg`) by

```
scripts/generate_landcover_patterns.py rock_overlay scree_overlay
```

which sets the pattern color and makes the files usable with Mapnik (see the script for details). The rock symbols overlap and are drawn with a white stroke casing in the source so they stay distinguishable; as the pattern is rendered over arbitrary fills the script cuts this casing out of the underlying symbols geometrically, leaving transparent gaps.
