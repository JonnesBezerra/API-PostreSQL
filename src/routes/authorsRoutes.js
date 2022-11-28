const express = require('express');
const authorDB = require('../db/authorDB');

const router = express.Router();

router.get('/', async (request, response) => {
  try {
    const { rows } = await authorDB.findAll();
    response.status(201).json(rows);
  } catch (erro) {
    console.log(erro);
    response.status(500).json({ message: erro.sqlMessage });
  }
});

router.get('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const { rows } = await authorDB.findByID(id);
    if (rows.length) {
      response.status(201).json(...rows);
    } else {
      response.status(404).json({ message: 'Author not found' });
    }
  } catch (error) {
    console.log(error);
    response.status(500).json({ message: error.sqlMessage });
  }
});

router.post('/', async (request, response) => {
  const author = request.body;
  try {
    const { rows } = await authorDB.insert(author);
    response.status(201).json({
      message: `Author registered successfully with id: ${rows[0].id_autor}`
    });
  } catch (error) {
    console.log(error);
    response.status(500).json({ message: error.sqlMessage });
  }
})

router.put('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const author = request.body;
    const { rowCount } = await authorDB.update(author, id);
    if (rowCount > 0) {
      response.status(200).json({ message: `Author with id ${id} was updated` });
    } else {
      res.status(404).json({ message: 'Author not found' });
    }
  } catch (error) {
    console.log(error);
    response.status(500).json({ message: error.sqlMessage });
  }
});

router.delete('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const { rowCount } = await authorDB.remove(id);
    if (rowCount > 0) {
      response.status(200).json({ message: `Author with id ${id} was deleted` });
    } else {
      res.status(404).json({ message: 'Author not found' });
    }
  } catch (error) {
    console.log(error);
    response.status(500).json({ message: error.sqlMessage });
  }
});

module.exports = router;
