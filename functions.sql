/* Additional database functions for openstreetmap-carto */

/* Access functions below adapted from https://github.com/imagico/osm-carto-alternative-colors/tree/591c861112b4e5d44badd108f4cd1409146bca0b/sql/roads.sql */

/* Simplified 'yes', 'destination', 'no', 'unrecognised', NULL scale for access restriction 
  'no' is returned if the rendering for highway category does not support 'restricted'.
  NULL is functionally equivalent to 'yes', but indicates the absence of a restriction 
  rather than a positive access = yes. 'unrecognised' corresponds to an uninterpretable 
  access restriction e.g. access=unknown or motorcar=occasionally */
CREATE OR REPLACE FUNCTION carto_int_access(accessvalue text, allow_restricted boolean)
	RETURNS text
	LANGUAGE SQL
	IMMUTABLE PARALLEL SAFE
AS $$
SELECT
	CASE
		WHEN accessvalue IN ('yes', 'designated', 'permissive') THEN 'yes'
		WHEN accessvalue IN ('destination',  'delivery', 'customers') THEN
			CASE WHEN allow_restricted = TRUE  THEN 'restricted' ELSE 'yes' END
		WHEN accessvalue IN ('no', 'permit', 'private', 'agricultural', 'forestry', 'agricultural;forestry') THEN 'no'
		WHEN accessvalue IS NULL THEN NULL
		ELSE 'unrecognised'
	END
$$;

/* Try to promote path to cycleway (if bicycle allowed), then bridleway (if horse)
   This duplicates existing behaviour where designated access is required */
CREATE OR REPLACE FUNCTION carto_path_type(bicycle text, horse text)
	RETURNS text
	LANGUAGE SQL
	IMMUTABLE PARALLEL SAFE
AS $$
SELECT
	CASE
		WHEN bicycle IN ('designated') THEN 'cycleway'
		WHEN horse IN ('designated') THEN 'bridleway'
		ELSE 'path'
	END
$$;

/* Return int_access value which will be used to determine access marking.
   Return values are documented above for carto_int_access function.

   Note that the code handling the promotion of highway=path assumes that
   promotion to cycleway or bridleway is based on the value of bicycle or
   horse respectively. A more general formulation would be, for example,
   WHEN 'cycleway' THEN carto_int_access(COALESCE(NULLIF(bicycle, 'unknown'), "access"), FALSE) */
CREATE OR REPLACE FUNCTION carto_highway_int_access(highway text, "access" text, foot text, bicycle text, horse text, motorcar text, motor_vehicle text, vehicle text)
  RETURNS text
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
AS $$
SELECT
	CASE
		WHEN highway IN ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary',
					 'secondary_link', 'tertiary', 'tertiary_link', 'residential', 'unclassified', 'living_street', 'service', 'road') THEN
			carto_int_access(
				COALESCE(
					NULLIF(motorcar, 'unknown'),
					NULLIF(motor_vehicle, 'unknown'),
					NULLIF(vehicle, 'unknown'),
					"access"), TRUE)
		WHEN highway = 'path' THEN
			CASE carto_path_type(bicycle, horse)
				WHEN 'cycleway' THEN carto_int_access(bicycle, FALSE)
				WHEN 'bridleway' THEN carto_int_access(horse, FALSE)
				ELSE carto_int_access(COALESCE(NULLIF(foot, 'unknown'), "access"), FALSE)
			END
		WHEN highway = 'pedestrian' THEN carto_int_access(COALESCE(NULLIF(foot, 'unknown'), "access"), TRUE)
		WHEN highway IN ('footway', 'steps') THEN carto_int_access(COALESCE(NULLIF(foot, 'unknown'), "access"), FALSE)
		WHEN highway = 'cycleway' THEN carto_int_access(COALESCE(NULLIF(bicycle, 'unknown'), "access"), FALSE)
		WHEN highway = 'bridleway' THEN carto_int_access(COALESCE(NULLIF(horse, 'unknown'), "access"), FALSE)
		ELSE carto_int_access("access", TRUE)
	END
$$;

CREATE OR REPLACE FUNCTION carto_highway_int_surface(surface text)
  RETURNS text
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
AS $$
SELECT
	CASE
		WHEN surface IN ('unpaved', 'compacted', 'dirt', 'earth', 'fine_gravel', 'grass', 'grass_paver', 'gravel', 'ground', 'mud', 'pebblestone', 'salt', 'sand', 'woodchips', 'clay', 'ice', 'snow') THEN 'unpaved'
		WHEN surface IN ('paved', 'asphalt', 'cobblestone', 'cobblestone:flattened', 'sett', 'concrete', 'concrete:lanes', 'concrete:plates', 'paving_stones', 'metal', 'wood', 'unhewn_cobblestone') THEN 'paved'
		ELSE NULL
	END
