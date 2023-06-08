const BaseAdapter = require("./BaseAdapter");

class CategoryPostAdapter extends BaseAdapter{
    constructor(db){
        super(db, "category_post", false);
    }

    async deletePostCategories(postid){
        let sql = `DELETE FROM public."${this.table}" WHERE post_id = $1 RETURNING id`;
        const res = await this.db.query(sql, [postid]);
        return res.rows.length > 0 ? res.rows : null;
    }
}

module.exports = CategoryPostAdapter;