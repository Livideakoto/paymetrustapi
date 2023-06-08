const {register, users, user, login} = require('../controllers/auth');

const express = require('express');
const router = express.Router();

//Authentication routes
router.post('/register', register);
router.post('/login', login);

//User management routes
router.get('/users', users);
router.get('/users/:id', user);
router.get('/users/:id', user);

module.exports = router;