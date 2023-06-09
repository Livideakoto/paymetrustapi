const UserAdapter = require('../../domain/adapters/UserAdapter');
const { encryptPassword, comparePassword } = require('../encryption');
const { getDBClient } = require('../../domain/persistence/db');
const { sign } = require('../tokenizer');

const register = (request, response) => {
    const db = getDBClient();

    const adapter = new UserAdapter(db);
    const user = {...request.body};

    //Hash password
    user.password = encryptPassword(user.password);
    user.token = null;

    const result = adapter.add(user);
    result.then((row) => {
        db.end();
        response.send(row);
    });
}

const login = (request, response) => {
    const db = getDBClient();

    const adapter = new UserAdapter(db);
    const credentials = {...request.body};

    const result = adapter.getAll({
        where: `email LIKE '${credentials.email}'`,
        limit: 1
    });

    result.then((rows) => {
        let res = {};

        if(rows.length > 0){
            const row = rows[0];

            if(comparePassword(credentials.password, row.password)){
                let token = sign({
                    id: row.id,
                    email: row.email,
                    pseudo: row.pseudo
                });
                
                adapter.update({
                    id: row.id,
                    token: token
                }).then((r) => {
                    res = {
                        code: 200,
                        object: {
                            token: r.token,
                            id: row.id, 
                            email: row.email, 
                            pseudo: row.pseudo
                        }
                    }

                    response.send(res);
                });
            }else{
                res = {
                    code: 300,
                    message: "Invalid credentials"
                }

                db.end();                
                response.send(res);
            }
        }else{
            res = {
                code: 404,
                message: `User with email "${credentials.email} doesn't exists"`
            }

            db.end();                
            response.send(res);
        }
    });
}

const users = (request, response) => {
    const db = getDBClient();
    const adapter = new UserAdapter(db);
    const result = adapter.getAll();

    result.then((rows) => {
        db.end();
        response.send(rows);
    });
}

const user = (request, response) => {
    const db = getDBClient();
    const adapter = new UserAdapter(db);
    const result = adapter.get(parseInt(request.params.id));

    result.then((row) => {
        db.end();
        response.send(row);
    });
}

module.exports = {
    register,
    login,

    users,
    user
}