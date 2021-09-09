echo "Deleting existing database if it exists"
eval "rm -rf Postgres/data"
eval "initdb -D Postgres/data"
