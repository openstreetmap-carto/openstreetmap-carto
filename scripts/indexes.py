#!/usr/bin/env python3

# This script takes a YAML file defining indexes and creates SQL statements
# There are a number of options for concurrent index creation, recreating the
# osm2pgsql-built indexes, fillfactors, and other settings to give full control
# of the resulting statements
# indexes.sql is created by this script, with the default options

import argparse, sys, os, yaml

parser = argparse.ArgumentParser(description='Generates custom index statements')
parser.add_argument('--concurrent', dest='concurrent', help='Generate indexes CONCURRENTLY', action='store_true', default=False)
parser.add_argument('--fillfactor', help='Custom fillfactor to use')
parser.add_argument('--notexist', help='Use IF NOT EXISTS (requires 9.5)', action='store_true', default=False)
parser.add_argument('--osm2pgsql', help='Include indexes normally built by osm2pgsql', action='store_true', default=False)
parser.add_argument('--reindex', help='Rebuild existing indexes', action='store_true', default=False)
parser.add_argument('--null', '-0', help='SQL statements are terminated by a null character instead of whitespace for use with xargs', action='store_true', default=False)
args = parser.parse_args()

separator = '\0' if args.null else '\n'

def index_statement(table, name, function, conditions=None, concurrent=False,notexist=False, fillfactor=None):
    options = ' CONCURRENTLY' if concurrent else ''
    options += ' IF NOT EXISTS' if notexist else ''
    storage = '' if fillfactor is None else f' WITH (fillfactor={fillfactor})'
    where = '' if conditions is None else f' WHERE {conditions}'

    return f'CREATE INDEX{options} planet_osm_{table}_{name} ON planet_osm_{table} USING GIST ({function}){storage}{where};'.replace('\n', ' ')

def parse(index_function):
    with open(os.path.join(os.path.dirname(__file__), '../indexes.yml')) as yaml_file:
        indexes = yaml.safe_load(yaml_file)

    for table, data in sorted(indexes.items()):
        for name, definition in sorted(data.items()):
            print(index_function(table, name, definition.get("function", "way"), definition["where"]), end=separator)

# The same as parse, but for osm2pgsql-built indexes
def osm2pgsql_parse(index_function):
    print(index_function('point', 'way_idx', 'way', None), end=separator)
    print(index_function('line', 'way_idx', 'way', None), end=separator)
    print(index_function('polygon', 'way_idx', 'way', None), end=separator)
    print(index_function('roads', 'way_idx', 'way', None), end=separator)

def generate_statement(table, name, function, where):
    return index_statement(table, name, function, where, args.concurrent, args.notexist, args.fillfactor)

def generate_reindex_statement(table, name, function, where):
    if not args.concurrent:
        return f'REINDEX planet_osm_{table}_{name};'
    else:
        # Rebuilding indexes concurrently requires making a new index, dropping the old one, and renaming.
        return f'ALTER INDEX planet_osm_{table}_{name} RENAME TO planet_osm_{table}_{name}_old; {generate_statement(table, name, function, where)} + DROP INDEX planet_osm_{table}_{name}_old;'

print('-- These are indexes for rendering performance with OpenStreetMap Carto.', end=separator)
print('-- This file is generated with {}'.format(' '.join(sys.argv)), end=separator)

if not args.reindex:
    parse(generate_statement)
else:
    parse(generate_reindex_statement)

if args.osm2pgsql:
    print('-- These indexes are normally built by osm2pgsql', end=separator)
    if not args.reindex:
        osm2pgsql_parse(generate_statement)
    else:
        osm2pgsql_parse(generate_reindex_statement)
