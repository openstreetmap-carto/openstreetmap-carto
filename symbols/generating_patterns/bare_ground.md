The bare ground patterns `symbols/rock_overlay.svg` and `symbols/scree_overlay.svg` are generated from the jsdotpattern sources `rock.svg` and `scree.svg` (identical to `reef.svg`) as defined in [`patterns.yaml`](../../patterns.yaml) with

```
scripts/generate_patterns.py rock_overlay scree_overlay
```

The rock symbols overlap and are drawn with a white stroke casing in the source so they stay distinguishable.  As the pattern is rendered over different fills, these casings are not drawn but cut out of the rocks below them (`erase: "#ffffff"`), leaving transparent gaps.
