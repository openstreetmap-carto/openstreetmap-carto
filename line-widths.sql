-- This is generated code; do not change this file manually.
-- To change the line widths, edit line-widths.yaml and run:
--   scripts/generate_line_widths.py > line-widths.sql
-- and load it again with psql -d gis -f line-widths.sql
--
-- The widths by class and zoom level, in pixels:
--
-- line_width
--                             z6    z7    z8    z9   z10   z11   z12   z13   z14   z15   z16   z17   z18   z19   z20
--   highway_motorway         0.4   0.8     1   1.4   1.9     2   3.5     6     6    10    10    18    21    27    33
--   highway_trunk            0.4   0.6     1   1.4   1.9   1.9   3.5     6     6    10    10    18    21    27    27
--   highway_primary                        1   1.4   1.8   1.8   3.5     5     5    10    10    18    21    27    27
--   highway_secondary                            1   1.1   1.1   3.5     5     5     9    10    18    21    27    27
--   highway_tertiary                                 0.7   0.7   2.5     4     5     9    10    18    21    27    27
--   highway_motorway_link                            1.9     2   1.5     4     4   7.8   7.8    12    13    16    17
--   highway_trunk_link                               1.9   1.9   1.5     4     4   7.8   7.8    12    13    16    16
--   highway_primary_link                             1.8   1.8   1.5     4     4   7.8   7.8    12    13    16    16
--   highway_secondary_link                           1.1   1.1   1.5     4     4     7     7    12    13    16    16
--   highway_tertiary_link                            0.7   0.7   1.5     3     3     7     7    12    13    16    16
--   highway_unclassified                                         0.8   2.5     3     5     6    12    13    17    17
--   highway_residential                                          0.5   2.5     3     5     6    12    13    17    17
--   highway_living_street                                                2     3     5     6    12    13    17    17
--   highway_pedestrian                                                         3     5     6    12    13    17    17
--   highway_road                                       1     1     1     1     2     2   3.5     7   8.5    11    11
--   highway_service                                                            2     2   3.5     7   8.5    11    12
--   highway_service_minor                                                                  2   3.5  4.75   5.5   8.5
--   highway_footway                                                          0.7     1   1.3   1.3   1.3   1.6   1.6
--   highway_path                                                             0.7     1   1.3   1.3   1.3   1.6   1.6
--   highway_cycleway                                                   0.7   0.7   0.9   0.9   0.9     1   1.3   1.3
--   highway_bridleway                                                  0.3   0.3   1.2   1.2   1.2   1.2   1.2   1.2
--   highway_steps                                                            0.7     3     3     3     3     3     3
--   highway_track                                                      0.5   0.5   1.5   1.5   1.5   1.5   1.5   1.5
--   aeroway_runway                                           2     4     6    12    18    24    24    24    24    24
--   aeroway_taxiway                                          1     1     2     4     6     8     8     8     8     8
--   railway_roller_coaster                                                           1   2.5     4     6     8    12
--
-- casing_width
--                            z12   z13   z14   z15   z16   z17   z18   z19   z20
--   highway_motorway         0.5   0.5   0.5   0.7   0.7     1     1     1     1
--   highway_trunk            0.5   0.5   0.5   0.7   0.7     1     1     1     1
--   highway_primary          0.5   0.5   0.5   0.7   0.7     1     1     1     1
--   highway_secondary        0.3  0.35  0.35   0.7   0.7     1     1     1     1
--   highway_tertiary         0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_motorway_link    0.3   0.5   0.5   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_trunk_link       0.3   0.5   0.5   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_primary_link     0.3   0.5   0.5   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_secondary_link   0.3   0.5   0.5   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_tertiary_link    0.3   0.5   0.5   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_unclassified     0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_residential      0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_living_street    0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_pedestrian       0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--   highway_road                        0.55  0.55   0.6   0.8   0.8   0.8   0.8
--   highway_service                     0.55  0.55   0.6   0.8   0.8   0.8   0.8
--   highway_service_minor    0.3   0.5  0.55   0.6   0.6   0.8   0.8   0.8   0.8
--
-- bridge_casing_width
--                            z12   z13   z14   z15   z16   z17   z18   z19   z20
--   highway_motorway         0.5   0.5   0.5  0.75  0.75     1     1     1     1
--   highway_trunk            0.5   0.5   0.5  0.75  0.75     1     1     1     1
--   highway_primary          0.5   0.5   0.5  0.75  0.75     1     1     1     1
--   highway_secondary        0.1   0.5   0.6  0.75  0.75     1     1     1     1
--   highway_tertiary         0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_motorway_link    0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_trunk_link       0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_primary_link     0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_secondary_link   0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_tertiary_link    0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_unclassified     0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_residential      0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_living_street    0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_pedestrian       0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   highway_road                         0.5   0.5  0.75   0.8   0.8   0.8   0.8
--   highway_service                      0.5   0.5  0.75   0.8   0.8   0.8   0.8
--   highway_service_minor    0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--   aeroway_runway                       0.6   0.7   0.7     1     1     1     1
--   aeroway_taxiway          0.3  0.35  0.35   0.7   0.7     1     1     1     1
--   railway_roller_coaster   0.1   0.5   0.5  0.75  0.75   0.8   0.8   0.8   0.8
--
-- Aliases: highway_path has the widths of highway_footway


