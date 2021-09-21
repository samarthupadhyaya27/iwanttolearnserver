#! /bin/bash

# Chance relative path to script's location
cd "$(dirname "${BASH_SOURCE[0]}")"

# Start the database
eval "pg_ctl -D ../Postgres/data -l ../Postgres/logfile -o \"-F -p 5432\" start"