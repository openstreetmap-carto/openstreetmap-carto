-- This is generated code; do not change this file manually.
-- To change the line widths, edit line-widths.yaml and run:
--   scripts/generate_line_widths.py > line-widths.sql
-- and load it again with psql -d gis -f line-widths.sql
--
-- Widths of the lines, in pixels (for roads including the casing)
--                     z6    z7    z8    z9   z10   z11   z12   z13   z14   z15   z16   z17   z18   z19   z20
--   motorway         0.4   0.8     1   1.4   1.9     2   3.5     6     6    10    10    18    21    27    33
--   trunk            0.4   0.6     1   1.4   1.9   1.9   3.5     6     6    10    10    18    21    27    27
--   primary                        1   1.4   1.8   1.8   3.5     5     5    10    10    18    21    27    27
--   secondary                            1   1.1   1.1   3.5     5     5     9    10    18    21    27    27
--   tertiary                                 0.7   0.7   2.5     4     5     9    10    18    21    27    27
--   motorway_link                            1.9     2   1.5     4     4   7.8   7.8    12    13    16    17
--   trunk_link                               1.9   1.9   1.5     4     4   7.8   7.8    12    13    16    16
--   primary_link                             1.8   1.8   1.5     4     4   7.8   7.8    12    13    16    16
--   secondary_link                           1.1   1.1   1.5     4     4     7     7    12    13    16    16
--   tertiary_link                            0.7   0.7   1.5     3     3     7     7    12    13    16    16
--   unclassified                                         0.8   2.5     3     5     6    12    13    17    17
--   residential                                          0.5   2.5     3     5     6    12    13    17    17
--   living_street                                                2     3     5     6    12    13    17    17
--   pedestrian                                                         3     5     6    12    13    17    17
--   road                                       1     1     1     1     2     2   3.5     7   8.5    11    11
--   service                                                            2     2   3.5     7   8.5    11    12
--   service_minor                                                                  2   3.5  4.75   5.5   8.5
--   footway                                                          0.7     1   1.3   1.3   1.3   1.6   1.6
--   cycleway                                                   0.7   0.7   0.9   0.9   0.9     1   1.3   1.3
--   bridleway                                                  0.3   0.3   1.2   1.2   1.2   1.2   1.2   1.2
--   steps                                                            0.7     3     3     3     3     3     3
--   track                                                      0.5   0.5   1.5   1.5   1.5   1.5   1.5   1.5
--   runway                                           2     4     6    12    18    24    24    24    24    24
--   taxiway                                          1     1     2     4     6     8     8     8     8     8
--   roller_coaster                                                           1   2.5     4     6     8    12
--   path                                                             0.7     1   1.3   1.3   1.3   1.6   1.6
--
-- Casings, on either side of the line
--               z12   z13   z14   z15   z16   z17   z18   z19   z20
--   major       0.5   0.5   0.5   0.7   0.7     1     1     1     1
--   secondary   0.3  0.35  0.35   0.7   0.7     1     1     1     1
--   link        0.3   0.5   0.5   0.6   0.6   0.8   0.8   0.8   0.8
--   minor       0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--   service                0.55  0.55   0.6   0.8   0.8   0.8   0.8
--
-- Casings on bridges
--               z12   z13   z14   z15   z16   z17   z18   z19   z20
--   major       0.5   0.5   0.5  0.75  0.75     1     1     1     1
--   secondary   0.1   0.5   0.6  0.75  0.75     1     1     1     1
--   minor       0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   service                 0.5   0.5  0.75   0.8   0.8   0.8   0.8
--
-- Drawn like another line: path like footway


DROP TABLE IF EXISTS carto_line_widths_data;
CREATE TABLE carto_line_widths_data (
    zoom integer NOT NULL,
    class text NOT NULL,
    line_width float NOT NULL,
    casing_width float NOT NULL,
    bridge_casing_width float NOT NULL,
    PRIMARY KEY (zoom, class));
