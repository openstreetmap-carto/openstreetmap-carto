/* Features related to (postal) adresses: */

@address-color: #666;

#interpolation {
  [zoom >= 17] {
    line-color: @address-color;
    line-width: 1;
    line-dasharray: 2,4;
  }
}

#addresses {
  [zoom >= 17] {
    text-name: "[addr_housename]";
    ["addr_housenumber" != null] {
      text-name: [addr_housenumber];
      ["addr_housename" != null] {
        text-name: [addr_housenumber] + "\n" + [addr_housename];
      }

    }
    text-face-name: @book-fonts;
    text-fill: @address-color;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-size: 10;
    text-wrap-width: 30; // 3.0 em
    text-line-spacing: -1.5; // -0.15 em
    text-margin: 3; // 0.3 em
    [zoom >= 18] {
      text-halo-radius: @standard-halo-radius * 1.25;
      ["addr_unit" != null]["addr_housenumber" = null] {
        text-name: [addr_unit];
      }
      ["addr_flats" != null]["addr_housenumber" = null] {
        text-name: [addr_flats];
      }
      ["addr_unit" != null] {
        text-name: [addr_housenumber] + " " + [addr_unit];
        ["addr_housename" != null] {
          text-name: [addr_housenumber] + " " + [addr_unit] + "\n" + [addr_housename];
        }
      }
      ["addr_flats" != null] {
        text-name: [addr_housenumber] + " " + [addr_flats];
        ["addr_housename" != null] {
          text-name: [addr_housenumber] + " " + [addr_flats] + "\n" + [addr_housename];
        }
      }
    }
    [zoom >= 20] {
        text-size: 11;
        text-wrap-width: 22; // 2.0 em
        text-line-spacing: -1.65; // -0.15 em
        text-margin: 3.3; // 0.3 em
    }
  }
}

/* Building names (rendered differently from addresses because they are
no official postal addresses) */

#building-text {
  [zoom >= 14][way_pixels > 3000],
  [zoom >= 17] {
    text-name: "[name]";
    text-face-name: @book-fonts;
    text-fill: #444;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-size: 11;
    text-wrap-width: 22; // 2.0 em
    text-line-spacing: -1.65; // -0.15 em
  }
}

/* Further attempts for names whose centred placement collided with something, e.g. the
   icon of a shop or room inside the building: try positions around the label point,
   one attachment per position, in this order. The name stays horizontally centred on
   each position, so it never ends up further than the offset from the label point.
   text-repeat-distance drops it when an earlier attempt already placed it. Only for
   buildings large enough on screen that the moved name still sits on them and not
   for buildings that are already a POI themselves, since those are already labelled. */
#building-text::dodge-n,
#building-text::dodge-s,
#building-text::dodge-e,
#building-text::dodge-w,
#building-text::dodge-ne,
#building-text::dodge-se,
#building-text::dodge-nw,
#building-text::dodge-sw {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] {
    text-name: "[name]";
    text-face-name: @book-fonts;
    text-fill: #444;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-size: 11;
    text-wrap-width: 22; // 2.0 em
    text-line-spacing: -1.65; // -0.15 em
    text-horizontal-alignment: middle;
    text-repeat-distance: 100;
  }
}

#building-text::dodge-n {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dy: -8; }
}
#building-text::dodge-s {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dy: 8; }
}
#building-text::dodge-e {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dx: 28; }
}
#building-text::dodge-w {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dx: -28; }
}
#building-text::dodge-ne {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dx: 28; text-dy: -8; }
}
#building-text::dodge-se {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dx: 28; text-dy: 8; }
}
#building-text::dodge-nw {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dx: -28; text-dy: -8; }
}
#building-text::dodge-sw {
  [zoom >= 14][way_pixels > 3000][poi_feature = null],
  [zoom >= 17][way_pixels > 1000][poi_feature = null] { text-dx: -28; text-dy: 8; }
}
