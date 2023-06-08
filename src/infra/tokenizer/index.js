var jwt = require('jsonwebtoken');

require('dotenv').config();
const SECRET = process.env.JWTSECRET;

const sign = (object, options) => {
    if(!options)
        options = {algorithm: 'HS256'};

    return jwt.sign(object, SECRET, options);
}

const verify = (token, options) => {
    if(!options)
        options = {algorithm: 'HS256'};

    try{
        let decoded = jwt.verify(token, SECRET, options);
        return decoded;
    }catch (error){
        return false;
    }
}


module.exports = {
    sign,
    verify
}