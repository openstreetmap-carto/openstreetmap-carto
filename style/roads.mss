/* For the main linear features, such as roads and railways. */

@tertiary-fill: #ffffff;
@residential-fill: #ffffff;
@service-fill: @residential-fill;
@living-street-fill: #ededed;
@pedestrian-fill: #dddde8;
@raceway-fill: #ffc0cb;
@road-fill: #ddd;
@footway-fill: salmon;
@footway-fill-noaccess: #bbbbbb;
@steps-fill: @footway-fill;
@steps-fill-noaccess: #bbbbbb;
@cycleway-fill: blue;
@cycleway-fill-noaccess: #9999ff;
@bridleway-fill: green;
@bridleway-fill-noaccess: #aaddaa;
@track-fill: #996600;
@track-fill-noaccess: #e2c5bb;
@platform-fill: #bbbbbb;
@aeroway-fill: #bbc;
@runway-fill: @aeroway-fill;
@taxiway-fill: @aeroway-fill;
@helipad-fill: @aeroway-fill;
@access-marking: #eaeaea;
/* access-marking-light is used on some darker highways for better contrast */
@access-marking-light: #f0f0f0;
@access-marking-secondary: #e4e4e4;
@access-marking-white-unpaved: #e0e0e0;
@access-marking-living-street: #d4d4d4;

@default-casing: white;
@tertiary-casing: #8f8f8f;
@residential-casing: #bbb;
@road-casing: @residential-casing;
@service-casing: @residential-casing;
@living-street-casing: @residential-casing;
@pedestrian-casing: #999;
@path-casing: @default-casing;
@footway-casing: @default-casing;
@steps-casing: @default-casing;
@cycleway-casing: @default-casing;
@bridleway-casing: @default-casing;
@track-casing: @default-casing;

@tertiary-shield: #3b3b3b;

@unimportant-road: @residential-casing;

@minor-construction: #aaa;
@service-construction: #aaa;

@destination-marking: #c2e0ff;
@private-marking: #efa9a9;
@private-marking-for-red: #C26363;

@tunnel-casing: grey;
@bridge-casing: black;

@motorway-tunnel-fill: lighten(@motorway-fill, 10%);
@trunk-tunnel-fill: lighten(@trunk-fill, 10%);
@primary-tunnel-fill: lighten(@primary-fill, 10%);
@secondary-tunnel-fill: lighten(@secondary-fill, 5%);
@tertiary-tunnel-fill: lighten(@tertiary-fill, 5%);
@residential-tunnel-fill: darken(@residential-fill, 5%);
@living-street-tunnel-fill: lighten(@living-street-fill, 3%);

@bus-guideway-fill: #6699ff;
@bus-guideway-tunnel-fill: lighten(desaturate(@bus-guideway-fill, 20%), 8%);

@motorway-width-z6:               0.4;
@trunk-width-z6:                  0.4;

@motorway-width-z7:               0.8;
@trunk-width-z7:                  0.6;

@motorway-width-z8:               1;
@trunk-width-z8:                  1;
@primary-width-z8:                1;

@motorway-width-z9:               1.4;
@trunk-width-z9:                  1.4;
@primary-width-z9:                1.4;
@secondary-width-z9:              1;

@motorway-width-z10:              1.9;
@trunk-width-z10:                 1.9;
@primary-width-z10:               1.8;
@secondary-width-z10:             1.1;
@tertiary-width-z10:              0.7;

@motorway-width-z11:              2.0;
@trunk-width-z11:                 1.9;
@primary-width-z11:               1.8;
@secondary-width-z11:             1.1;
@tertiary-width-z11:              0.7;

@motorway-width-z12:              3.5;
@motorway-link-width-z12:         1.5;
@trunk-width-z12:                 3.5;
@trunk-link-width-z12:            1.5;
@primary-width-z12:               3.5;
@primary-link-width-z12:          1.5;
@secondary-width-z12:             3.5;
@secondary-link-width-z12:        1.5;
@tertiary-width-z12:              2.5;
@tertiary-link-width-z12:         1.5;
@residential-width-z12:           0.5;
@unclassified-width-z12:          0.8;

@motorway-width-z13:              6;
@motorway-link-width-z13:         4;
@trunk-width-z13:                 6;
@trunk-link-width-z13:             4;
@primary-width-z13:               5;
@primary-link-width-z13:          4;
@secondary-width-z13:             5;
@secondary-link-width-z13:        4;
@tertiary-width-z13:              4;
@tertiary-link-width-z13:         3;
@residential-width-z13:           2.5;
@living-street-width-z13:         2;
@bridleway-width-z13:             0.3;
@footway-width-z14:               0.7;
@cycleway-width-z13:              0.7;
@track-width-z13:                 0.5;
@track-grade1-width-z13:          0.5;
@track-grade2-width-z13:          0.5;

@secondary-width-z14:             5;
@tertiary-width-z14:              5;
@residential-width-z14:           3;
@living-street-width-z14:         3;
@pedestrian-width-z14:            3;
@road-width-z14:                  2;
@service-width-z14:               2;
@steps-width-z14:                 0.7;

@motorway-width-z15:             10;
@motorway-link-width-z15:         7.8;
@trunk-width-z15:                10;
@trunk-link-width-z15:          7.8;
@primary-width-z15:              10;
@primary-link-width-z15:        7.8;
@secondary-width-z15:             9;
@secondary-link-width-z15:        7;
@tertiary-width-z15:              9;
@tertiary-link-width-z15:         7;
@residential-width-z15:           5;
@living-street-width-z15:         5;
@pedestrian-width-z15:            5;
@bridleway-width-z15:             1.2;
@footway-width-z15:               1;
@cycleway-width-z15:              0.9;
@track-width-z15:                 1.5;
@track-grade1-width-z15:          0.75;
@track-grade2-width-z15:          0.75;
@steps-width-z15:                 3;

@secondary-width-z16:            10;
@tertiary-width-z16:             10;
@residential-width-z16:           6;
@living-street-width-z16:         6;
@pedestrian-width-z16:            6;
@road-width-z16:                  3.5;
@service-width-z16:               3.5;
@minor-service-width-z16:         2;
@footway-width-z16:               1.3;
@cycleway-width-z16:              0.9;

@motorway-width-z17:             18;
@motorway-link-width-z17:        12;
@trunk-width-z17:                18;
@trunk-link-width-z17:           12;
@primary-width-z17:              18;
@primary-link-width-z17:         12;
@secondary-width-z17:            18;
@secondary-link-width-z17:       12;
@tertiary-width-z17:             18;
@tertiary-link-width-z17:        12;
@residential-width-z17:          12;
@living-street-width-z17:        12;
@pedestrian-width-z17:           12;
@road-width-z17:                  7;
@service-width-z17:               7;
@minor-service-width-z17:         3.5;

@motorway-width-z18:             21;
@motorway-link-width-z18:        13;
@trunk-width-z18:                21;
@trunk-link-width-z18:           13;
@primary-width-z18:              21;
@primary-link-width-z18:         13;
@secondary-width-z18:            21;
@secondary-link-width-z18:       13;
@tertiary-width-z18:             21;
@tertiary-link-width-z18:        13;
@residential-width-z18:          13;
@living-street-width-z18:        13;
@pedestrian-width-z18:           13;
@road-width-z18:                  8.5;
@service-width-z18:               8.5;
@minor-service-width-z18:         4.75;
@footway-width-z18:               1.3;
@cycleway-width-z18:              1;

@motorway-width-z19:             27;
@motorway-link-width-z19:        16;
@trunk-width-z19:                27;
@trunk-link-width-z19:           16;
@primary-width-z19:              27;
@primary-link-width-z19:         16;
@secondary-width-z19:            27;
@secondary-link-width-z19:       16;
@tertiary-width-z19:             27;
@tertiary-link-width-z19:        16;
@residential-width-z19:          17;
@living-street-width-z19:        17;
@pedestrian-width-z19:           17;
@road-width-z19:                 11;
@service-width-z19:              11;
@minor-service-width-z19:         5.5;
@footway-width-z19:               1.6;
@cycleway-width-z19:              1.3;

@motorway-width-z20:             33;
@motorway-link-width-z20:        17;
@service-width-z20:              12;
@minor-service-width-z20:         8.5;


@major-casing-width-z11:          0.3;

@casing-width-z12:                0.3;
@secondary-casing-width-z12:      0.3;
@major-casing-width-z12:          0.5;

@casing-width-z13:                0.5;
@residential-casing-width-z13:    0.5;
@secondary-casing-width-z13:      0.35;
@major-casing-width-z13:          0.5;

@casing-width-z14:                0.55;
@secondary-casing-width-z14:      0.35;
@major-casing-width-z14:          0.6;

@casing-width-z15:                0.6;
@secondary-casing-width-z15:      0.7;
@major-casing-width-z15:          0.7;

@casing-width-z16:                0.6;
@secondary-casing-width-z16:      0.7;
@major-casing-width-z16:          0.7;

@casing-width-z17:                0.8;
@secondary-casing-width-z17:      1;
@major-casing-width-z17:          1;

@casing-width-z18:                0.8;
@secondary-casing-width-z18:      1;
@major-casing-width-z18:          1;

@casing-width-z19:                0.8;
@secondary-casing-width-z19:      1;
@major-casing-width-z19:          1;

@casing-width-z20:                0.8;
@secondary-casing-width-z20:      1;
@major-casing-width-z20:          1;

@bridge-casing-width-z12:         0.1;
@major-bridge-casing-width-z12:   0.5;
@bridge-casing-width-z13:         0.5;
@major-bridge-casing-width-z13:   0.5;
@bridge-casing-width-z14:         0.5;
@major-bridge-casing-width-z14:   0.6;
@bridge-casing-width-z15:         0.75;
@major-bridge-casing-width-z15:   0.75;
@bridge-casing-width-z16:         0.75;
@major-bridge-casing-width-z16:   0.75;
@bridge-casing-width-z17:         0.8;
@major-bridge-casing-width-z17:   1;
@bridge-casing-width-z18:         0.8;
@major-bridge-casing-width-z18:   1;
@bridge-casing-width-z19:         0.8;
@major-bridge-casing-width-z19:   1;
@bridge-casing-width-z20:         0.8;
@major-bridge-casing-width-z20:   1;

@paths-background-width:          1;
@paths-bridge-casing-width:       0.5;
@paths-tunnel-casing-width:       1;

@mini-roundabout-width:           4;
@turning-circle-factor:           1.6;

@junction-text-color:             #960000;
@halo-color-for-minor-road:       white;
@lowzoom-halo-color:              white;
@lowzoom-halo-width:              1;
/* opacity for halo of coloured roads at mid low zoom (Z10-Z12) */
@lowzoom-halo-opacity:			  0.4; 

@motorway-oneway-arrow-color:     darken(@motorway-casing, 25%);
@trunk-oneway-arrow-color:        darken(@trunk-casing, 25%);
@primary-oneway-arrow-color:      darken(@primary-casing, 15%);
@secondary-oneway-arrow-color:    darken(@secondary-casing, 10%);
@tertiary-oneway-arrow-color:     darken(@tertiary-casing, 30%);
@residential-oneway-arrow-color:  darken(@residential-casing, 40%);
@living-street-oneway-arrow-color: darken(@residential-casing, 30%);
@pedestrian-oneway-arrow-color:   darken(@pedestrian-casing, 25%);
@bus-guideway-oneway-arrow-color: darken(@bus-guideway-fill, 25%);
@raceway-oneway-arrow-color:      darken(@raceway-fill, 50%);
@footway-oneway-arrow-color:      darken(@footway-fill, 35%);
@steps-oneway-arrow-color:        darken(@steps-fill, 35%);
@cycleway-oneway-arrow-color:     darken(@cycleway-fill, 25%);
@track-oneway-arrow-color:        darken(@track-fill, 10%);
@bridleway-oneway-arrow-color:    darken(@bridleway-fill, 15%);

// Shield’s line wrap is based on OpenStreetMap data and not on line-wrap-width,
// but lines are typically rather short, so we use narrow line spacing.
@shield-size: 10;
@shield-line-spacing: -1.50; // -0.15 em
@shield-size-z16: 11;
@shield-line-spacing-z16: -1.65; // -0.15 em
@shield-size-z18: 12;
@shield-line-spacing-z18: -1.80; // -0.15 em
@shield-spacing: 760;
@shield-repeat-distance: 400;
@shield-margin: 40;
@shield-font: @book-fonts;
@shield-clip: false;

@major-highway-text-repeat-distance: 50;
@minor-highway-text-repeat-distance: 10;

@railway-text-repeat-distance: 200;

