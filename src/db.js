const { Pool } = require('pg')

const pool = new Pool({
	host: 'localhost',
	port: 5432,
	database: 'userdata',
})

module.exports = pool
