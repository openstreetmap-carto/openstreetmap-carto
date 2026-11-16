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

/* Return the POI feature of an object, e.g. 'amenity_cafe' or 'shop', or NULL if the
   style has no POI rendering for it. Whether a shop or office value has one depends on
   the carto_pois table; that lookup is passed in as shop_rendered and office_rendered
   so the function contains no query and can be inlined. */
CREATE OR REPLACE FUNCTION carto_poi_feature(
    aeroway text, amenity text, barrier text, boundary text, highway text, historic text,
    landuse text, leisure text, man_made text, military text, "natural" text, place text,
    power text, shop text, tourism text, waterway text, "access" text, tags hstore,
    way_area real, shop_rendered boolean, office_rendered boolean
  )
  RETURNS text
  LANGUAGE SQL
  IMMUTABLE PARALLEL SAFE
AS $$
SELECT
  COALESCE(
    'aeroway_' || CASE WHEN aeroway IN ('gate', 'apron', 'helipad', 'aerodrome') THEN aeroway END,
    'tourism_' || CASE WHEN tourism IN ('alpine_hut', 'apartment', 'artwork', 'camp_site', 'caravan_site', 'chalet', 'gallery', 'guest_house',
                                        'hostel', 'hotel', 'motel', 'museum', 'picnic_site', 'theme_park', 'wilderness_hut',
                                        'zoo') THEN tourism END,
    'amenity_' || CASE WHEN amenity IN ('arts_centre', 'atm', 'bank', 'bar', 'bbq', 'bicycle_rental',
                                        'bicycle_repair_station','biergarten', 'boat_rental', 'bureau_de_change', 'bus_station', 'cafe',
                                        'car_rental', 'car_wash', 'casino', 'charging_station', 'childcare', 'cinema', 'clinic', 'college',
                                        'community_centre', 'courthouse', 'dentist', 'doctors', 'drinking_water', 'driving_school',
                                        'fast_food', 'ferry_terminal', 'fire_station', 'food_court', 'fountain', 'fuel', 'grave_yard',
                                        'hospital', 'hunting_stand', 'ice_cream', 'internet_cafe', 'kindergarten', 'library', 'marketplace',
                                        'nightclub', 'nursing_home', 'pharmacy', 'place_of_worship', 'police', 'post_box',
                                        'post_office', 'prison', 'pub', 'public_bath', 'public_bookcase', 'recycling', 'restaurant', 'school',
                                        'shelter', 'shower', 'social_facility', 'taxi', 'telephone', 'theatre', 'toilets', 'townhall',
                                        'university', 'vehicle_inspection', 'veterinary') THEN amenity END,
    'amenity_' || CASE WHEN amenity IN ('waste_disposal') AND way_area IS NOT NULL THEN amenity END, -- Waste disposal points are rendered in the low priority layer
    'amenity_' || CASE WHEN amenity IN ('vending_machine') AND tags->'vending' IN ('excrement_bags', 'parking_tickets', 'public_transport_tickets') THEN amenity END,
    'amenity_' || CASE WHEN amenity IN ('parcel_locker') THEN amenity END,
    'diplomatic_'|| CASE WHEN tags->'office' IN ('diplomatic') AND tags->'diplomatic' IN ('embassy', 'consulate') THEN tags->'diplomatic' ELSE NULL END,
    'advertising_' || CASE WHEN tags->'advertising' in ('column') THEN tags->'advertising' END,
    'emergency_' || CASE WHEN tags->'emergency' IN ('phone') AND way_area IS NULL THEN tags->'emergency' END,
    'shop' || CASE WHEN shop_rendered THEN '' END,
    'leisure_' || CASE WHEN leisure IN ('amusement_arcade', 'beach_resort', 'bird_hide', 'bowling_alley', 'dance', 'dog_park', 'firepit', 'fishing',
                                        'fitness_centre', 'fitness_station', 'garden', 'golf_course', 'ice_rink', 'marina', 'miniature_golf',
                                        'outdoor_seating', 'park', 'picnic_table', 'pitch', 'playground',
                                        'sauna', 'slipway', 'sports_centre', 'stadium', 'swimming_area', 'swimming_pool', 'track', 'water_park') THEN leisure END,
    'power_' || CASE WHEN power IN ('plant', 'generator', 'substation') THEN power END,
    'man_made_' || CASE WHEN (man_made IN ('ceremonial_gate', 'chimney', 'communications_tower', 'crane', 'lighthouse', 'mast', 'obelisk', 'silo', 'storage_tank',
                                           'telescope', 'tower', 'wastewater_plant', 'water_tower', 'water_works', 'windmill', 'works')
                                AND (tags->'location' NOT IN ('roof', 'rooftop') OR NOT (tags ? 'location'))) THEN man_made END,
    'landuse_' || CASE WHEN landuse IN ('reservoir', 'basin', 'recreation_ground', 'village_green', 'quarry', 'vineyard', 'orchard', 'cemetery',
                                        'residential', 'garages', 'meadow', 'grass', 'allotments', 'forest', 'farmyard', 'farmland',
                                        'greenhouse_horticulture', 'retail', 'industrial', 'railway', 'commercial', 'brownfield', 'landfill',
                                        'construction', 'salt_pond', 'military', 'plant_nursery') THEN landuse END,
    'natural_' || CASE WHEN "natural" IN ('peak', 'volcano', 'saddle', 'cave_entrance') AND way_area IS NULL THEN "natural" END,
    'natural_' || CASE WHEN "natural" IN ('wood', 'water', 'mud', 'wetland', 'bay', 'spring', 'scree', 'shingle', 'bare_rock', 'sand', 'heath',
                                          'grassland', 'scrub', 'beach', 'glacier', 'tree', 'strait', 'cape', 'reef', 'peninsula')
                                          THEN "natural" END,
    'mountain_pass' || CASE WHEN tags->'mountain_pass' IN ('yes') THEN '' END, -- after natural=saddle to give priority to that tag on the same node
    'waterway_' || CASE WHEN "waterway" IN ('waterfall') AND way_area IS NULL THEN waterway END,
    'place_' || CASE WHEN place IN ('island', 'islet', 'square') THEN place END,
    'historic_' || CASE WHEN historic IN ('memorial', 'monument', 'archaeological_site', 'fort', 'castle', 'manor', 'city_gate')
                  THEN historic END,
    'military_'|| CASE WHEN military IN ('danger_area', 'bunker') THEN military END,
    'highway_' || CASE WHEN highway IN ('services', 'rest_area', 'bus_stop', 'elevator', 'traffic_signals') THEN highway END,
    'highway_'|| CASE WHEN tags->'ford' IN ('yes', 'stepping_stones') AND way_area IS NULL THEN 'ford' END,
    'boundary_' || CASE WHEN boundary IN ('aboriginal_lands', 'national_park')
                              OR (boundary = 'protected_area' AND tags->'protect_class' IN ('1','1a','1b','2','3','4','5','6'))
                              THEN boundary END,
    'leisure_' || CASE WHEN leisure IN ('nature_reserve') THEN leisure END,
    'tourism_' || CASE WHEN tourism IN ('information') AND tags->'information' IN ('audioguide', 'board', 'guidepost', 'office', 'map', 'tactile_map', 'terminal') THEN tourism END,
    'office' || CASE WHEN office_rendered THEN '' END,
    'barrier_' || CASE WHEN barrier IN ('toll_booth') AND way_area IS NULL THEN barrier END,
    'waterway_' || CASE WHEN waterway IN ('dam', 'dock') THEN waterway END,
    'waterway_' || CASE WHEN waterway IN ('weir') AND way_area IS NULL THEN waterway END,
    'amenity_' || CASE WHEN amenity IN ('bicycle_parking', 'motorcycle_parking') THEN amenity END,
    'amenity_' || CASE WHEN amenity IN ('parking') AND (tags->'parking' NOT IN ('underground') OR (tags->'parking') IS NULL) THEN amenity END,
    'amenity_' || CASE WHEN amenity IN ('parking_entrance')
                            AND tags->'parking' IN ('multi-storey', 'underground')
                            AND (access IS NULL OR access NOT IN ('private', 'no', 'customers', 'permit', 'delivery'))
                            AND way_area IS NULL
                       THEN amenity END,
    'tourism_' || CASE WHEN tourism IN ('viewpoint', 'attraction') THEN tourism END,
    'place_' || CASE WHEN place IN ('locality') AND way_area IS NULL THEN place END,
    'golf_' || CASE WHEN tags->'golf' IN ('pin') AND way_area IS NULL THEN tags->'golf' END
  )
$$;
