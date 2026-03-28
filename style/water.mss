@water-text: #4d80b3;
@glacier: #ddecec;
@glacier-line: #9cf;
//@water-tunnelfill-color: #f3f7f7;
@water-tunnelfill-color: lighten(@water-color, 20%);
@waterway-text-repeat-distance: 200;

@river-width-z8:          0.7;
@river-width-z9:          1.2;
@river-width-z10:         1.5;
@river-width-z11:         1.8;
@river-width-z12:         2.3;
@river-width-z13:         3;
@river-width-z14:         4.5;
@river-width-z15:         6;
@river-width-z16:         8;
@river-width-z17:         10;
@river-width-z18:         12;

@canal-scale-factor-z12z13:  0.8;
@canal-scale-factor:      0.6;

@stream-width-z12:        0.8;
@stream-width-z13:        1.4;
@stream-width-z14:        2;
@stream-width-z15:        2.5;
@stream-width-z16:        3;
@stream-width-z17:        3.5;
@stream-width-z18:        4;

@ditchdrain-width-z14:        1.5;
@ditchdrain-width-z16:        2;
@ditchdrain-width-z18:        2.5;

#water-areas {
  [natural = 'glacier']::natural {
    [zoom >= 5] {
      line-width: 1.0;
      line-color: @glacier-line;
      polygon-fill: @glacier;
      [zoom >= 10] {
        line-dasharray: 4,2;
        line-width: 1.5;
      }
    }
  }

  [waterway = 'dock'],
  [landuse = 'basin'],
  [natural = 'water'],
  [landuse = 'reservoir'],
  [waterway = 'riverbank'] {
    [int_intermittent = 'no'] {
      polygon-fill: @water-color;
      [way_pixels >= 4] { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6; }
    }
    [int_intermittent = 'yes'] {
      polygon-pattern-file: url('patterns/intermittent_water.svg');
      [way_pixels >= 4] { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.6; }
    }
  }
}

#water-lines-low-zoom {
  [waterway = 'river'][zoom >= 8][zoom < 12] {
    [int_intermittent = 'yes'] {
      line-dasharray: 8,4;
      line-cap: butt;
      line-join: round;
    }
    line-color: @water-color;
    line-width: @river-width-z8;
    [zoom >= 9] { line-width: @river-width-z9; }
    [zoom >= 10] { line-width: @river-width-z10; }
  }
}

#water-lines::casing, 
#waterway-bridges::casing {
  // white glow used when water stroke width is less than 3 px and only at "mid zoom" (13 - 17)

  [waterway = 'stream'] {
    [int_tunnel = 'no'][zoom < 16] {
      [zoom = 13][int_intermittent != 'yes'],
      [zoom >= 14] {
        line-color: white;
        line-opacity: 0.75;
        line-width: @stream-width-z13 + 0.5;
        [zoom >= 14] { line-width: @stream-width-z14 + 0.4; }
        [zoom >= 15] { line-width: @stream-width-z15 + 0.3; }
        [int_intermittent = 'yes'] {
          line-dasharray: 4,3;
          line-cap: butt;
          line-join: round;
        }
      }
    }
  }

  [waterway = 'ditch'],
  [waterway = 'drain'] {
    [int_tunnel = 'no'][zoom < 18] {
      [zoom = 14][int_intermittent != 'yes'],
      [zoom >= 15] {
        line-opacity: 0.75;
        line-color: white;
        line-width: @ditchdrain-width-z14 + 0.5;
        [zoom >= 16] { line-width: @ditchdrain-width-z16 + 0.4; }
        [int_intermittent = 'yes'] {
          line-dasharray: 4,3;
          line-cap: butt;
          line-join: round;
        }
      }
    }
  }

}

