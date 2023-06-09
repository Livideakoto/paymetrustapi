const { getDBClient } = require('../../domain/persistence/db');
const CommentAdapter = require("../../domain/adapters/CommentAdapter");

const CommentsController = {
    all: (request, response) => {
        const db = getDBClient();
        const adapter = new CommentAdapter(db);
        const result = adapter.getAll({
            where: `post_id = ${request.params.id}`, 
            order: 'id DESC'
        });

        result.then((rows) => {
            console.log(rows);
            db.end();
            response.send(rows);
        });
    },
    add: (request, response) => {
        const db = getDBClient();
        const adapter = new CommentAdapter(db);
        const comment = {...request.body, post_id: request.params.id};

        const result = adapter.add(comment);
        result.then((row) => {
            console.log(row);
            db.end();
            response.send(row);
        });
    },
    get: (request, response) => {
        const db = getDBClient();
        const adapter = new CommentAdapter(db);
        const result = adapter.get(parseInt(request.params.comment));

        result.then((row) => {
            console.log(row);
            db.end();

            if(row)
                response.send(row);
            else
                response.status(404).send({
                    code: 404,
                    message: "Not Found"
                });
        });
    },
    delete: (request, response) => {
        const db = getDBClient();
        const adapter = new CommentAdapter(db);
        const result = adapter.delete(parseInt(request.params.comment));

        result.then((row) => {
            console.log(row);
            db.end();

            if(row)
                response.status(200).send(row);
            else
                response.status(404).send({
                    code: 404,
                    message: "Not Found"
                });
        });
    }
}

module.exports = CommentsController;