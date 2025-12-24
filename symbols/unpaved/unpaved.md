Base pattern file (`unpaved.svg`) for unpaved roads is generated as follows:

1. Visit [jsdotpattern (command sequence is recorded)](www.imagico.de/map/jsdotpattern.php#x,64,jdp59980;g,2.25,16,16;rx,250,2,8,8;rx,250,2,8,8;s,jdp58799;s,jdp49103;rx,250,2,8,8;rx,250,2,8,8;s,jdp94534;rx,250,2,8,8;rd,0,0,1,scree,0.07,5,10,0,jdp40148,0000ff,ffffff;) Use "get pattern SVG data" (it is expected that background will be transparent, background colour in jsdotpattern is only for display).

2. Generated SVG image is sanitized for use with Mapnik by the script `svg_pattern.sh` from the [jsdotpattern repository](http://github.com/imagico/jsdotpattern).

3. The sanitized file is then edited manually, and the `<rect>` element is put above the `<path>` element. The file is saved as `unpaved.svg`.

From sanitized base SVG file (`unpaved.svg`), the coloured SVG versions are created. Just create a copy of the file, and within the SVG code replace `fill:#0000ff` with the actual foreground colour and `fill:none` with the actual background colour. This can be done automatically with `scripts/generate_unpaved_patterns.py`.
