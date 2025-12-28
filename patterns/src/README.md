# Vector pattern generation
This file contains some documentation on the patterns in `symbols/landcover`.
Some of the patterns are created by hand, others are generated.
Most of the more complex patterns are generated with `generate_pattern.py` from a text file.

### Pattern text file format
The first line of a pattern text file has the tile size.
Next the style of the symbols, such as color, opacity and stroke-width (provided as SVG attributes).
The third line should be the symbol shape (the instructions inside an SVG `path`). Make sure all path commands use relative positions.
Most of the rest is a list of x,y coordinates where to insert the symbol.
It is possible to concatenate multiple symbols with their list of coordinates to generate a pattern with multiple symbols.


## Basic hatches

### `allotments.svg`
Tiles of 8×8px.
Dots with a radius of 0.95px in a rectangular 8×8 grid (color: `#f2efe9`).

### `orchard.svg`
Tiles of 8×8px.
Square dots of 1px in a rectangular 8×8 grid (color: `#759e6c`).

### `danger_red_hatch.png`
Tiles of 32×32px.
Diagonal lines with a horizontal distance of 16px on top of a background of `#ff5555` with 10% opacity.
Every line has a width of 2√2px (color: `#ff5555` and 10% opacity).

### `military_red_hatch.png`
Tiles of 32×32px.
Diagonal lines with a horizontal distance of 16px on top of a background of `#ff5555` with 8% opacity.
Every line has a width of ½√2px (color: `#ff5555` and 12% opacity).

### `grey_vertical_hatch.png`
Tiles of 32×32px.
Vertical lines with a distance of 16px on top of a background of `#8e8e8e` with 14% opacity.
Every line has a width of 3px (color: `#8e8e8e` and 32.9% opacity).

### `intermittent_water.png`
Tiles of 32×32px.
Horizontal lines with a width of 2px, repeated every 4px (color: `#aad3df`).


## Random dot patterns

### `plant_nursery.svg`
Tiles of 30×30.
Square dots of 1px in a triangular grid with a 6px distance (color: `#0e5500` and 57.5% opacity).
Vertical spacing is ½√3=5.2; rounded down to 5px.
Final svg generated with `generate_pattern.py` from `plant_nursery.txt`.

### `salt_dots.svg`
Tiles of 256×256px.
Dots in a random pattern (color: `#ffffff`).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,256,jdp68152;g,5,32,32;rx,25,2,32,32;rx,25,2,32,32;rx,25,2,32,32;rd,0,0,0,dot,0.125,10,9,0,jdp48264,ffffff,cdebb0;).
The positions are rounded to two decimals, repeated across tile boundaries, and saved in `salt_dots.txt`.
The dots are offset by -0.05,-0.05px to align with a pre-existing svg.
Final svg generated with `generate_pattern.py` from `salt_dots.txt`.

### `beach.svg`
Tiles of 128×128px.
Dots in a random pattern (color: `#685d45` and 40% opacity).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,128,jdp59980;g,2.25,16,16;rx,250,2,8,8;rx,250,2,8,8;s,jdp58799;s,jdp49103;rx,250,2,8,8;rd,0,0,1,scree,0.1,5,10,0,jdp31724,dbb677,fff1ba;), rounded to two decimals and repeated across tile boundaries.
Most of the dots have a radius of 0.85px, but some have a radius of 0.8px or 1px.
Their distribution is based on the appearance of a pre-existing svg, with the positions saved in `beach.txt`.
Final svg generated with `generate_pattern.py` from `beach.txt`.

### `scree.svg`
Tiles of 256×256px.
Dots and lines in a random pattern (color: `#cbc9c6`).
Positions generated with jsdotpattern, command sequence unknown.
Most of the dots have a radius of 1px, but some have a radius of 1.2px are a short line 0.8px wide.
Their distribution is based on the appearance of a pre-existing svg, with the positions saved in `scree.txt`.
Final svg generated with `generate_pattern.py` from `scree.txt`.

### `reef.svg`
Tiles of 256×256px.
Based on `scree.svg`, color: `#549ccd`.

### `beach_coarse.svg`
Tiles of 256×256px.
Based on `scree.svg`, color: `#969696`.