$$;

/* Convert a Mapnik scale_denominator to an integer Web Mercator zoom level.
   Adapted from https://github.com/mapbox/postgis-vt-util/blob/master/src/Z.sql
   Intended usage:
     WHERE Z(!scale_denominator!) < 17 */
CREATE OR REPLACE FUNCTION Z(scale_denominator numeric)
  RETURNS integer
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
  RETURNS NULL ON NULL INPUT
AS $$
SELECT
	CASE
		WHEN scale_denominator <= 0 OR scale_denominator > 600000000 THEN NULL
		ELSE CAST(ROUND(LOG(2, 559082264.028 / scale_denominator)) AS integer)
	END
$$;

/* Try to shorten a list of entries if the length is more than maxlength characters
   The list is partitioned using the given separator and shortened if it contains
   more then two items, by returning the first and last items separated by a ellipsis (U+2026).
   If the separator argument multiple characters, the shortening attempted if one, but not more,
   separator types is found. */

CREATE OR REPLACE FUNCTION carto_shorten_list(
    listtext text,
    separators text,
    maxlength integer DEFAULT 10
  )
  RETURNS text
  LANGUAGE plpgsql
  IMMUTABLE PARALLEL SAFE
AS $$
DECLARE
  found_sep   text;
  sep         text;
  parts       text[];
BEGIN
  IF listtext IS NULL
    OR separators IS NULL
    OR length(listtext) <= maxlength THEN
      RETURN listtext;
  END IF;

  -- Find separator types present in the text
  FOR i IN 1 .. length(separators) LOOP
    sep := substr(separators, i, 1);
    IF position(sep IN listtext) > 0 THEN
      IF found_sep IS NOT NULL THEN
        -- Multiple separator types found: do not shorten
        RETURN listtext;
      END IF;
      found_sep := sep;
    END IF;
  END LOOP;

  IF found_sep IS NOT NULL THEN
    parts := string_to_array(listtext, found_sep);
    IF array_length(parts, 1) > 2 THEN
      RETURN parts[1]
          || chr(x'2026'::int) -- U+2026 HORIZONTAL ELLIPSIS: …
          || chr(x'2060'::int) -- U+2060 WORD JOINER: Prevents a linebreak. Without this, it might render as: 123…\n456
          || parts[array_length(parts, 1)];
    END IF;
  END IF;

  RETURN listtext;
END;
$$;

/* Remove antimeridian closure segments from a boundary linestring.

   Boundary relations that cross the antimeridian are closed with artificial
   member ways (tagged closure_segment=yes) running along lon +/-180. Those ways
   carry no boundary tags of their own, and line_merge() folds them into the
   relation geometry, so the tag is not present on the rendered row and cannot be
   filtered directly. Instead drop every segment with BOTH endpoints on the
   antimeridian; a segment with only one endpoint there is real boundary linework
   meeting it, and is kept.

   The 0.5m tolerance is deliberate. OSM stores coordinates as integers at 1e-7
   degrees, so one unit in the last place is 1.11cm in Web Mercator, and nodes
   intended to sit at 180 are frequently stored as 179.9999999. Across the
   antimeridian data tested no vertex falls between 2cm and 1m of +/-180, while
   the nearest genuine boundary node is 13m out, so 0.5m separates them cleanly.

   The guard uses the && operator rather than the more obvious ST_XMax/ST_XMin
   because ST_XMax(geometry) casts to box3d, which reads every vertex, and
   the caller evaluates this expression once per output plus once per NULL/empty
   check. On a dense admin tile that measured ~3x the cost of the whole query,
   while && compares only the cached bounding box.

   Returns NULL when every segment was removed - ST_Collect over zero rows is
   NULL, so the result is never an empty geometry - and callers only need to
   discard NULL. */
CREATE OR REPLACE FUNCTION carto_filter_antimeridian(way geometry)
  RETURNS geometry
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
AS $$
SELECT
	CASE
		WHEN way && ST_MakeEnvelope(20037507.84, -20037509, 20037509, 20037509, 3857)
		  OR way && ST_MakeEnvelope(-20037509, -20037509, -20037507.84, 20037509, 3857) THEN
			(SELECT ST_LineMerge(ST_Collect(s.geom))
				FROM ST_DumpSegments(way) s
				WHERE NOT (abs(abs(ST_X(ST_StartPoint(s.geom))) - 20037508.342789244) < 0.5
					AND abs(abs(ST_X(ST_EndPoint(s.geom))) - 20037508.342789244) < 0.5))
		ELSE way
	END
