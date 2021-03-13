Author = require('../middlewares/models/').Author


module.exports= {

     //Get a list of all authors using model.findAll()
  index(req, res) {
    Author.findAll({
      //Return all books that have a matching author_id for each Author
      // include: Book
    })
      .then(function (authors) {
        res.status(200).json(authors);
      })
      .catch(function (error) {
        res.status(500).json(error);
      });
  },
     //Create a new author using model.create()
  create(req, res) {
    Author.create(req.body)
      .then(function (newAuthor) {
        res.status(200).json(newAuthor);
      })
      .catch(function (error){
        res.status(500).json(error);
      });
  },
}