### `golf_rough.svg`
Tiles of 128×128px.
Dots in a random pattern (color: `#a5d979`).
Positions based on `beach`, size and shape of dots based on `scree`.
Final svg generated with `generate_pattern.py` from `golf_rough.txt`.


## Patterns with symbols, rectangular grid

### `dog_park.svg`
Tiles of 32x32px.
Two dog paw prints based on `shop/pet.svg`, scaled to 10x10px (color: `#a6e0ab` and 70% opacity).

### `grave_yard_generic.svg`
Tiles of 32x32px.
A single symbol, repeated in a 32×32 grid. (color: `#88b78e`).

### `grave_yard_christian.svg`
Tiles of 32x32px.
A single symbol, repeated in a 32×32 grid. (color: `#88b78e`).

### `grave_yard_jewish.svg`
Tiles of 32x32px.
A single symbol, repeated in a 32×32 grid. (color: `#88b78e`).

### `grave_yard_muslim.svg`
Tiles of 32x32px.
A single symbol, repeated in a 32×32 grid. (color: `#88b78e`).


## Patterns with symbols, generated positions

A preview of the different forest symbols is available in `forest.svg`.
Note that the forest patterns don't have 40% opacity applied to the pattern, but at the Mapnik layer/attachment level.
This is to handle overlappings forest areas.

### `leaftype_unknown.svg`
Tiles of 256×256px.
Random pattern of two symbols with a 30px distance (color: `#6b8d5e`).
Positions originally generated with jsdotpattern, command sequence not recorded.
Coordinates are recreated from a pre-existing svg, positions saved in `leaftype_unknown.txt`.
Final svg generated with `generate_pattern.py` from `leaftype_unknown.txt`.

### `leaftype_broadleaved.svg`
Tiles of 256×256px.
Based on `leaftype_unknown.svg`, but with only one symbol (color: `#6b8d5e`).
Final svg generated with `generate_pattern.py` from `leaftype_broadleaved.txt`.

### `leaftype_leafless.svg`
Tiles of 256×256px.
Based on `leaftype_unknown.svg`, but with only one symbol (color: `#6b8d5e`).
Final svg generated with `generate_pattern.py` from `leaftype_leafless.txt`.

### `leaftype_mixed.svg`
Tiles of 256×256px.
Based on `leaftype_unknown.svg`, with two other symbols (color: `#6b8d5e`).
Final svg generated with `generate_pattern.py` from `leaftype_mixed.txt`.

### `leaftype_needleleaved.svg`
Tiles of 256×256px.
Based on `leaftype_unknown.svg`, but with only one symbol (color: `#6b8d5e`).
Final svg generated with `generate_pattern.py` from `leaftype_needleleaved.txt`.

### `quarry.svg`
Tiles of 256×256px.
Symbols repeated in a triangular grid with a 45px distance (color: `#e6e6e6`).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,128,jdp32360;gv,6,32,32;rd,1,0,0,pixel,0.125,4,4,0,jdp23814,749d6c,aedea3;)
The positions are rounded down and saved in `quarry.txt`.
Final svg generated with `generate_pattern.py` from `quarry.txt`.

### `salt_pond.svg`
Tiles of 128×128px.
Symbols repeated in a triangular grid with a 17px distance (color: `#ffffff`).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,128,jdp58391;gv,17,32,32;)
The positions are rounded down and saved in `salt_pond.txt`.
Final svg generated with `generate_pattern.py` from `salt_pond.txt`.

### `scrub.svg`
Tiles of 512×512px.
Random pattern of scrub symbols (color: `#b0be93`).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,512,jdp60679;g,24,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rd,1,1,0,scrub2,1,5,5,0,jdp97432,b0be93,c8d7ab;).
The positions are rounded down, repeated across tile boundaries, and saved in `scrub.txt`.
Final svg generated with `generate_pattern.py` from `scrub.txt`.

### `vineyard.svg`
Tiles of 32x32px.
Short vertical lines in a triangular pattern (color: `#759e6c` and 38% opacity).
Positions have been recreated after a pre-existing raster image.
Final svg generated with `generate_pattern.py` from `vineyard.txt`.

