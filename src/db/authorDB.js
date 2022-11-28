const conn = require('./connection');

const findAll = () => conn.query('SELECT * FROM autor');

const findByID = (id) => conn.query('SELECT * FROM autor WHERE id_autor = $1', [id]);

const insert = (author) => conn.query(
  `
  INSERT INTO autor
    (primeironome_autor, sobrenome_autor)
  VALUES
    ($1, $2)
  RETURNING *
  `,
  [author.firstName, author.lastName]
);

module.exports = {
  findAll,
  findByID,
  insert,
};