DROP TABLE IF EXISTS carto_line_widths_data;
CREATE TABLE carto_line_widths_data (
    zoom integer NOT NULL,
    class text NOT NULL,
    line_width float,
    casing_width float,
    bridge_casing_width float,
    PRIMARY KEY (zoom, class));
-- If there are permission problems reading the carto_line_widths_data table,
-- uncomment the line below, setting <render user> to the relevant database user
-- GRANT SELECT ON carto_line_widths_data TO <render user>;

INSERT INTO carto_line_widths_data (zoom, class, line_width, casing_width, bridge_casing_width) VALUES
    (6, 'highway_motorway', 0.4, NULL, NULL),
    (6, 'highway_trunk', 0.4, NULL, NULL),
    (7, 'highway_motorway', 0.8, NULL, NULL),
    (7, 'highway_trunk', 0.6, NULL, NULL),
    (8, 'highway_motorway', 1, NULL, NULL),
    (8, 'highway_trunk', 1, NULL, NULL),
    (8, 'highway_primary', 1, NULL, NULL),
    (9, 'highway_motorway', 1.4, NULL, NULL),
    (9, 'highway_trunk', 1.4, NULL, NULL),
    (9, 'highway_primary', 1.4, NULL, NULL),
    (9, 'highway_secondary', 1, NULL, NULL),
    (10, 'highway_motorway', 1.9, NULL, NULL),
    (10, 'highway_trunk', 1.9, NULL, NULL),
    (10, 'highway_primary', 1.8, NULL, NULL),
    (10, 'highway_secondary', 1.1, NULL, NULL),
    (10, 'highway_tertiary', 0.7, NULL, NULL),
    (10, 'highway_motorway_link', 1.9, NULL, NULL),
    (10, 'highway_trunk_link', 1.9, NULL, NULL),
    (10, 'highway_primary_link', 1.8, NULL, NULL),
    (10, 'highway_secondary_link', 1.1, NULL, NULL),
    (10, 'highway_tertiary_link', 0.7, NULL, NULL),
    (10, 'highway_road', 1, NULL, NULL),
    (11, 'highway_motorway', 2, NULL, NULL),
    (11, 'highway_trunk', 1.9, NULL, NULL),
    (11, 'highway_primary', 1.8, NULL, NULL),
    (11, 'highway_secondary', 1.1, NULL, NULL),
    (11, 'highway_tertiary', 0.7, NULL, NULL),
    (11, 'highway_motorway_link', 2, NULL, NULL),
    (11, 'highway_trunk_link', 1.9, NULL, NULL),
    (11, 'highway_primary_link', 1.8, NULL, NULL),
    (11, 'highway_secondary_link', 1.1, NULL, NULL),
    (11, 'highway_tertiary_link', 0.7, NULL, NULL),
    (11, 'highway_road', 1, NULL, NULL),
    (11, 'aeroway_runway', 2, NULL, NULL),
    (11, 'aeroway_taxiway', 1, NULL, NULL),
    (12, 'highway_motorway', 3.5, 0.5, 0.5),
    (12, 'highway_trunk', 3.5, 0.5, 0.5),
    (12, 'highway_primary', 3.5, 0.5, 0.5),
    (12, 'highway_secondary', 3.5, 0.3, 0.1),
    (12, 'highway_tertiary', 2.5, 0.3, 0.1),
    (12, 'highway_motorway_link', 1.5, 0.3, 0.1),
    (12, 'highway_trunk_link', 1.5, 0.3, 0.1),
    (12, 'highway_primary_link', 1.5, 0.3, 0.1),
    (12, 'highway_secondary_link', 1.5, 0.3, 0.1),
    (12, 'highway_tertiary_link', 1.5, 0.3, 0.1),
    (12, 'highway_unclassified', 0.8, 0.3, 0.1),
    (12, 'highway_residential', 0.5, 0.3, 0.1),
    (12, 'highway_living_street', NULL, 0.3, 0.1),
    (12, 'highway_pedestrian', NULL, 0.3, 0.1),
    (12, 'highway_road', 1, NULL, NULL),
    (12, 'highway_service_minor', NULL, 0.3, 0.1),
    (12, 'aeroway_runway', 4, NULL, NULL),
    (12, 'aeroway_taxiway', 1, NULL, 0.3),
    (12, 'railway_roller_coaster', NULL, NULL, 0.1),
    (13, 'highway_motorway', 6, 0.5, 0.5),
    (13, 'highway_trunk', 6, 0.5, 0.5),
    (13, 'highway_primary', 5, 0.5, 0.5),
    (13, 'highway_secondary', 5, 0.35, 0.5),
    (13, 'highway_tertiary', 4, 0.5, 0.5),
    (13, 'highway_motorway_link', 4, 0.5, 0.5),
    (13, 'highway_trunk_link', 4, 0.5, 0.5),
    (13, 'highway_primary_link', 4, 0.5, 0.5),
    (13, 'highway_secondary_link', 4, 0.5, 0.5),
    (13, 'highway_tertiary_link', 3, 0.5, 0.5),
    (13, 'highway_unclassified', 2.5, 0.5, 0.5),
    (13, 'highway_residential', 2.5, 0.5, 0.5),
    (13, 'highway_living_street', 2, 0.5, 0.5),
    (13, 'highway_pedestrian', NULL, 0.5, 0.5),
    (13, 'highway_road', 1, NULL, NULL),
    (13, 'highway_service_minor', NULL, 0.5, 0.5),
    (13, 'highway_cycleway', 0.7, NULL, NULL),
    (13, 'highway_bridleway', 0.3, NULL, NULL),
    (13, 'highway_track', 0.5, NULL, NULL),
    (13, 'aeroway_runway', 6, NULL, NULL),
    (13, 'aeroway_taxiway', 2, NULL, 0.35),
    (13, 'railway_roller_coaster', NULL, NULL, 0.5),
    (14, 'highway_motorway', 6, 0.5, 0.5),
    (14, 'highway_trunk', 6, 0.5, 0.5),
    (14, 'highway_primary', 5, 0.5, 0.5),
    (14, 'highway_secondary', 5, 0.35, 0.6),
    (14, 'highway_tertiary', 5, 0.55, 0.5),
    (14, 'highway_motorway_link', 4, 0.5, 0.5),
    (14, 'highway_trunk_link', 4, 0.5, 0.5),
    (14, 'highway_primary_link', 4, 0.5, 0.5),
    (14, 'highway_secondary_link', 4, 0.5, 0.5),
    (14, 'highway_tertiary_link', 3, 0.5, 0.5),
    (14, 'highway_unclassified', 3, 0.55, 0.5),
    (14, 'highway_residential', 3, 0.55, 0.5),
    (14, 'highway_living_street', 3, 0.55, 0.5),
    (14, 'highway_pedestrian', 3, 0.55, 0.5),
    (14, 'highway_road', 2, 0.55, 0.5),
    (14, 'highway_service', 2, 0.55, 0.5),
    (14, 'highway_service_minor', NULL, 0.55, 0.5),
    (14, 'highway_footway', 0.7, NULL, NULL),
    (14, 'highway_path', 0.7, NULL, NULL),
    (14, 'highway_cycleway', 0.7, NULL, NULL),
    (14, 'highway_bridleway', 0.3, NULL, NULL),
    (14, 'highway_steps', 0.7, NULL, NULL),
    (14, 'highway_track', 0.5, NULL, NULL),
    (14, 'aeroway_runway', 12, NULL, 0.6),
    (14, 'aeroway_taxiway', 4, NULL, 0.35),
    (14, 'railway_roller_coaster', NULL, NULL, 0.5),
    (15, 'highway_motorway', 10, 0.7, 0.75),
    (15, 'highway_trunk', 10, 0.7, 0.75),
    (15, 'highway_primary', 10, 0.7, 0.75),
    (15, 'highway_secondary', 9, 0.7, 0.75),
    (15, 'highway_tertiary', 9, 0.6, 0.75),
    (15, 'highway_motorway_link', 7.8, 0.6, 0.75),
    (15, 'highway_trunk_link', 7.8, 0.6, 0.75),
    (15, 'highway_primary_link', 7.8, 0.6, 0.75),
    (15, 'highway_secondary_link', 7, 0.6, 0.75),
    (15, 'highway_tertiary_link', 7, 0.6, 0.75),
    (15, 'highway_unclassified', 5, 0.6, 0.75),
    (15, 'highway_residential', 5, 0.6, 0.75),
    (15, 'highway_living_street', 5, 0.6, 0.75),
    (15, 'highway_pedestrian', 5, 0.6, 0.75),
    (15, 'highway_road', 2, 0.55, 0.5),
    (15, 'highway_service', 2, 0.55, 0.5),
    (15, 'highway_service_minor', NULL, 0.6, 0.75),
    (15, 'highway_footway', 1, NULL, NULL),
    (15, 'highway_path', 1, NULL, NULL),
    (15, 'highway_cycleway', 0.9, NULL, NULL),
    (15, 'highway_bridleway', 1.2, NULL, NULL),
    (15, 'highway_steps', 3, NULL, NULL),
    (15, 'highway_track', 1.5, NULL, NULL),
    (15, 'aeroway_runway', 18, NULL, 0.7),
    (15, 'aeroway_taxiway', 6, NULL, 0.7),
    (15, 'railway_roller_coaster', 1, NULL, 0.75),
    (16, 'highway_motorway', 10, 0.7, 0.75),
    (16, 'highway_trunk', 10, 0.7, 0.75),
    (16, 'highway_primary', 10, 0.7, 0.75),
    (16, 'highway_secondary', 10, 0.7, 0.75),
    (16, 'highway_tertiary', 10, 0.6, 0.75),
    (16, 'highway_motorway_link', 7.8, 0.6, 0.75),
    (16, 'highway_trunk_link', 7.8, 0.6, 0.75),
    (16, 'highway_primary_link', 7.8, 0.6, 0.75),
    (16, 'highway_secondary_link', 7, 0.6, 0.75),
    (16, 'highway_tertiary_link', 7, 0.6, 0.75),
    (16, 'highway_unclassified', 6, 0.6, 0.75),
    (16, 'highway_residential', 6, 0.6, 0.75),
    (16, 'highway_living_street', 6, 0.6, 0.75),
    (16, 'highway_pedestrian', 6, 0.6, 0.75),
    (16, 'highway_road', 3.5, 0.6, 0.75),
    (16, 'highway_service', 3.5, 0.6, 0.75),
    (16, 'highway_service_minor', 2, 0.6, 0.75),
    (16, 'highway_footway', 1.3, NULL, NULL),
    (16, 'highway_path', 1.3, NULL, NULL),
    (16, 'highway_cycleway', 0.9, NULL, NULL),
    (16, 'highway_bridleway', 1.2, NULL, NULL),
    (16, 'highway_steps', 3, NULL, NULL),
    (16, 'highway_track', 1.5, NULL, NULL),
    (16, 'aeroway_runway', 24, NULL, 0.7),
    (16, 'aeroway_taxiway', 8, NULL, 0.7),
    (16, 'railway_roller_coaster', 2.5, NULL, 0.75),
    (17, 'highway_motorway', 18, 1, 1),
    (17, 'highway_trunk', 18, 1, 1),
    (17, 'highway_primary', 18, 1, 1),
    (17, 'highway_secondary', 18, 1, 1),
    (17, 'highway_tertiary', 18, 0.8, 0.8),
    (17, 'highway_motorway_link', 12, 0.8, 0.8),
    (17, 'highway_trunk_link', 12, 0.8, 0.8),
    (17, 'highway_primary_link', 12, 0.8, 0.8),
    (17, 'highway_secondary_link', 12, 0.8, 0.8),
    (17, 'highway_tertiary_link', 12, 0.8, 0.8),
    (17, 'highway_unclassified', 12, 0.8, 0.8),
    (17, 'highway_residential', 12, 0.8, 0.8),
    (17, 'highway_living_street', 12, 0.8, 0.8),
    (17, 'highway_pedestrian', 12, 0.8, 0.8),
    (17, 'highway_road', 7, 0.8, 0.8),
    (17, 'highway_service', 7, 0.8, 0.8),
    (17, 'highway_service_minor', 3.5, 0.8, 0.8),
    (17, 'highway_footway', 1.3, NULL, NULL),
    (17, 'highway_path', 1.3, NULL, NULL),
    (17, 'highway_cycleway', 0.9, NULL, NULL),
    (17, 'highway_bridleway', 1.2, NULL, NULL),
    (17, 'highway_steps', 3, NULL, NULL),
    (17, 'highway_track', 1.5, NULL, NULL),
    (17, 'aeroway_runway', 24, NULL, 1),
    (17, 'aeroway_taxiway', 8, NULL, 1),
    (17, 'railway_roller_coaster', 4, NULL, 0.8),
    (18, 'highway_motorway', 21, 1, 1),
    (18, 'highway_trunk', 21, 1, 1),
    (18, 'highway_primary', 21, 1, 1),
    (18, 'highway_secondary', 21, 1, 1),
    (18, 'highway_tertiary', 21, 0.8, 0.8),
    (18, 'highway_motorway_link', 13, 0.8, 0.8),
    (18, 'highway_trunk_link', 13, 0.8, 0.8),
    (18, 'highway_primary_link', 13, 0.8, 0.8),
    (18, 'highway_secondary_link', 13, 0.8, 0.8),
    (18, 'highway_tertiary_link', 13, 0.8, 0.8),
    (18, 'highway_unclassified', 13, 0.8, 0.8),
    (18, 'highway_residential', 13, 0.8, 0.8),
    (18, 'highway_living_street', 13, 0.8, 0.8),
    (18, 'highway_pedestrian', 13, 0.8, 0.8),
    (18, 'highway_road', 8.5, 0.8, 0.8),
    (18, 'highway_service', 8.5, 0.8, 0.8),
    (18, 'highway_service_minor', 4.75, 0.8, 0.8),
    (18, 'highway_footway', 1.3, NULL, NULL),
    (18, 'highway_path', 1.3, NULL, NULL),
    (18, 'highway_cycleway', 1, NULL, NULL),
    (18, 'highway_bridleway', 1.2, NULL, NULL),
    (18, 'highway_steps', 3, NULL, NULL),
    (18, 'highway_track', 1.5, NULL, NULL),
    (18, 'aeroway_runway', 24, NULL, 1),
    (18, 'aeroway_taxiway', 8, NULL, 1),
    (18, 'railway_roller_coaster', 6, NULL, 0.8),
    (19, 'highway_motorway', 27, 1, 1),
    (19, 'highway_trunk', 27, 1, 1),
    (19, 'highway_primary', 27, 1, 1),
    (19, 'highway_secondary', 27, 1, 1),
    (19, 'highway_tertiary', 27, 0.8, 0.8),
    (19, 'highway_motorway_link', 16, 0.8, 0.8),
    (19, 'highway_trunk_link', 16, 0.8, 0.8),
    (19, 'highway_primary_link', 16, 0.8, 0.8),
    (19, 'highway_secondary_link', 16, 0.8, 0.8),
    (19, 'highway_tertiary_link', 16, 0.8, 0.8),
    (19, 'highway_unclassified', 17, 0.8, 0.8),
    (19, 'highway_residential', 17, 0.8, 0.8),
    (19, 'highway_living_street', 17, 0.8, 0.8),
    (19, 'highway_pedestrian', 17, 0.8, 0.8),
    (19, 'highway_road', 11, 0.8, 0.8),
    (19, 'highway_service', 11, 0.8, 0.8),
    (19, 'highway_service_minor', 5.5, 0.8, 0.8),
    (19, 'highway_footway', 1.6, NULL, NULL),
    (19, 'highway_path', 1.6, NULL, NULL),
    (19, 'highway_cycleway', 1.3, NULL, NULL),
    (19, 'highway_bridleway', 1.2, NULL, NULL),
    (19, 'highway_steps', 3, NULL, NULL),
    (19, 'highway_track', 1.5, NULL, NULL),
    (19, 'aeroway_runway', 24, NULL, 1),
    (19, 'aeroway_taxiway', 8, NULL, 1),
    (19, 'railway_roller_coaster', 8, NULL, 0.8),
    (20, 'highway_motorway', 33, 1, 1),
    (20, 'highway_trunk', 27, 1, 1),
    (20, 'highway_primary', 27, 1, 1),
    (20, 'highway_secondary', 27, 1, 1),
    (20, 'highway_tertiary', 27, 0.8, 0.8),
    (20, 'highway_motorway_link', 17, 0.8, 0.8),
    (20, 'highway_trunk_link', 16, 0.8, 0.8),
    (20, 'highway_primary_link', 16, 0.8, 0.8),
    (20, 'highway_secondary_link', 16, 0.8, 0.8),
    (20, 'highway_tertiary_link', 16, 0.8, 0.8),
    (20, 'highway_unclassified', 17, 0.8, 0.8),
    (20, 'highway_residential', 17, 0.8, 0.8),
    (20, 'highway_living_street', 17, 0.8, 0.8),
    (20, 'highway_pedestrian', 17, 0.8, 0.8),
    (20, 'highway_road', 11, 0.8, 0.8),
    (20, 'highway_service', 12, 0.8, 0.8),
    (20, 'highway_service_minor', 8.5, 0.8, 0.8),
    (20, 'highway_footway', 1.6, NULL, NULL),
    (20, 'highway_path', 1.6, NULL, NULL),
    (20, 'highway_cycleway', 1.3, NULL, NULL),
    (20, 'highway_bridleway', 1.2, NULL, NULL),
    (20, 'highway_steps', 3, NULL, NULL),
    (20, 'highway_track', 1.5, NULL, NULL),
    (20, 'aeroway_runway', 24, NULL, 1),
    (20, 'aeroway_taxiway', 8, NULL, 1),
    (20, 'railway_roller_coaster', 12, NULL, 0.8);
ANALYZE carto_line_widths_data;

-- The widths at a zoom level, those of z20 above it, none for no zoom level. The layers
-- join this on the class of the line. A plain SQL function like this is inlined into the
-- queries, so the planner reads the table directly. It is dropped first, as its columns
-- may have changed.
DROP FUNCTION IF EXISTS carto_line_widths(integer);
CREATE FUNCTION carto_line_widths(zoom integer)
  RETURNS TABLE (class text, line_width float, casing_width float, bridge_casing_width float)
  LANGUAGE SQL
  STABLE PARALLEL SAFE
AS $$
SELECT class, line_width, casing_width, bridge_casing_width
  FROM carto_line_widths_data
  WHERE carto_line_widths_data.zoom = CASE WHEN $1 > 20 THEN 20 ELSE $1 END
$$;
