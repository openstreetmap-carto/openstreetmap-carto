#aerialways {
  [aerialway = 'cable_car'],
  [aerialway = 'gondola'],
  [aerialway = 'mixed_lift'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #808080;

      dash/line-width: 3;
      dash/line-join: round;
      dash/line-cap: round;
      dash/line-color: black;
      dash/line-dasharray: 0.4,13;
      dash/line-clip: false;
    }
  }

  [aerialway = 'goods'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #808080;

      dash/line-width: 3.5;
      dash/line-join: round;
      dash/line-color: #707070;
      dash/line-dasharray: 6,25;
      dash/line-clip: false;
    }
  }

  [aerialway = 'chair_lift'],
  [aerialway = 'drag_lift'],
  [aerialway = 't-bar'],
  [aerialway = 'j-bar'],
  [aerialway = 'platter'],
  [aerialway = 'rope_tow'],
  [aerialway = 'zip_line'] {
    [zoom >= 12] {
      line/line-width: 1;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #808080;

      dash/line-width: 4;
      dash/line-join: round;
      dash/line-color: black;
      dash/line-dasharray: 1,30;
      dash/line-clip: false;
    }
  }

  [man_made = 'goods_conveyor'] {
    [zoom >= 14] {
      line/line-width: 0.7;
      line/line-join: round;
      line/line-cap: round;
      line/line-color: #999999;

      dash/line-width: 2;
      dash/line-join: round;
      dash/line-color: #999999;
      dash/line-dasharray: 4,6;

      [zoom >= 16] {
        line/line-width: 1;
        dash/line-width: 3;
        dash/line-dasharray: 6,6;
      }
    }
  }

  [man_made = 'pipeline'] {
    [zoom >= 14] {
      line/line-width: .7;
      line/line-join: round;
      line/line-color: #909090;
      line/line-dasharray: 0,.7,14,.7;
      dash/line-width: 2;
      dash/line-join: round;
      dash/line-color: #909090;
      dash/line-dasharray: 0,.7,.7,12.6,.7,.7;
      [zoom >= 15] {
        line/line-width: 1;
        line/line-dasharray: 0,.7,16,.7;
        dash/line-width: 2.5;
        dash/line-dasharray: 0,.7,.7,14.6,.7,.7;
      }
      [zoom >= 16] {
        line/line-width: 1.5;
        line/line-dasharray: 0,1,20,1;
        dash/line-width: 3;
        dash/line-dasharray: 0,1,1,18,1,1;
      }
      [zoom >= 17] {
        line/line-width: 2;
        line/line-dasharray: 0,1,24,1;
        dash/line-width: 4;
        dash/line-dasharray: 0,1,1,22,1,1;
        center/line-width: 1;
        center/line-dasharray: 0,2,22,2;
        center/line-color: @land-color;
        center/line-join: round;
        [substance = 'water'] { center/line-color: @water-color; }
        [substance = 'gas'] { center/line-color: #c1c1c1; } // Lch(78,0,0)
        [substance = 'oil'] { center/line-color: #cfbfa5; } // Lch(78,15,83)
      }
      [zoom >= 18] {
        line/line-width: 3;
        line/line-dasharray: 0,1,30,1;
        dash/line-width: 5;
        dash/line-dasharray: 0,1,1,28,1,1;
        center/line-width: 2;
        center/line-dasharray: 0,2,28,2;
      }
      [zoom >= 19] {
        line/line-width: 4;
        line/line-dasharray: 0,1,36,1;
        dash/line-width: 6;
        dash/line-dasharray: 0,1,1,34,1,1;
        center/line-width: 3;
        center/line-dasharray: 0,2,34,2;
      }
    }
  }
}

#text-line {
  [feature = 'aerialway_cable_car'],
  [feature = 'aerialway_gondola'],
  [feature = 'aerialway_mixed_lift'],
  [feature = 'aerialway_goods'],
  [feature = 'aerialway_chair_lift'],
  [feature = 'aerialway_drag_lift'],
  [feature = 'aerialway_t-bar'],
  [feature = 'aerialway_j-bar'],
  [feature = 'aerialway_platter'],
  [feature = 'aerialway_rope_tow'],
  [feature = 'aerialway_zip_line'],
  [feature = 'man_made_pipeline'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-fill: #666666;
      text-size: 10;
      text-dy: 4;
      text-spacing: 900;
      text-clip: false;
      text-placement: line;
      text-repeat-distance: 200;
      text-margin: 18;
      text-face-name: @book-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [zoom >= 19] {
        text-size: 11;
        text-dy: 5;
      }
      [feature = 'man_made_pipeline'] {
        text-dy: 6;
        [zoom >= 18] { text-dy: 7; }
        [zoom >= 19] { text-dy: 8; }
      }
    }
  }
}
