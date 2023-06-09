const authRouter = require('./routers/authRouter');
const apiRouter = require('./routers/apiRouter');
const { checkToken } = require('./middleware/tokenized');

require('dotenv').config();

const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT;

app.use(cors());
app.use(bodyParser.json());
app.use(
    bodyParser.urlencoded({
      extended: true,
    })
)

//Token Middleware assignation
app.use('/api', checkToken);

//Routers
app.use('/auth', authRouter);
app.use('/api', apiRouter);


app.listen(port, () => {
    console.log(`Paymetrust API listening on port ${port}`)
});
  