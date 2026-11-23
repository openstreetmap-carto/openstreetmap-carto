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
