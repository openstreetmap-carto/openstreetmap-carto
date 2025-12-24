#!/bin/sh

set -e
export PGUSER="$POSTGRES_USER"

psql -c "ALTER SYSTEM SET work_mem='${PG_WORK_MEM:-16MB}';"
psql -c "ALTER SYSTEM SET maintenance_work_mem='${PG_MAINTENANCE_WORK_MEM:-256MB}';"
