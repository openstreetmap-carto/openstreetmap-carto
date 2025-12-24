#!/bin/sh

# This script is used to start the import of kosmtik containers for the Docker development environment.
# You can read details about that in DOCKER.md

# Testing if database is ready
i=1
MAXCOUNT=60
echo "Waiting for PostgreSQL to be running"
while [ $i -le $MAXCOUNT ]
do
  pg_isready -q && echo "PostgreSQL running" && break
  sleep 2
  i=$((i+1))
done
test $i -gt $MAXCOUNT && echo "Timeout while waiting for PostgreSQL to be running"

case "$1" in
import)
  # Creating default database
  echo "Creating database"
  psql -c "SELECT 1 FROM pg_database WHERE datname = 'gis';" | grep -q 1 || createdb gis
  psql -d gis -c 'CREATE EXTENSION IF NOT EXISTS postgis;'
  psql -d gis -c 'CREATE EXTENSION IF NOT EXISTS hstore;'
  psql -d gis -c 'ALTER SYSTEM SET jit=off;' -c 'SELECT pg_reload_conf();'

  # Creating default import settings file editable by user and passing values for osm2pgsql
  if [ ! -e ".env" ]; then
    cat > .env <<EOF
# Environment settings for importing to a Docker container database
PG_WORK_MEM=${PG_WORK_MEM:-16MB}
PG_MAINTENANCE_WORK_MEM=${PG_MAINTENANCE_WORK_MEM:-256MB}
OSM2PGSQL_CACHE=${OSM2PGSQL_CACHE:-512}
OSM2PGSQL_NUMPROC=${OSM2PGSQL_NUMPROC:-1}
OSM2PGSQL_DATAFILE=${OSM2PGSQL_DATAFILE:-data.osm.pbf}
EXTERNAL_DATA_SCRIPT_FLAGS=${EXTERNAL_DATA_SCRIPT_FLAGS:-}
EOF
    chmod a+rw .env
    export OSM2PGSQL_CACHE=${OSM2PGSQL_CACHE:-512}
    export OSM2PGSQL_NUMPROC=${OSM2PGSQL_NUMPROC:-1}
    export OSM2PGSQL_DATAFILE=${OSM2PGSQL_DATAFILE:-data.osm.pbf}
  fi

  # Importing data to a database
  echo "Importing data from $OSM2PGSQL_DATAFILE"
  osm2pgsql \
  --cache $OSM2PGSQL_CACHE \
  --number-processes $OSM2PGSQL_NUMPROC \
  --database gis \
  --slim \
  --drop \
  --output flex \
  --style openstreetmap-carto-flex.lua \
  $OSM2PGSQL_DATAFILE

  # Setting up indexes and functions
  echo "Setting up indexes and functions"
  psql -d gis -f indexes.sql
  psql -d gis -f functions.sql

  # Downloading and importing needed shapefiles
  scripts/get-external-data.py $EXTERNAL_DATA_SCRIPT_FLAGS

  # Download fonts
  scripts/get-fonts.py
  ;;

kosmtik)
  # Creating default Kosmtik settings file
  if [ ! -e ".kosmtik-config.yml" ]; then
    cp /tmp/.kosmtik-config.yml .kosmtik-config.yml
  fi
  export KOSMTIK_CONFIGPATH=".kosmtik-config.yml"

  # Starting Kosmtik
  kosmtik serve project.mml --host 0.0.0.0
  # It needs Ctrl+C to be interrupted
  ;;

esac
