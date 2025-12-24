#ocean-lz,
#ocean {
  polygon-fill: @water-color;
}

#icesheet-poly {
  [zoom >= 5] {
    polygon-fill: @glacier;
  }
}

#icesheet-outlines {
  [zoom >= 5] {
    [ice_edge = 'ice_ocean'],
    [ice_edge = 'ice_land'] {
      line-width: 0.375;
      line-color: @glacier-line;
      [zoom >= 8] {
        line-width: 0.5;
      }
      [zoom >= 10] {
        line-dasharray: 4,2;
        line-width: 0.75;
      }
    }
  }
}
