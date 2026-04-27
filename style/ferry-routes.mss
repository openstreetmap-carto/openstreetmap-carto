@ferry-route: #66f;
@ferry-route-text: @ferry-route;

// Overlapping dashed lines of ferry routes can look like a continues line
// (see #457). To avoid this we draw a masking line behind the ferry routes.
// That line is drawn with comp-op: dst-out, and with `gamma: 0` to prevent
// aliasing issues.
//
// To limit the masking operation to just this layer, opacity or comp-op needs
// to be set at the layer level. Sadly setting default values like `opacity: 1`
// or `comp-op: scr-over` don't work. As a hack we set opacity to 0.99999.

#ferry-routes {
  opacity: 0.99999;

  [zoom >= 8] {
    mask/line-width: 0.4;
    mask/line-comp-op: dst-out;
    mask/line-gamma: 0;
    line-color: @ferry-route;
    line-width: 0.4;
    line-dasharray: 4,4;
    [zoom >= 11] {
      mask/line-width: 0.8;
      line-width: 0.8;
      line-dasharray: 6,6;
    }
  }
}

#ferry-routes-text {
  [zoom >= 13] {
    text-name: "[name]";
    text-face-name: @book-fonts;
    text-placement: line;
    text-fill: @ferry-route-text;
    text-spacing: 1000;
    text-size: 10;
    text-dy: -8;
  }
}