### `wetland.svg`
Tiles of 256×256px.
Random pattern of short horizontal lines (color: `#4aa5fa`).
Positions originally generated with jsdotpattern, command sequence not recorded.
Coordinates are recreated from a pre-existing svg, positions saved in `wetland.txt`.
Final svg generated with `generate_pattern.py` from `wetland.txt`.


## Wetland patterns
All wetland tiles are 512×512px. The basis is `wetland512.txt`, which has the coordinates of `wetland.txt` repeated to cover the larger size.

The wetland patterns put different plant symbols on top of the blue wetland lines.
The symbols have a ~2px casing around them, rounded to the nearest pixel boundary.
If there is only 1 pixel left of the lines in the covered wetland pattern, that part of the line is be removed.

`generate_pattern.py` has some complexity to deal with this, but only in a very basic way. It is hard-coded for the wetland patterns, and every shape has the outline of its casing manually recorded in the text file.

A preview of the various shapes is available in `wetland_casings.svg` (created by adding a copy of the shape with `stroke-width="4"`, and eyeballing the closest pixel boundary).

### `wetland_marsh.svg`
Tiles of 512x512px.
Random pattern of two grass symbols (color: `#73b386`), on top of the `wetland512` pattern.
Positions originally generated with jsdotpattern, command sequence not recorded.
Coordinates are recreated from a pre-existing svg, positions saved in `wetland_marsh.txt`.
Final svg generated with `generate_pattern.py` from `marsh.txt` and `wetland512.txt`.

### `wetland_reed.svg`
Tiles of 512x512px.
Based on `marsh.txt`, but with two reed symbols (color: `#73b386`).
Final svg generated with `generate_pattern.py` from `reed.txt` and `wetland512.txt`.

### `wetland_swamp.svg`
Tiles of 512x512px.
Based on `marsh.txt`, but with the two symbols of `leaftype_unknown` (color: `#6b8d5e` and 40% opacity).
Final svg generated with `generate_pattern.py` from `swamp.txt` and `wetland512.txt`.

### `wetland_bog.svg`
Tiles of 512x512px.
Based on `marsh.txt`, but with only one symbol (color: `#73b386`).
Final svg generated with `generate_pattern.py` from `bog.txt` and `wetland512.txt`.

### `wetland_mangrove.svg`
Tiles of 512x512px.
Based on `marsh.txt`, but with only one symbol (color: `#709b6f`).
Final svg generated with `generate_pattern.py` from `mangrove.txt` and `wetland512.txt`.

### Casing format in text file
The wetland `.txt` files contain a `casing:` line. Example:
```
Casing: -5 -3|0 -3|4 -4|6 -5|7 -6|7 -5|6 -5|6 -5|6 -5|6 -5|6 -4|6
```
The first number is the number of pixels that the casing starts above the insertion point of the symbol.
Then for every lineof pixels there is a `left|right` pair describing the shape of the casing.
`-3|4` means the casing starts at `-3` from the insertion point: 3px to the left; and end at `4`; 4px to the right.


## Rock

### `rock.svg`
Tiles of 256×256px.
Random pattern of 12 complex shapes, each with 13 possible rotations.
The positions are close enough for the shapes to overlap.
Every shape has both a fill, and a casing of 0.6px around it to hide part of the underlying shapes.

Overlapping shapes, with a casing as outline in between, don't work with a pattern with opacity.
That is why `rock.svg` is the only pattern that needs to include both a foreground color (`#cfcdca`) and background color (`#eee5dc`).

One option to include casing is to repeat every shape twice: once with a stroke of 1.2px with the background color, and then one with only a fill on top of that.
An alternative is to offset the path of the shape by 0.3px, and use that single shape with both a fill and a stroke of 0.6px.
The alternative almost halves the complexity for the rasterizer, so now all shapes are offset in Inkscape.

A preview of the various original and offset shapes is available in `rock_outlines.svg`.

Pattern positions originally generated with jsdotpattern, command sequence not recorded.
`rock.txt` contains a list of coordinates, shapes and orientations extracted from a pre-existing svg.
`rock.py` is a script to convert the coordinates to SVG `use` elements, which are manually combined with the shapes from `rock_outlines` to create `rock.svg`.