#water-lines,
#waterway-bridges {
  [waterway = 'canal'][zoom >= 12],
  [waterway = 'river'][zoom >= 12] {
    [int_tunnel = 'yes'] {
      // Background for dashed tunnel casings
      background/line-color: @water-tunnelfill-color;
      background/line-width: @river-width-z12;
      [zoom >= 13] { background/line-width: @river-width-z13; }
      [zoom >= 14] { background/line-width: @river-width-z14; }
      [zoom >= 15] { background/line-width: @river-width-z15; }
      [zoom >= 16] { background/line-width: @river-width-z16; }
      [zoom >= 17] { background/line-width: @river-width-z17; }
      [zoom >= 18] { background/line-width: @river-width-z18; }
      [waterway = 'canal'] {
        background/line-width: @river-width-z12 * @canal-scale-factor-z12z13;
        [zoom >= 13] { background/line-width: @river-width-z13 * @canal-scale-factor-z12z13; }
        [zoom >= 14] { background/line-width: @river-width-z14 * @canal-scale-factor; }
        [zoom >= 15] { background/line-width: @river-width-z15 * @canal-scale-factor; }
        [zoom >= 16] { background/line-width: @river-width-z16 * @canal-scale-factor; }
        [zoom >= 17] { background/line-width: @river-width-z17 * @canal-scale-factor; }
        [zoom >= 18] { background/line-width: @river-width-z18 * @canal-scale-factor; }
      }
      background/line-cap: round;
      background/line-join: round;
      // PROBLEM HERE. Initially round+round, then redefined as butt+miter
      background/line-cap: butt;
      background/line-join: miter;
    }

    [bridge = 'yes'][zoom >= 14] {
      bridgecasing/line-color: black;
      bridgecasing/line-join: round;
      bridgecasing/line-width: @river-width-z14 + 1;
      [zoom >= 15] { bridgecasing/line-width: @river-width-z15 + 1; }
      [zoom >= 16] { bridgecasing/line-width: @river-width-z16 + 1; }
      [zoom >= 17] { bridgecasing/line-width: @river-width-z17 + 1; }
      [zoom >= 18] { bridgecasing/line-width: @river-width-z18 + 1; }
      [waterway = 'canal'] {
        bridgecasing/line-width: @river-width-z14 * @canal-scale-factor + 1;
        [zoom >= 15] { bridgecasing/line-width: @river-width-z15 * @canal-scale-factor + 1; }
        [zoom >= 16] { bridgecasing/line-width: @river-width-z16 * @canal-scale-factor + 1; }
        [zoom >= 17] { bridgecasing/line-width: @river-width-z17 * @canal-scale-factor + 1; }
        [zoom >= 18] { bridgecasing/line-width: @river-width-z18 * @canal-scale-factor + 1; }
      }

      [int_intermittent = 'yes'] {
        bridgefill/line-color: white;
        bridgefill/line-join: round;
        bridgefill/line-width: @river-width-z14;
        [zoom >= 15] { bridgefill/line-width: @river-width-z15; }
        [zoom >= 16] { bridgefill/line-width: @river-width-z16; }
        [zoom >= 17] { bridgefill/line-width: @river-width-z17; }
        [zoom >= 18] { bridgefill/line-width: @river-width-z18; }
        [waterway = 'canal'] {
          bridgefill/line-width: @river-width-z14 * @canal-scale-factor;
          [zoom >= 15] { bridgefill/line-width: @river-width-z15 * @canal-scale-factor; }
          [zoom >= 16] { bridgefill/line-width: @river-width-z16 * @canal-scale-factor; }
          [zoom >= 17] { bridgefill/line-width: @river-width-z17 * @canal-scale-factor; }
          [zoom >= 18] { bridgefill/line-width: @river-width-z18 * @canal-scale-factor; }
        }
      }
    }

    water/line-color: @water-color;
    water/line-width: @river-width-z12;
    [zoom >= 13] { water/line-width: @river-width-z13; }
    [zoom >= 14] { water/line-width: @river-width-z14; }
    [zoom >= 15] { water/line-width: @river-width-z15; }
    [zoom >= 16] { water/line-width: @river-width-z16; }
    [zoom >= 17] { water/line-width: @river-width-z17; }
    [zoom >= 18] { water/line-width: @river-width-z18; }
    [waterway = 'canal'] {
      water/line-width: @river-width-z12 * @canal-scale-factor-z12z13;
      [zoom >= 13] { water/line-width: @river-width-z13 * @canal-scale-factor-z12z13; }
      [zoom >= 14] { water/line-width: @river-width-z14 * @canal-scale-factor; }
      [zoom >= 15] { water/line-width: @river-width-z15 * @canal-scale-factor; }
      [zoom >= 16] { water/line-width: @river-width-z16 * @canal-scale-factor; }
      [zoom >= 17] { water/line-width: @river-width-z17 * @canal-scale-factor; }
      [zoom >= 18] { water/line-width: @river-width-z18 * @canal-scale-factor; }
    }
    water/line-cap: round;
    water/line-join: round;

    [int_intermittent = 'yes'] {
      water/line-dasharray: 4,3;
      water/line-cap: butt;
    }

    [int_tunnel = 'yes'] {
      // This provides the blue dashed casing of waterway tunnels
      water/line-dasharray: 4,2;
      water/line-cap: butt;
      water/line-join: miter;
      tunnelfill/line-color: @water-tunnelfill-color;
      tunnelfill/line-width: @river-width-z12 - 1.5;
      [zoom >= 13] { tunnelfill/line-width: @river-width-z13 - 2; }
      [zoom >= 14] { tunnelfill/line-width: @river-width-z14 - 3; }
      [zoom >= 15] { tunnelfill/line-width: @river-width-z15 - 3; }
      [zoom >= 16] { tunnelfill/line-width: @river-width-z16 - 3; }
      [zoom >= 17] { tunnelfill/line-width: @river-width-z17 - 3; }
      [zoom >= 18] { tunnelfill/line-width: @river-width-z18 - 4; }
      [waterway= 'canal'] {
        tunnelfill/line-width: (@river-width-z12 - 1.5) * @canal-scale-factor-z12z13;
        [zoom >= 13] { tunnelfill/line-width: (@river-width-z13 - 2) * @canal-scale-factor-z12z13; }
        [zoom >= 14] { tunnelfill/line-width: (@river-width-z14 - 3) * @canal-scale-factor; }
        [zoom >= 15] { tunnelfill/line-width: (@river-width-z15 - 3) * @canal-scale-factor; }
        [zoom >= 16] { tunnelfill/line-width: (@river-width-z16 - 3.5) * @canal-scale-factor; }
        [zoom >= 17] { tunnelfill/line-width: (@river-width-z17 - 3.5) * @canal-scale-factor; }
        [zoom >= 18] { tunnelfill/line-width: (@river-width-z18 - 4) * @canal-scale-factor; }
      }
    }
  }

  [waterway = 'stream'] {
    [int_intermittent != 'yes'][zoom >= 12],
    [zoom >= 13] {
      [int_tunnel = 'yes'][zoom >= 14] {
        // Background for dashed tunnel casings
        // The line widths are adjusted later - this just "books in" the background layer
        background/line-color: @water-tunnelfill-color;
      // PROBLEM HERE: Join/cap style not specified?
      }

      [bridge = 'yes'][zoom >= 14] {
        bridgecasing/line-color: black;
        bridgecasing/line-join: round;
        bridgecasing/line-width: @stream-width-z14 + 1;
        [zoom >= 15] { bridgecasing/line-width: @stream-width-z15 + 1; }
        [zoom >= 16] { bridgecasing/line-width: @stream-width-z16 + 1; }
        [zoom >= 17] { bridgecasing/line-width: @stream-width-z17 + 1; }
        [zoom >= 18] { bridgecasing/line-width: @stream-width-z18 + 1; }
        bridgefill/line-color: white;
        bridgefill/line-join: round;
        bridgefill/line-width: @stream-width-z14;
        [zoom >= 15] { bridgefill/line-width: @stream-width-z15; }
        [zoom >= 16] { bridgefill/line-width: @stream-width-z16; }
        [zoom >= 17] { bridgefill/line-width: @stream-width-z17; }
        [zoom >= 18] { bridgefill/line-width: @stream-width-z18; }
      }

      water/line-width: @stream-width-z12;
      [zoom >= 13] { water/line-width: @stream-width-z13; }
      [zoom >= 14] { water/line-width: @stream-width-z14; }
      [zoom >= 15] { water/line-width: @stream-width-z15; }
      [zoom >= 16] { water/line-width: @stream-width-z16; }
      [zoom >= 17] { water/line-width: @stream-width-z17; }
      [zoom >= 18] { water/line-width: @stream-width-z18; }
      water/line-color: @water-color;

      [int_intermittent = 'yes'] {
        water/line-dasharray: 4,3;
        water/line-cap: butt;
        water/line-join: round;
      }

      [int_tunnel = 'yes'][zoom >= 14] {
        water/line-dasharray: 4,2;
        // PROBLEM HERE: join/cap not set, differs from river/canal
        background/line-width: @stream-width-z14 + 1;
        water/line-width: @stream-width-z14 + 1;
        tunnelfill/line-width: @stream-width-z14 - 0.5;
        tunnelfill/line-color: @water-tunnelfill-color;
        [zoom >= 15] { 
          background/line-width: @stream-width-z15 + 1.5;
          water/line-width: @stream-width-z15 + 1.5;
          tunnelfill/line-width: @stream-width-z15 - 1;
        }
        [zoom >= 16] { 
          background/line-width: @stream-width-z16 + 1;
          water/line-width: @stream-width-z16 + 1;
          tunnelfill/line-width: @stream-width-z16 - 1.5;
        }
        [zoom >= 17] { 
          background/line-width: @stream-width-z17 + 1;
          water/line-width: @stream-width-z17 + 1;
          tunnelfill/line-width: @stream-width-z17 - 1.5;
        }
        [zoom >= 18] { 
          background/line-width: @stream-width-z18 + 1;
          water/line-width: @stream-width-z18 + 1;
          tunnelfill/line-width: @stream-width-z18 - 1.5;
        }
      }
    }
  }

  [waterway = 'ditch'],
  [waterway = 'drain'] {
    [int_intermittent != 'yes'][zoom >= 14],
    [zoom >= 15] {
      [int_tunnel = 'yes'][zoom >= 15] {
        // Background for dashed tunnel casings
        // The line widths are adjusted later - this just "books in" the background layer
        background/line-color: @water-tunnelfill-color;
      }

      [bridge = 'yes'] {
        bridgecasing/line-color: black;
        bridgecasing/line-join: round;
        bridgecasing/line-width: @ditchdrain-width-z14 + 1;
        [zoom >= 16] { bridgecasing/line-width: @ditchdrain-width-z16 + 1; }
        [zoom >= 18] { bridgecasing/line-width: @ditchdrain-width-z18 + 1; }
        bridgefill/line-color: white;
        bridgefill/line-join: round;
        bridgefill/line-width: @ditchdrain-width-z14;
        [zoom >= 16] { bridgefill/line-width: @ditchdrain-width-z16; }
        [zoom >= 18] { bridgefill/line-width: @ditchdrain-width-z18; }
      }

      water/line-width: @ditchdrain-width-z14;
      [zoom >= 16] { water/line-width: @ditchdrain-width-z16; }
      [zoom >= 18] { water/line-width: @ditchdrain-width-z18; }
      water/line-color: @water-color;
      [int_intermittent = 'yes'] {
        water/line-dasharray: 4,3;
        water/line-cap: butt;
        water/line-join: round;
      }

      [int_tunnel = 'yes'][zoom >= 15]  {
        water/line-dasharray: 4,2;
        // PROBLEM HERE: join/cap not set, differs from river/canal
        background/line-width: @ditchdrain-width-z14 + 1.5;
        water/line-width: @ditchdrain-width-z14 + 1.5;
        tunnelfill/line-width: @ditchdrain-width-z14 - 0.5;
        tunnelfill/line-color: @water-tunnelfill-color;
        [zoom >= 16] {
          background/line-width: @ditchdrain-width-z16 + 1.5;
          water/line-width: @ditchdrain-width-z16 + 1.5;
          tunnelfill/line-width: @ditchdrain-width-z16 - 1.5;
        }
        [zoom >= 18] {
          background/line-width: @ditchdrain-width-z18 + 1;
          water/line-width: @ditchdrain-width-z18 + 1;
          tunnelfill/line-width: @ditchdrain-width-z18 - 1;
        }
      }
    }
  }

}

