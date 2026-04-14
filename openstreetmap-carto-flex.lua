
-- This is the osm2pgsql configuration for the OpenStreetMap Carto map style
-- using the osm2pgsql flex output.

-- It is written in a way that it can be used with or without the Themepark
-- framework. For more about Themepark see https://osm2pgsql.org/themepark/ .

-- ---------------------------------------------------------------------------

-- CONFIGURATION

-- Prefix for all output table names.
--
-- (This used to be set with the --prefix command line option, but note the
-- trailing '_' letter which was not needed with the command line option.)
local PREFIX = 'planet_osm_'

-- Set this to the database schema.
--
-- (This used to be set with the --output-pgsql-schema command line option.)
local SCHEMA = 'public'

-- ---------------------------------------------------------------------------

-- Needed for use with the Themepark framework
local themepark = ...

-- ---------------------------------------------------------------------------

-- A list of columns per table in the order they will appear in the database
-- tables. Columns can either be
-- * a string ('highway') in which case they will be added as 'text' column or
-- * a Lua table with a column definition for the define_table() command.
local table_columns = {
    point = {
        'access',
        'addr:housename',
        'addr:housenumber',
        'admin_level',
        'aerialway',
        'aeroway',
        'amenity',
        'barrier',
        'boundary',
        'building',
        'highway',
        'historic',
        'junction',
        'landuse',
        { column = 'layer', type = 'int4' },
        'leisure',
        'lock',
        'man_made',
        'military',
        'name',
        'natural',
        'oneway',
        'place',
        'power',
        'railway',
        'ref',
        'religion',
        'shop',
        'tourism',
        'water',
        'waterway',
        { column = 'tags', type = 'hstore' },
    },
    line = {
        'access',
        'addr:housename',
        'addr:housenumber',
        'addr:interpolation',
        'admin_level',
        'aerialway',
        'aeroway',
        'amenity',
        'barrier',
        'bicycle',
        'bridge',
        'boundary',
        'building',
        'construction',
        'covered',
        'foot',
        'highway',
        'historic',
        'horse',
        'junction',
        'landuse',
        { column = 'layer', type = 'int4' },
        'leisure',
        'lock',
        'man_made',
        'military',
        'name',
        'natural',
        'oneway',
        'place',
        'power',
        'railway',
        'ref',
        'religion',
        'route',
        'service',
        'shop',
        'surface',
        'tourism',
        'tracktype',
        'tunnel',
        'water',
        'waterway',
        { column = 'way_area', type = 'real' },
        { column = 'z_order', type = 'int4' },
        { column = 'tags', type = 'hstore' },
    },
}

-- The columns for the roads and polygon tables are the same as for the line
-- table, so just reuse them. (Note: This is not a deep copy!)
table_columns.roads = table_columns.line
table_columns.polygon = table_columns.line

-- These are the database table definitions. They will be combined with the
-- column definitions above to create the final definitions.
--
-- (The index definitions reflect the index definitions in indexes.[sql|yml]
-- but have been commented out so that the behaviour of the configuration is
-- the same as before. The index definitions here can be used instead of the
-- ones in indexes.[sql|yml], the indexes will be the same except that it is
-- currently not possible to name the indexes.)
local table_definitions = {
    point = {
        geometry_type = 'point',
        ids = { type = 'node' },
    },
    line = {
        geometry_type = 'linestring',
        ids = { type = 'way' },
    },
    roads = {
        geometry_type = 'linestring',
        ids = { type = 'way' },
    },
    polygon = {
        geometry_type = 'geometry',
        ids = { type = 'area' },
    },
}

-- This will contain the database tables after they have been initialized.
local tables = {}

-- Contain a hash with all text columns for the point table and all other
-- tables, respectively.
-- Used to quickly check whether a columns of a given name exists.
local columns_in_point_table = {}
local columns_in_non_point_tables = {}

-- Combine the table definitions and the column definitions from above to
-- the final definitions and create the tables.
for name, definition in pairs(table_definitions) do
    definition.name = PREFIX .. name
    definition.schema = SCHEMA
    definition.ids.id_column = 'osm_id'
    definition.columns = {}
    definition.geom = {
        column = 'way',
        type = definition.geometry_type,
        not_null = true
    }

    -- Add column definitions to table definitions
    for _, column in ipairs(table_columns[name]) do
        if type(column) == 'table' then
            table.insert(definition.columns, column)
        else
            table.insert(definition.columns, { column = column, type = 'text' })

            if name == 'point' then
                columns_in_point_table[column] = true
            elseif name == 'line' then
                columns_in_non_point_tables[column] = true
            end
        end
    end

    if themepark then
        themepark:add_table(definition)
    else
        table.insert(definition.columns, definition.geom)
        tables[name] = osm2pgsql.define_table(definition)
    end
