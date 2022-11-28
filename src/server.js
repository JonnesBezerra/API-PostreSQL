const app = require('./app');
const connection = require('./db/connection');

const PORT = 3001;

app.listen(PORT, async () => {
  console.log(`Listening to the port ${PORT}!`);

  const result = await connection.query('SELECT 1');
  if (result) {
    console.log('Postgres connection OK');
  } else {
    console.log('NO CONNECTION!!!')
  };
});
