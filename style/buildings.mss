@building-fill: #d9d0c9;  // Lch(84, 5, 68)
@building-line: darken(@building-fill, 15%);  // Lch(70, 9, 66)
@building-low-zoom: darken(@building-fill, 4%);

@building-major-fill: darken(@building-fill, 10%);  // Lch(75, 8, 67)
@building-major-line: darken(@building-major-fill, 15%);  // Lch(61, 13, 65)
@building-major-z15: darken(@building-major-fill, 5%);  // Lch(70, 9, 66)
@building-major-z14: darken(@building-major-fill, 10%);  // Lch(66, 11, 65)

@entrance-permissive: darken(@building-line, 15%);
@entrance-normal: @building-line;

#buildings {
  [zoom >= 14] {
    polygon-fill: @building-low-zoom;
    polygon-clip: false;
    [zoom >= 15] {
      polygon-fill: @building-fill;
      line-color: @building-line;
      line-width: .75;
      line-clip: false;
    }
    [amenity = 'place_of_worship'],
    [aeroway = 'terminal'],
    [aerialway = 'station'],
    [building = 'train_station'],
    [public_transport = 'station'] {
      polygon-fill: @building-major-z14;
      [zoom >= 15] {
        polygon-fill: @building-major-z15;
        line-color: @building-major-line;
        [zoom >= 16] {
          polygon-fill: @building-major-fill;
        }
      }
    }
  }
}

#bridge {
  [zoom >= 12] {
    polygon-fill: #B8B8B8;
  }
}

#entrances {
  [zoom >= 18]["entrance" != null]  {
    marker-fill: @entrance-normal;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    marker-file: url('symbols/rect.svg');
    marker-width: 5.0;
    marker-height: 5.0;
    marker-opacity: 0.0;
    ["entrance" = 'main'] {
      marker-opacity: 1.0;
      marker-file: url('symbols/square.svg');
    }
  }
  [zoom >= 19]["entrance" != null] {
    ["entrance" = 'yes'],
    ["entrance" = 'main'],
    ["entrance" = 'home'],
    ["entrance" = 'service'],
    ["entrance" = 'staircase'] {
      marker-opacity: 1.0;
      marker-width: 6.0;
      marker-height: 6.0;
      ["entrance" = 'service'] {
        marker-file: url('symbols/corners.svg');
      }
    }
    ["access" = 'yes'],
    ["access" = 'permissive'] {
      marker-fill: @entrance-permissive;
    }
    ["access" = 'no'] {
      marker-fill: @entrance-normal;
      marker-file: url('symbols/rectdiag.svg');
    }
  }
  [zoom >= 20]["entrance" != null] {
    marker-width: 8.0;
    marker-height: 8.0;
  }
}
