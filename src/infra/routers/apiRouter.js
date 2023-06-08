const CategoriesController = require('../controllers/category');
const CommentsController = require('../controllers/comment');
const PostsController = require('../controllers/post');

const express = require('express');
const apiRouter = express.Router();

apiRouter.get('/', (req, res) => {
    res.send('Ok');
});

//Catégories
apiRouter.get('/categories', CategoriesController.all);
apiRouter.post('/categories', CategoriesController.add);
apiRouter.get('/categories/:id', CategoriesController.get);
apiRouter.post('/categories/:id', CategoriesController.update);
apiRouter.delete('/categories/:id', CategoriesController.delete);

//Posts
apiRouter.get('/posts', PostsController.all);
apiRouter.post('/posts', PostsController.add);
apiRouter.get('/posts/:id', PostsController.get);
apiRouter.post('/posts/:id', PostsController.update);
apiRouter.delete('/posts/:id', PostsController.delete);

//Commentaires
apiRouter.get('/posts/:id/comments', CommentsController.all);
apiRouter.post('/posts/:id/comments', CommentsController.add);
apiRouter.get('/posts/:id/comments/:comment', CommentsController.get);
apiRouter.delete('/posts/:id/comments/:comment', CommentsController.delete);

module.exports = apiRouter;