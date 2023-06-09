const slugify = require('slugify');
const { encode, decode } = require('html-entities');

const { getDBClient } = require('../../domain/persistence/db');
const PostAdapter = require('../../domain/adapters/PostAdapter');
const CategoryPostAdapter = require('../../domain/adapters/CategoryPostAdapter');

const PostsController = {
    all: (request, response) => {
        const db = getDBClient();
        const adapter = new PostAdapter(db);
        const result = adapter.getAll({order: 'id DESC'});

        result.then((rows) => {
            db.end();
            response.send(rows);
        });
    },
    add: (request, response) => {
        let {title, description, content, published, user_id, categories} = request.body;
        let datas = {
            title,
            description,
            content,
            published,
            user_id
        }

        datas.slug = slugify(title, {
            remove: /[*+~.()'"!:@]/g,
            lower: true
        });
        datas.content = encode(content);

        const db = getDBClient();
        const PAdapter = new PostAdapter(db);
        const result = PAdapter.add(datas);

        result.then((row) => {
            const cats = [];
            const promises = [];
            const CPAdapter = new CategoryPostAdapter(db);

            categories.map((c, i) => {
                const r = CPAdapter.add({
                    post_id: row.id,
                    category_id: parseInt(c)
                });

                promises.push(r);
            });

            
            Promise.all(promises).then((values) => {
                db.end();
                response.send(row);
            });
        });
    },
    get: (request, response) => {
        const db = getDBClient();
        const adapter = new PostAdapter(db);
        const result = adapter.get(parseInt(request.params.id));

        result.then((row) => {
            db.end();

            if(row){
                row.content = decode(row.content);
                response.send(row);
            }else{
                response.status(404).send({
                    code: 404,
                    message: "Not Found"
                });
            }
        });
    },
    update: (request, response) => {
        const db = getDBClient();
        const adapter = new PostAdapter(db);
        const CPAdapter = new CategoryPostAdapter(db);
        const datas = {...request.body, id: request.params.id};

        let categories = [];
        if(datas.categories){
            categories = datas.categories;
            delete datas.categories;
        }
        
        adapter.update(datas).then((row) => {
            if(categories.length > 0){
                const deleted = CPAdapter.deletePostCategories(row.id);
                deleted.then((list) => {
                    const promises = [];
                    categories.map((c, i) => {
                        const r = CPAdapter.add({
                            post_id: row.id,
                            category_id: parseInt(c)
                        });
        
                        promises.push(r);
                    });
        
                    
                    Promise.all(promises).then((values) => {
                        db.end();
                        
                        res = {
                            code: 200,
                            object: {id: row.id}
                        };

                        response.send(res);
                    })
                });
            }else{
                res = {
                    code: 200,
                    object: {id: r.id}
                };
    
                response.status(200).send(res);
            }

            
        });
    },
    delete: (request, response) => {
        const db = getDBClient();
        const adapter = new PostAdapter(db);
        const CPAdapter = new CategoryPostAdapter(db);

        const deleted = CPAdapter.deletePostCategories(request.params.id);
        deleted.then((list) => {
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
        });
    }
}

module.exports = PostsController;