#roads-casing, #bridges, #tunnels {
  ::casing {
    [zoom >= 12] {
      [feature = 'highway_motorway'] {
        line-width: @motorway-width-z12;
        [zoom >= 13] { line-width: @motorway-width-z13; }
        [zoom >= 15] { line-width: @motorway-width-z15; }
        [zoom >= 17] { line-width: @motorway-width-z17; }
        [zoom >= 18] { line-width: @motorway-width-z18; }
        [zoom >= 19] { line-width: @motorway-width-z19; }
        [zoom >= 20] { line-width: @motorway-width-z20; }
        [link = 'yes'] {
          line-width: @motorway-link-width-z12;
          [zoom >= 13] { line-width: @motorway-link-width-z13; }
          [zoom >= 15] { line-width: @motorway-link-width-z15; }
          [zoom >= 17] { line-width: @motorway-link-width-z17; }
          [zoom >= 18] { line-width: @motorway-link-width-z18; }
          [zoom >= 19] { line-width: @motorway-link-width-z19; }
          [zoom >= 20] { line-width: @motorway-link-width-z20; }
        }
        line-color: @motorway-low-zoom-casing;
        [zoom >= 13] {
          line-color: @motorway-casing;
        }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          line-join: round;
          [zoom >= 13] { line-color: @bridge-casing; }
        }
      }
    }

    [feature = 'highway_trunk'] {
      [zoom >= 12] {
        line-color: @trunk-low-zoom-casing;
        [zoom >= 13] {
          line-color: @trunk-casing;
        }
        line-width: @trunk-width-z12;
        [zoom >= 13] { line-width: @trunk-width-z13; }
        [zoom >= 15] { line-width: @trunk-width-z15; }
        [zoom >= 17] { line-width: @trunk-width-z17; }
        [zoom >= 18] { line-width: @trunk-width-z18; }
        [zoom >= 19] { line-width: @trunk-width-z19; }
        [link = 'yes'] {
          line-width: @trunk-link-width-z12;
          [zoom >= 13] { line-width: @trunk-link-width-z13; }
          [zoom >= 15] { line-width: @trunk-link-width-z15; }
          [zoom >= 17] { line-width: @trunk-link-width-z17; }
          [zoom >= 18] { line-width: @trunk-link-width-z18; }
          [zoom >= 19] { line-width: @trunk-link-width-z19; }
        }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          line-join: round;
          [zoom >= 13] { line-color: @bridge-casing; }
        }
      }
    }

    [feature = 'highway_primary'] {
      [zoom >= 12] {
        line-color: @primary-low-zoom-casing;
        [zoom >= 13] {
          line-color: @primary-casing;
        }
        line-width: @primary-width-z12;
        [zoom >= 13] { line-width: @primary-width-z13; }
        [zoom >= 15] { line-width: @primary-width-z15; }
        [zoom >= 17] { line-width: @primary-width-z17; }
        [zoom >= 18] { line-width: @primary-width-z18; }
        [zoom >= 19] { line-width: @primary-width-z19; }
        [link = 'yes'] {
          line-width: @primary-link-width-z12;
          [zoom >= 13] { line-width: @primary-link-width-z13; }
          [zoom >= 15] { line-width: @primary-link-width-z15; }
          [zoom >= 17] { line-width: @primary-link-width-z17; }
          [zoom >= 18] { line-width: @primary-link-width-z18; }
          [zoom >= 19] { line-width: @primary-link-width-z19; }
        }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          line-join: round;
          [zoom >= 13] { line-color: @bridge-casing; }
        }
      }
    }

    [feature = 'highway_secondary'] {
      [zoom >= 12] {
        line-color: @secondary-low-zoom-casing;
        [zoom >= 13] {
          line-color: @secondary-casing;
        }
        line-width: @secondary-width-z12;
        [zoom >= 13] { line-width: @secondary-width-z13; }
        [zoom >= 14] { line-width: @secondary-width-z14; }
        [zoom >= 15] { line-width: @secondary-width-z15; }
        [zoom >= 16] { line-width: @secondary-width-z16; }
        [zoom >= 17] { line-width: @secondary-width-z17; }
        [zoom >= 18] { line-width: @secondary-width-z18; }
        [zoom >= 19] { line-width: @secondary-width-z19; }
        [link = 'yes'] {
          line-width: @secondary-link-width-z12;
          [zoom >= 13] { line-width: @secondary-link-width-z13; }
          [zoom >= 15] { line-width: @secondary-link-width-z15; }
          [zoom >= 17] { line-width: @secondary-link-width-z17; }
          [zoom >= 18] { line-width: @secondary-link-width-z18; }
          [zoom >= 19] { line-width: @secondary-link-width-z19; }
        }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          [zoom >= 13] {
            line-color: @bridge-casing;
            line-join: round;
          }
        }
      }
    }

    [feature = 'highway_tertiary'] {
      [zoom >= 12] {
        line-color: @tertiary-casing;
        line-width: @tertiary-width-z12;
        [zoom >= 13] { line-width: @tertiary-width-z13; }
        [zoom >= 14] { line-width: @tertiary-width-z14; }
        [zoom >= 15] { line-width: @tertiary-width-z15; }
        [zoom >= 16] { line-width: @tertiary-width-z16; }
        [zoom >= 17] { line-width: @tertiary-width-z17; }
        [zoom >= 18] { line-width: @tertiary-width-z18; }
        [zoom >= 19] { line-width: @tertiary-width-z19; }
        [link = 'yes'] {
          line-width: @tertiary-link-width-z12;
          [zoom >= 13] { line-width: @tertiary-link-width-z13; }
          [zoom >= 15] { line-width: @tertiary-link-width-z15; }
          [zoom >= 17] { line-width: @tertiary-link-width-z17; }
          [zoom >= 18] { line-width: @tertiary-link-width-z18; }
          [zoom >= 19] { line-width: @tertiary-link-width-z19; }
        }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          [zoom >= 14] {
            line-color: @bridge-casing;
            line-join: round;
          }
        }
      }
    }

    [feature = 'highway_residential'],
    [feature = 'highway_unclassified'] {
      [zoom >= 13] {
        line-color: @residential-casing;
        line-width: @residential-width-z13;
        [zoom >= 14] { line-width: @residential-width-z14; }
        [zoom >= 15] { line-width: @residential-width-z15; }
        [zoom >= 16] { line-width: @residential-width-z16; }
        [zoom >= 17] { line-width: @residential-width-z17; }
        [zoom >= 18] { line-width: @residential-width-z18; }
        [zoom >= 19] { line-width: @residential-width-z19; }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          [zoom >= 14] {
            line-color: @bridge-casing;
            line-join: round;
          }
        }
      }
    }

    [feature = 'highway_road'] {
      [zoom >= 14] {
        line-color: @road-casing;
        line-width: @road-width-z14;
        [zoom >= 16] { line-width: @road-width-z16; }
        [zoom >= 17] { line-width: @road-width-z17; }
        [zoom >= 18] { line-width: @road-width-z18; }
        [zoom >= 19] { line-width: @road-width-z19; }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'highway_service'] {
      [zoom >= 14][service = 'INT-normal'],
      [zoom >= 16][service = 'INT-minor'] {
        line-color: @service-casing;
        [service = 'INT-normal'] {
          line-width: @service-width-z14;
          [zoom >= 16] { line-width: @service-width-z16; }
          [zoom >= 17] { line-width: @service-width-z17; }
          [zoom >= 18] { line-width: @service-width-z18; }
          [zoom >= 19] { line-width: @service-width-z19; }
          [zoom >= 20] { line-width: @service-width-z20; }
        }
        [service = 'INT-minor'] {
          line-width: @minor-service-width-z16;
          [zoom >= 17] { line-width: @minor-service-width-z17; }
          [zoom >= 18] { line-width: @minor-service-width-z18; }
          [zoom >= 19] { line-width: @minor-service-width-z19; }
          [zoom >= 20] { line-width: @minor-service-width-z20; }
        }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'highway_pedestrian'] {
      [zoom >= 14] {
        line-color: @pedestrian-casing;
        line-width: @pedestrian-width-z14;
        [zoom >= 15] { line-width: @pedestrian-width-z15; }
        [zoom >= 16] { line-width: @pedestrian-width-z16; }
        [zoom >= 17] { line-width: @pedestrian-width-z17; }
        [zoom >= 18] { line-width: @pedestrian-width-z18; }
        [zoom >= 19] { line-width: @pedestrian-width-z19; }
        #roads-casing {
          line-join: round;
          line-cap: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'highway_living_street'] {
      [zoom >= 13] {
        line-color: @residential-casing;
        line-width: @living-street-width-z13;
        [zoom >= 14] {
          line-color: @living-street-casing;
          line-width: @living-street-width-z14;
        }
        [zoom >= 15] { line-width: @living-street-width-z15; }
        [zoom >= 16] { line-width: @living-street-width-z16; }
        [zoom >= 17] { line-width: @living-street-width-z17; }
        [zoom >= 18] { line-width: @living-street-width-z18; }
        [zoom >= 19] { line-width: @living-street-width-z19; }
        #roads-casing {
          line-cap: round;
          line-join: round;
        }
        #tunnels {
          line-dasharray: 4,2;
        }
        #bridges {
          [zoom >= 14] {
            line-color: @bridge-casing;
            line-join: round;
          }
        }
      }
    }

    [feature = 'highway_steps'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @steps-width-z14 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          [zoom >= 15] { line-width: @steps-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          line-color: @bridge-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @steps-width-z14 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          [zoom >= 15] { line-width: @steps-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          line-color: @tunnel-casing;
          line-dasharray: 4,2;
        }
      }
    }

    [feature = 'highway_bridleway'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @bridleway-width-z13 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          [zoom >= 15] { line-width: @bridleway-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          line-color: @bridge-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 13][int_access != 'no'],
        [zoom >= 15] {
          line-width: @bridleway-width-z13 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          [zoom >= 15] { line-width: @bridleway-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          line-color: @tunnel-casing;
          line-dasharray: 4,2;
        }
      }
    }

    [feature = 'highway_footway'],
    [feature = 'highway_path'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @footway-width-z14 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          [zoom >= 15] { line-width: @footway-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          [zoom >= 16] { line-width: @footway-width-z16 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          [zoom >= 18] { line-width: @footway-width-z18 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          [zoom >= 19] { line-width: @footway-width-z19 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          line-color: @bridge-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @footway-width-z14 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          [zoom >= 15] { line-width: @footway-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          [zoom >= 16] { line-width: @footway-width-z16 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          [zoom >= 18] { line-width: @footway-width-z18 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          [zoom >= 19] { line-width: @footway-width-z19 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          line-color: @tunnel-casing;
          line-dasharray: 4,2;
        }
      }
    }

    [feature = 'highway_cycleway'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @cycleway-width-z13 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          [zoom >= 15] { line-width: @cycleway-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          [zoom >= 16] { line-width: @cycleway-width-z16 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          [zoom >= 18] { line-width: @cycleway-width-z18 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          [zoom >= 19] { line-width: @cycleway-width-z19 + 2 * (@paths-background-width + @paths-bridge-casing-width); }
          line-color: @bridge-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 13][int_access != 'no'],
        [zoom >= 15] {
          line-width: @cycleway-width-z13 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          [zoom >= 15] { line-width: @cycleway-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          [zoom >= 16] { line-width: @cycleway-width-z16 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          [zoom >= 18] { line-width: @cycleway-width-z18 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          [zoom >= 19] { line-width: @cycleway-width-z19 + 2 * (@paths-background-width + @paths-tunnel-casing-width); }
          line-color: @tunnel-casing;
          line-dasharray: 4,2;
        }
      }
    }

    [feature = 'highway_track'] {
      #bridges {
        [zoom >= 13][int_access != 'no'] {
          line-color: @bridge-casing;
          line-join: round;
          line-width: @track-width-z13 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          [tracktype = 'grade1'] {
            line-width: @track-grade1-width-z13 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          }
          [tracktype = 'grade2'] {
            line-width: @track-grade2-width-z13 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          }
        }
        [zoom >= 15] {
          line-color: @bridge-casing;
          line-join: round;
          line-width: @track-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          [tracktype = 'grade1'] {
            line-width: @track-grade1-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          }
          [tracktype = 'grade2'] {
            line-width: @track-grade2-width-z15 + 2 * (@paths-background-width + @paths-bridge-casing-width);
          }
        }
      }
      #tunnels {
        [zoom >= 13][int_access != 'no'],
        [zoom >= 15] {
          line-color: @tunnel-casing;
          line-dasharray: 4,2;
          line-width: @track-width-z13 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          [tracktype = 'grade1'] {
            line-width: @track-grade1-width-z13 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          }
          [tracktype = 'grade2'] {
            line-width: @track-grade2-width-z13 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
          }
          [zoom >= 15]{
            line-width: @track-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
            [tracktype = 'grade1'] {
              line-width: @track-grade1-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
            }
            [tracktype = 'grade2'] {
              line-width: @track-grade2-width-z15 + 2 * (@paths-background-width + @paths-tunnel-casing-width);
            }
          }
        }
      }
    }

    [feature = 'highway_bus_guideway'][zoom >= 13] {
      #bridges {
        line-width: 6.5;
        line-color: @bridge-casing;
        line-join: round;
      }
    }

    [feature = 'railway_tram'],
    [feature = 'railway_tram-service'][zoom >= 15] {
      #bridges {
        [zoom >= 13] {
          line-width: 4;
          [zoom >= 15] {
            line-width: 5;
          }
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'railway_subway'],
    [feature = 'railway_construction'][construction = 'subway'] {
      #bridges {
        [zoom >= 14] {
          line-width: 5.5;
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'railway_light_rail'],
    [feature = 'railway_funicular'],
    [feature = 'railway_narrow_gauge'] {
      #bridges {
        [zoom >= 14] {
          line-width: 5.5;
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'railway_rail'],
    [feature = 'railway_monorail'][zoom >= 14] {
      #bridges {
        [zoom >= 13] {
          line-width: 6.5;
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'railway_INT-spur-siding-yard'] {
      #bridges {
        [zoom >= 13] {
          line-width: 5.7;
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

    [feature = 'railway_disused'][zoom >= 15],
    [feature = 'railway_construction'][construction != 'subway'],
    [feature = 'railway_miniature'][zoom >= 15] {
      #bridges {
        [zoom >= 13] {
          line-width: 6;
          line-color: @bridge-casing;
          line-join: round;
        }
      }
    }

  }

  ::bridges_and_tunnels_background {
    [feature = 'highway_bridleway'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @bridleway-width-z13 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @bridleway-width-z15 + 2 * @paths-background-width; }
          line-color: @bridleway-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 13][int_access != 'no'],
        [zoom >= 15] {
          line-color: @bridleway-casing;
          line-cap: round;
          line-join: round;
          line-width: @bridleway-width-z13 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @bridleway-width-z15 + 2 * @paths-background-width; }
        }
      }
    }

    [feature = 'highway_footway'],
    [feature = 'highway_path'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @footway-width-z14 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @footway-width-z15 + 2 * @paths-background-width; }
          [zoom >= 16] { line-width: @footway-width-z16 + 2 * @paths-background-width; }
          [zoom >= 18] { line-width: @footway-width-z18 + 2 * @paths-background-width; }
          [zoom >= 19] { line-width: @footway-width-z19 + 2 * @paths-background-width; }
          line-color: @footway-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-color: @footway-casing;
          line-cap: round;
          line-join: round;
          line-width: @footway-width-z14 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @footway-width-z15 + 2 * @paths-background-width; }
          [zoom >= 16] { line-width: @footway-width-z16 + 2 * @paths-background-width; }
          [zoom >= 18] { line-width: @footway-width-z18 + 2 * @paths-background-width; }
          [zoom >= 19] { line-width: @footway-width-z19 + 2 * @paths-background-width; }
        }
      }
    }

    [feature = 'highway_cycleway'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @cycleway-width-z13 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @cycleway-width-z15 + 2 * @paths-background-width; }
          [zoom >= 16] { line-width: @cycleway-width-z16 + 2 * @paths-background-width; }
          [zoom >= 18] { line-width: @cycleway-width-z18 + 2 * @paths-background-width; }
          [zoom >= 19] { line-width: @cycleway-width-z19 + 2 * @paths-background-width; }
          line-color: @cycleway-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 13][int_access != 'no'],
        [zoom >= 15] {
          line-color: @cycleway-casing;
          line-cap: round;
          line-join: round;
          line-width: @cycleway-width-z13 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @cycleway-width-z15 + 2 * @paths-background-width; }
          [zoom >= 16] { line-width: @cycleway-width-z16 + 2 * @paths-background-width; }
          [zoom >= 18] { line-width: @cycleway-width-z18 + 2 * @paths-background-width; }
          [zoom >= 19] { line-width: @cycleway-width-z19 + 2 * @paths-background-width; }
        }
      }
    }

    [feature = 'highway_steps'] {
      #bridges {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-width: @steps-width-z14 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @steps-width-z15 + 2 * @paths-background-width; }
          line-color: @steps-casing;
          line-join: round;
        }
      }
      #tunnels {
        [zoom >= 14][int_access != 'no'],
        [zoom >= 15] {
          line-color: @steps-casing;
          line-cap: round;
          line-join: round;
          line-width: @steps-width-z14 + 2 * @paths-background-width;
          [zoom >= 15] { line-width: @steps-width-z15 + 2 * @paths-background-width; }
        }
      }
    }

    [feature = 'highway_track'] {
      /* We don't set opacity here, so it's 1.0. Aside from that, it's basically a copy of roads-fill::background in the track part of ::fill */
      #bridges {
        [zoom >= 13][int_access != 'no'] {
          line-color: @track-casing;
          line-join: round;
          line-width: @track-width-z13 + 2 * @paths-background-width;
          [tracktype = 'grade1'] {
            line-width: @track-grade1-width-z13 + 2 * @paths-background-width;
          }
          [tracktype = 'grade2'] {
            line-width: @track-grade2-width-z13 + 2 * @paths-background-width;
          }
        }
        [zoom >= 15] {
          line-color: @track-casing;
          line-join: round;
          line-width: @track-width-z15 + 2 * @paths-background-width;
          [tracktype = 'grade1'] {
            line-width: @track-grade1-width-z15 + 2 * @paths-background-width;
          }
          [tracktype = 'grade2'] {
            line-width: @track-grade2-width-z15 + 2 * @paths-background-width;
          }
        }
      }
      #tunnels {
        [zoom >= 13][int_access != 'no'],
        [zoom >= 15] {
          line-color: @track-casing;
          line-join: round;
          line-cap: round;
          line-width: @track-width-z13 + 2 * @paths-background-width;
          /* With the heavier dasharrays on grade1 and grade2 it helps to make the casing a bit larger */
          [tracktype = 'grade1'] {
            line-width: @track-grade1-width-z13 + 2 * @paths-background-width;
          }
          [tracktype = 'grade2'] {
            line-width: @track-grade2-width-z13 + 2 * @paths-background-width;
          }

          [zoom >= 15] {
            line-width: @track-width-z15 + 2 * @paths-background-width;
            [tracktype = 'grade1'] {
              line-width: @track-grade1-width-z15 + 2 * @paths-background-width;
            }
            [tracktype = 'grade2'] {
              line-width: @track-grade2-width-z15 + 2 * @paths-background-width;
            }
          }
        }
      }
    }

    [feature = 'highway_bus_guideway'][zoom >= 13] {
      #bridges {
        line-width: 5;
        line-color: white;
        line-join: round;
      }
	  }

    [feature = 'railway_rail'][zoom >= 13],
    [feature = 'railway_monorail'][zoom >= 14] {
      #bridges {
        line-width: 5;
        line-color: white;
        line-join: round;
      }
    }

    [feature = 'railway_INT-spur-siding-yard'] {
      #bridges {
        [zoom >= 13] {
          line-width: 4;
          line-color: white;
          line-join: round;
        }
      }
    }

    [feature = 'railway_disused'][zoom >= 15],
    [feature = 'railway_construction'][construction != 'subway'],
    [feature = 'railway_miniature'][zoom >= 15] {
      #bridges {
        [zoom >= 13] {
          line-width: 4.5;
          line-color: white;
          line-join: round;
        }
      }
    }

    [feature = 'railway_tram'],
    [feature = 'railway_tram-service'][zoom >= 15] {
      #bridges {
        [zoom >= 13] {
          line-width: 3;
          [zoom >= 15] {
            line-width: 4;
          }
          line-color: white;
        }
      }
    }

    [feature = 'railway_subway'],
    [feature = 'railway_construction'][construction = 'subway'] {
      #bridges {
        [zoom >= 14] {
          line-width: 4;
          line-color: white;
          line-join: round;
        }
      }
    }

    [feature = 'railway_light_rail'],
    [feature = 'railway_funicular'],
    [feature = 'railway_narrow_gauge'] {
      #bridges {
        [zoom >= 14] {
          line-width: 4;
          line-color: white;
          line-join: round;
        }
      }
    }
  }
}

/* Data on z<10 comes from osm_planet_roads, data on z>=10 comes from
osm_planet_line. This is for performance reasons: osm_planet_roads contains less
data, and is thus faster. Chosen is for zoom level 10 as cut-off, because
tertiary is rendered from z10 and is not included in osm_planet_roads. */

