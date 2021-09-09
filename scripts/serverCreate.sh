echo "Deleting existing database if it exists"
eval "rm -rf Postgres/data"
eval "initdb -D Postgres/data"
eval "pg_ctl -D Postgres/data -l logfile start"
