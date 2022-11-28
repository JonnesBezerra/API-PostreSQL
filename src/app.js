const express = require('express');
const bodyParser = require('body-parser');
const authorsRoutes = require('./routes/authorsRoutes');

const app = express();

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use('/', authorsRoutes);

module.exports = app;
