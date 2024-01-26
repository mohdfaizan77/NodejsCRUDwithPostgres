const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv').config();

const app = express();
const port = process.env.PORT

const { client } = require('./databasepg');

// Middleware to parse incoming JSON requests
app.use(bodyParser.json());

// Route to handle CRUD operations------------------------>

// Create a new book
app.post('/createnewbook', async (req, res) => {
  try {
    const { book_id, title, published_year, author_id } = req.body;
    const result = await client.query('INSERT INTO books (book_id, title, published_year, author_id) VALUES ($1, $2, $3, $4) RETURNING *', [book_id, title, published_year, author_id]);
    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error('Error creating book:', error);
    res.status(500).send('Internal Server Error');
  }
});

// Get all books
app.get('/books', async (req, res) => {
  try {
    const result = await client.query('SELECT * FROM books;');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching books:', error);
    res.status(500).send('Internal Server Error');
  }
});

app.get('/', (req, res) => {
  res.send('Working');
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// Handle graceful shutdown
process.on('SIGINT', async () => {
  console.log('Received SIGINT. Closing server and database connection.');
  await client.end();
  process.exit();
});
