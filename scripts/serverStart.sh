#! /bin/bash

echo "Starting a PostgreSQL server in the database/data database cluster on port 5444"
# We first need to kill any running processes on port 5444
if [[ $OSTYPE == 'darwin'* ]]; then
	eval lsof -ti tcp:5444 | xargs kill -9
else
	eval lsof -ti tcp:5444 | xargs --no-run-if-empty kill -9
fi

eval "pg_ctl start -l Postgres/postgresql.log -o \"-F -p 5444\" -D Postgres/data"
