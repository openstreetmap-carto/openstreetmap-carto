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
    ::bridges[bridge = 'yes'][zoom >= 16] {
      line-width: 2.5 + @bridge-casing-width-z16;
      line-color: #000;
      line-join: round;
      
      [tunnel = 'yes'] { line-color: lighten(#000, 20%); }

      [zoom >= 17] { line-width: 4 + @bridge-casing-width-z17; }
      [zoom >= 18] { line-width: 6 + 1.5 * @bridge-casing-width-z18; }
      [zoom >= 19] { line-width: 8 + 2 * @bridge-casing-width-z19; }
      [zoom >= 20] { line-width: 12 + 2 * @bridge-casing-width-z20; }
    }

    ::casing {
      line-width: 1;
      line-color: mix(@roller-coaster-casing, @roller-coaster-fill, 50%);
      line-join: round;

      [tunnel = 'yes'][zoom >= 16] {
        line-color: lighten(@roller-coaster-casing, 20%);
      }
      [zoom >= 16] { 
        line-color: @roller-coaster-casing;
        line-width: 2.5;
      }
      [zoom >= 17] { line-width: 4; }
      [zoom >= 18] { line-width: 6; }
      [zoom >= 19] { line-width: 8; }
      [zoom >= 20] { line-width: 12; }
    }

    ::fill[zoom >= 16] {
      line-width: 1.25;
      line-color: @roller-coaster-fill;
      line-join: round;

      [tunnel = 'yes'] {
        line-color: lighten(@roller-coaster-fill, 5%);
      }
      [zoom >= 17] { line-width: 2; }
      [zoom >= 18] { line-width: 3; }
      [zoom >= 19] { line-width: 4; }
      [zoom >= 20] { line-width: 6; }
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
