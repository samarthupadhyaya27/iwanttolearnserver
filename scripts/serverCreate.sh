# Chance relative path to script's location
cd "$(dirname "${BASH_SOURCE[0]}")"

echo "Deleting existing database if it exists"
# Delete database files if it already exists
if pg_isready -q -p 5432
then 
    echo "Found active server. Shutting down server..."
    eval ./serverStop.sh
    echo "Server closed"
else
    echo "No active server found. Continuing..."
fi
eval "rm -rf ../Postgres/data"
eval "initdb -D ../Postgres/data"

# Start the Server
./serverStart.sh

# Intialize the databsae
./setupDatabase.sh