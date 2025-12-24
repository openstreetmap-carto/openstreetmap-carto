# OpenStreetMap Carto contribution guidelines

## Reporting issues

As OpenStreetMap data is always changing, rendering bug reports should **always**
contain a cropped screenshot of the problem, and a link to the area. Don't assume
that we will see exactly what you see. If a particular OSM object is an issue,
the issue should contain the tagging of the object.

## Workflow

We operate the "Fork & Pull" model explained at

https://help.github.com/articles/about-pull-requests/

You should fork the project into your own repo, create a topic branch
there and then make one or more pull requests back to the gravitystorm repository.
Your pull requests will then be reviewed and discussed.

Pull requests that change the cartography should contain a few images selected
to show the changes. The easiest way to make these is by taking screenshots and
cropping them, then pasting them into the issue. Avoid adding an overwhelming
number of screenshots.

The images are not intended to replace reviewing changes in Kosmtik or TileMill,
but to provide an overview.

### Previews

Some changes benefit from a review over a wider area and many zooms, where static
images might not be sufficient and a demo layer is necessary. pnorman has a server
 which can host layers and has some data from parts of the world loaded. Before
 requesting this in a pull request, make sure that it is in a stable condition.

## Easy pickings

Some [easy issues](https://github.com/gravitystorm/openstreetmap-carto/labels/good%20first%20issue) have been selected
that are particularly suitable for new contributors to get familiar with the project's code base and the contribution process.

## Editing layers

OpenStreetMap Carto uses a YAML file for defining layers, because it [works much
better for big projects](https://github.com/gravitystorm/openstreetmap-carto/issues/711).
This requires CartoCSS 0.18.0 or later. If you need JSON MML, you can generate it
with `python -c 'import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout)' < project.mml > project.json`
or the equivalent in a different language.

[Kosmtik](https://github.com/kosmtik/kosmtik) and CartoCSS can directly load the project from
the YAML file with `node index.js serve path/to/openstreetmap-carto/project.mml`

## CartoCSS style guidelines

* Always specify zoom levels as either >= or < . Don't use = or =< or >
* Open curly braces on the same line, and close on an empty line.
* One space before and after = etc
* Two space indents. No tabs.
* space after : but not before
* Dashes, not underscores, in layer names
* Avoid restating defaults, e.g. don't add `point-allow-overlap = false`. Where
  Mapnik 2.x and 3.0 have different defaults, they should be stated
* Avoid repeating the layer name for layers with multiple attachments, i.e., prefer

```mss
#layer {
  ::outline {
    line-width: 6;
    line-color: black;
  }
  ::inline {
    line-width: 2;
    line-color: white;
  }
}
```
instead of

```mss
#layer::outline {
    line-width: 6;
    line-color: black;
}
#layer::inline {
    line-width: 2;
    line-color: white;
}
```
* Order the selectors in a style-sheet in rough order of importance (i.e.,
  `highway=primary`, then `highway=secondary`) and beyond that, add layers that
  are rendered later (i.e., higher) lower in the file.
* For features where the symbolizer attributes change on different zoom levels,
  the main definition should be for the lowest zoom level. Also, avoid nesting
  zoom-based overrides. For example:

```mss
#layer[feature = 'foo'][zoom >= 13] {
  line-width: 6;
  line-color: black;
  [zoom >= 15] {
    line-width: 7;
  }
  [zoom >= 17] {
    line-width: 10;
  }
}
```
instead of
```mss
#layer[feature = 'foo'][zoom >= 13] {
  line-width: 10;
  line-color: black;
  [zoom < 18] {
    line-width: 7;
    [zoom < 16] {
      line-width: 6;
    }
  }
}
```
* Use the PostgreSQL quoting syntax for attributes (columns) and string-values of selectors.
  Use no quotes or double quotes for attributes (columns) and single quotes for string-values.
  For Example:

```mss
#layer[entrance = 'yes'] {
  marker-width: 6.0;
}
#layer["generator:source" = 'wind'] {
  marker-width: 8.0;
}
```
instead of
```mss
#layer[entrance = "yes"] {
  marker-width: 6.0;
}
#layer['generator:source' = 'wind'] {
  marker-width: 8.0;
}
```

## SQL style guidelines
Because SQL within JSON or YAML will not generally be syntax highlighted, indentation and caps are particularly important.

* SQL keywords in caps, as in PostgreSQL documentation
* Two space indents. No tabs.
* Start with `(SELECT` and start the columns on the next line.
* Two indents for columns, to bring them to the same indent level as later clause contents
* Add indentation after `SELECT`s until the end of the sub-select.
* Add indentation for contents of `FROM`, `WHERE`, `ORDER BY` and other clauses
* Put content with WHERE, etc if it's short
* Add indentation if necessary for complex function calls, WHERE parentheses, and CASE statements
* One space before and after = etc
* Name SQL subqueries after the layer name (but use underscores)
* When extracting tags from hstore, use `tags->'foo'`, not `tags -> 'foo'`, and only add parentheses if needed for order of operations
* Hstore queries tested for NULL should be enclosed in parentheses, e.g. `(tags->'foo') IS NULL`.
* To check if a tag is in the tags hstore, use `tags @> 'foo=>bar'`, relying on automatic conversion from `text` to `hstore`.

## Map icon guidelines

* All new icons must be SVG format only.  The SVG must be saved as standards compliant SVG without any proprietary tags. In Inkscape software, you will need to "Save As..." and choose the format Optimized SVG (preferable) or Plain SVG.
* Icons must use SVG fills only, not SVG strokes or any feature Mapnik does not support.
* Use no color for the icon's fill if the icon is monochromatic. This allows the color to be set in the MSS.
* Use a common canvas size, which is usually 14x14 px.
* Convert shapes and other components to paths and merge them into a compound path.
* Draw a simple siloutte of the subject with an "on the shelf" perspective.
* Align vectors to the pixel grid.
* Make a clean design, so reduced complexity where possible.

### External icon design resources
The project's goals and design philsophy are different from other projects, but some external resources with general information about icon design are:

* [Maki Icons Design Guidelines](https://labs.mapbox.com/maki-icons/guidelines/)
* [GNOME Icon Design Guildelines](https://developer.gnome.org/hig/guidelines/ui-icons.html)

## Typography

This style uses the font "Noto" for a world-wide coverage of scripts. The font
size should be ≥ 10 (legibility).

### Multi-line labels

Additional to text-size we have to set text-wrap-width and text-line-spacing.
For both, the absolute value is quite meaningless; it should rather be
interpreted relative to the font size (em) that has been set in “text-size”:
```mss
text-size: 10;
text-wrap-width: 30; // 3.0 em
text-line-spacing: -1.5; // -0.15 em
```
- The text-size is 10, so we have: 1 em = 10
- The text-wrap-width should be 3.0 em, so we have: 3.0 * 10 = 30
- The text-line-spacing should be -0.15 em, so we have: -0.15 * 10 = -1.5

If text-size increases on higher zoom levels the other parameters also have
to be adjusted to guarantee the same line wrap and same relative line spacing:
```mss
text-size: 12;
text-wrap-width: 36; // 3.0 em
text-line-spacing: -1.8; // -0.15 em
```

Usually, with higher zoom levels we increase the line length
(text-wrap-width measured in em!).

Following an old typography convention, we use narrow
line spacing for short lines and wider line spacing for longer lines.
```mss
text-size: 15;
text-wrap-width: 75; // 5.0 em
text-line-spacing: -0.75; // -0.05 em
```
Noto’s line spacing is rather large to allow also tall scripts like Myanmar
to be rendered without collisions. But the line spacing is too large for
cartographic usage; therefore we reduce the line spacing. Currently, the
line spacing ranges from -0.15 em to -0.05 em. (Even at -0.15 em, collisions
are seldom and even then the text stays legible).

## Syntax highlighting

Most of the style development happens within CartoCSS MSS and MML files. Syntax highlighting can make editing more pleasant.

Editors based on KDE Frameworks (Kate, KWrite, KDevelop…) provide syntax highlighting for CartoCSS MSS out-of-the-box, and starting with KF 5.100 also for CartoCSS MML including SQL highlighting within the YAML structure.

Also, Yohan Boniface [has developed](https://github.com/yohanboniface/carto-atom) highlighting for CartoCSS MSS for editors that use the TextMate Language Grammar for syntax highlighting: Atom (install package “language-carto”), Visual Studio Code, Jetbrains…