#water-lines-text {
  [lock = 'yes'][zoom >= 17] {
      text-name: "[lock_name]";
      text-face-name: @oblique-fonts;
      text-placement: line;
      text-fill: @water-text;
      text-spacing: 400;
      text-size: 10;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
  }

  [lock != 'yes'][int_tunnel != 'yes'] {
    [waterway = 'river'][zoom >= 13] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-spacing: 400;
      text-placement: line;
      text-repeat-distance: @waterway-text-repeat-distance;
      [zoom >= 14] { text-size: 12; }
    }

    [waterway = 'canal'][zoom >= 13] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: line;
      text-repeat-distance: @waterway-text-repeat-distance;
    }

    [waterway = 'stream'][zoom >= 15] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-spacing: 600;
      text-placement: line;
      text-vertical-alignment: middle;
      text-dy: 8;
      text-repeat-distance: @waterway-text-repeat-distance;
    }

    [waterway = 'drain'],
    [waterway = 'ditch'] {
      [zoom >= 15] {
        text-name: "[name]";
        text-size: 10;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
        text-spacing: 600;
        text-placement: line;
        text-vertical-alignment: middle;
        text-dy: 8;
        text-repeat-distance: @waterway-text-repeat-distance;
      }
    }
  }
  [natural = 'bay'][zoom >= 14],
  [natural = 'strait'][zoom >= 14] {
    text-name: "[name]";
    text-size: 10;
    text-face-name: @oblique-fonts;
    text-fill: @water-text;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-max-char-angle-delta: 15;
    text-spacing: 400;
    text-placement: line;
    [zoom >= 15] {
      text-size: 12;
    }
  }
}


