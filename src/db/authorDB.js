const conn = require('./connection');

const findAll = () => conn.query('SELECT * FROM autor ORDER BY id_autor ASC');

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

const update = (author, id) => conn.query(
  `UPDATE autor
  SET primeironome_autor = $1, sobrenome_autor = $2
  WHERE id_autor = $3`,
  [author.firstName, author.lastName, id]
);

const remove = (id) => conn.query(
  'DELETE FROM autor WHERE id_autor = $1',
  [id]
)

module.exports = {
  findAll,
  findByID,
  insert,
  update,
  remove,
};
