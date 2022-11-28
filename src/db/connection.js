require('dotenv').config();
const Pool = require('pg').Pool;

const connection = new Pool({
  user: process.env.POSTGRES_USER,
  host: process.env.HOSTNAME,
  database: process.env.POSTGRES_DATABASE,
  password: process.env.POSTGRES_PASWORD,
  port: process.env.POSTGRES_PORT,
});

module.exports = connection;
