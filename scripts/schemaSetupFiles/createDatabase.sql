DROP DATABASE IF EXISTS userdata;
CREATE DATABASE userdata;
-- connect to userdata
\c userdata 

\i ./schemaSetupFiles/createTables.sql
\i ./schemaSetupFiles/initializeDatabase.sql