#roads-low-zoom[zoom < 10],
#roads-fill[zoom >= 10],
#bridges[zoom >= 10],
#tunnels[zoom >= 10] {

  ::halo {
    [zoom = 9][feature = 'highway_secondary'] {
      line-color: @halo-color-for-minor-road;
      line-width: 2.2;
      line-opacity: 0.4;
      line-join: round;
      //Missing line-cap: round; is intentional. It would cause rendering glow multiple times in some places - what as result of partial transparency would cause differences in rendering
      //Also, bridges - including bridge casings - are rendered on top of roads. Enabling line-cap: round would result in glow from bridges rendered on top of road around bridges.
    }
    [zoom = 10][feature = 'highway_secondary'],
    [zoom = 11][feature = 'highway_secondary'] {
      line-color: @halo-color-for-minor-road;
      line-width: 2.7;
      line-opacity: @lowzoom-halo-opacity;
      line-join: round;
      //Missing line-cap: round; is intentional. It would cause rendering glow multiple times in some places - what as result of partial transparency would cause differences in rendering
      //Also, bridges - including bridge casings - are rendered on top of roads. Enabling line-cap: round would result in glow from bridges rendered on top of road around bridges.
    }
    [zoom = 10][feature = 'highway_tertiary'],
    [zoom = 11][feature = 'highway_tertiary'],
    [zoom = 12][feature = 'highway_unclassified'] {
      line-color: @halo-color-for-minor-road;
      line-width: 2.2;
      line-opacity: 0.3;
      line-join: round;
      //Missing line-cap: round; is intentional. It would cause rendering glow multiple times in some places - what as result of partial transparency would cause differences in rendering
      //Also, bridges - including bridge casings are rendered on top of roads. Enabling line-cap: round would result in glow from bridges rendered on top of road around bridges.
    }
    [feature = 'highway_motorway'][link != 'yes'][zoom >= 6][zoom < 12],
    [feature = 'highway_motorway'][link = 'yes'][zoom >= 10][zoom < 12],
    [feature = 'highway_trunk'][link != 'yes'][zoom >= 6][zoom < 12],
    [feature = 'highway_trunk'][link = 'yes'][zoom >= 10][zoom < 12],
    [feature = 'highway_primary'][link != 'yes'][zoom >= 8][zoom < 12],
    [feature = 'highway_primary'][link = 'yes'][zoom >= 10][zoom < 12],
    [feature = 'highway_secondary'][zoom >= 11][zoom < 12] {
      [feature = 'highway_motorway'] {
        [zoom >= 6] { line-width: @motorway-width-z6 + 2 * @lowzoom-halo-width; }
        [zoom >= 7] { line-width: @motorway-width-z7 + 2 * @lowzoom-halo-width; }
        [zoom >= 8] { line-width: @motorway-width-z8 + 2 * @lowzoom-halo-width; }
        [zoom >= 9] { line-width: @motorway-width-z9 + 2 * @lowzoom-halo-width; }
        [zoom >= 10] { line-width: @motorway-width-z10 + 2 * @lowzoom-halo-width; }
        [zoom >= 11] { line-width: @motorway-width-z11 + 2 * @lowzoom-halo-width; }
      }
      [feature = 'highway_trunk'] {
        [zoom >= 6] { line-width: @trunk-width-z6 + 2 * @lowzoom-halo-width; }
        [zoom >= 7] { line-width: @trunk-width-z7 + 2 * @lowzoom-halo-width; }
        [zoom >= 8] { line-width: @trunk-width-z8 + 2 * @lowzoom-halo-width; }
        [zoom >= 9] { line-width: @trunk-width-z9 + 2 * @lowzoom-halo-width; }
        [zoom >= 10] { line-width: @trunk-width-z10 + 2 * @lowzoom-halo-width; }
        [zoom >= 11] { line-width: @trunk-width-z11 + 2 * @lowzoom-halo-width; }
      }
      [feature = 'highway_primary'] {
        [zoom >= 8] { line-width: @primary-width-z8 + 2 * @lowzoom-halo-width; }
        [zoom >= 9] { line-width: @primary-width-z9 + 2 * @lowzoom-halo-width; }
        [zoom >= 10] { line-width: @primary-width-z10 + 2 * @lowzoom-halo-width; }
        [zoom >= 11] { line-width: @primary-width-z11 + 2 * @lowzoom-halo-width; }
      }
      line-color: @lowzoom-halo-color;
      line-opacity: @lowzoom-halo-opacity;
    }
  }

  ::fill {
    /*
     * The highway_construction rules below are quite sensitive to re-ordering, since the instances end up swapping round
     * (and then the dashes appear below the fills). See:
     * https://github.com/gravitystorm/openstreetmap-carto/issues/23
     * https://github.com/mapbox/carto/issues/235
     * https://github.com/mapbox/carto/issues/237
     */
    [feature = 'highway_construction'][zoom >= 12] {
      [construction = 'motorway'][zoom >= 12],
      [construction = 'motorway_link'][zoom >= 13],
      [construction = 'trunk'][zoom >= 12],
      [construction = 'trunk_link'][zoom >= 13],
      [construction = 'primary'][zoom >= 12],
      [construction = 'primary_link'][zoom >= 13],
      [construction = 'secondary'][zoom >= 12],
      [construction = 'secondary_link'][zoom >= 13],
      [construction = 'tertiary'][zoom >= 13],
      [construction = 'tertiary_link'][zoom >= 14] {
        [construction = 'motorway'],
        [construction = 'motorway_link'] { line-color: @motorway-fill; }
        [construction = 'trunk'],
        [construction = 'trunk_link'] { line-color: @trunk-fill; }
        [construction = 'primary'],
        [construction = 'primary_link'] { line-color: @primary-fill; }
        [construction = 'secondary'],
        [construction = 'secondary_link'] { line-color: @secondary-fill; }
        [construction = 'tertiary'],
        [construction = 'tertiary_link'] { line-color: @minor-construction; }
        line-width: 2;
        b/line-width: 2;
        b/line-dasharray: 4,2;
        b/line-color: white;
        [zoom >= 13] {
          line-width: 4;
          b/line-width: 3.5;
          b/line-dasharray: 6,4;
        }
        [zoom >= 16] {
          line-width: 8;
          b/line-width: 7;
          b/line-dasharray: 8,6;
          [construction = 'secondary_link'] {
            line-width: @secondary-link-width-z15;
            b/line-width: @secondary-link-width-z15 - 2 * @casing-width-z15;
          }
          [construction = 'tertiary_link'] {
            line-width: @tertiary-link-width-z15;
            b/line-width: @tertiary-link-width-z15 - 2 * @casing-width-z15;
          }
        }
        [zoom >= 17] {
          line-width: 8;
          b/line-width: 7;
        }
      }

      [construction = null][zoom >= 14],
      [construction = 'residential'][zoom >= 14],
      [construction = 'unclassified'][zoom >= 14] {
        line-color: @minor-construction;
        b/line-color: white;
        line-width: @residential-width-z14;
        b/line-width: @residential-width-z14 - 2 * @casing-width-z13;
        b/line-dasharray: 6,4;
        [zoom >= 15] {
          line-width: @residential-width-z15;
          b/line-width: @residential-width-z15 - 2 * @casing-width-z15;
          }
        [zoom >= 16] {
          line-width: @residential-width-z16;
          b/line-width: @residential-width-z16 - 2 * @casing-width-z16;
          b/line-dasharray: 8,6;
        }
        [zoom >= 17] {
          line-width: 8;
          b/line-width: 7;
        }
      }
      [construction = 'living_street'][zoom >= 14] {
        line-color: @minor-construction;
        b/line-color: @living-street-fill;
        line-width: @living-street-width-z14;
        b/line-width: @living-street-width-z14 - 2 * @casing-width-z13;
        b/line-dasharray: 6,4;
        [zoom >= 15] {
          line-width: @living-street-width-z15;
          b/line-width: @living-street-width-z15 - 2 * @casing-width-z15;
        }
        [zoom >= 16] {
          line-width: @living-street-width-z16;
          b/line-width: @living-street-width-z16 - 2 * @casing-width-z16;
          b/line-dasharray: 8,6;
        }
        [zoom >= 17] {
          line-width: 8;
          b/line-width: 7;
        }
      }
      [construction = 'pedestrian'][zoom >= 14] {
        line-color: @minor-construction;
        b/line-color: @pedestrian-fill;
        line-width: @pedestrian-width-z14;
        b/line-width: @pedestrian-width-z14 - 2 * @casing-width-z13;
        b/line-dasharray: 6,4;
        [zoom >= 15] {
          line-width: @pedestrian-width-z15;
          b/line-width: @pedestrian-width-z15 - 2 * @casing-width-z15;
        }
        [zoom >= 16] {
          line-width: @pedestrian-width-z16;
          b/line-width: @pedestrian-width-z16 - 2 * @casing-width-z16;
          b/line-dasharray: 8,6;
        }
        [zoom >= 17] {
          line-width: 8;
          b/line-width: 7;
        }
      }

      [construction = 'service'] {
        [zoom >= 15][service = 'INT-normal'],
        [zoom >= 17][service = 'INT-minor'] {
          line-color: @minor-construction;
          b/line-color: white;
          b/line-dasharray: 6,4;
          [service = 'INT-normal'] {
            line-width: @service-width-z14;
            b/line-width: @service-width-z14;
            [zoom >= 16] {
              line-width: @service-width-z16;
              b/line-width: @service-width-z16 - 2 * @casing-width-z16;
              b/line-dasharray: 8,6;
            }
            [zoom >= 17] {
              line-width: @service-width-z17;
              b/line-width: @service-width-z17 - 2 * @casing-width-z17;
            }
            [zoom >= 18] {
              line-width: 8;
              b/line-width: 7;
            }
          }
          [service = 'INT-minor'] {
            line-width: @minor-service-width-z17;
            b/line-width: @minor-service-width-z17 - 2 * @casing-width-z17;
            b/line-dasharray: 8,6;
            [zoom >= 18] {
              line-width: @minor-service-width-z18;
              b/line-width: @minor-service-width-z18 - 2 * @casing-width-z18;
            }
            [zoom >= 19] {
              line-width: @minor-service-width-z19 - 2 * @casing-width-z19;
              b/line-width: @minor-service-width-z19 - 4 * @casing-width-z19;
            }
          }
        }
      }

      [construction = 'road'][zoom >= 15],
      [construction = 'raceway'][zoom >= 15] {
        line-color: @minor-construction;
        b/line-color: @road-fill;
        line-width: @road-width-z14;
        b/line-width: @road-width-z14;
        b/line-dasharray: 6,4;
        [zoom >= 16] {
          line-width: @road-width-z16;
          b/line-width: @road-width-z16 - 2 * @casing-width-z16;
          b/line-dasharray: 8,6;
        }
        [zoom >= 17] {
          line-width: @road-width-z17;
          b/line-width: @road-width-z17 - 2 * @casing-width-z17;
        }
        [zoom >= 18] {
          line-width: 8;
          b/line-width: 7;
        }
      }
      [construction = 'footway'][zoom >= 15],
      [construction = 'cycleway'][zoom >= 15],
      [construction = 'bridleway'][zoom >= 15],
      [construction = 'path'][zoom >= 15],
      [construction = 'track'][zoom >= 15],
      [construction = 'steps'][zoom >= 15] {
        line-color: white;
        line-width: 3;
        line-opacity: 0.4;
        b/line-width: 1.2;
        b/line-color: @minor-construction;
        b/line-dasharray: 2,6;
      }
    }

    #roads-low-zoom[feature = 'highway_motorway'][int_surface != 'unpaved'],
    #roads-fill[feature = 'highway_motorway'][int_surface != 'unpaved'],
    #bridges[feature = 'highway_motorway'][int_surface != 'unpaved'],
    #tunnels[feature = 'highway_motorway'] {
      [zoom >= 6][link != 'yes'],
      [zoom >= 10] {
        line-color: @motorway-low-zoom;
        line-width: @motorway-width-z6;
        [zoom >= 7] { line-width: @motorway-width-z7; }
        [zoom >= 8] { line-width: @motorway-width-z8; }
        [zoom >= 9] { line-width: @motorway-width-z9; }
        [zoom >= 10] { line-width: @motorway-width-z10; }
        [zoom >= 11] { line-width: @motorway-width-z11; }
        [zoom >= 12] {
          line-color: @motorway-fill;
          line-width: @motorway-width-z12 - 2 * @major-casing-width-z12;
          [zoom >= 13] { line-width: @motorway-width-z13 - 2 * @major-casing-width-z13; }
          [zoom >= 15] { line-width: @motorway-width-z15 - 2 * @major-casing-width-z15; }
          [zoom >= 17] { line-width: @motorway-width-z17 - 2 * @major-casing-width-z17; }
          [zoom >= 18] { line-width: @motorway-width-z18 - 2 * @major-casing-width-z18; }
          [zoom >= 19] { line-width: @motorway-width-z19 - 2 * @major-casing-width-z19; }
          [zoom >= 20] { line-width: @motorway-width-z20 - 2 * @major-casing-width-z20; }
          [link = 'yes'] {
            line-width: @motorway-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-width: @motorway-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-width: @motorway-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-width: @motorway-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-width: @motorway-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-width: @motorway-link-width-z19 - 2 * @casing-width-z19; }
            [zoom >= 20] { line-width: @motorway-link-width-z20 - 2 * @casing-width-z20; }
          }
          #tunnels {
            line-color: @motorway-tunnel-fill;
          }
          #bridges {
            line-width: @motorway-width-z12 - 2 * @major-bridge-casing-width-z12;
            [zoom >= 13] { line-width: @motorway-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 15] { line-width: @motorway-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 17] { line-width: @motorway-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @motorway-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @motorway-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [zoom >= 20] { line-width: @motorway-width-z20 - 2 * @major-bridge-casing-width-z20; }
            [link = 'yes'] {
              line-width: @motorway-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-width: @motorway-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-width: @motorway-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-width: @motorway-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-width: @motorway-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-width: @motorway-link-width-z19 - 2 * @bridge-casing-width-z19; }
              [zoom >= 20] { line-width: @motorway-link-width-z20 - 2 * @bridge-casing-width-z20; }
            }
          }
          line-cap: round;
          line-join: round;
        }
      }
    }

    #roads-low-zoom[feature = 'highway_motorway'][int_surface = 'unpaved'],
    #roads-fill[feature = 'highway_motorway'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_motorway'][int_surface = 'unpaved'] {
      [zoom >= 6][link != 'yes'],
      [zoom >= 10] {
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-width: @motorway-width-z6;
        line-pattern-file: url("symbols/unpaved/unpaved_motorway-low-zoom.svg");
        [zoom >= 7] { line-pattern-width: @motorway-width-z7; }
        [zoom >= 8] { line-pattern-width: @motorway-width-z8; }
        [zoom >= 9] { line-pattern-width: @motorway-width-z9; }
        [zoom >= 10] { line-pattern-width: @motorway-width-z10; }
        [zoom >= 11] { line-pattern-width: @motorway-width-z11; }
        [zoom >= 12] {
          line-pattern-file: url("symbols/unpaved/unpaved_motorway-fill.svg");
          line-pattern-width: @motorway-width-z12 - 2 * @major-casing-width-z12;
          [zoom >= 13] { line-pattern-width: @motorway-width-z13 - 2 * @major-casing-width-z13; }
          [zoom >= 15] { line-pattern-width: @motorway-width-z15 - 2 * @major-casing-width-z15; }
          [zoom >= 17] { line-pattern-width: @motorway-width-z17 - 2 * @major-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @motorway-width-z18 - 2 * @major-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @motorway-width-z19 - 2 * @major-casing-width-z19; }
          [zoom >= 20] { line-pattern-width: @motorway-width-z20 - 2 * @major-casing-width-z20; }
          [link = 'yes'] {
            line-pattern-width: @motorway-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-pattern-width: @motorway-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @motorway-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @motorway-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @motorway-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @motorway-link-width-z19 - 2 * @casing-width-z19; }
            [zoom >= 20] { line-pattern-width: @motorway-link-width-z20 - 2 * @casing-width-z20; }
          }
          #bridges {
            line-pattern-width: @motorway-width-z12 - 2 * @major-bridge-casing-width-z12;
            [zoom >= 13] { line-pattern-width: @motorway-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @motorway-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @motorway-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @motorway-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @motorway-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [zoom >= 20] { line-pattern-width: @motorway-width-z20 - 2 * @major-bridge-casing-width-z20; }
            [link = 'yes'] {
              line-pattern-width: @motorway-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-pattern-width: @motorway-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-pattern-width: @motorway-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-pattern-width: @motorway-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-pattern-width: @motorway-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-pattern-width: @motorway-link-width-z19 - 2 * @bridge-casing-width-z19; }
              [zoom >= 20] { line-pattern-width: @motorway-link-width-z20 - 2 * @bridge-casing-width-z20; }
            }
          }
          line-pattern-cap: round;
          line-pattern-join: round;
        }
      }
    }

    #roads-low-zoom[feature = 'highway_trunk'][int_surface != 'unpaved'],
    #roads-fill[feature = 'highway_trunk'][int_surface != 'unpaved'],
    #bridges[feature = 'highway_trunk'][int_surface != 'unpaved'],
    #tunnels[feature = 'highway_trunk'] {
      [zoom >= 6][link != 'yes'],
      [zoom >= 10] {
        line-width: @trunk-width-z6;
        line-color: @trunk-low-zoom;
        [zoom >= 7] { line-width: @trunk-width-z7; }
        [zoom >= 8] { line-width: @trunk-width-z8; }
        [zoom >= 9] { line-width: @trunk-width-z9; }
        [zoom >= 10] { line-width: @trunk-width-z10; }
        [zoom >= 11] { line-width: @trunk-width-z11; }
        [zoom >= 12] {
          line-color: @trunk-fill;
          line-width: @trunk-width-z12 - 2 * @major-casing-width-z12;
          [zoom >= 13] { line-width: @trunk-width-z13 - 2 * @major-casing-width-z13; }
          [zoom >= 15] { line-width: @trunk-width-z15 - 2 * @major-casing-width-z15; }
          [zoom >= 17] { line-width: @trunk-width-z17 - 2 * @major-casing-width-z17; }
          [zoom >= 18] { line-width: @trunk-width-z18 - 2 * @major-casing-width-z18; }
          [zoom >= 19] { line-width: @trunk-width-z19 - 2 * @major-casing-width-z19; }
          [link = 'yes'] {
            line-width: @trunk-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-width: @trunk-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-width: @trunk-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-width: @trunk-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-width: @trunk-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-width: @trunk-link-width-z19 - 2 * @casing-width-z19; }
          }
          #tunnels {
            line-color: @trunk-tunnel-fill;
          }
          #bridges {
            line-width: @trunk-width-z12 - 2 * @major-bridge-casing-width-z12;
            [zoom >= 13] { line-width: @trunk-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 15] { line-width: @trunk-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 17] { line-width: @trunk-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @trunk-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @trunk-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [link = 'yes'] {
              line-width: @trunk-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-width: @trunk-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-width: @trunk-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-width: @trunk-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-width: @trunk-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-width: @trunk-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
          line-cap: round;
          line-join: round;
        }
      }
    }

    #roads-low-zoom[feature = 'highway_trunk'][int_surface = 'unpaved'],
    #roads-fill[feature = 'highway_trunk'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_trunk'][int_surface = 'unpaved'] {
      [zoom >= 6][link != 'yes'],
      [zoom >= 10] {
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-width: @trunk-width-z6;
        line-pattern-file: url("symbols/unpaved/unpaved_trunk-low-zoom.svg");
        [zoom >= 7] { line-pattern-width: @trunk-width-z7; }
        [zoom >= 8] { line-pattern-width: @trunk-width-z8; }
        [zoom >= 9] { line-pattern-width: @trunk-width-z9; }
        [zoom >= 10] { line-pattern-width: @trunk-width-z10; }
        [zoom >= 11] { line-pattern-width: @trunk-width-z11; }
        [zoom >= 12] {
          line-pattern-file: url("symbols/unpaved/unpaved_trunk-fill.svg");
          line-pattern-width: @trunk-width-z12 - 2 * @major-casing-width-z12;
          [zoom >= 13] { line-pattern-width: @trunk-width-z13 - 2 * @major-casing-width-z13; }
          [zoom >= 15] { line-pattern-width: @trunk-width-z15 - 2 * @major-casing-width-z15; }
          [zoom >= 17] { line-pattern-width: @trunk-width-z17 - 2 * @major-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @trunk-width-z18 - 2 * @major-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @trunk-width-z19 - 2 * @major-casing-width-z19; }
          [link = 'yes'] {
            line-pattern-width: @trunk-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-pattern-width: @trunk-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @trunk-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @trunk-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @trunk-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @trunk-link-width-z19 - 2 * @casing-width-z19; }
          }
          #bridges {
            line-pattern-width: @trunk-width-z12 - 2 * @major-bridge-casing-width-z12;
            [zoom >= 13] { line-pattern-width: @trunk-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @trunk-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @trunk-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @trunk-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @trunk-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [link = 'yes'] {
              line-pattern-width: @trunk-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-pattern-width: @trunk-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-pattern-width: @trunk-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-pattern-width: @trunk-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-pattern-width: @trunk-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-pattern-width: @trunk-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
          line-pattern-cap: round;
          line-pattern-join: round;
        }
      }
    }

    #roads-low-zoom[feature = 'highway_primary'][int_surface != 'unpaved'],
    #roads-fill[feature = 'highway_primary'][int_surface != 'unpaved'],
    #bridges[feature = 'highway_primary'][int_surface != 'unpaved'],
    #tunnels[feature = 'highway_primary'] {
      [zoom >= 8][link != 'yes'],
      [zoom >= 10] {
        line-width: @primary-width-z8;
        line-color: @primary-low-zoom;
        [zoom >= 9] { line-width: @primary-width-z9; }
        [zoom >= 10] { line-width: @primary-width-z10; }
        [zoom >= 11] { line-width: @primary-width-z11; }
        [zoom >= 12] {
          line-color: @primary-fill;
          line-width: @primary-width-z12 - 2 * @major-casing-width-z12;
          [zoom >= 13] { line-width: @primary-width-z13 - 2 * @major-casing-width-z13; }
          [zoom >= 15] { line-width: @primary-width-z15 - 2 * @major-casing-width-z15; }
          [zoom >= 17] { line-width: @primary-width-z17 - 2 * @major-casing-width-z17; }
          [zoom >= 18] { line-width: @primary-width-z18 - 2 * @major-casing-width-z18; }
          [zoom >= 19] { line-width: @primary-width-z19 - 2 * @major-casing-width-z19; }
          [link = 'yes'] {
            line-width: @primary-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-width: @primary-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-width: @primary-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-width: @primary-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-width: @primary-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-width: @primary-link-width-z19 - 2 * @casing-width-z19; }
          }
          #tunnels {
            line-color: @primary-tunnel-fill;
          }
          #bridges {
            line-width: @primary-width-z12 - 2 * @major-bridge-casing-width-z12;
            [zoom >= 13] { line-width: @primary-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 15] { line-width: @primary-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 17] { line-width: @primary-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @primary-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @primary-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [link = 'yes'] {
              line-width: @primary-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-width: @primary-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-width: @primary-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-width: @primary-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-width: @primary-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-width: @primary-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
          line-cap: round;
          line-join: round;
        }
      }
    }

    #roads-low-zoom[feature = 'highway_primary'][int_surface = 'unpaved'],
    #roads-fill[feature = 'highway_primary'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_primary'][int_surface = 'unpaved'] {
      [zoom >= 8][link != 'yes'],
      [zoom >= 10] {
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-width: @primary-width-z8;
        line-pattern-file: url("symbols/unpaved/unpaved_primary-low-zoom.svg");
        [zoom >= 9] { line-pattern-width: @primary-width-z9; }
        [zoom >= 10] { line-pattern-width: @primary-width-z10; }
        [zoom >= 11] { line-pattern-width: @primary-width-z11; }
        [zoom >= 12] {
          line-pattern-file: url("symbols/unpaved/unpaved_primary-fill.svg");
          line-pattern-width: @primary-width-z12 - 2 * @major-casing-width-z12;
          [zoom >= 13] { line-pattern-width: @primary-width-z13 - 2 * @major-casing-width-z13; }
          [zoom >= 15] { line-pattern-width: @primary-width-z15 - 2 * @major-casing-width-z15; }
          [zoom >= 17] { line-pattern-width: @primary-width-z17 - 2 * @major-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @primary-width-z18 - 2 * @major-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @primary-width-z19 - 2 * @major-casing-width-z19; }
          [link = 'yes'] {
            line-pattern-width: @primary-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-pattern-width: @primary-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @primary-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @primary-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @primary-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @primary-link-width-z19 - 2 * @casing-width-z19; }
          }
          #bridges {
            line-pattern-width: @primary-width-z12 - 2 * @major-bridge-casing-width-z12;
            [zoom >= 13] { line-pattern-width: @primary-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @primary-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @primary-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @primary-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @primary-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [link = 'yes'] {
              line-pattern-width: @primary-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-pattern-width: @primary-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-pattern-width: @primary-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-pattern-width: @primary-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-pattern-width: @primary-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-pattern-width: @primary-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
          line-pattern-cap: round;
          line-pattern-join: round;
        }
      }
    }    

    [feature = 'highway_secondary'] {
      [zoom >= 9][link != 'yes'],
      [zoom >= 10] {
        line-color: @unimportant-road;
        line-width: @secondary-width-z9;
        [zoom >= 10] { line-width: @secondary-width-z10; }
        [zoom >= 11] { line-width: @secondary-width-z11; }
        [zoom >= 12] {
          line-color: @secondary-fill;
          line-width: @secondary-width-z12 - 2 * @secondary-casing-width-z12;
          line-cap: round;
          line-join: round;
          [zoom >= 13] { line-width: @secondary-width-z13 - 2 * @secondary-casing-width-z13; }
          [zoom >= 14] { line-width: @secondary-width-z14 - 2 * @secondary-casing-width-z14; }
          [zoom >= 15] { line-width: @secondary-width-z15 - 2 * @secondary-casing-width-z15; }
          [zoom >= 16] { line-width: @secondary-width-z16 - 2 * @secondary-casing-width-z16; }
          [zoom >= 17] { line-width: @secondary-width-z17 - 2 * @secondary-casing-width-z17; }
          [zoom >= 18] { line-width: @secondary-width-z18 - 2 * @secondary-casing-width-z18; }
          [zoom >= 19] { line-width: @secondary-width-z19 - 2 * @secondary-casing-width-z19; }
          [link = 'yes'] {
            line-width: @secondary-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-width: @secondary-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-width: @secondary-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-width: @secondary-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-width: @secondary-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-width: @secondary-link-width-z19 - 2 * @casing-width-z19; }
          }
          #tunnels {
            line-color: @secondary-tunnel-fill;
          }
          #bridges {
            line-width: @secondary-width-z12 - 2 * @bridge-casing-width-z12;
            [zoom >= 13] { line-width: @secondary-width-z13 - 2 * @major-bridge-casing-width-z13; }
            [zoom >= 14] { line-width: @secondary-width-z14 - 2 * @major-bridge-casing-width-z14; }
            [zoom >= 15] { line-width: @secondary-width-z15 - 2 * @major-bridge-casing-width-z15; }
            [zoom >= 16] { line-width: @secondary-width-z16 - 2 * @major-bridge-casing-width-z16; }
            [zoom >= 17] { line-width: @secondary-width-z17 - 2 * @major-bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @secondary-width-z18 - 2 * @major-bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @secondary-width-z19 - 2 * @major-bridge-casing-width-z19; }
            [link = 'yes'] {
              line-width: @secondary-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-width: @secondary-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-width: @secondary-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-width: @secondary-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-width: @secondary-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-width: @secondary-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
        }
      }
    }

    #roads-fill[feature = 'highway_secondary'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_secondary'][int_surface = 'unpaved'] {
        [zoom >= 12] {
          line-pattern-type: repeat;
          line-pattern-alignment: global;
          line-pattern-width: @secondary-width-z12 - 2 * @secondary-casing-width-z12;
          line-pattern-file: url("symbols/unpaved/unpaved_secondary-fill.svg");          
          line-pattern-cap: round;
          line-pattern-join: round;
          [zoom >= 13] {
            [zoom >= 13] { line-pattern-width: @secondary-width-z13 - 2 * @secondary-casing-width-z13; }
            [zoom >= 14] { line-pattern-width: @secondary-width-z14 - 2 * @secondary-casing-width-z14; }
            [zoom >= 15] { line-pattern-width: @secondary-width-z15 - 2 * @secondary-casing-width-z15; }
            [zoom >= 16] { line-pattern-width: @secondary-width-z16 - 2 * @secondary-casing-width-z16; }
            [zoom >= 17] { line-pattern-width: @secondary-width-z17 - 2 * @secondary-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @secondary-width-z18 - 2 * @secondary-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @secondary-width-z19 - 2 * @secondary-casing-width-z19; }
            [link = 'yes'] {
              line-pattern-width: @secondary-link-width-z12 - 2 * @casing-width-z12;
              [zoom >= 13] { line-pattern-width: @secondary-link-width-z13 - 2 * @casing-width-z13; }
              [zoom >= 15] { line-pattern-width: @secondary-link-width-z15 - 2 * @casing-width-z15; }
              [zoom >= 17] { line-pattern-width: @secondary-link-width-z17 - 2 * @casing-width-z17; }
              [zoom >= 18] { line-pattern-width: @secondary-link-width-z18 - 2 * @casing-width-z18; }
              [zoom >= 19] { line-pattern-width: @secondary-link-width-z19 - 2 * @casing-width-z19; }
            }
            #bridges {
              line-pattern-width: @secondary-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-pattern-width: @secondary-width-z13 - 2 * @major-bridge-casing-width-z13; }
              [zoom >= 14] { line-pattern-width: @secondary-width-z14 - 2 * @major-bridge-casing-width-z14; }
              [zoom >= 15] { line-pattern-width: @secondary-width-z15 - 2 * @major-bridge-casing-width-z15; }
              [zoom >= 16] { line-pattern-width: @secondary-width-z16 - 2 * @major-bridge-casing-width-z16; }
              [zoom >= 17] { line-pattern-width: @secondary-width-z17 - 2 * @major-bridge-casing-width-z17; }
              [zoom >= 18] { line-pattern-width: @secondary-width-z18 - 2 * @major-bridge-casing-width-z18; }
              [zoom >= 19] { line-pattern-width: @secondary-width-z19 - 2 * @major-bridge-casing-width-z19; }
              [link = 'yes'] {
                line-pattern-width: @secondary-link-width-z12 - 2 * @bridge-casing-width-z12;
                [zoom >= 13] { line-pattern-width: @secondary-link-width-z13 - 2 * @bridge-casing-width-z13; }
                [zoom >= 15] { line-pattern-width: @secondary-link-width-z15 - 2 * @bridge-casing-width-z15; }
                [zoom >= 17] { line-pattern-width: @secondary-link-width-z17 - 2 * @bridge-casing-width-z17; }
                [zoom >= 18] { line-pattern-width: @secondary-link-width-z18 - 2 * @bridge-casing-width-z18; }
                [zoom >= 19] { line-pattern-width: @secondary-link-width-z19 - 2 * @bridge-casing-width-z19; }
              }
            }
          }
        }
    }

    [feature = 'highway_tertiary'] {
      [zoom >= 10] {
        line-color: @unimportant-road;
        line-width: @tertiary-width-z10;
        [zoom >= 11] {
          line-width: @tertiary-width-z11;
        }
        [zoom >= 12] {
          line-color: @tertiary-fill;
          line-width: @tertiary-width-z12 - 2 * @casing-width-z12;
          [zoom >= 13] { line-width: @tertiary-width-z13 - 2 * @casing-width-z13; }
          [zoom >= 14] { line-width: @tertiary-width-z14 - 2 * @casing-width-z14; }
          [zoom >= 15] { line-width: @tertiary-width-z15 - 2 * @casing-width-z15; }
          [zoom >= 16] { line-width: @tertiary-width-z16 - 2 * @casing-width-z16; }
          [zoom >= 17] { line-width: @tertiary-width-z17 - 2 * @casing-width-z17; }
          [zoom >= 18] { line-width: @tertiary-width-z18 - 2 * @casing-width-z18; }
          [zoom >= 19] { line-width: @tertiary-width-z19 - 2 * @casing-width-z19; }
          [link = 'yes'] {
            line-width: @tertiary-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-width: @tertiary-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-width: @tertiary-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-width: @tertiary-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-width: @tertiary-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-width: @tertiary-link-width-z19 - 2 * @casing-width-z19; }
          }
          #tunnels {
            line-color: @tertiary-tunnel-fill;
          }
          #bridges {
            line-width: @tertiary-width-z12 - 2 * @bridge-casing-width-z12;
            [zoom >= 13] { line-width: @tertiary-width-z13 - 2 * @bridge-casing-width-z13; }
            [zoom >= 14] { line-width: @tertiary-width-z14 - 2 * @bridge-casing-width-z14; }
            [zoom >= 15] { line-width: @tertiary-width-z15 - 2 * @bridge-casing-width-z15; }
            [zoom >= 16] { line-width: @tertiary-width-z16 - 2 * @bridge-casing-width-z16; }
            [zoom >= 17] { line-width: @tertiary-width-z17 - 2 * @bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @tertiary-width-z18 - 2 * @bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @tertiary-width-z19 - 2 * @bridge-casing-width-z19; }
            [link = 'yes'] {
              line-width: @tertiary-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-width: @tertiary-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-width: @tertiary-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-width: @tertiary-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-width: @tertiary-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-width: @tertiary-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
          line-cap: round;
          line-join: round;
        }
      }
    }

    #roads-fill[feature = 'highway_tertiary'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_tertiary'][int_surface = 'unpaved'] {
        [zoom >= 13] {
          line-pattern-type: repeat;
          line-pattern-alignment: global;
          line-pattern-width: @tertiary-width-z12 - 2 * @casing-width-z12;
          line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg");          
          [zoom >= 13] { line-pattern-width: @tertiary-width-z13 - 2 * @casing-width-z13; }
          [zoom >= 14] { line-pattern-width: @tertiary-width-z14 - 2 * @casing-width-z14; }
          [zoom >= 15] { line-pattern-width: @tertiary-width-z15 - 2 * @casing-width-z15; }
          [zoom >= 16] { line-pattern-width: @tertiary-width-z16 - 2 * @casing-width-z16; }
          [zoom >= 17] { line-pattern-width: @tertiary-width-z17 - 2 * @casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @tertiary-width-z18 - 2 * @casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @tertiary-width-z19 - 2 * @casing-width-z19; }
          [link = 'yes'] {
            line-pattern-width: @tertiary-link-width-z12 - 2 * @casing-width-z12;
            [zoom >= 13] { line-pattern-width: @tertiary-link-width-z13 - 2 * @casing-width-z13; }
            [zoom >= 15] { line-pattern-width: @tertiary-link-width-z15 - 2 * @casing-width-z15; }
            [zoom >= 17] { line-pattern-width: @tertiary-link-width-z17 - 2 * @casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @tertiary-link-width-z18 - 2 * @casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @tertiary-link-width-z19 - 2 * @casing-width-z19; }
          }
          #bridges {
            line-pattern-width: @tertiary-width-z12 - 2 * @bridge-casing-width-z12;
            [zoom >= 13] { line-pattern-width: @tertiary-width-z13 - 2 * @bridge-casing-width-z13; }
            [zoom >= 14] { line-pattern-width: @tertiary-width-z14 - 2 * @bridge-casing-width-z14; }
            [zoom >= 15] { line-pattern-width: @tertiary-width-z15 - 2 * @bridge-casing-width-z15; }
            [zoom >= 16] { line-pattern-width: @tertiary-width-z16 - 2 * @bridge-casing-width-z16; }
            [zoom >= 17] { line-pattern-width: @tertiary-width-z17 - 2 * @bridge-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @tertiary-width-z18 - 2 * @bridge-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @tertiary-width-z19 - 2 * @bridge-casing-width-z19; }
            [link = 'yes'] {
              line-pattern-width: @tertiary-link-width-z12 - 2 * @bridge-casing-width-z12;
              [zoom >= 13] { line-pattern-width: @tertiary-link-width-z13 - 2 * @bridge-casing-width-z13; }
              [zoom >= 15] { line-pattern-width: @tertiary-link-width-z15 - 2 * @bridge-casing-width-z15; }
              [zoom >= 17] { line-pattern-width: @tertiary-link-width-z17 - 2 * @bridge-casing-width-z17; }
              [zoom >= 18] { line-pattern-width: @tertiary-link-width-z18 - 2 * @bridge-casing-width-z18; }
              [zoom >= 19] { line-pattern-width: @tertiary-link-width-z19 - 2 * @bridge-casing-width-z19; }
            }
          }
          line-pattern-cap: round;
          line-pattern-join: round;
        }
    }

    [feature = 'highway_residential'],
    [feature = 'highway_unclassified'] {
      [zoom = 12][feature = 'highway_residential'] {
        line-color: @unimportant-road;
        line-width: @residential-width-z12;
      }
      [zoom = 12][feature = 'highway_unclassified'] {
        line-color: @unimportant-road;
        line-width: @unclassified-width-z12;
      }
      [zoom >= 13] {
        line-width: @residential-width-z13 - 2 * @residential-casing-width-z13;
        [zoom >= 14] { line-width: @residential-width-z14 - 2 * @casing-width-z14; }
        [zoom >= 15] { line-width: @residential-width-z15 - 2 * @casing-width-z15; }
        [zoom >= 16] { line-width: @residential-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-width: @residential-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-width: @residential-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-width: @residential-width-z19 - 2 * @casing-width-z19; }
        #roads-fill, #bridges {
          line-color: @residential-fill;
        }
        #tunnels {
          line-color: @residential-tunnel-fill;
        }
        #bridges {
          line-width: @residential-width-z13 - 2 * @bridge-casing-width-z13;
          [zoom >= 14] { line-width: @residential-width-z14 - 2 * @bridge-casing-width-z14; }
          [zoom >= 15] { line-width: @residential-width-z15 - 2 * @bridge-casing-width-z15; }
          [zoom >= 16] { line-width: @residential-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-width: @residential-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-width: @residential-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-width: @residential-width-z19 - 2 * @bridge-casing-width-z19; }
        }
        line-cap: round;
        line-join: round;
      }
    }

    #roads-fill[feature = 'highway_residential'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_residential'][int_surface = 'unpaved'],
    #roads-fill[feature = 'highway_unclassified'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_unclassified'][int_surface = 'unpaved'] {
      [zoom >= 14] {
        line-pattern-width: @residential-width-z13 - 2 * @residential-casing-width-z13;
        [zoom >= 14] { line-pattern-width: @residential-width-z14 - 2 * @casing-width-z14; }
        [zoom >= 15] { line-pattern-width: @residential-width-z15 - 2 * @casing-width-z15; }
        [zoom >= 16] { line-pattern-width: @residential-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-pattern-width: @residential-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-pattern-width: @residential-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-pattern-width: @residential-width-z19 - 2 * @casing-width-z19; }
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg"); 
        #bridges {
          line-pattern-width: @residential-width-z13 - 2 * @bridge-casing-width-z13;
          [zoom >= 14] { line-pattern-width: @residential-width-z14 - 2 * @bridge-casing-width-z14; }
          [zoom >= 15] { line-pattern-width: @residential-width-z15 - 2 * @bridge-casing-width-z15; }
          [zoom >= 16] { line-pattern-width: @residential-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-pattern-width: @residential-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @residential-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @residential-width-z19 - 2 * @bridge-casing-width-z19; }
        }
        line-pattern-cap: round;
        line-pattern-join: round;
      }
    }

    #roads-fill[feature = 'highway_living_street'][int_surface != 'unpaved'],
    #bridges[feature = 'highway_living_street'][int_surface != 'unpaved'],
    #tunnels[feature = 'highway_living_street'] {
      [zoom >= 13] {
        line-width: @living-street-width-z13 - 2 * @casing-width-z13;
        [zoom >= 14] { line-width: @living-street-width-z14 - 2 * @casing-width-z14; }
        [zoom >= 15] { line-width: @living-street-width-z15 - 2 * @casing-width-z15; }
        [zoom >= 16] { line-width: @living-street-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-width: @living-street-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-width: @living-street-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-width: @living-street-width-z19 - 2 * @casing-width-z19; }
        #roads-fill, #bridges {
          line-color: @living-street-fill;
        }
        #tunnels {
          line-color: @living-street-tunnel-fill;
        }
        #bridges {
          line-width: @living-street-width-z13 - 2 * @casing-width-z13;
          [zoom >= 14] { line-width: @living-street-width-z14 - 2 * @bridge-casing-width-z14; }
          [zoom >= 15] { line-width: @living-street-width-z15 - 2 * @bridge-casing-width-z15; }
          [zoom >= 16] { line-width: @living-street-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-width: @living-street-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-width: @living-street-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-width: @living-street-width-z19 - 2 * @bridge-casing-width-z19; }
        }
        line-join: round;
        line-cap: round;
      }
    }

    #roads-fill[feature = 'highway_living_street'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_living_street'][int_surface = 'unpaved'] {
      [zoom >= 13] {
        line-pattern-width: @living-street-width-z13 - 2 * @casing-width-z13;
        [zoom >= 14] { line-pattern-width: @living-street-width-z14 - 2 * @casing-width-z14; }
        [zoom >= 15] { line-pattern-width: @living-street-width-z15 - 2 * @casing-width-z15; }
        [zoom >= 16] { line-pattern-width: @living-street-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-pattern-width: @living-street-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-pattern-width: @living-street-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-pattern-width: @living-street-width-z19 - 2 * @casing-width-z19; }
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-file: url("symbols/unpaved/unpaved_living-street-fill.svg"); 
        #bridges {
          line-pattern-width: @living-street-width-z13 - 2 * @casing-width-z13;
          [zoom >= 14] { line-pattern-width: @living-street-width-z14 - 2 * @bridge-casing-width-z14; }
          [zoom >= 15] { line-pattern-width: @living-street-width-z15 - 2 * @bridge-casing-width-z15; }
          [zoom >= 16] { line-pattern-width: @living-street-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-pattern-width: @living-street-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @living-street-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @living-street-width-z19 - 2 * @bridge-casing-width-z19; }
        }
        line-pattern-join: round;
        line-pattern-cap: round;
      }
    }    

    [feature = 'highway_road'] {
      [zoom >= 10] {
        line-width: 1;
        line-color: @unimportant-road;
        line-join: round;
        line-cap: round;
      }
      [zoom >= 14] {
        line-width: @road-width-z14 - 2 * @casing-width-z14;
        [zoom >= 16] { line-width: @road-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-width: @road-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-width: @road-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-width: @road-width-z19 - 2 * @casing-width-z19; }
        #roads-fill {
          line-color: @road-fill;
        }
        #bridges {
          line-width: @road-width-z14 - 2 * @bridge-casing-width-z14;
          [zoom >= 16] { line-width: @road-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-width: @road-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-width: @road-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-width: @road-width-z19 - 2 * @bridge-casing-width-z19; }
          line-color: @road-fill;
        }
        #tunnels {
          line-color: @road-fill;
        }
      }
    }

    #roads-fill[feature = 'highway_road'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_road'][int_surface = 'unpaved'] {
      [zoom >= 16] {
        line-pattern-join: round;
        line-pattern-cap: round;
        line-pattern-width: @road-width-z14 - 2 * @casing-width-z14;
        [zoom >= 16] { line-pattern-width: @road-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-pattern-width: @road-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-pattern-width: @road-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-pattern-width: @road-width-z19 - 2 * @casing-width-z19; }
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-file: url("symbols/unpaved/unpaved_road-fill.svg"); 
        #bridges {
          line-pattern-width: @road-width-z14 - 2 * @bridge-casing-width-z14;
          [zoom >= 16] { line-pattern-width: @road-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-pattern-width: @road-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @road-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @road-width-z19 - 2 * @bridge-casing-width-z19; }
        }
      }
    }

    #roads-fill[feature = 'highway_service'],
    #bridges[feature = 'highway_service'],
    #tunnels[feature = 'highway_service'] {
      [zoom >= 14][service = 'INT-normal'],
      [zoom >= 16][service = 'INT-minor'] {
        line-color: @service-fill;
        [service = 'INT-normal'] {
          line-width: @service-width-z14 - 2 * @casing-width-z14;
          [zoom >= 16] { line-width: @service-width-z16 - 2 * @casing-width-z16; }
          [zoom >= 17] { line-width: @service-width-z17 - 2 * @casing-width-z17; }
          [zoom >= 18] { line-width: @service-width-z18 - 2 * @casing-width-z18; }
          [zoom >= 19] { line-width: @service-width-z19 - 2 * @casing-width-z19; }
          [zoom >= 20] { line-width: @service-width-z20 - 2 * @casing-width-z20; }
        }
        [service = 'INT-minor'] {
          line-width: @minor-service-width-z16 - 2 * @casing-width-z16;
          [zoom >= 17] { line-width: @minor-service-width-z17 - 2 * @casing-width-z17; }
          [zoom >= 18] { line-width: @minor-service-width-z18 - 2 * @casing-width-z18; }
          [zoom >= 19] { line-width: @minor-service-width-z19 - 2 * @casing-width-z19; }
          [zoom >= 20] { line-width: @minor-service-width-z20 - 2 * @casing-width-z20; }
        }
        line-join: round;
        line-cap: round;
        #tunnels {
          line-color: darken(white, 5%);
        }
        #bridges {
          [service = 'INT-normal'] {
            line-width: @service-width-z14 - 2 * @bridge-casing-width-z14;
            [zoom >= 16] { line-width: @service-width-z16 - 2 * @bridge-casing-width-z16; }
            [zoom >= 17] { line-width: @service-width-z17 - 2 * @bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @service-width-z18 - 2 * @bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @service-width-z19 - 2 * @bridge-casing-width-z19; }
            [zoom >= 20] { line-width: @service-width-z20 - 2 * @bridge-casing-width-z20; }
          }
          [service = 'INT-minor'] {
            line-width: @minor-service-width-z16 - 2 * @bridge-casing-width-z16;
            [zoom >= 17] { line-width: @minor-service-width-z17 - 2 * @bridge-casing-width-z17; }
            [zoom >= 18] { line-width: @minor-service-width-z18 - 2 * @bridge-casing-width-z18; }
            [zoom >= 19] { line-width: @minor-service-width-z19 - 2 * @bridge-casing-width-z19; }
            [zoom >= 20] { line-width: @minor-service-width-z20 - 2 * @bridge-casing-width-z20; }
          }
        }
      }
    }

    #roads-fill[feature = 'highway_service'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_service'][int_surface = 'unpaved'] {
      [zoom >= 16][service = 'INT-normal'],
      [zoom >= 17][service = 'INT-minor'] {
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg"); 
        [service = 'INT-normal'] {
          line-pattern-width: @service-width-z14 - 2 * @casing-width-z14;
          [zoom >= 16] { line-pattern-width: @service-width-z16 - 2 * @casing-width-z16; }
          [zoom >= 17] { line-pattern-width: @service-width-z17 - 2 * @casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @service-width-z18 - 2 * @casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @service-width-z19 - 2 * @casing-width-z19; }
          [zoom >= 20] { line-pattern-width: @service-width-z20 - 2 * @casing-width-z20; }
        }
        [service = 'INT-minor'] {
          line-pattern-width: @minor-service-width-z16 - 2 * @casing-width-z16;
          [zoom >= 17] { line-pattern-width: @minor-service-width-z17 - 2 * @casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @minor-service-width-z18 - 2 * @casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @minor-service-width-z19 - 2 * @casing-width-z19; }
          [zoom >= 20] { line-pattern-width: @minor-service-width-z20 - 2 * @casing-width-z20; }
        }
        line-pattern-join: round;
        line-pattern-cap: round;
        #bridges {
          [service = 'INT-normal'] {
            line-pattern-width: @service-width-z14 - 2 * @bridge-casing-width-z14;
            [zoom >= 16] { line-pattern-width: @service-width-z16 - 2 * @bridge-casing-width-z16; }
            [zoom >= 17] { line-pattern-width: @service-width-z17 - 2 * @bridge-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @service-width-z18 - 2 * @bridge-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @service-width-z19 - 2 * @bridge-casing-width-z19; }
            [zoom >= 20] { line-pattern-width: @service-width-z20 - 2 * @bridge-casing-width-z20; }
          }
          [service = 'INT-minor'] {
            line-pattern-width: @minor-service-width-z16 - 2 * @bridge-casing-width-z16;
            [zoom >= 17] { line-pattern-width: @minor-service-width-z17 - 2 * @bridge-casing-width-z17; }
            [zoom >= 18] { line-pattern-width: @minor-service-width-z18 - 2 * @bridge-casing-width-z18; }
            [zoom >= 19] { line-pattern-width: @minor-service-width-z19 - 2 * @bridge-casing-width-z19; }
            [zoom >= 20] { line-pattern-width: @minor-service-width-z20 - 2 * @bridge-casing-width-z20; }
          }
        }
      }
    }

    #roads-fill[feature = 'highway_pedestrian'][int_surface != 'unpaved'],
    #bridges[feature = 'highway_pedestrian'][int_surface != 'unpaved'],
    #tunnels[feature = 'highway_pedestrian'] {
      [zoom >= 14] {
        line-width: @pedestrian-width-z14 - 2 * @casing-width-z14;
        [zoom >= 15] { line-width: @pedestrian-width-z15 - 2 * @casing-width-z15; }
        [zoom >= 16] { line-width: @pedestrian-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-width: @pedestrian-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-width: @pedestrian-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-width: @pedestrian-width-z19 - 2 * @casing-width-z19; }
        line-color: @pedestrian-fill;
        #bridges {
          line-width: @pedestrian-width-z14 - 2 * @bridge-casing-width-z14;
          [zoom >= 15] { line-width: @pedestrian-width-z15 - 2 * @bridge-casing-width-z15; }
          [zoom >= 16] { line-width: @pedestrian-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-width: @pedestrian-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-width: @pedestrian-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-width: @pedestrian-width-z19 - 2 * @bridge-casing-width-z19; }
        }
        line-join: round;
        line-cap: round;
      }
    }

    #roads-fill[feature = 'highway_pedestrian'][int_surface = 'unpaved'],
    #bridges[feature = 'highway_pedestrian'][int_surface = 'unpaved'] {
      [zoom >= 14] {
        line-pattern-width: @pedestrian-width-z14 - 2 * @casing-width-z14;
        [zoom >= 15] { line-pattern-width: @pedestrian-width-z15 - 2 * @casing-width-z15; }
        [zoom >= 16] { line-pattern-width: @pedestrian-width-z16 - 2 * @casing-width-z16; }
        [zoom >= 17] { line-pattern-width: @pedestrian-width-z17 - 2 * @casing-width-z17; }
        [zoom >= 18] { line-pattern-width: @pedestrian-width-z18 - 2 * @casing-width-z18; }
        [zoom >= 19] { line-pattern-width: @pedestrian-width-z19 - 2 * @casing-width-z19; }
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-file: url("symbols/unpaved/unpaved_pedestrian-fill.svg"); 
        #bridges {
          line-pattern-width: @pedestrian-width-z14 - 2 * @bridge-casing-width-z14;
          [zoom >= 15] { line-pattern-width: @pedestrian-width-z15 - 2 * @bridge-casing-width-z15; }
          [zoom >= 16] { line-pattern-width: @pedestrian-width-z16 - 2 * @bridge-casing-width-z16; }
          [zoom >= 17] { line-pattern-width: @pedestrian-width-z17 - 2 * @bridge-casing-width-z17; }
          [zoom >= 18] { line-pattern-width: @pedestrian-width-z18 - 2 * @bridge-casing-width-z18; }
          [zoom >= 19] { line-pattern-width: @pedestrian-width-z19 - 2 * @bridge-casing-width-z19; }
        }
        line-pattern-join: round;
        line-pattern-cap: round;
      }
    }

    [feature = 'highway_raceway'][int_surface != 'unpaved'] {
      [zoom >= 12] {
        line-color: @raceway-fill;
        line-width: 1.2;
        line-join: round;
        line-cap: round;
      }
      [zoom >= 13] { line-width: 2; }
      [zoom >= 14] { line-width: 3; }
      [zoom >= 15] { line-width: 6; }
      [zoom >= 18] { line-width: 8; }
      [zoom >= 19] { line-width: 12; }
      [zoom >= 20] { line-width: 24; }
    }

    [feature = 'highway_raceway'][int_surface = 'unpaved'] {
      [zoom >= 12] {
        line-pattern-type: repeat;
        line-pattern-alignment: global;
        line-pattern-file: url("symbols/unpaved/unpaved_raceway-fill.svg"); 
        line-pattern-width: 1.2;
        line-pattern-join: round;
        line-pattern-cap: round;
      }
      [zoom >= 13] { line-pattern-width: 2; }
      [zoom >= 14] { line-pattern-width: 3; }
      [zoom >= 15] { line-pattern-width: 6; }
      [zoom >= 18] { line-pattern-width: 8; }
      [zoom >= 19] { line-pattern-width: 12; }
      [zoom >= 20] { line-pattern-width: 24; }
    }

    [feature = 'highway_platform'][int_surface != 'unpaved'] {
      [zoom >= 16] {
        line-join: round;
        line-width: 6;
        line-color: grey;
        line-cap: round;
        b/line-width: 4;
        b/line-color: @platform-fill;
        b/line-cap: round;
        b/line-join: round;
      }
    }

    [feature = 'highway_platform'][int_surface = 'unpaved'] {
      [zoom >= 16] {
        line-join: round;
        line-width: 6;
        line-color: grey;
        line-cap: round;
        b/line-pattern-width: 4;
        b/line-pattern-type: repeat;
        b/line-pattern-alignment: global;
        b/line-pattern-file: url("symbols/unpaved/unpaved_platform-fill.svg"); 
        b/line-pattern-cap: round;
        b/line-pattern-join: round;
      }
    }

    [feature = 'highway_steps'] {
      [zoom >= 14][int_access != 'no'],
      [zoom >= 15] {
        #roads-fill[zoom >= 15] {
          background/line-color: @steps-casing;
          background/line-cap: round;
          background/line-join: round;
          background/line-width: @steps-width-z15 + 2 * @paths-background-width;
          background/line-opacity: 0.4;
        }
        line/line-color: @steps-fill;
        [int_access = 'no'] { line/line-color: @steps-fill-noaccess; }
        line/line-dasharray: 2,1;
        line/line-width: @steps-width-z14;
        [zoom >= 15] { line/line-width:  @steps-width-z15; }
      }
    }

    [feature = 'highway_bridleway'] {
      [zoom >= 13][int_access != 'no'],
      [zoom >= 15] {
        #roads-fill[zoom >= 15] {
          background/line-color: @bridleway-casing;
          background/line-cap: round;
          background/line-join: round;
          background/line-width: @bridleway-width-z15 + 2 * @paths-background-width;
          background/line-opacity: 0.4;
        }
        line/line-color: @bridleway-fill;
        [int_access = 'no'] { line/line-color: @bridleway-fill-noaccess; }
        line/line-dasharray: 4,2;
        line/line-width: @bridleway-width-z13;
        [zoom >= 15] { line/line-width: @bridleway-width-z15; }
        #tunnels {
          line/line-join: round;
          line/line-cap: round;
        }
      }
    }

    [feature = 'highway_footway'],
    [feature = 'highway_path'] {
      [zoom >= 14][int_access != 'no'],
      [zoom >= 15] {
        #roads-fill[zoom >= 15] {
          background/line-color: @footway-casing;
          background/line-cap: round;
          background/line-join: round;
          background/line-width: @footway-width-z15 + 2 * @paths-background-width;
          background/line-opacity: 0.4;
          [zoom >= 16] {
            background/line-width: @footway-width-z16 + 2 * @paths-background-width;
          }
          [zoom >= 18] {
            background/line-width: @footway-width-z18 + 2 * @paths-background-width;
          }
          [zoom >= 19] {
            background/line-width: @footway-width-z19 + 2 * @paths-background-width;
          }
        }
        line/line-color: @footway-fill;
        [int_access = 'no'] { line/line-color: @footway-fill-noaccess; }
        line/line-dasharray: 1,3;
        line/line-join: round;
        line/line-cap: round;
        line/line-width: @footway-width-z14;
        [zoom >= 15][int_surface = 'paved'] {
          line/line-dasharray: 2,3.5;
          line/line-width: @footway-width-z15;
          [zoom >= 16] {
            line/line-dasharray: 3,3.5;
            line/line-width: @footway-width-z16;
          }
          [zoom >= 17] {
            line/line-dasharray: 3,3;
          }
          [zoom >= 18] {
            line/line-width: @footway-width-z18;
          }
          [zoom >= 19] {
            line/line-width: @footway-width-z19;
          }
        }
        [zoom >= 15][int_surface = null] {
          line/line-color: @footway-fill;
          [int_access = 'no'] { line/line-color: @footway-fill-noaccess; }
          line/line-dasharray: 1,3,2,4;
          line/line-join: round;
          line/line-cap: round;
          line/line-width: @footway-width-z15;
          [zoom >= 16] {
            line/line-dasharray: 1,4,2,3;
            line/line-width: @footway-width-z16;
          }
          [zoom >= 18] {
            line/line-width: @footway-width-z18;
          }
          [zoom >= 19] {
            line/line-width: @footway-width-z19;
          }
        }
        [zoom >= 15][int_surface = 'unpaved'] {
          line/line-color: @footway-fill;
          [int_access = 'no'] { line/line-color: @footway-fill-noaccess; }
          line/line-dasharray: 1,4;
          line/line-join: round;
          line/line-cap: round;
          line/line-width: @footway-width-z15;
          [zoom >= 16] {
            line/line-width: @footway-width-z16;
          }
          [zoom >= 18] {
            line/line-width: @footway-width-z18;
          }
          [zoom >= 19] {
            line/line-width: @footway-width-z19;
          }
        }
      }
    }

    [feature = 'highway_cycleway'] {
      [zoom >= 13][int_access != 'no'],
      [zoom >= 15] {
        #roads-fill[zoom >= 15] {
          background/line-color: @cycleway-casing;
          background/line-cap: round;
          background/line-join: round;
          background/line-width: @cycleway-width-z15 + 2 * @paths-background-width;
          background/line-opacity: 0.4;
          [zoom >= 16] {
            background/line-width: @cycleway-width-z16 + 2 * @paths-background-width;
          }
          [zoom >= 18] {
            background/line-width: @cycleway-width-z18 + 2 * @paths-background-width;
          }
          [zoom >= 19] {
            background/line-width: @cycleway-width-z19 + 2 * @paths-background-width;
          }
        }
        line/line-color: @cycleway-fill;
        [int_access = 'no'] { line/line-color: @cycleway-fill-noaccess; }
        line/line-dasharray: 1,3;
        line/line-join: round;
        line/line-cap: round;
        line/line-width: @cycleway-width-z13;
        [zoom >= 15][int_surface = 'paved'] {
          line/line-dasharray: 2,3.5;
          line/line-width: @cycleway-width-z15;
          [zoom >= 16] {
            line/line-dasharray: 3,3.5;
            line/line-width: @cycleway-width-z16;
          }
          [zoom >= 17] {
            line/line-dasharray: 3,3;
          }
          [zoom >= 18] {
            line/line-width: @cycleway-width-z18;
          }
          [zoom >= 19] {
            line/line-width: @cycleway-width-z19;
          }
        }
        [zoom >= 15][int_surface = null] {
          line/line-color: @cycleway-fill;
          [int_access = 'no'] { line/line-color: @cycleway-fill-noaccess; }
          line/line-dasharray: 1,3,2,4;
          line/line-join: round;
          line/line-cap: round;
          line/line-width: @cycleway-width-z15;
          [zoom >= 16] {
            line/line-dasharray: 1,4,2,3;
            line/line-width: @cycleway-width-z16;
          }
          [zoom >= 18] {
            line/line-width: @cycleway-width-z18;
          }
          [zoom >= 19] {
            line/line-width: @cycleway-width-z19;
          }
        }
        [zoom >= 15][int_surface = 'unpaved'] {
          line/line-color: @cycleway-fill;
          [int_access = 'no'] { line/line-color: @cycleway-fill-noaccess; }
          line/line-dasharray: 1,4;
          line/line-join: round;
          line/line-cap: round;
          line/line-width:  @cycleway-width-z15;
          [zoom >= 16] {
            line/line-width:  @cycleway-width-z16;
          }
          [zoom >= 18] {
            line/line-width: @cycleway-width-z18;
          }
          [zoom >= 19] {
            line/line-width:  @cycleway-width-z19;
          }
        }
      }
    }

    [feature = 'highway_track'] {
      [zoom >= 13][int_access != 'no'],
      [zoom >= 15] {
        /* The white casing that you mainly see against forests and other dark features */
        #roads-fill[zoom >= 15] {
          background/line-opacity: 0.4;
          background/line-color: @track-casing;
          background/line-join: round;
          background/line-cap: round;
          background/line-width: @track-width-z15 + 2 * @paths-background-width;
          /* With the heavier dasharrays on grade1 and grade2 it helps to make the casing a bit larger */
          [tracktype = 'grade1'] {
            background/line-width: @track-grade1-width-z15 + 2 * @paths-background-width;
          }
          [tracktype = 'grade2'] {
            background/line-width: @track-grade2-width-z15 + 2 * @paths-background-width;
          }
        }

        /* Set the properties of the brown inside */
        line/line-color: @track-fill;
        [int_access = 'no'] { line/line-color: @track-fill-noaccess; }
        line/line-dasharray: 5,4,2,4;
        line/line-cap: round;
        line/line-join: round;
        line/line-opacity: 0.8;
        line/line-clip:false;

        line/line-width: @track-width-z13;

        [tracktype = 'grade1'] {
          line/line-dasharray: 100,0;
        }
        [tracktype = 'grade2'] {
          line/line-dasharray: 8.8,3.2;
        }
        [tracktype = 'grade3'] {
          line/line-dasharray: 5.6,4.0;
        }
        [tracktype = 'grade4'] {
          line/line-dasharray: 3.2,4.8;
        }
        [tracktype = 'grade5'] {
          line/line-dasharray: 1.6,6.4;
        }

        [zoom >= 15] {
          line/line-width: @track-width-z15;
          [tracktype = 'grade1'] {
            line/line-dasharray: 100,0;
          }
          [tracktype = 'grade2'] {
            line/line-dasharray: 11,4;
          }
          [tracktype = 'grade3'] {
            line/line-dasharray: 7,5;
          }
          [tracktype = 'grade4'] {
            line/line-dasharray: 4,6;
          }
          [tracktype = 'grade5'] {
            line/line-dasharray: 2,8;
          }
        }
      }
    }
	
    [feature = 'highway_bus_guideway'][zoom >= 11] {
      [zoom < 13] {
        line-width: 0.6;
        [zoom >= 12] { line-width: 1; }
        #roads-fill, #bridges {
        line-color: @bus-guideway-fill;
        }
        #tunnels {
        line-color: @bus-guideway-tunnel-fill;
        line-dasharray: 5,2;
        }
      }
      [zoom >= 13] {
        line-width: 3;
        line-join: round;
        #roads-fill, #bridges {
          line-color: @bus-guideway-fill;
        }
        #tunnels {
          line-color: @bus-guideway-tunnel-fill;
        }
        b/line-width: 1;
        b/line-color: white;
        b/line-dasharray: 8,12;
        b/line-join: round;
        [zoom >= 14] {
          b/line-dasharray: 0,11,8,1;
        }
      }
    }

    [feature = 'railway_rail'][zoom >= 8][zoom < 10],
    [feature = 'railway_rail'][preserved != 'yes'][zoom >= 10][zoom < 12],
    [feature = 'railway_rail'][zoom >= 12],
    [feature = 'railway_INT-spur-siding-yard'][zoom >= 13] {
      [zoom < 13] {
        line-color: #787878;
        line-width: 0.5;
        [zoom >= 8] { line-width: 0.8; }
        [zoom >= 12] { line-width: 0.9; }
        line-join: round;
        .roads_low_zoom[int_tunnel = 'yes'], #tunnels {
          line-dasharray: 5,2;
        }
      }
      [zoom >= 12] {
        #roads-fill, #bridges {
          dark/line-join: round;
          light/line-color: white;
          light/line-join: round;
          [feature = 'railway_rail'] {
            dark/line-color: #707070;
            dark/line-width: 2;
            light/line-width: 0.75;
            light/line-dasharray: 8,8;
            [zoom >= 13] {
              dark/line-width: 3;
              light/line-width: 1;
            }
            [zoom >= 15][preserved != 'yes'] {
              light/line-dasharray: 0,8,8,1;
            }
            [zoom >= 18] {
              dark/line-width: 4;
              light/line-width: 2;
            }
          }
          [feature = 'railway_INT-spur-siding-yard'] {
            dark/line-width: 2;
            dark/line-color: #aaa;
            light/line-width: 0.8;
            light/line-dasharray: 0,8,8,1;
            [zoom >= 18] {
              dark/line-width: 3;
              light/line-width: 1;
            }
          }
          [preserved = 'yes'] {
            dark/line-width: 3;
            dark/line-color: #666;
            light/line-width: 1;
            light/line-color: white;
            light/line-dasharray: 0,1,8,1;
          }
        }
        #tunnels {
          line-color: #787878;
          line-width: 2.8;
          line-dasharray: 6,4;
          line-clip: false;
          [feature = 'railway_INT-spur-siding-yard'] {
            line-color: #aaa;
            line-width: 1.9;
            line-dasharray: 3,3;
            [zoom >= 18] {
              line-width: 2.7;
            }
          }
          [feature = 'railway_rail'][zoom >= 18] {
            line-dasharray: 8,6;
            line-width: 3.8;
          }
        }
      }
    }

    [feature = 'railway_light_rail'],
    [feature = 'railway_funicular'],
    [feature = 'railway_narrow_gauge'] {
      [zoom >= 8][zoom < 10],
      [preserved != 'yes'][zoom >= 10][zoom < 12],
      [zoom >= 12] {
        line-color: #ccc;
        [zoom >= 10] { line-color: #aaa; }
        [zoom >= 13] { line-color: #666; }
        line-width: 1;
        [zoom >= 13] { line-width: 2; }
        [preserved = 'yes'][zoom >= 13] {
          #roads-fill, #bridges {
            dark/line-width: 3;
            dark/line-color: #999;
            light/line-width: 1;
            light/line-color: white;
            light/line-dasharray: 0,1,8,1;
            light/line-join: round;
          }
        }
        #tunnels {
          line-dasharray: 5,3;
        }
      }
    }

    [feature = 'railway_miniature'] {
      [zoom >= 15] {
        line/line-width: 1.2;
        line/line-color: #999;
        dashes/line-width: 3;
        dashes/line-color: #999;
        dashes/line-dasharray: 1,10;

        [preserved = 'yes'] {
          line/line-width: 3;
          line/line-color: #bbb;
          dashes/line-width: 1;
          dashes/line-color: white;
          dashes/line-dasharray: 0,1,8,1;
          dashes/line-join: round;
        }
      }
    }

    [feature = 'railway_tram'],
    [feature = 'railway_tram-service'][zoom >= 15] {
      [zoom >= 12] {
        line-color: #6E6E6E;
        line-width: 0.75;
        [zoom >= 14] {
          line-width: 1;
        }
        [zoom >= 15] {
          line-width: 1.5;
          [feature = 'railway_tram-service'] {
            line-width: 0.5;
          }
        }
        [zoom >= 17] {
          line-width: 2;
          [feature = 'railway_tram-service'] {
            line-width: 1;
          }
        }
        [zoom >= 18] {
          [feature = 'railway_tram-service'] {
            line-width: 1.5;
          }
        }
        [zoom >= 19] {
          [feature = 'railway_tram-service'] {
            line-width: 2;
          }
        }
        [preserved = 'yes'][zoom >= 15] {
          #roads-fill, #bridges {
            dark/line-width: 3;
            dark/line-color: #999;
            light/line-width: 1;
            light/line-color: white;
            light/line-dasharray: 0,1,8,1;
            light/line-join: round;
          }
        }
        #tunnels {
          line-dasharray: 5,3;
        }
      }
    }

    [feature = 'railway_subway'] {
      [zoom >= 12] {
        line-width: 2;
        line-color: #999;
        [preserved = 'yes'][zoom >= 15] {
          #roads-fill, #bridges {
            dark/line-width: 3;
            dark/line-color: #999;
            light/line-width: 1;
            light/line-color: white;
            light/line-dasharray: 0,1,8,1;
            light/line-join: round;
          }
        }
        #tunnels {
          line-dasharray: 5,3;
        }
      }
      #bridges {
        [zoom >= 14] {
          line-width: 2;
          line-color: #999;
        }
      }
    }

    [feature = 'railway_monorail'] {
      [zoom >= 14] {
        background/line-width: 4;
        background/line-color: #fff;
        background/line-opacity: 0.4;
        background/line-cap: round;
        background/line-join: round;
        line/line-width: 3;
        line/line-color: #777;
        line/line-dasharray: 2,3;
        line/line-cap: round;
        line/line-join: round;

        [preserved = 'yes'] {
          line/line-color: #999;
          background/line-color: white;
          background/line-dasharray: 0,1,8,1;
        }

        #tunnels {
          line/line-dasharray: 3,4;
        }
      }
    }

    [feature = 'railway_construction'] {
      [zoom >= 13] {
        line-color: grey;
        line-width: 2;
        line-dasharray: 2,4;
        line-join: round;
        [zoom >= 14] {
          line-dasharray: 2,3;
        }
        [zoom >= 15] {
          line-width: 3;
          line-dasharray: 3,3;
        }
      }
    }

    [feature = 'railway_disused'] {
      [zoom >= 15] {
        line-color: #aaa;
        line-width: 2;
        line-dasharray: 2,4;
        line-join: round;
      }
    }

    [feature = 'railway_platform'][int_surface != 'unpaved'] {
      [zoom >= 16] {
        line-join: round;
        line-width: 6;
        line-color: grey;
        line-cap: round;
        b/line-width: 4;
        b/line-color: @platform-fill;
        b/line-cap: round;
        b/line-join: round;
      }
    }

    [feature = 'railway_platform'][int_surface = 'unpaved'] {
      [zoom >= 16] {
        line-join: round;
        line-width: 6;
        line-color: grey;
        line-cap: round;
        b/line-pattern-width: 4;
        b/line-pattern-type: repeat;
        b/line-pattern-alignment: global;
        b/line-pattern-file: url("symbols/unpaved/unpaved_platform-fill.svg"); 
        b/line-pattern-cap: round;
        b/line-pattern-join: round;
      }
    }

    [feature = 'railway_turntable'] {
      [zoom >= 16] {
        line-width: 1.5;
        line-color: #999;
      }
    }
  }
}

