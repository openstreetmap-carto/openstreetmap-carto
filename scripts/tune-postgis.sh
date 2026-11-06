#!/bin/sh

# Tuning for the Docker dev database.
# We want to optimize for quickly rendering tiles for fast developer feedback.
# Therefore, we prioritize latency over throughput.

set -e
export PGUSER="$POSTGRES_USER"

# Count how many CPUs we have.
NPROC="$(nproc)"
PER_GATHER="$((NPROC / 4))"
if [ "$PER_GATHER" -lt 2 ]; then
	PER_GATHER=2
fi

psql -c "ALTER SYSTEM SET work_mem='${PG_WORK_MEM:-16MB}';"
psql -c "ALTER SYSTEM SET maintenance_work_mem='${PG_MAINTENANCE_WORK_MEM:-256MB}';"

psql -c "ALTER SYSTEM SET max_worker_processes='${PG_MAX_WORKER_PROCESSES:-$NPROC}';"
psql -c "ALTER SYSTEM SET max_parallel_workers='${PG_MAX_PARALLEL_WORKERS:-$NPROC}';"
psql -c "ALTER SYSTEM SET max_parallel_workers_per_gather='${PG_MAX_PARALLEL_WORKERS_PER_GATHER:-$PER_GATHER}';"

psql -c "ALTER SYSTEM SET jit='${PG_JIT:-off}';"
