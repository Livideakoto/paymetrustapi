const { getDBClient } = require('../../domain/persistence/db');
const CategoryAdapter = require('../../domain/adapters/CategoryAdapter');
const PostAdapter = require('../../domain/adapters/PostAdapter');
const CategoryPostAdapter = require('../../domain/adapters/CategoryPostAdapter');

const CategoriesController = {
    all: (request, response) => {
        const db = getDBClient();
        const adapter = new CategoryAdapter(db);
        const result = adapter.getAll();

        result.then((rows) => {
            db.end();
            response.send(rows);
        });
    },
    posts: (request, response) => {
        const db = getDBClient();
        const CPAdapter = new CategoryPostAdapter(db);
        const result = CPAdapter.getAll({
            where: `category_id = ${parseInt(request.params.id)}`,
            order: 'post_id DESC'
        });

        result.then((categoryPosts) => {
            let promises = [];
            let PAdapter = new PostAdapter(db);

            categoryPosts.map((el, index) => {
                promises.push(PAdapter.get(el.post_id));
            });

            Promise.all(promises).then((posts) => {
                response.send(posts);
            });
        })
    },
    add: (request, response) => {
        const db = getDBClient();
        const adapter = new CategoryAdapter(db);
        const category = {...request.body};

        const result = adapter.add(category);
        result.then((row) => {
            db.end();
            response.send(row);
        });
    },
    get: (request, response) => {
        const db = getDBClient();
        const adapter = new CategoryAdapter(db);
        const result = adapter.get(parseInt(request.params.id));

        result.then((row) => {
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
    update: (request, response) => {
        const db = getDBClient();
        const adapter = new CategoryAdapter(db);
        const datas = {...request.body, id: request.params.id};
        
        adapter.update(datas).then((r) => {
            res = {
                code: 200,
                object: {id: r.id}
            }

            response.status(200).send(res);
        });
    },
    delete: (request, response) => {
        const db = getDBClient();
        const adapter = new CategoryAdapter(db);
        const result = adapter.delete(parseInt(request.params.id));
        
        result.then((row) => {
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

module.exports = CategoriesController;