#turning-circle-casing {
  [int_tc_type = 'trunk'][zoom >= 15] {
    line-color: @trunk-casing;
    line-width: @trunk-width-z15 * @turning-circle-factor + 2 * @major-casing-width-z15;
    [zoom >= 17] {
      line-width: @trunk-width-z17 * @turning-circle-factor + 2 * @major-casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @trunk-width-z18 * @turning-circle-factor + 2 * @major-casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @trunk-width-z19 * @turning-circle-factor + 2 * @major-casing-width-z19;
    }
    line-cap: round;
  }

  [int_tc_type = 'primary'][zoom >= 15] {
    line-color: @primary-casing;
    line-width: @primary-width-z15 * @turning-circle-factor + 2 * @major-casing-width-z15;
    [zoom >= 17] {
      line-width: @primary-width-z17 * @turning-circle-factor + 2 * @major-casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @primary-width-z18 * @turning-circle-factor + 2 * @major-casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @primary-width-z19 * @turning-circle-factor + 2 * @major-casing-width-z19;
    }
    line-cap: round;
  }

  [int_tc_type = 'secondary'][zoom >= 15] {
    line-color: @secondary-casing;
    line-width: @secondary-width-z15 * @turning-circle-factor + 2 * @secondary-casing-width-z15;
    [zoom >= 16] {
      line-width: @secondary-width-z16 * @turning-circle-factor + 2 * @secondary-casing-width-z16;
    }
    [zoom >= 17] {
      line-width: @secondary-width-z17 * @turning-circle-factor + 2 * @secondary-casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @secondary-width-z18 * @turning-circle-factor + 2 * @secondary-casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @secondary-width-z19 * @turning-circle-factor + 2 * @secondary-casing-width-z19;
    }
    line-cap: round;
  }

  [int_tc_type = 'tertiary'][zoom >= 15] {
    line-color: @tertiary-casing;
    line-width: @tertiary-width-z15 * @turning-circle-factor + 2 * @casing-width-z15;
    [zoom >= 16] {
      line-width: @tertiary-width-z16 * @turning-circle-factor + 2 * @casing-width-z16;
    }
    [zoom >= 17] {
      line-width: @tertiary-width-z17 * @turning-circle-factor + 2 * @casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @tertiary-width-z18 * @turning-circle-factor + 2 * @casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @tertiary-width-z19 * @turning-circle-factor + 2 * @casing-width-z19;
    }
    line-cap: round;
  }

  [int_tc_type = 'residential'][zoom >= 15],
  [int_tc_type = 'unclassified'][zoom >= 15] {
    line-color: @residential-casing;
    line-width: @residential-width-z15 * @turning-circle-factor + 2 * @casing-width-z15;
    [zoom >= 16] {
      line-width: @residential-width-z16 * @turning-circle-factor + 2 * @casing-width-z16;
    }
    [zoom >= 17] {
      line-width: @residential-width-z17 * @turning-circle-factor + 2 * @casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @residential-width-z18 * @turning-circle-factor + 2 * @casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @residential-width-z19 * @turning-circle-factor + 2 * @casing-width-z19;
    }
    line-cap: round;
  }

  [int_tc_type = 'living_street'][zoom >= 15] {
    line-color: @living-street-casing;
    line-width: @living-street-width-z15 * @turning-circle-factor + 2 * @casing-width-z15;
    [zoom >= 16] {
      line-width: @living-street-width-z16 * @turning-circle-factor + 2 * @casing-width-z16;
    }
    [zoom >= 17] {
      line-width: @living-street-width-z17 * @turning-circle-factor + 2 * @casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @living-street-width-z18 * @turning-circle-factor + 2 * @casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @living-street-width-z19 * @turning-circle-factor + 2 * @casing-width-z19;
    }
    line-cap: round;
  }

  [int_tc_type = 'service'][int_tc_service = 'INT-normal'][zoom >= 16] {
    line-color: @service-casing;
    line-width: @service-width-z16 * @turning-circle-factor + 2 * @casing-width-z16;
    [zoom >= 17] {
      line-width: @service-width-z17 * @turning-circle-factor + 2 * @casing-width-z17;
    }
    [zoom >= 18] {
      line-width: @service-width-z18 * @turning-circle-factor + 2 * @casing-width-z18;
    }
    [zoom >= 19] {
      line-width: @service-width-z19 * @turning-circle-factor + 2 * @casing-width-z19;
    }
    [zoom >= 20] {
      line-width: @service-width-z20 * @turning-circle-factor + 2 * @casing-width-z20;
    }
    line-cap: round;
  }

  [int_tc_type = 'service'][int_tc_service = 'INT-minor'][zoom >= 18] {
    line-color: @service-casing;
    line-width: @minor-service-width-z18 * @turning-circle-factor + 2 * @casing-width-z18;
    [zoom >= 19] {
      line-width: @minor-service-width-z19 * @turning-circle-factor + 2 * @casing-width-z19;
    }
    [zoom >= 20] {
      line-width: @minor-service-width-z20 * @turning-circle-factor + 2 * @casing-width-z20;
    }
    line-cap: round;
  }
}

