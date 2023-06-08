const { verify } = require('../tokenizer');

const checkToken = (req, res, next) => {
    const bearerHeader = req.headers['authorization'];

    if(typeof bearerHeader !== 'undefined'){
        const bearer = bearerHeader.split(' ');
        const decoded = verify(bearer[1]);
        
        if(decoded)
            next();
        else
            res.sendStatus(403);
    }else{
        res.sendStatus(403);
    }
};

module.exports = {
    checkToken
}