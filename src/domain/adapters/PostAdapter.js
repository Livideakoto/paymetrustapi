const BaseAdapter = require("./BaseAdapter");

class PostAdapter extends BaseAdapter{
    constructor(db){
        super(db, "posts");
    }

    async get(id){
        let categories = [];
        let post = await super.get(id);

        let sql = `SELECT * FROM public."category_post" WHERE post_id = $1`;
        const res = await this.db.query(sql, [post.id]);
        
        if(res.rows.length > 0){
            for(const c in res.rows){
                sql = `SELECT * FROM public."categories" WHERE id = $1`;
                const cat = await this.db.query(sql, [res.rows[c].category_id]);
                categories.push(cat.rows[0]);
            }
        }

        post.categories = categories;
        return post;
    }
}

module.exports = PostAdapter;