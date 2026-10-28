The scrub source is exported from [jsdotpattern](https://www.imagico.de/map/jsdotpattern.php#x,512,jdp60679;g,24,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rd,1,1,0,scrub2,1,5,5,0,jdp97432,b0be93,c8d7ab;) using this command sequence:

```text
x,512,jdp60679;g,24,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rd,1,1,0,scrub2,1,5,5,0,jdp97432,b0be93,c8d7ab;
```

This makes a 512x512 periodic pattern with 441 placements of `scrub2`, the
existing symbol, size and colors. Four rounds of relaxation preserve even
spacing. The first `1` in `rd,1,1,0,...` enables pixel alignment; the second
inlines symbols in the exported source. Save the SVG export as `scrub.svg` in
this directory, then run from the repository root:

```sh
scripts/generate_landcover_patterns.py scrub
```

The converter sets the pattern color and clips the periodic copies at the
repeat boundary. Do not edit the generated `symbols/scrub.svg` by hand.

This source was regenerated with jsdotpattern revision
[`d20f66f86fc36f7d6b16d892633fa98ed3b3b151`](https://github.com/imagico/jsdotpattern/tree/d20f66f86fc36f7d6b16d892633fa98ed3b3b151).
The old SVG export and PNG did not agree on symbol placements. However, the
documented recipe uses fixed random seeds and reproduces all 441 periodic symbol
positions of the former PNG, including pixel alignment. Regeneration therefore
preserves the arrangement without depending on recovery from that PNG. Small
rasterization differences can remain. Export-generated SVG identifiers may vary
without changing the rendered geometry.