#turning-circle-fill {
  [int_tc_type = 'trunk'][zoom >= 15][int_surface != 'unpaved'] {
    line-color: @trunk-fill;
    line-width: @trunk-width-z15 * @turning-circle-factor;
    [zoom >= 17] {
      line-width: @trunk-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-width: @trunk-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-width: @trunk-width-z19 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'trunk'][zoom >= 15][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @trunk-width-z15 * @turning-circle-factor;
    line-pattern-file: url("symbols/unpaved/unpaved_trunk-fill.svg");
    [zoom >= 17] {
      line-pattern-width: @trunk-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-pattern-width: @trunk-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-pattern-width: @trunk-width-z19 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'primary'][zoom >= 15][int_surface != 'unpaved'] {
    line-color: @primary-fill;
    line-width: @primary-width-z15 * @turning-circle-factor;
    [zoom >= 17] {
      line-width: @primary-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-width: @primary-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-width: @primary-width-z19 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'primary'][zoom >= 15][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @primary-width-z15 * @turning-circle-factor;
    line-pattern-file: url("symbols/unpaved/unpaved_primary-fill.svg");
    [zoom >= 17] {
      line-pattern-width: @primary-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-pattern-width: @primary-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-pattern-width: @primary-width-z19 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'secondary'][zoom >= 15][int_surface != 'unpaved'] {
    line-color: @secondary-fill;
    line-width: @secondary-width-z15 * @turning-circle-factor;
    [zoom >= 16] {
      line-width: @secondary-width-z16 * @turning-circle-factor;
    }
    [zoom >= 17] {
      line-width: @secondary-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-width: @secondary-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-width: @secondary-width-z19 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'secondary'][zoom >= 15][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @secondary-width-z15 * @turning-circle-factor;
    line-pattern-file: url("symbols/unpaved/unpaved_secondary-fill.svg");
    [zoom >= 16] {
      line-pattern-width: @secondary-width-z16 * @turning-circle-factor;
    }
    [zoom >= 17] {
      line-pattern-width: @secondary-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-pattern-width: @secondary-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-pattern-width: @secondary-width-z19 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'tertiary'][zoom >= 15][int_surface != 'unpaved'] {
    line-color: @tertiary-fill;
    line-width: @tertiary-width-z15 * @turning-circle-factor;
    [zoom >= 16] {
      line-width: @tertiary-width-z16 * @turning-circle-factor;
    }
    [zoom >= 17] {
      line-width: @tertiary-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-width: @tertiary-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-width: @tertiary-width-z19 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'tertiary'][zoom >= 15][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @tertiary-width-z15 * 1.6;
    line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg");
    [zoom >= 16] {
      line-pattern-width: @tertiary-width-z16 * @turning-circle-factor;
    }
    [zoom >= 17] {
      line-pattern-width: @tertiary-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-pattern-width: @tertiary-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-pattern-width: @tertiary-width-z19 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'residential'][int_surface != 'unpaved'],
  [int_tc_type = 'unclassified'][int_surface != 'unpaved'] {
    [zoom >= 15] {
      line-color: @residential-fill;
      line-width: @residential-width-z15 * @turning-circle-factor;
      [zoom >= 16] {
        line-width: @residential-width-z16 * @turning-circle-factor;
      }
      [zoom >= 17] {
        line-width: @residential-width-z17 * @turning-circle-factor;
      }
      [zoom >= 18] {
        line-width: @residential-width-z18 * @turning-circle-factor;
      }
      [zoom >= 19] {
        line-width: @residential-width-z19 * @turning-circle-factor;
      }
      line-cap: round;
    }
  }
  [int_tc_type = 'residential'][int_surface = 'unpaved'],
  [int_tc_type = 'unclassified'][int_surface = 'unpaved'] {
    [zoom >= 15] {
      line-pattern-type: repeat;
      line-pattern-alignment: global;
      line-pattern-width: @residential-width-z15 * @turning-circle-factor;
      line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg");
      [zoom >= 16] {
        line-pattern-width: @residential-width-z16 * @turning-circle-factor;
      }
      [zoom >= 17] {
        line-pattern-width: @residential-width-z17 * @turning-circle-factor;
      }
      [zoom >= 18] {
        line-pattern-width: @residential-width-z18 * @turning-circle-factor;
      }
      [zoom >= 19] {
        line-pattern-width: @residential-width-z19 * @turning-circle-factor;
      }
      line-pattern-cap: round;
    }
  }

  [int_tc_type = 'living_street'][zoom >= 15][int_surface != 'unpaved'] {
    line-color: @living-street-fill;
    line-width: @living-street-width-z15 * @turning-circle-factor;
    [zoom >= 16] {
      line-width: @living-street-width-z16 * @turning-circle-factor;
    }
    [zoom >= 17] {
      line-width: @living-street-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-width: @living-street-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-width: @living-street-width-z19 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'living_street'][zoom >= 15][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @living-street-width-z15 * @turning-circle-factor;
    line-pattern-file: url("symbols/unpaved/unpaved_living-street-fill.svg");
    [zoom >= 16] {
      line-pattern-width: @living-street-width-z16 * @turning-circle-factor;
    }
    [zoom >= 17] {
      line-pattern-width: @living-street-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-pattern-width: @living-street-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-pattern-width: @living-street-width-z19 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'service'][int_tc_service = 'INT-normal'][zoom >= 16][int_surface != 'unpaved'] {
    line-color: @service-fill;
    line-width: @service-width-z16 * @turning-circle-factor;
    [zoom >= 17] {
      line-width: @service-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-width: @service-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-width: @service-width-z19 * @turning-circle-factor;
    }
    [zoom >= 20] {
      line-width: @service-width-z20 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'service'][int_tc_service = 'INT-normal'][zoom >= 16][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @service-width-z16 * @turning-circle-factor;
    line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg");
    [zoom >= 17] {
      line-pattern-width: @service-width-z17 * @turning-circle-factor;
    }
    [zoom >= 18] {
      line-pattern-width: @service-width-z18 * @turning-circle-factor;
    }
    [zoom >= 19] {
      line-pattern-width: @service-width-z19 * @turning-circle-factor;
    }
    [zoom >= 20] {
      line-pattern-width: @service-width-z20 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'service'][int_tc_service = 'INT-minor'][zoom >= 18][int_surface != 'unpaved'] {
    line-color: @service-fill;
    line-width: @minor-service-width-z18 * @turning-circle-factor;
    [zoom >= 19] {
      line-width: @minor-service-width-z19 * @turning-circle-factor;
    }
    [zoom >= 20] {
      line-width: @minor-service-width-z20 * @turning-circle-factor;
    }
    line-cap: round;
  }
  [int_tc_type = 'service'][int_tc_service = 'INT-minor'][zoom >= 18][int_surface = 'unpaved'] {
    line-pattern-type: repeat;
    line-pattern-alignment: global;
    line-pattern-width: @minor-service-width-z18 * @turning-circle-factor;
    line-pattern-file: url("symbols/unpaved/unpaved_residential-fill.svg");
    [zoom >= 19] {
      line-pattern-width: @minor-service-width-z19 * @turning-circle-factor;
    }
    [zoom >= 20] {
      line-pattern-width: @minor-service-width-z20 * @turning-circle-factor;
    }
    line-pattern-cap: round;
  }

  [int_tc_type = 'track'][zoom >= 15] {
    line-color: @track-fill;
    line-width: 6;
    [zoom >= 17] {
      line-width: 10;
    }
    line-cap: round;
  }

  [type = 'mini_roundabout']::circle {
    line-width: @mini-roundabout-width;
    line-cap: round;

    [int_tc_type = 'trunk'] { line-color: @trunk-casing; }
    [int_tc_type = 'primary'] { line-color: @primary-casing; }
    [int_tc_type = 'secondary'] { line-color: @secondary-casing; }
    [int_tc_type = 'tertiary'] { line-color: @tertiary-casing; }
    [int_tc_type = 'unclassified'],
    [int_tc_type = 'residential'] { line-color: @residential-casing; }
    [int_tc_type = 'living_street'] { line-color: @living-street-casing; }
    [int_tc_type = 'service'] { line-color: @service-casing; }
    [int_tc_type = 'track'] { line-color: @track-casing; }
  }
}

#highway-area-casing {
  [feature = 'highway_service'] {
    [zoom >= 14] {
      line-color: #999;
      line-width: 1;
    }
  }

  [feature = 'highway_footway'],
  [feature = 'highway_pedestrian'] {
    [zoom >= 15] {
      line-color: grey;
      line-width: 1;
    }
  }

  [feature = 'highway_platform'],
  [feature = 'railway_platform'] {
    [zoom >= 16] {
      line-color: grey;
      line-width: 2;
      line-cap: round;
      line-join: round;
    }
  }
}

#highway-area-fill {
  [feature = 'highway_living_street'][zoom >= 14] {
    polygon-fill: @living-street-fill;
    [int_surface = 'unpaved'] {
      polygon-pattern-file: url('symbols/unpaved/unpaved_living-street-fill.svg');
      polygon-pattern-alignment: global;
    }
  }

  [feature = 'highway_service'] {
    [zoom >= 14] {
      polygon-fill: #fff;
      [int_surface = 'unpaved'] {
        polygon-pattern-file: url('symbols/unpaved/unpaved_residential-fill.svg');
        polygon-pattern-alignment: global;
      }
    }
  }

  [feature = 'highway_footway'],
  [feature = 'highway_pedestrian'] {
    [zoom >= 15] {
      polygon-fill: @pedestrian-fill;
      [int_surface = 'unpaved'] {
        polygon-pattern-file: url('symbols/unpaved/unpaved_pedestrian-fill.svg');
        polygon-pattern-alignment: global;
      }
    }
  }

  [feature = 'highway_platform'],
  [feature = 'railway_platform'] {
    [zoom >= 16] {
      polygon-fill: @platform-fill;
      [int_surface = 'unpaved'] {
        polygon-pattern-file: url('symbols/unpaved/unpaved_platform-fill.svg');
        polygon-pattern-alignment: global;
      }
    }
  }

  [feature = 'aeroway_runway'][zoom >= 11] {
    polygon-fill: @runway-fill;
    [int_surface = 'unpaved'] {
      polygon-pattern-file: url('symbols/unpaved/unpaved_aeroway-fill.svg');
      polygon-pattern-alignment: global;
    }
  }

  [feature = 'aeroway_taxiway'][zoom >= 13] {
    polygon-fill: @taxiway-fill;
    [int_surface = 'unpaved'] {
      polygon-pattern-file: url('symbols/unpaved/unpaved_aeroway-fill.svg');
      polygon-pattern-alignment: global;
    }
  }

  [feature = 'aeroway_helipad'][zoom >= 16] {
    polygon-fill: @helipad-fill;
    [int_surface = 'unpaved'] {
      polygon-pattern-file: url('symbols/unpaved/unpaved_aeroway-fill.svg');
      polygon-pattern-alignment: global;
    }
  }
}

#junctions {
  [highway = 'motorway_junction'] {
    [zoom >= 11] {
      text-name: "[ref]";
      text-size: 10;
      text-fill: @junction-text-color;
      text-min-distance: 2;
      text-face-name: @oblique-fonts;
      text-halo-radius: @standard-halo-radius;
      text-wrap-character: ";";
      text-wrap-width: 2; // effectively break after every wrap character
      text-line-spacing: -1.5; // -0.15 em
      [zoom >= 13] {
        ["name" != null]["ref" = null] {
          text-name: "[name]";
        }
        ["name" != null]["ref" != null] {
          text-name: [name] + "\n" + [ref];
        }
      }
      [zoom >= 15] {
        text-size: 11;
        text-line-spacing: -1.65; // -0.15 em
      }
    }
  }

  [junction = 'yes'],
  [highway = 'traffic_signals'] {
    [zoom >= 15] {
      text-name: "[name]";
      text-size: 10;
      text-fill: black;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 30;  // 3.0 em
      text-line-spacing: -1.5; // -0.15 em
      text-min-distance: 2;
      [zoom >= 17] {
        text-size: 11;
        text-line-spacing: -1.65; // -0.15 em
        /* Offset name on traffic_signals on zoomlevels where they are displayed
        in order not to hide the text */
        [highway = 'traffic_signals'] {
          text-dy: 9;
        }
      }
    }
  }
}

#bridge-text  {
  [man_made = 'bridge'] {
    [zoom >= 12][way_pixels > 125][way_pixels <= 768000] {
      text-name: "[name]";
      text-size: 10;
      text-wrap-width: 30; // 3 em
      text-line-spacing: -1.2; // -0.15 em
      text-fill: black;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-margin: 3; // 0.3 em
      text-wrap-width: 30;
      [way_pixels > 250] {
        text-size: 11;
        text-margin: 3.3; // 0.3 em
        text-wrap-width: 33; // 3 em
        text-line-spacing: -1.35; // -0.15 em
        text-halo-radius: @standard-halo-radius * 1.1;
      }
      [way_pixels > 1000] {
        text-size: 12;
        text-margin: 3.6; // 0.3 em
        text-wrap-width: 36; // 3 em
        text-line-spacing: -1.65; // -0.15 em
        text-halo-radius: @standard-halo-radius * 1.2;
      }
      [way_pixels > 4000] {
        text-size: 13;
        text-margin: 3.9; // 0.3 em
        text-wrap-width: 39; // 3 em
        text-line-spacing: -1.80; // -0.15 em
        text-halo-radius: @standard-halo-radius * 1.3;
      }
      [way_pixels > 16000] {
        text-size: 14;
        text-margin: 4.2; // 0.3 em
        text-wrap-width: 42; // 3 em
        text-line-spacing: -1.95; // -0.15 em
        text-halo-radius: @standard-halo-radius * 1.4;
      }
    }
  }
}

#tunnels::fill,
#roads-fill::fill,
#bridges::fill {
  [int_access = 'restricted'] {
    [feature = 'highway_motorway'],
    [feature = 'highway_trunk'],
    [feature = 'highway_primary'],
    [feature = 'highway_secondary'],
    [feature = 'highway_tertiary'],
    [feature = 'highway_unclassified'],
    [feature = 'highway_residential'],
    [feature = 'highway_pedestrian'], 
    [feature = 'highway_living_street'] {
      [zoom >= 15] {
        access/line-color: @access-marking;
        [int_surface = 'unpaved'] {
          access/line-color: @access-marking-white-unpaved;
        }
        [feature = 'highway_primary'],
		[feature = 'highway_pedestrian'] {
          access/line-color: @access-marking-light;
        }
        [feature = 'highway_secondary'] {
          access/line-color: @access-marking-secondary;
        }
        [feature = 'highway_living_street'] {
          access/line-color: @access-marking-living-street;
        }
        access/line-join: round;
        access/line-cap: round;
        access/line-width: 3;
        access/line-dasharray: 0.1,9;
        [zoom >= 17] {
          access/line-width: 6;
          access/line-dasharray: 0.1,12;
        }
      }
    }
    [feature = 'highway_road'],
    [feature = 'highway_service'][service = 'INT-normal'] {
      [zoom >= 16] {
        access/line-color: @access-marking;
        [int_surface = 'unpaved'] {
          access/line-color: @access-marking-white-unpaved;
        }
        [feature = 'highway_road'] {
          access/line-color: @access-marking-light;
        }
        access/line-join: round;
        access/line-cap: round;
        access/line-width: 2;
        access/line-dasharray: 0.1,4;
        [zoom >= 17] {
          access/line-width: 4;
          access/line-dasharray: 0.1,9;
        }
      }
    }
    [feature = 'highway_service'][service = 'INT-minor'] {
      [zoom >= 17] {
        access/line-color: @access-marking;
        [int_surface = 'unpaved'] {
          access/line-color: @access-marking-white-unpaved;
        }
        access/line-join: round;
        access/line-cap: round;
        access/line-width: 1;
        access/line-dasharray: 0.1,4;
        [zoom >= 17] {
          access/line-width: 2;
        }
      }
    }
  }
  [int_access = 'no'] {
    [feature = 'highway_motorway'],
    [feature = 'highway_trunk'],
    [feature = 'highway_primary'],
    [feature = 'highway_secondary'],
    [feature = 'highway_tertiary'],
    [feature = 'highway_unclassified'],
    [feature = 'highway_residential'],
    [feature = 'highway_pedestrian'], 
    [feature = 'highway_living_street'] {
      [zoom >= 15] {
        access/line-color: @access-marking;
        [feature = 'highway_tertiary'],
        [feature = 'highway_unclassified'],
        [feature = 'highway_residential'] {
          [int_surface = 'unpaved'] {
            access/line-color: @access-marking-white-unpaved;
          }
        }
        [feature = 'highway_primary'],
		[feature = 'highway_pedestrian'] {
          access/line-color: @access-marking-light;
        }
        [feature = 'highway_secondary'] {
          access/line-color: @access-marking-secondary;
        }
        [feature = 'highway_living_street'] {
          access/line-color: @access-marking-living-street;
        }
        access/line-join: round;
        access/line-cap: round;
        access/line-width: 2;
        access/line-dasharray: 6,6;
        [zoom >= 17] {
          access/line-width: 6;
          access/line-dasharray: 10,12;
        }
      }
    }
    [feature = 'highway_road'],
    [feature = 'highway_service'][service = 'INT-normal'] {
      [zoom >= 16] {
        access/line-color: @access-marking;
        [int_surface = 'unpaved'] {
          access/line-color: @access-marking-white-unpaved;
        }
        [feature = 'highway_road'] {
          access/line-color: @access-marking-light;
        }
        access/line-join: round;
        access/line-cap: round;
        access/line-width: 2;
        access/line-dasharray: 6,8;
        [zoom >= 17] {
          access/line-width: 3;
          access/line-dasharray: 8,10;
        }
      }
    }
    [feature = 'highway_service'][service = 'INT-minor'][zoom >= 17] {
      access/line-color: @access-marking;
        [int_surface = 'unpaved'] {
          access/line-color: @access-marking-white-unpaved;
        }
      access/line-join: round;
      access/line-cap: round;
      access/line-width: 1;
      access/line-dasharray: 6,8;
      [zoom >= 17] {
        access/line-width: 2;
      }
    }
  }
}

#aeroways {
  [aeroway = 'runway'] {
    [zoom >= 11] {
      ::casing[bridge = true][zoom >= 14] {
        line-width: 12 + 2*@major-casing-width-z14;
        line-color: @bridge-casing;
        line-join: round;
        [zoom >= 15] { line-width: 18 + 2*@major-casing-width-z15; }
        [zoom >= 16] { line-width: 24 + 2*@major-casing-width-z16; }
        [zoom >= 17] { line-width: 24 + 2*@major-casing-width-z17; }
        [zoom >= 18] { line-width: 24 + 2*@major-casing-width-z18; }
      }
      ::fill {
        [int_surface != 'unpaved'] {
          line-color: @runway-fill;
          line-width: 2;
          [zoom >= 12] { line-width: 4; }
          [zoom >= 13] { line-width: 6; }
          [zoom >= 14] { line-width: 12; }
          [zoom >= 15] { line-width: 18; }
          [zoom >= 16] { line-width: 24; }
        }
        [int_surface = 'unpaved'] {
          line-pattern-type: repeat;
          line-pattern-alignment: global;
          line-pattern-file: url("symbols/unpaved/unpaved_aeroway-fill.svg"); 
          line-pattern-width: 2;
          [zoom >= 12] { line-pattern-width: 4; }
          [zoom >= 13] { line-pattern-width: 6; }
          [zoom >= 14] { line-pattern-width: 12; }
          [zoom >= 15] { line-pattern-width: 18; }
          [zoom >= 16] { line-pattern-width: 24; }
        }
      }
    }
  }
  [aeroway = 'taxiway'] {
    [zoom >= 11] {
      ::casing[bridge = true][zoom >= 14] {
        line-width: 4 + 2*@secondary-casing-width-z14;
        line-color: @bridge-casing;
        line-join: round;
        [zoom >= 15] { line-width: 6 + 2*@secondary-casing-width-z15; }
        [zoom >= 16] { line-width: 8 + 2*@secondary-casing-width-z16; }
        [zoom >= 17] { line-width: 8 + 2*@secondary-casing-width-z17; }
        [zoom >= 18] { line-width: 8 + 2*@secondary-casing-width-z18; }
      }
      ::fill {
        [int_surface != 'unpaved'] {
          line-color: @taxiway-fill ;
          line-width: 1;
          [zoom >= 13] { line-width: 2; }
          [zoom >= 14] { line-width: 4; }
          [zoom >= 15] { line-width: 6; }
          [zoom >= 16] { line-width: 8; }
        }
        [int_surface = 'unpaved'] {
          line-pattern-type: repeat;
          line-pattern-alignment: global;
          line-pattern-file: url("symbols/unpaved/unpaved_aeroway-fill.svg"); 
          line-pattern-width: 1;
          [zoom >= 13] { line-pattern-width: 2; }
          [zoom >= 14] { line-pattern-width: 4; }
          [zoom >= 15] { line-pattern-width: 6; }
          [zoom >= 16] { line-pattern-width: 8; }
        }
      }
    }
  }
}

#roads-text-ref-low-zoom[zoom < 13] {
  [highway = 'motorway'][zoom >= 10],
  [highway = 'trunk'][zoom >= 11],
  [highway = 'primary'][zoom >= 11],
  [highway = 'secondary'][zoom >= 12] {
    shield-name: "[refs]";
    shield-size: @shield-size;
    shield-line-spacing: @shield-line-spacing;
    shield-placement: line;
    shield-spacing: @shield-spacing;
    shield-repeat-distance: @shield-repeat-distance;
    shield-margin: @shield-margin;
    shield-face-name: @shield-font;
    shield-clip: @shield-clip;

    [highway = 'motorway'] {
      shield-fill: @motorway-shield;
      shield-file: url("symbols/shields/motorway_[width]x[height].svg");
    }

    [highway = 'trunk'] {
      shield-fill: @trunk-shield;
      shield-file: url("symbols/shields/trunk_[width]x[height].svg");
    }

    [highway = 'primary'] {
      shield-fill: @primary-shield;
      shield-file: url("symbols/shields/primary_[width]x[height].svg");
    }

    [highway = 'secondary'] {
      shield-fill: @secondary-shield;
      shield-file: url("symbols/shields/secondary_[width]x[height].svg");
    }
  }
}

#roads-text-ref {
  [highway = 'motorway'],
  [highway = 'trunk'],
  [highway = 'primary'],
  [highway = 'secondary'],
  [highway = 'tertiary'] {
    [zoom >= 13] {
      shield-name: "[refs]";
      shield-size: @shield-size;
      shield-line-spacing: @shield-line-spacing;

      [zoom >= 16] {
        shield-size: @shield-size-z16;
        shield-line-spacing: @shield-line-spacing-z16;
      }
      [zoom >= 18] {
        shield-size: @shield-size-z18;
        shield-line-spacing: @shield-line-spacing-z18;
      }

      shield-placement: line;
      shield-spacing: @shield-spacing;
      shield-repeat-distance: @shield-repeat-distance;
      shield-margin: @shield-margin;
      shield-face-name: @shield-font;
      shield-clip: @shield-clip;

      [highway = 'motorway'] {
        shield-fill: @motorway-shield;
        shield-file: url("symbols/shields/motorway_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/motorway_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/motorway_[width]x[height]_z18.svg");
        }
      }
      [highway = 'trunk'] {
        shield-fill: @trunk-shield;
        shield-file: url("symbols/shields/trunk_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/trunk_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/trunk_[width]x[height]_z18.svg");
        }
      }
      [highway = 'primary'] {
        shield-fill: @primary-shield;
        shield-file: url("symbols/shields/primary_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/primary_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/primary_[width]x[height]_z18.svg");
        }
      }
      [highway = 'secondary'] {
        shield-fill: @secondary-shield;
        shield-file: url("symbols/shields/secondary_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/secondary_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/secondary_[width]x[height]_z18.svg");
        }
      }
      [highway = 'tertiary'] {
        shield-fill: @tertiary-shield;
        shield-file: url("symbols/shields/tertiary_[width]x[height].svg");

        [zoom >= 16] {
          shield-file: url("symbols/shields/tertiary_[width]x[height]_z16.svg");
        }
        [zoom >= 18] {
          shield-file: url("symbols/shields/tertiary_[width]x[height]_z18.svg");
        }
      }
    }
  }
  [highway = 'runway'],
  [highway = 'taxiway'] {
    [zoom >= 15] {
      text-name: "[refs]";
      text-size: 10;
      text-fill: #333;
      text-spacing: 750;
      text-clip: false;
      text-placement: line;
      text-face-name: @oblique-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-repeat-distance: @minor-highway-text-repeat-distance;
    }
  }
}