$$;

/* The width at a zoom level from a list of widths ending at z20, see above. */
CREATE OR REPLACE FUNCTION carto_width_at(widths numeric[], zoom integer)
  RETURNS float
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
AS $$
SELECT widths[array_length(widths, 1) - 20 + LEAST(zoom, 20)]::float
$$;

/* The widths of the roads, in pixels, by zoom level.

   This is the one place the road widths are defined. The roads layers join
   this table on the class of the road and the zoom level being drawn, and the
   style reads the widths from the line_width, casing_width and
   bridge_casing_width columns instead of holding them in CartoCSS variables.
   A change here is applied by loading this file again, which the Docker setup
   does whenever kosmtik is started:

     psql -d gis -f functions.sql

   For a road, line_width is its full width including the casing, which is
   casing_width wide on either side, or bridge_casing_width on a bridge. For
   the paths (footway, cycleway, bridleway, steps, track) it is the width of
   the line itself, which the style surrounds with a background of its own.
   For runways and taxiways the casing is drawn on bridges only, outside the
   line, and for roller coasters the bridge casing is added to the line.

   The widths are listed per zoom level up to z20, right aligned under the
   header, so the first width of a class belongs to the zoom level at which it
   is first drawn. Above z20 the z20 width applies. Classes can also be
   defined from other classes, see the end of the function: a class can be
   drawn like another one, or, say, 1.2 times as wide as another one at every
   zoom level.

   The casings hold the widths as the style has drawn them so far, which in a
   few places are not the casing widths it defined: the casing was only
   declared again at the zoom levels where the width of the road changed, so
   where it did not change the casing of the zoom level before stayed in use.
   Those values are marked. */
CREATE OR REPLACE FUNCTION carto_line_widths(zoom integer)
  RETURNS TABLE (class text, line_width float, casing_width float, bridge_casing_width float)
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
  -- also keeps the planner from inlining the function into the layer queries, so
  -- that its rows are built once per query and joined from a hash rather than
  -- being rebuilt for every road
  RETURNS NULL ON NULL INPUT
