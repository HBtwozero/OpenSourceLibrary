const express = require("express");
const cors = require("cors")
require('dotenv').config();
const pool = require('./database')

const DeveloperController = require('./controllers/DeveloperController')
const app = express()
const router = express.Router();

//MiddleWare
app.use(cors())
app.use(express.json())

const PORT = process.env.PORT || 5000

//Routes

app.get('/', function (req, res) {
    res.send('hello from ther server')
  })


app.get('/developer',DeveloperController.welcome);

// developer login
app.post('/developer/login', DeveloperController.login);

app.post('/developer/create', DeveloperController.create);


//Create Books
app.post("/books", async (req, res) =>{
    try {
        const {description} = req.body;

        const newBooks = await pool.query(
            "INSERT INTO books (description) VALUES($1) RETURNING *", 
            [description]
            )
        res.json(newBooks.rows[0])
    } catch (error) {
        console.error(error.message);
    }
})

//Get Todos
app.get("/books", async (req, res) =>{
    try {

        const allBooks = await pool.query("SELECT * FROM books" )
        res.json(allBooks.rows);
    } catch (error) {
        console.error(error.message);
    }
})


//Get a Book

app.get("/books/:id", async (req, res) =>{
    try {
        const {id} = req.params;

        const book = await pool.query(
            "SELECT * FROM books WHERE book_id = $1",
            [id] )
        res.json(book.rows[0]);
    } catch (error) {
        console.error(error.message);
    }
})

//Updata a book
app.put("/books/:id", async (req, res) =>{
    try {
        const {id} = req.params;
        const {description}= req.body;

       const updateBook = await pool.query(
      "UPDATE books SET description = $1 WHERE book_id = $2",
      [description, id]
    );
        res.json("Book was updated!");
    } catch (error) {
        console.error(error.message);
    }
})


//delete a book

app.delete("/books/:id", async (req, res) => {
  try {
    const { id } = req.params;
    const deleteBook= await pool.query("DELETE FROM books WHERE book_id = $1", [
      id
    ]);
    res.json("Book was deleted!");
  } catch (err) {
    console.log(err.message);
  }
});



// Implement 500 error route
app.use(function (err, req, res, next) {
    console.error(err.stack)
    res.status(500).send('Something is broken.')
  })
  
  // Implement 404 error route
  app.use(function (req, res, next) {
    res.status(404).send('Sorry we could not find that.')
  })


  // Start express app
app.listen(PORT, function() {
    console.log(`Server is running on: ${PORT}`)
  })