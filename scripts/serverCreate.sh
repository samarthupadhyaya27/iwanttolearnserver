# Chance relative path to script's location
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "Deleting existing database if it exists"
# Delete database files if it already exists
eval "pg_ctl stop -D ../Postgres/data"
eval "rm -rf ../Postgres/data"
eval "initdb -D ../Postgres/data"

# Start the database
eval "pg_ctl -D ../Postgres/data -l ../Postgres/logfile start"

if [ -f "schemaSetupFiles/createDatabase.sql" ]; then
	eval psql -p 5432 -d postgres -f "schemaSetupFiles/createDatabase.sql"
fi