AS $$
WITH
  road(class, casing, bridge_casing, widths) AS (VALUES
    --                                               z6   z7   z8   z9   z10  z11  z12  z13  z14  z15  z16  z17  z18  z19  z20
    ('motorway',       'major',     'major',     ARRAY[  0.4, 0.8, 1,   1.4, 1.9, 2.0, 3.5, 6,   6,   10,  10,  18,  21,  27,  33]),
    ('motorway_link',  'link',      'minor',     ARRAY[                      1.9, 2.0, 1.5, 4,   4,   7.8, 7.8, 12,  13,  16,  17]),
    ('trunk',          'major',     'major',     ARRAY[  0.4, 0.6, 1,   1.4, 1.9, 1.9, 3.5, 6,   6,   10,  10,  18,  21,  27,  27]),
    ('trunk_link',     'link',      'minor',     ARRAY[                      1.9, 1.9, 1.5, 4,   4,   7.8, 7.8, 12,  13,  16,  16]),
    ('primary',        'major',     'major',     ARRAY[            1,   1.4, 1.8, 1.8, 3.5, 5,   5,   10,  10,  18,  21,  27,  27]),
    ('primary_link',   'link',      'minor',     ARRAY[                      1.8, 1.8, 1.5, 4,   4,   7.8, 7.8, 12,  13,  16,  16]),
    ('secondary',      'secondary', 'secondary', ARRAY[                 1,   1.1, 1.1, 3.5, 5,   5,   9,   10,  18,  21,  27,  27]),
    ('secondary_link', 'link',      'minor',     ARRAY[                      1.1, 1.1, 1.5, 4,   4,   7,   7,   12,  13,  16,  16]),
    ('tertiary',       'minor',     'minor',     ARRAY[                      0.7, 0.7, 2.5, 4,   5,   9,   10,  18,  21,  27,  27]),
    ('tertiary_link',  'link',      'minor',     ARRAY[                      0.7, 0.7, 1.5, 3,   3,   7,   7,   12,  13,  16,  16]),
    ('unclassified',   'minor',     'minor',     ARRAY[                                0.8, 2.5, 3,   5,   6,   12,  13,  17,  17]),
    ('residential',    'minor',     'minor',     ARRAY[                                0.5, 2.5, 3,   5,   6,   12,  13,  17,  17]),
    ('living_street',  'minor',     'minor',     ARRAY[                                     2,   3,   5,   6,   12,  13,  17,  17]),
    ('road',           'service',   'service',   ARRAY[                      1,   1,   1,   1,   2,   2,   3.5, 7,   8.5, 11,  11]),
    ('service',        'service',   'service',   ARRAY[                                          2,   2,   3.5, 7,   8.5, 11,  12]),
    ('service_minor',  'minor',     'minor',     ARRAY[                                                    2,   3.5, 4.75,5.5, 8.5]),
    ('footway',        NULL,        NULL,        ARRAY[                                          0.7, 1,   1.3, 1.3, 1.3, 1.6, 1.6]),
    ('cycleway',       NULL,        NULL,        ARRAY[                                     0.7, 0.7, 0.9, 0.9, 0.9, 1,   1.3, 1.3]),
    ('bridleway',      NULL,        NULL,        ARRAY[                                     0.3, 0.3, 1.2, 1.2, 1.2, 1.2, 1.2, 1.2]),
    ('steps',          NULL,        NULL,        ARRAY[                                          0.7, 3,   3,   3,   3,   3,   3]),
    ('track',          NULL,        NULL,        ARRAY[                                     0.5, 0.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5]),
    ('runway',         'runway',    NULL,        ARRAY[                           2,   4,   6,   12,  18,  24,  24,  24,  24,  24]),
    ('taxiway',        'secondary', NULL,        ARRAY[                           1,   1,   2,   4,   6,   8,   8,   8,   8,   8]),
    ('roller_coaster', NULL,        'minor',     ARRAY[                                               1,   2.5, 4,   6,   8,   12])
  ),
  -- the casings, on either side of the road
  casing(casing, widths) AS (VALUES
    --                   z12  z13  z14  z15  z16  z17  z18  z19  z20
    ('major',        ARRAY[  0.5, 0.5, 0.5, 0.7, 0.7, 1,   1,   1,   1]),   -- z14: the casing of z13
    ('runway',       ARRAY[            0.6, 0.7, 0.7, 1,   1,   1,   1]),   -- the major casing as defined
    ('secondary',    ARRAY[  0.3, 0.35,0.35,0.7, 0.7, 1,   1,   1,   1]),
    ('link',         ARRAY[  0.3, 0.5, 0.5, 0.6, 0.6, 0.8, 0.8, 0.8, 0.8]), -- z14: the casing of z13
    ('minor',        ARRAY[  0.3, 0.5, 0.55,0.6, 0.6, 0.8, 0.8, 0.8, 0.8]),
    ('service',      ARRAY[            0.55,0.55,0.6, 0.8, 0.8, 0.8, 0.8])  -- z15: the casing of z14
  ),
  bridge_casing(bridge_casing, widths) AS (VALUES
    ('major',        ARRAY[  0.5, 0.5, 0.5, 0.75,0.75,1,   1,   1,   1]),   -- z14: the casing of z13
    ('secondary',    ARRAY[  0.1, 0.5, 0.6, 0.75,0.75,1,   1,   1,   1]),   -- z12: the casing of the minor roads
    ('minor',        ARRAY[  0.1, 0.5, 0.5, 0.75,0.75,0.8, 0.8, 0.8, 0.8]),
    ('service',      ARRAY[            0.5, 0.5, 0.75,0.8, 0.8, 0.8, 0.8])  -- z15: the casing of z14
  ),
  -- the classes at this zoom level
  width AS (
    SELECT class, casing, bridge_casing, carto_width_at(widths, zoom) AS line_width
      FROM road
  ),
  -- classes drawn like another class
  width_all AS (
    SELECT * FROM width
    UNION ALL SELECT 'path', casing, bridge_casing, line_width FROM width WHERE class = 'footway'
    UNION ALL SELECT 'pedestrian', casing, bridge_casing, line_width FROM width WHERE class = 'living_street' AND zoom >= 14
  )
SELECT
    width_all.class,
    width_all.line_width,
    COALESCE(carto_width_at(casing.widths, zoom), 0) AS casing_width,
    COALESCE(carto_width_at(bridge_casing.widths, zoom), 0) AS bridge_casing_width
  FROM width_all
    LEFT JOIN casing USING (casing)
    LEFT JOIN bridge_casing USING (bridge_casing)
  WHERE width_all.line_width IS NOT NULL
$$;
