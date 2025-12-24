@golf-color: #666;

#landcover[zoom >= 12] {
  ::high-zoom[zoom >= 12] {
    [feature = 'golf_tee'],
    [feature = 'golf_fairway'],
    [feature = 'golf_rough'],
    [feature = 'golf_driving_range'] {
      polygon-fill: @grass;
    }
  }
  ::high-zoom[zoom >= 13] {
    [feature = 'golf_green'] {
      polygon-fill: @pitch;
    }
    [feature = 'golf_bunker'] {
      polygon-fill: @sand;
    }
  }
  ::high-zoom[zoom >= 15] {
    [feature = 'golf_rough'] {
      polygon-pattern-file: url('symbols/golf_rough.svg');
    }
  }
}

#golf-line[zoom >= 16] {
  [golf = 'hole'] {
    line-color: @golf-color;
    line-width: 0.5;
  }
}

// Note that golf hole names (if set) are not used for labelling.
// This is because replacing the ref with a name removes the order of the golf holes from the map.
// Previously the name would replace the ref, which was causing mappers to incorrectly put the hole number into the name, e.g. "1 First Hole".
// This is not a valid name, see https://wiki.openstreetmap.org/wiki/Tag:leisure%3Dgolf_course
// See https://github.com/gravitystorm/openstreetmap-carto/pull/5133 for discussion on removal of name.
#text-line[zoom >= 16] {
  [feature = 'golf_hole'][ref != ''] {
    text-placement: line;
    text-size: 11;
    text-fill: @golf-color;
    text-face-name: @book-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-name: "[ref]";

    [zoom >= 17] { text-size: 13; }
  }
}

#amenity-points[zoom >= 16] {
  [feature = 'golf_pin'] {
    marker-file: url('symbols/leisure/golf_pin.svg');
    marker-fill: @golf-color;
    marker-clip: false;
  }
}

#text-point[zoom >= 17] {
  [feature = 'golf_pin'][ref != ''] {
    text-name: "[ref]";
    text-size: @standard-font-size;
    text-fill: @golf-color;
    text-face-name: @book-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-horizontal-alignment: middle;
    text-dx: 1;
    text-dy: 6;
  }
}