end

-- Objects with any of the following keys will be treated as polygon
local polygon_keys = {
    'abandoned:aeroway',
    'abandoned:amenity',
    'abandoned:building',
    'abandoned:landuse',
    'abandoned:power',
    'aeroway',
    'allotments',
    'amenity',
    'area:highway',
    'craft',
    'building',
    'building:part',
    'club',
    'golf',
    'emergency',
    'harbour',
    'healthcare',
    'historic',
    'landuse',
    'leisure',
    'man_made',
    'military',
    'natural',
    'office',
    'place',
    'power',
    'public_transport',
    'shop',
    'tourism',
    'water',
    'wetland',
}

-- Objects with any of the following key/value combinations will be treated as linestring
local linestring_values = {
    golf      = { cartpath = true, hole = true, path = true },
    emergency = { designated = true, destination = true, no = true,
                  official = true, yes = true },
    historic  = { citywalls = true },
    leisure   = { track = true, slipway = true },
    man_made  = { breakwater = true, cutline = true, embankment = true,
                  groyne = true, pipeline = true },
    natural   = { cliff = true, earth_bank = true, tree_row = true,
                  ridge = true, arete = true },
    power     = { cable = true, line = true, minor_line = true },
    tourism   = { yes = true },
}

-- Objects with any of the following key/value combinations will be treated as polygon
local polygon_values = {
    aerialway = { station = true },
    boundary  = { aboriginal_lands = true, national_park = true,
                  protected_area = true },
    highway   = { services = true, rest_area = true },
    junction  = { yes = true },
    railway   = { station = true },
    waterway  = { boatyard = true, dam = true, dock = true, fuel = true,
                  riverbank = true },
}

-- Tags with the following keys will be igored
local ignore_keys = {
    'note',
    'source',
    'source:addr',
    'source:date',
    'source_ref',
    'attribution',
    'comment',
    'fixme',

    -- Tags generally dropped by editors, not otherwise covered
    'created_by',
    'odbl',

    -- Lots of import tags
    -- EUROSHA (Various countries)
    'project:eurosha_2012',
    -- UrbIS (Brussels, BE)
    'ref:UrbIS',
    -- NHN (CA)
    'accuracy:meters',
    'waterway:type',
    -- StatsCan (CA)
    'statscan:rbuid',
    -- RUIAN (CZ)
    'ref:ruian:addr',
    'ref:ruian:building',
    'ref:ruian',
    'building:ruian:type',
    -- DIBAVOD (CZ)
    'dibavod:id',
    -- UIR-ADR (CZ)
    'uir_adr:ADRESA_KOD',
    -- GST (DK)
    'gst:feat_id',
    -- osak (DK)
    'osak:identifier',
    -- Maa-amet (EE)
    'maaamet:ETAK',
    -- FANTOIR (FR)
    'ref:FR:FANTOIR',
    -- OPPDATERIN (NO)
    'OPPDATERIN',
    -- Various imports (PL)
    'addr:city:simc',
    'addr:street:sym_ul',
    'building:usage:pl',
    'building:use:pl',
    -- TERYT (PL)
    'teryt:simc',
    -- RABA (SK)
    'raba:id',
    -- LINZ (NZ)
    'linz2osm:objectid',
    -- DCGIS (Washington DC, US)
    'dcgis:gis_id',
    -- Building Identification Number (New York, US)
    'nycdoitt:bin',
    -- Chicago Building Import (US)
    'chicago:building_id',
    -- Louisville, Kentucky/Building Outlines Import (US)
    'lojic:bgnum',
    -- MassGIS (Massachusetts, US)
    'massgis:way_id',
    -- TIGER (US)
    'tiger:cfcc',
    'tiger:county',
    'tiger:reviewed',

    -- misc
    'import',
    'SK53_bulk:load',
    'addr:TW:dataset',
    'at_bev:addr_date',
    'mml:class',
    'nysgissam:nysaddresspointid',
    'ref:RS:kucni_broj',
    'ref:bygningsnr',
    'ref:minvskaddress',
}

-- Tags with the following key prefixes will be ignored.
local ignore_key_prefixes = {
    'note:',
    'source:',

    -- Corine (CLC) (Europe)
    'CLC:',
    -- Geobase (CA)
    'geobase:',
    -- CanVec (CA)
    'canvec:',
    -- Geobase (CA)
    'geobase:',
    -- Friuli Venezia Giulia (IT)
    'it:fvg:',
    -- KSJ2 (JA)
    -- See also note:ja and source_ref above
    'KSJ2:',
    -- Yahoo/ALPS (JA)
    'yh:',
    -- LINZ (NZ)
    'LINZ2OSM:',
    'LINZ:',
    -- Naptan (UK)
    'naptan:',
    -- TIGER (US)
    'tiger:',
    -- GNIS (US)
    'gnis:',
    -- National Hydrography Dataset (US)
    'NHD:',
    'nhd:',
    -- mvdgis (Montevideo, UY)
    'mvdgis:',
    -- Land Information New Zealand
    'ref:linz:',
    -- Los Angeles County
    'lacounty:',
}

