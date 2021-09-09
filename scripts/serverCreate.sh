echo "Deleting existing database if it exists"
# Delete database files if it already exists
eval "rm -rf Postgres/data"
eval "initdb -D Postgres/data"

# Start the database
eval "pg_ctl -D Postgres/data -l logfile start"

if [ -f "scripts/schemaSetupFiles/createDatabase.sql" ]; then
	eval psql -p 5432 -d postgres -f "scripts/schemaSetupFiles/createDatabase.sql"