-- If there are permission problems reading the carto_line_widths_data table,
-- uncomment the line below, setting <render user> to the relevant database user
-- GRANT SELECT ON carto_line_widths_data TO <render user>;

INSERT INTO carto_line_widths_data (zoom, class, line_width, casing_width, bridge_casing_width) VALUES
    (6, 'motorway', 0.4, 0, 0),
    (6, 'trunk', 0.4, 0, 0),
    (7, 'motorway', 0.8, 0, 0),
    (7, 'trunk', 0.6, 0, 0),
    (8, 'motorway', 1, 0, 0),
    (8, 'trunk', 1, 0, 0),
    (8, 'primary', 1, 0, 0),
    (9, 'motorway', 1.4, 0, 0),
    (9, 'trunk', 1.4, 0, 0),
    (9, 'primary', 1.4, 0, 0),
    (9, 'secondary', 1, 0, 0),
    (10, 'motorway', 1.9, 0, 0),
    (10, 'trunk', 1.9, 0, 0),
    (10, 'primary', 1.8, 0, 0),
    (10, 'secondary', 1.1, 0, 0),
    (10, 'tertiary', 0.7, 0, 0),
    (10, 'motorway_link', 1.9, 0, 0),
    (10, 'trunk_link', 1.9, 0, 0),
    (10, 'primary_link', 1.8, 0, 0),
    (10, 'secondary_link', 1.1, 0, 0),
    (10, 'tertiary_link', 0.7, 0, 0),
    (10, 'road', 1, 0, 0),
    (11, 'motorway', 2, 0, 0),
    (11, 'trunk', 1.9, 0, 0),
    (11, 'primary', 1.8, 0, 0),
    (11, 'secondary', 1.1, 0, 0),
    (11, 'tertiary', 0.7, 0, 0),
    (11, 'motorway_link', 2, 0, 0),
    (11, 'trunk_link', 1.9, 0, 0),
    (11, 'primary_link', 1.8, 0, 0),
    (11, 'secondary_link', 1.1, 0, 0),
    (11, 'tertiary_link', 0.7, 0, 0),
    (11, 'road', 1, 0, 0),
    (11, 'runway', 2, 0, 0),
    (11, 'taxiway', 1, 0, 0),
    (12, 'motorway', 3.5, 0.5, 0.5),
    (12, 'trunk', 3.5, 0.5, 0.5),
    (12, 'primary', 3.5, 0.5, 0.5),
    (12, 'secondary', 3.5, 0.3, 0.1),
    (12, 'tertiary', 2.5, 0.3, 0.1),
    (12, 'motorway_link', 1.5, 0.3, 0.1),
    (12, 'trunk_link', 1.5, 0.3, 0.1),
    (12, 'primary_link', 1.5, 0.3, 0.1),
    (12, 'secondary_link', 1.5, 0.3, 0.1),
    (12, 'tertiary_link', 1.5, 0.3, 0.1),
    (12, 'unclassified', 0.8, 0.3, 0.1),
    (12, 'residential', 0.5, 0.3, 0.1),
    (12, 'road', 1, 0, 0),
    (12, 'runway', 4, 0, 0),
    (12, 'taxiway', 1, 0.3, 0),
    (13, 'motorway', 6, 0.5, 0.5),
    (13, 'trunk', 6, 0.5, 0.5),
    (13, 'primary', 5, 0.5, 0.5),
    (13, 'secondary', 5, 0.35, 0.5),
    (13, 'tertiary', 4, 0.5, 0.5),
    (13, 'motorway_link', 4, 0.5, 0.5),
    (13, 'trunk_link', 4, 0.5, 0.5),
    (13, 'primary_link', 4, 0.5, 0.5),
    (13, 'secondary_link', 4, 0.5, 0.5),
    (13, 'tertiary_link', 3, 0.5, 0.5),
    (13, 'unclassified', 2.5, 0.5, 0.5),
    (13, 'residential', 2.5, 0.5, 0.5),
    (13, 'living_street', 2, 0.5, 0.5),
    (13, 'road', 1, 0, 0),
    (13, 'cycleway', 0.7, 0, 0),
    (13, 'bridleway', 0.3, 0, 0),
    (13, 'track', 0.5, 0, 0),
    (13, 'runway', 6, 0, 0),
    (13, 'taxiway', 2, 0.35, 0),
    (14, 'motorway', 6, 0.5, 0.5),
    (14, 'trunk', 6, 0.5, 0.5),
    (14, 'primary', 5, 0.5, 0.5),
    (14, 'secondary', 5, 0.35, 0.6),
    (14, 'tertiary', 5, 0.55, 0.5),
    (14, 'motorway_link', 4, 0.5, 0.5),
    (14, 'trunk_link', 4, 0.5, 0.5),
    (14, 'primary_link', 4, 0.5, 0.5),
    (14, 'secondary_link', 4, 0.5, 0.5),
    (14, 'tertiary_link', 3, 0.5, 0.5),
    (14, 'unclassified', 3, 0.55, 0.5),
    (14, 'residential', 3, 0.55, 0.5),
    (14, 'living_street', 3, 0.55, 0.5),
    (14, 'pedestrian', 3, 0.55, 0.5),
    (14, 'road', 2, 0.55, 0.5),
    (14, 'service', 2, 0.55, 0.5),
    (14, 'footway', 0.7, 0, 0),
    (14, 'cycleway', 0.7, 0, 0),
    (14, 'bridleway', 0.3, 0, 0),
    (14, 'steps', 0.7, 0, 0),
    (14, 'track', 0.5, 0, 0),
    (14, 'runway', 12, 0.6, 0),
    (14, 'taxiway', 4, 0.35, 0),
    (14, 'path', 0.7, 0, 0),
    (15, 'motorway', 10, 0.7, 0.75),
    (15, 'trunk', 10, 0.7, 0.75),
    (15, 'primary', 10, 0.7, 0.75),
    (15, 'secondary', 9, 0.7, 0.75),
    (15, 'tertiary', 9, 0.6, 0.75),
    (15, 'motorway_link', 7.8, 0.6, 0.75),
    (15, 'trunk_link', 7.8, 0.6, 0.75),
    (15, 'primary_link', 7.8, 0.6, 0.75),
    (15, 'secondary_link', 7, 0.6, 0.75),
    (15, 'tertiary_link', 7, 0.6, 0.75),
    (15, 'unclassified', 5, 0.6, 0.75),
    (15, 'residential', 5, 0.6, 0.75),
    (15, 'living_street', 5, 0.6, 0.75),
    (15, 'pedestrian', 5, 0.6, 0.75),
    (15, 'road', 2, 0.55, 0.5),
    (15, 'service', 2, 0.55, 0.5),
    (15, 'footway', 1, 0, 0),
    (15, 'cycleway', 0.9, 0, 0),
    (15, 'bridleway', 1.2, 0, 0),
    (15, 'steps', 3, 0, 0),
    (15, 'track', 1.5, 0, 0),
    (15, 'runway', 18, 0.7, 0),
    (15, 'taxiway', 6, 0.7, 0),
    (15, 'roller_coaster', 1, 0, 0.75),
    (15, 'path', 1, 0, 0),
    (16, 'motorway', 10, 0.7, 0.75),
    (16, 'trunk', 10, 0.7, 0.75),
    (16, 'primary', 10, 0.7, 0.75),
    (16, 'secondary', 10, 0.7, 0.75),
    (16, 'tertiary', 10, 0.6, 0.75),
    (16, 'motorway_link', 7.8, 0.6, 0.75),
    (16, 'trunk_link', 7.8, 0.6, 0.75),
    (16, 'primary_link', 7.8, 0.6, 0.75),
    (16, 'secondary_link', 7, 0.6, 0.75),
    (16, 'tertiary_link', 7, 0.6, 0.75),
    (16, 'unclassified', 6, 0.6, 0.75),
    (16, 'residential', 6, 0.6, 0.75),
    (16, 'living_street', 6, 0.6, 0.75),
    (16, 'pedestrian', 6, 0.6, 0.75),
    (16, 'road', 3.5, 0.6, 0.75),
    (16, 'service', 3.5, 0.6, 0.75),
    (16, 'service_minor', 2, 0.6, 0.75),
    (16, 'footway', 1.3, 0, 0),
    (16, 'cycleway', 0.9, 0, 0),
    (16, 'bridleway', 1.2, 0, 0),
    (16, 'steps', 3, 0, 0),
    (16, 'track', 1.5, 0, 0),
    (16, 'runway', 24, 0.7, 0),
    (16, 'taxiway', 8, 0.7, 0),
    (16, 'roller_coaster', 2.5, 0, 0.75),
    (16, 'path', 1.3, 0, 0),
    (17, 'motorway', 18, 1, 1),
    (17, 'trunk', 18, 1, 1),
    (17, 'primary', 18, 1, 1),
    (17, 'secondary', 18, 1, 1),
    (17, 'tertiary', 18, 0.8, 0.8),
    (17, 'motorway_link', 12, 0.8, 0.8),
    (17, 'trunk_link', 12, 0.8, 0.8),
    (17, 'primary_link', 12, 0.8, 0.8),
    (17, 'secondary_link', 12, 0.8, 0.8),
    (17, 'tertiary_link', 12, 0.8, 0.8),
    (17, 'unclassified', 12, 0.8, 0.8),
    (17, 'residential', 12, 0.8, 0.8),
    (17, 'living_street', 12, 0.8, 0.8),
    (17, 'pedestrian', 12, 0.8, 0.8),
    (17, 'road', 7, 0.8, 0.8),
    (17, 'service', 7, 0.8, 0.8),
    (17, 'service_minor', 3.5, 0.8, 0.8),
    (17, 'footway', 1.3, 0, 0),
    (17, 'cycleway', 0.9, 0, 0),
    (17, 'bridleway', 1.2, 0, 0),
    (17, 'steps', 3, 0, 0),
    (17, 'track', 1.5, 0, 0),
    (17, 'runway', 24, 1, 0),
    (17, 'taxiway', 8, 1, 0),
    (17, 'roller_coaster', 4, 0, 0.8),
    (17, 'path', 1.3, 0, 0),
    (18, 'motorway', 21, 1, 1),
    (18, 'trunk', 21, 1, 1),
    (18, 'primary', 21, 1, 1),
    (18, 'secondary', 21, 1, 1),
    (18, 'tertiary', 21, 0.8, 0.8),
    (18, 'motorway_link', 13, 0.8, 0.8),
    (18, 'trunk_link', 13, 0.8, 0.8),
    (18, 'primary_link', 13, 0.8, 0.8),
    (18, 'secondary_link', 13, 0.8, 0.8),
    (18, 'tertiary_link', 13, 0.8, 0.8),
    (18, 'unclassified', 13, 0.8, 0.8),
    (18, 'residential', 13, 0.8, 0.8),
    (18, 'living_street', 13, 0.8, 0.8),
    (18, 'pedestrian', 13, 0.8, 0.8),
    (18, 'road', 8.5, 0.8, 0.8),
    (18, 'service', 8.5, 0.8, 0.8),
    (18, 'service_minor', 4.75, 0.8, 0.8),
    (18, 'footway', 1.3, 0, 0),
    (18, 'cycleway', 1, 0, 0),
    (18, 'bridleway', 1.2, 0, 0),
    (18, 'steps', 3, 0, 0),
    (18, 'track', 1.5, 0, 0),
    (18, 'runway', 24, 1, 0),
    (18, 'taxiway', 8, 1, 0),
    (18, 'roller_coaster', 6, 0, 0.8),
    (18, 'path', 1.3, 0, 0),
    (19, 'motorway', 27, 1, 1),
    (19, 'trunk', 27, 1, 1),
    (19, 'primary', 27, 1, 1),
    (19, 'secondary', 27, 1, 1),
    (19, 'tertiary', 27, 0.8, 0.8),
    (19, 'motorway_link', 16, 0.8, 0.8),
    (19, 'trunk_link', 16, 0.8, 0.8),
    (19, 'primary_link', 16, 0.8, 0.8),
    (19, 'secondary_link', 16, 0.8, 0.8),
    (19, 'tertiary_link', 16, 0.8, 0.8),
    (19, 'unclassified', 17, 0.8, 0.8),
    (19, 'residential', 17, 0.8, 0.8),
    (19, 'living_street', 17, 0.8, 0.8),
    (19, 'pedestrian', 17, 0.8, 0.8),
    (19, 'road', 11, 0.8, 0.8),
    (19, 'service', 11, 0.8, 0.8),
    (19, 'service_minor', 5.5, 0.8, 0.8),
    (19, 'footway', 1.6, 0, 0),
    (19, 'cycleway', 1.3, 0, 0),
    (19, 'bridleway', 1.2, 0, 0),
    (19, 'steps', 3, 0, 0),
    (19, 'track', 1.5, 0, 0),
    (19, 'runway', 24, 1, 0),
    (19, 'taxiway', 8, 1, 0),
    (19, 'roller_coaster', 8, 0, 0.8),
    (19, 'path', 1.6, 0, 0),
    (20, 'motorway', 33, 1, 1),
    (20, 'trunk', 27, 1, 1),
    (20, 'primary', 27, 1, 1),
    (20, 'secondary', 27, 1, 1),
    (20, 'tertiary', 27, 0.8, 0.8),
    (20, 'motorway_link', 17, 0.8, 0.8),
    (20, 'trunk_link', 16, 0.8, 0.8),
    (20, 'primary_link', 16, 0.8, 0.8),
    (20, 'secondary_link', 16, 0.8, 0.8),
    (20, 'tertiary_link', 16, 0.8, 0.8),
    (20, 'unclassified', 17, 0.8, 0.8),
    (20, 'residential', 17, 0.8, 0.8),
    (20, 'living_street', 17, 0.8, 0.8),
    (20, 'pedestrian', 17, 0.8, 0.8),
    (20, 'road', 11, 0.8, 0.8),
    (20, 'service', 12, 0.8, 0.8),
    (20, 'service_minor', 8.5, 0.8, 0.8),
    (20, 'footway', 1.6, 0, 0),
    (20, 'cycleway', 1.3, 0, 0),
    (20, 'bridleway', 1.2, 0, 0),
    (20, 'steps', 3, 0, 0),
    (20, 'track', 1.5, 0, 0),
    (20, 'runway', 24, 1, 0),
    (20, 'taxiway', 8, 1, 0),
    (20, 'roller_coaster', 12, 0, 0.8),
    (20, 'path', 1.6, 0, 0);
ANALYZE carto_line_widths_data;

-- The widths at a zoom level, those of z20 above it, none for no zoom level. The roads layers
-- join this on the class of the line. A plain SQL function like this is inlined into the
-- queries, so the planner reads the table directly.
CREATE OR REPLACE FUNCTION carto_line_widths(zoom integer)
  RETURNS TABLE (class text, line_width float, casing_width float, bridge_casing_width float)
  LANGUAGE SQL
  STABLE PARALLEL SAFE
AS $$
SELECT class, line_width, casing_width, bridge_casing_width
  FROM carto_line_widths_data
  WHERE carto_line_widths_data.zoom = CASE WHEN $1 > 20 THEN 20 ELSE $1 END
$$;