#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {
  [feature = 'natural_water'],
  [feature = 'landuse_reservoir'],
  [feature = 'landuse_basin'],
  [feature = 'waterway_dock'] {
    [zoom >= 5][way_pixels > 3000][way_pixels <= 768000],
    [zoom >= 17][way_pixels <= 768000] {
      text-name: "[name]";
      text-size: 10;
      text-wrap-width: 25; // 2.5 em
      text-line-spacing: -1.5; // -0.15 em
      [way_pixels > 12000] {
        text-size: 12;
        text-wrap-width: 37; // 3.1 em
        text-line-spacing: -1.6; // -0.13 em
      }
      [way_pixels > 48000] {
        text-size: 15;
        text-wrap-width: 59; // 3.9 em
        text-line-spacing: -1.5; // -0.10 em
      }
      [way_pixels > 192000] {
        text-size: 19;
        text-wrap-width: 95; // 5.0 em
        text-line-spacing: -0.95; // -0.05 em
      }
      text-fill: @water-text;
      text-face-name: @oblique-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: interior;
    }
  }
}

#text-point[zoom >= 14] {
  [feature = 'natural_bay'],
  [feature = 'natural_strait'] {
    text-name: "[name]";
    text-size: 10;
    text-wrap-width: 25; // 2.5 em
    text-line-spacing: -1.5; // -0.15 em
    text-fill: @water-text;
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-placement: interior;
    [zoom >= 15] {
      text-size: 12;
      text-wrap-width: 37; // 3.1 em
      text-line-spacing: -1.6; // -0.13 em
    }
  }
}
