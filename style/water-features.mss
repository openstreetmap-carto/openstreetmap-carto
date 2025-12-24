@breakwater-color: #aaa; /* Also for groyne */
@dam: #adadad;
@dam-line: #444444;
@weir-line: #aaa;
@lock-gate: #aaa;
@lock-gate-line: #aaa;

#water-barriers-point, #water-barriers-line, #water-barriers-poly {
  [waterway = 'dam'] {
    #water-barriers-poly[zoom >= 13] {
      line-width: 2;
      line-color: @dam-line;
      line-join: round;
      line-cap: round;
      polygon-fill: @dam;
    }
    #water-barriers-line[zoom >= 13] {
      line-width: 2;
      line-color: @dam-line;
      line-join: round;
      line-cap: round;
    }
    #water-barriers-point[zoom >= 17] {
      marker-fill: @dam;
      marker-line-color: @dam-line;
      marker-line-width: 1;
      marker-width: 8;
      [zoom >= 18] { marker-width: 10; }
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }

  [waterway = 'weir'] {
    #water-barriers-line[zoom >= 13] {
      line-color: @weir-line;
      line-width: 2;
      line-dasharray: 2,2;
    }
    #water-barriers-point[zoom >= 17] {
      marker-fill: @water-color;
      marker-line-color: @weir-line;
      marker-line-width: 1;
      marker-width: 8;
      [zoom >= 18] { marker-width: 10; }
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }

  [waterway = 'lock_gate'] {
    #water-barriers-line[zoom >= 13] {
      line-color: @lock-gate-line;
      line-width: 2;
    }
    #water-barriers-point[zoom >= 17] {
      marker-fill: @lock-gate;
      marker-line-width: 0;
      marker-width: 8;
      [zoom >= 18] { marker-width: 10; }
      marker-allow-overlap: true;
      marker-ignore-placement: true;
    }
  }
}

#piers-poly, #piers-line {
  [man_made = 'pier'][zoom >= 12] {
    #piers-poly {
      polygon-fill: @land-color;
    }
    #piers-line {
      line-width: 0.5;
      line-color: @land-color;
      line-cap: square;
      [zoom >= 13] { line-width: 1; }
      [zoom >= 15] { line-width: 2; }
      [zoom >= 17] { line-width: 4; }
    }
  }

  [man_made = 'breakwater'][zoom >= 12],
  [man_made = 'groyne'][zoom >= 12] {
    #piers-poly {
      polygon-fill: @breakwater-color;
    }
    #piers-line {
      line-width: 1;
      line-color: @breakwater-color;
      [zoom >= 13] { line-width: 2; }
      [zoom >= 16] { line-width: 4; }
    }
  }
}

#marinas-area {
  [zoom >= 14] {
    a/line-width: 1;
    a/line-offset: -0.5;
    a/line-color: blue;
    a/line-opacity: 0.1;
    a/line-join: round;
    a/line-cap: round;
    b/line-width: 3;
    b/line-offset: -1.5;
    b/line-color: blue;
    b/line-opacity: 0.1;
    b/line-join: round;
    b/line-cap: round;
    [zoom >= 17] {
      a/line-width: 2;
      a/line-offset: -1;
      b/line-width: 6;
      b/line-offset: -3;
    }
  }
}

#text-point,
#text-line {
  [feature = 'waterway_dam'],
  [feature = 'waterway_weir'] {
    #text-point[zoom >= 15],
    #text-line[zoom >= 15] {
      text-name: "[name]";
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-fill: #222;
      text-size: 10;
      text-face-name: @book-fonts;
      #text-line {
        text-placement: line;
        text-dy: 8;
        text-spacing: 400;
      }
      #text-point {
        text-placement: point;
        text-dy: 8;
      }
    }
  }

  [feature = 'man_made_breakwater'][zoom >= 15],
  [feature = 'man_made_groyne'][zoom >= 15],
  [feature = 'man_made_pier'][zoom >= 15] {
    #text-point,
    #text-line {
      text-name: "[name]";
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-fill: #222;
      text-size: 10;
      text-face-name: @book-fonts;
      #text-line {
        text-placement: line;
        text-spacing: 400;
      }
    }
  }
}