-- Big table for z_order and roads status for certain tags.
-- The road status (true/false) determines whether or not the feature will be
-- added to the 'roads' table.
-- z=0 is turned into nil by the z_order function.
-- Road z values are divided by 10 for objects tagged as highway=construction,
-- construction=[HIGHWAY_CLASS], so must be multiples of 10.
local roads_info = {
    highway = {
        motorway        = { z = 380, roads = true },
        trunk           = { z = 370, roads = true },
        primary         = { z = 360, roads = true },
        secondary       = { z = 350, roads = true },
        tertiary        = { z = 340, roads = false },
        residential     = { z = 330, roads = false },
        unclassified    = { z = 330, roads = false },
        road            = { z = 330, roads = false },
        living_street   = { z = 320, roads = false },
        pedestrian      = { z = 310, roads = false },
        raceway         = { z = 300, roads = false },
        motorway_link   = { z = 240, roads = true },
        trunk_link      = { z = 230, roads = true },
        primary_link    = { z = 220, roads = true },
        secondary_link  = { z = 210, roads = true },
        tertiary_link   = { z = 200, roads = false },
        busway          = { z = 190, roads = false },
        bus_guideway    = { z = 180, roads = false },
        service         = { z = 150, roads = false },
        track           = { z = 110, roads = false },
        path            = { z = 100, roads = false },
        footway         = { z = 100, roads = false },
        bridleway       = { z = 100, roads = false },
        cycleway        = { z = 100, roads = false },
        steps           = { z =  90, roads = false },
        platform        = { z =  90, roads = false },
    },
    railway = {
        rail            = { z = 440, roads = true },
        subway          = { z = 420, roads = true },
        narrow_gauge    = { z = 420, roads = true },
        light_rail      = { z = 420, roads = true },
        funicular       = { z = 420, roads = true },
        preserved       = { z = 420, roads = false },
        monorail        = { z = 420, roads = false },
        miniature       = { z = 420, roads = false },
        turntable       = { z = 420, roads = false },
        tram            = { z = 410, roads = false },
        disused         = { z = 400, roads = false },
        construction    = { z = 400, roads = false },
        platform        = { z =  90, roads = false },
    },
    aeroway = {
        runway          = { z =  60, roads = false },
        taxiway         = { z =  50, roads = false },
    },
    boundary = {
        administrative  = { z =   0, roads = true },
    },
}

local excluded_railway_service = {
    spur = true,
    siding = true,
    yard = true,
}

-- Bring the polygon keys into hash table
local polygon_lookup = {}
for n = 1, #polygon_keys do
    polygon_lookup[polygon_keys[n]] = true
end

-- Bring the keys we want to ignore into hash table for fast lookup
-- The 'layer' tag is is a special case
local ignore_keys_lookup = { layer = true }
for n = 1, #ignore_keys do
    ignore_keys_lookup[ignore_keys[n]] = true
end

local ignore_key_prefixes_lookup = {}
for _, prefix in ipairs(ignore_key_prefixes) do
    local length = string.len(prefix)
    if not ignore_key_prefixes_lookup[length] then
        ignore_key_prefixes_lookup[length] = {}
    end
    ignore_key_prefixes_lookup[length][prefix] = true
end

-- ---------------------------------------------------------------------------

-- Gets the z_order and roads table status for a set of tags.
--
-- @param tags OSM tags
-- @return z_order: if an object with z_order, otherwise nil
--         in_roads: should object be added to roads_table? (true or false)
--
local function calculate_z_order(tags)
    local z_order = 0
    local in_roads = false

    for key, value in pairs(tags) do
        local ri = roads_info[key]
        if ri and ri[value] then
            z_order = math.max(z_order, ri[value].z)
            if in_roads == false and ri[value].roads then
                if not (key ~= 'railway' or tags.service) then
                    in_roads = true
                end
                if not excluded_railway_service[tags.service] then
                    in_roads = true
                end
            end
        end
    end

    if tags.highway == 'construction' then
        if tags.construction and roads_info.highway[tags.construction] then
            z_order = math.max(z_order, roads_info.highway[tags.construction].z / 10)
        else
            -- For unknown roads, assume highway=road
            z_order = math.max(z_order, roads_info.highway.road.z / 10)
        end
    end

    return z_order ~= 0 and z_order or nil, in_roads
