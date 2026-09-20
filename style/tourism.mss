/* For tourism features like roller coasters */

@roller-coaster-casing: #707070;
@roller-coaster-fill: #ddd;

/* The purpose of “roller-coaster-gap-fill” layer is to fill in the gaps between sections of roller coaster track. */
#roller-coaster-gap-fill[zoom >= 15] {
  ::bridges { line-cap: round; }
  ::casing { line-cap: round; }
  ::fill { line-cap: round; }
}

#roller-coaster, #roller-coaster-gap-fill {
  [zoom >= 15] {
    /* The widths come from the roller_coaster class of carto_line_widths() in
       functions.sql: the casing is drawn at [line_width], the fill at half of it. */
    ::bridges[bridge = 'yes'][zoom >= 16] {
      line-width: [line_width] + [bridge_casing_width];
      line-color: #000;
      line-join: round;
      
      [tunnel = 'yes'] { line-color: lighten(#000, 20%); }

      [zoom >= 18] { line-width: [line_width] + 1.5 * [bridge_casing_width]; }
      [zoom >= 19] { line-width: [line_width] + 2 * [bridge_casing_width]; }
    }

    ::casing {
      line-width: [line_width];
      line-color: mix(@roller-coaster-casing, @roller-coaster-fill, 50%);
      line-join: round;

      [tunnel = 'yes'][zoom >= 16] {
        line-color: lighten(@roller-coaster-casing, 20%);
      }
      [zoom >= 16] { 
        line-color: @roller-coaster-casing;
      }
    }

    ::fill[zoom >= 16] {
      line-width: [line_width] / 2;
      line-color: @roller-coaster-fill;
      line-join: round;

      [tunnel = 'yes'] {
        line-color: lighten(@roller-coaster-fill, 5%);
      }
    }
  }
}

#roller-coaster::fill[zoom >= 16] {
  line-dasharray: 2.5,0.5;
  [zoom >= 17] { line-dasharray: 4,0.8; }
  [zoom >= 18] { line-dasharray: 6,1.2; }
  [zoom >= 19] { line-dasharray: 8,1.6; }
  [zoom >= 20] { line-dasharray: 12,2.4; }
}
