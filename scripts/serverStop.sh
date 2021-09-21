# Chance relative path to script's location
cd "$(dirname "${BASH_SOURCE[0]}")"

# Stop the server
eval "pg_ctl stop -D ../Postgres/data"