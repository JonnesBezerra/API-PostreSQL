const Pool = require('pg').Pool;

const connection = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'Library',
  password: '1243',
  port: 5432,
});

module.exports = connection;
