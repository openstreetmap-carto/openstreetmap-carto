The beach and reef patterns `symbols/beach.svg`, `symbols/beach_coarse.svg` and `symbols/reef.svg` are generated from the jsdotpattern sources `beach.svg` and `reef.svg` as defined in [`patterns.yaml`](../../patterns.yaml) with

```
scripts/generate_patterns.py beach beach_coarse reef
```

The beach pattern is drawn at 40% opacity: its source shapes are grey (`#9a9a9a`) and the former PNG version derived its alpha from that grey level.