end

-- Check if an object with given tags should be treated as polygon
--
-- @param tags OSM tags
-- @return true if area, false if linear
--
local function is_area(tags)
    local area_tag = tags.area
    if area_tag then
        return area_tag == 'yes'
    end

    for key, value in pairs(tags) do
        if value ~= 'no' then
            if polygon_lookup[key] then
                local lv = linestring_values[key]
                if not (lv and lv[value]) then
                    return true
                end
            end

            local pv = polygon_values[key]
            if pv and pv[value] then
                return true
            end
        end
    end

    return false
end

-- Normalizes layer tags to integers
--
-- @param value The layer tag value
-- @return The input value if it is an integer between -100 and 100, or nil
--         otherwise. (Can be changed to return 0 if that's more convenient.)
--
local function normalize_layer(value)
    -- check if value exists, is numeric, and is in range
    if value and string.find(value, '^-?%d+$') then
        value = tonumber(value)
        if value < 100 and value > -100 then
            return value
        end
    end
    return nil
end

-- Decide whether to keep this tag.
--
-- @param key The tag key
-- @return true of false
local function keep_tag(key)
    if ignore_keys_lookup[key] then
        return false
    end

    for length, lookup in pairs(ignore_key_prefixes_lookup) do
        local prefix = string.sub(key, 1, length)
        if lookup[prefix] then
            return false
        end
    end

    return true
end

-- Prepare columns based on tags. Some tags go into their own columns, the
-- rest will be put into the hstore column called "tags".
--
-- @param tags OSM tags
-- @param tag_map Lua table that contains the OSM tags that will get a dedicated column
-- @param ignore_type Set to 'true' to ignore 'type' tag
-- @return the contents for the columns
--
local function prepare_columns(tags, tag_map, ignore_type)
    local attrs = { tags = {}, layer = normalize_layer(tags.layer) }
    local found_tag = false

    for key, value in pairs(tags) do
        if tag_map[key] then
            attrs[key] = value
            found_tag = true
        elseif ignore_type and key == 'type' then -- luacheck: ignore 542
            -- do nothing
        elseif keep_tag(key) then
            attrs.tags[key] = value
            found_tag = true
        end
    end

    if not found_tag then
        return nil
    end

    return attrs
end

local insert_row
if themepark then
    insert_row = function(table_name, columns)
        themepark:insert(PREFIX .. table_name, columns, {}, {})
    end
else
    insert_row = function(table_name, columns)
        tables[table_name]:insert(columns)
    end
end

-- Add an object to the 'line' or 'roads' table.
local function add_linear(table_name, attrs, geom)
    for sgeom in geom:geometries() do
        attrs.way = sgeom
        insert_row(table_name, attrs)
    end
end

-- Add an object to the 'polygon' table.
local function add_polygon(attrs, geom)
    attrs.way = geom
    attrs.way_area = geom:area()
    insert_row('polygon', attrs)
end

local function process_node(object)
    local attrs = prepare_columns(object.tags, columns_in_point_table, false)
    if attrs == nil then
        return
    end

    attrs.way = object:as_point()
    insert_row('point', attrs)
end

local function process_way(object)
    local attrs = prepare_columns(object.tags, columns_in_non_point_tables, false)
    if attrs == nil then
        return
    end

    local in_roads
    attrs.z_order, in_roads = calculate_z_order(object.tags)

    if object.is_closed and is_area(object.tags) then
        add_polygon(attrs, object:as_polygon():transform(3857))
    else
        local geom = object:as_linestring():transform(3857):segmentize(100000)
        add_linear('line', attrs, geom)

        if in_roads then
            add_linear('roads', attrs, geom)
        end
    end
end

local function process_relation(object)
    local attrs = prepare_columns(object.tags, columns_in_non_point_tables, true)
    if attrs == nil then
        return
    end

    local in_roads
    attrs.z_order, in_roads = calculate_z_order(object.tags)

    local type = object.tags.type
    if type == 'boundary' or (type == 'multipolygon' and object.tags.boundary) or type == 'route' then
        local geom = object:as_multilinestring():line_merge():transform(3857):segmentize(100000)
        add_linear('line', attrs, geom)

        if in_roads then
            add_linear('roads', attrs, geom)
        end

        add_polygon(attrs, object:as_multipolygon():transform(3857))
    elseif type == 'multipolygon' then
        add_polygon(attrs, object:as_multipolygon():transform(3857))
    end
end

if themepark then
    themepark:add_proc('node', process_node)
    themepark:add_proc('way', process_way)
    themepark:add_proc('relation', process_relation)
else
    osm2pgsql.process_node = process_node
    osm2pgsql.process_way = process_way
    osm2pgsql.process_relation = process_relation
end