#roads-text-ref-minor {
  [highway = 'unclassified'],
  [highway = 'residential'] {
    [zoom >= 15] {
      text-name: "[refs]";
      text-size: 8;

      [zoom >= 16] {
        text-size: 9;
      }
      [zoom >= 17] {
        text-size: 11;
      }

      text-fill: #000;
      text-face-name: @oblique-fonts;
      text-placement: line;
      text-repeat-distance: @major-highway-text-repeat-distance;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-spacing: 760;
      text-clip: false;
    }
  }

  [highway = 'track'] {
    [zoom >= 15] {
      text-name: "[refs]";
      text-size: 8;
      text-dy: 5;

      [zoom >= 16] {
        text-size: 9;
        text-dy: 7;
      }
      [zoom >= 17] {
        text-size: 11;
        text-dy: 9;
      }

      text-clip: false;
      text-fill: #222;
      text-face-name: @oblique-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-margin: 10;
      text-placement: line;
      text-spacing: 760;
      text-repeat-distance: @major-highway-text-repeat-distance;
      text-vertical-alignment: middle;
    }
  }
}

#roads-text-name {
  [highway = 'motorway'],
  [highway = 'trunk'],
  [highway = 'primary'],
  [highway = 'construction'][construction = 'motorway'],
  [highway = 'construction'][construction = 'trunk'],
  [highway = 'construction'][construction = 'primary'] {
    [zoom >= 13] {
      text-name: "[name]";
      text-size: 8;
      text-fill: black;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-repeat-distance: @major-highway-text-repeat-distance;
      [tunnel = 'no'] {
        text-halo-radius: @standard-halo-radius;
        [highway = 'motorway'] { text-halo-fill: @motorway-fill; }
        [highway = 'trunk'] { text-halo-fill: @trunk-fill; }
        [highway = 'primary'] { text-halo-fill: @primary-fill; }
      }
    }
    [zoom >= 14] {
      text-size: 9;
    }
    [zoom >= 15] {
      text-size: 10;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
  [highway = 'secondary'],
  [highway = 'construction'][construction = 'secondary'] {
    [zoom >= 13] {
      text-name: "[name]";
      text-size: 8;
      text-fill: black;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @secondary-fill;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 14] {
      text-size: 9;
    }
    [zoom >= 15] {
      text-size: 10;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
  [highway = 'tertiary'],
  [highway = 'construction'][construction = 'tertiary'] {
    [zoom >= 14] {
      text-name: "[name]";
      text-size: 9;
      text-fill: black;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @tertiary-fill;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
  [highway = 'construction'][construction = null][zoom >= 16] {
    text-name: "[name]";
    text-size: 9;
    text-fill: black;
    text-spacing: 300;
    text-clip: false;
    text-placement: line;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-face-name: @book-fonts;
    text-repeat-distance: @major-highway-text-repeat-distance;

    [zoom >= 17] {
      text-size: 11;
      text-spacing: 400;
    }
    [zoom >= 19] {
      text-size: 12;
      text-spacing: 400;
    }
  }
  [highway = 'residential'],
  [highway = 'unclassified'],
  [highway = 'road'],
  [highway = 'construction'][construction = null],
  [highway = 'construction'][construction = 'residential'],
  [highway = 'construction'][construction = 'unclassified'],
  [highway = 'construction'][construction = 'road'] {
    [zoom >= 15] {
      text-name: "[name]";
      text-size: 8;
      text-fill: black;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @residential-fill;
      text-face-name: @book-fonts;
      text-repeat-distance: @minor-highway-text-repeat-distance;
      [highway = 'unclassified'] { text-repeat-distance: @major-highway-text-repeat-distance;}
    }
    [zoom >= 16] {
      text-size: 9;
    }
    [zoom >= 17] {
      text-size: 11;
      text-spacing: 400;
    }
    [zoom >= 19] {
      text-size: 12;
      text-spacing: 400;
    }
  }

  [highway = 'raceway'],
  [highway = 'service'],
  [highway = 'construction'][construction = 'raceway'],
  [highway = 'construction'][construction = 'service'][zoom >= 17] {
    [zoom >= 16] {
      text-name: "[name]";
      text-size: 9;
      text-fill: black;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      [highway = 'raceway'] { text-halo-fill: @raceway-fill; }
      [highway = 'service'] { text-halo-fill: @service-fill; }
      text-face-name: @book-fonts;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 17] {
      text-size: 11;
    }
  }

  [highway = 'living_street'],
  [highway = 'pedestrian'],
  [highway = 'construction'][construction = 'living_street'][zoom >= 16],
  [highway = 'construction'][construction = 'pedestrian'][zoom >= 16] {
    [zoom >= 15] {
      text-name: "[name]";
      text-size: 8;
      text-fill: black;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-halo-radius: @standard-halo-radius;
      [highway = 'living_street'] {
        text-halo-fill: @living-street-fill;
        text-repeat-distance: @major-highway-text-repeat-distance;
      }
      [highway = 'pedestrian'] { text-halo-fill: @pedestrian-fill; }
      text-face-name: @book-fonts;
      text-repeat-distance: @minor-highway-text-repeat-distance;
    }
    [zoom >= 16] {
      text-size: 9;
    }
    [zoom >= 17] {
      text-size: 11;
    }
    [zoom >= 19] {
      text-size: 12;
    }
  }
}

#roads-area-text-name {
  [way_pixels > 3000],
  [zoom >= 17] {
    text-name: "[name]";
    text-size: 11;
    text-face-name: @book-fonts;
    text-wrap-width: 30; // 2.7 em
    text-line-spacing: -1.7; // -0.15 em
  }
}

#paths-text-name {
  [highway = 'track'],
  [highway = 'construction'][construction = 'track'][zoom >= 16] {
    [zoom >= 15] {
      text-name: "[name]";
      text-fill: #222;
      text-size: 8;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-vertical-alignment: middle;
      text-dy: 5;
      text-repeat-distance: @major-highway-text-repeat-distance;
    }
    [zoom >= 16] {
      text-size: 9;
      text-dy: 7;
    }
    [zoom >= 17] {
      text-size: 11;
      text-dy: 9;
    }
  }

  [highway = 'bridleway'],
  [highway = 'footway'],
  [highway = 'cycleway'],
  [highway = 'path'],
  [highway = 'steps'],
  [highway = 'construction'][construction = 'bridleway'],
  [highway = 'construction'][construction = 'footway'],
  [highway = 'construction'][construction = 'cycleway'],
  [highway = 'construction'][construction = 'path'],
  [highway = 'construction'][construction = 'steps'] {
    [zoom >= 16] {
      text-name: "[name]";
      text-fill: #222;
      text-size: 9;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-spacing: 300;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-vertical-alignment: middle;
      text-dy: 7;
      text-repeat-distance: @major-highway-text-repeat-distance;
      [highway = 'steps'] { text-repeat-distance: @minor-highway-text-repeat-distance; }
    }
    [zoom >= 17] {
      text-size: 11;
      text-dy: 9;
    }
  }
}

#roads-text-name::directions,
#paths-text-name::directions {
  [zoom >= 16] {
    // intentionally omitting highway_platform, highway_construction
    [highway = 'motorway'],
    [highway = 'motorway_link'],
    [highway = 'trunk'],
    [highway = 'trunk_link'],
    [highway = 'primary'],
    [highway = 'primary_link'],
    [highway = 'secondary'],
    [highway = 'secondary_link'],
    [highway = 'tertiary'],
    [highway = 'tertiary_link'],
    [highway = 'residential'],
    [highway = 'unclassified'],
    [highway = 'living_street'],
    [highway = 'bus_guideway'],
    [highway = 'road'],
    [highway = 'service'],
    [highway = 'pedestrian'],
    [highway = 'raceway'] {
      [oneway != null] {
        marker-placement: line;
        marker-spacing: 180;
        marker-max-error: 0.5;
        marker-file: url('symbols/oneway.svg');
        [oneway = '-1'] {
          marker-file: url('symbols/oneway-reverse.svg');
        }

        [highway = 'motorway'],
        [highway = 'motorway_link'] {
          marker-fill: @motorway-oneway-arrow-color;
        }
        [highway = 'trunk'],
        [highway = 'trunk_link'] {
          marker-fill: @trunk-oneway-arrow-color;
        }
        [highway = 'primary'],
        [highway = 'primary_link'] {
          marker-fill: @primary-oneway-arrow-color;
        }
        [highway = 'secondary'],
        [highway = 'secondary_link'] {
          marker-fill: @secondary-oneway-arrow-color;
        }
        [highway = 'tertiary'],
        [highway = 'tertiary_link'] {
          marker-fill: @tertiary-oneway-arrow-color;
        }
        [highway = 'residential'],
        [highway = 'unclassified'],
        [highway = 'road'],
        [highway = 'service'] {
          marker-fill: @residential-oneway-arrow-color;
        }
        [highway = 'bus_guideway'] {
          marker-fill: @bus-guideway-oneway-arrow-color;
          marker-offset: 7;
        }
        [highway = 'living_street'] {
          marker-fill: @living-street-oneway-arrow-color;
        }
        [highway = 'pedestrian'] {
          marker-fill: @pedestrian-oneway-arrow-color;
        }
        [highway = 'raceway'] {
          marker-fill: @raceway-oneway-arrow-color;
        }
      }
    }

    [highway = 'steps'],
    [highway = 'cycleway'],
    [highway = 'footway'],
    [highway = 'path'],
    [highway = 'track'],
    [highway = 'bridleway'] {
      [oneway != null] {
        text-name: "'🠖'";
        text-size: 15;
        text-clip: false;
        text-spacing: 180;
        text-placement: line;
        text-halo-fill: @standard-halo-fill;
        text-halo-radius: 1.5;
        text-margin: 2;
        text-dy: 3;
        text-upright: right;
        text-vertical-alignment: middle;
        text-face-name: @book-fonts;
        [oneway = '-1'] {
          text-upright: left;
          text-dy: -3;
        }
        [highway = 'path'],
        [highway = 'footway'] {
          text-fill: @footway-oneway-arrow-color;
        }
        [highway = 'steps'] {
          text-fill: @steps-oneway-arrow-color;
        }
        [highway = 'cycleway'] {
          text-fill: @cycleway-oneway-arrow-color;
        }
        [highway = 'track'] {
          text-fill: @track-oneway-arrow-color;
        }
        [highway = 'bridleway'] {
          text-fill: @bridleway-oneway-arrow-color;
        }
      }
    }
  }
}

#railways-text-name {
  /* Mostly started from z17. */
  [railway = 'rail'],
  [railway = 'subway'],
  [railway = 'narrow_gauge'],
  [railway = 'light_rail'],
  [railway = 'funicular'],
  [railway = 'monorail'],
  [railway = 'tram'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-fill: #666666;
      text-size: 10;
      text-dy: 6;
      text-spacing: 900;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-repeat-distance: @railway-text-repeat-distance;
    }
    [zoom >= 19] {
      text-size: 11;
      text-dy: 7;
    }
  }
  [railway = 'rail'] {
    /* Render highspeed rails from z11,
       other main routes at z14. */
    [highspeed = 'yes'] {
      [zoom >= 11] {
        text-name: "[name]";
        text-fill: #666666;
        text-size: 10;
        text-dy: 3;
        text-spacing: 300;
        text-clip: false;
        text-placement: line;
        text-face-name: @book-fonts;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
        text-repeat-distance: @railway-text-repeat-distance;
      }
      [zoom >= 13] {
        text-dy: 6;
      }
      [zoom >= 14] {
        text-spacing: 600;
      }
      [zoom >= 17] {
        text-size: 11;
        text-dy: 7;
      }
      [zoom >= 19] {
        text-size: 12;
        text-dy: 8;
      }
    }
    [highspeed != 'yes'][usage = 'main'] {
      [zoom >= 14] {
        text-name: "[name]";
        text-fill: #666666;
        text-size: 10;
        text-dy: 6;
        text-spacing: 300;
        text-clip: false;
        text-placement: line;
        text-face-name: @book-fonts;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
        text-repeat-distance: @railway-text-repeat-distance;
      }
      [zoom >= 17] {
        text-spacing: 600;
        text-size: 11;
        text-dy: 7;
      }
      [zoom >= 19] {
        text-size: 12;
        text-dy: 8;
      }
    }
  }

  /*
  Other minor railway styles. For service rails, see:
  https://github.com/gravitystorm/openstreetmap-carto/pull/2687
  */
  [railway = 'miniature'],
  [railway = 'disused'],
  [railway = 'construction'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-fill: #666666;
      text-size: 10;
      text-dy: 6;
      text-spacing: 900;
      text-clip: false;
      text-placement: line;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-repeat-distance: @railway-text-repeat-distance;
    }
    [zoom >= 19] {
      text-size: 11;
      text-dy: 7;
    }
  }
}
