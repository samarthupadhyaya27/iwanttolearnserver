# Chance relative path to script's location
cd "$(dirname "${BASH_SOURCE[0]}")"

# Setup the database
if [ -f "schemaSetupFiles/createDatabase.sql" ]
then
    eval psql -p 5432 -d postgres -f "schemaSetupFiles/createDatabase.sql"
else
    echo "File 'schemaSetupFiles/createDatabse.sql' not found"
fi