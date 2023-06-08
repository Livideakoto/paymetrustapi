const BaseAdapter = require("./BaseAdapter");

class CommentAdapter extends BaseAdapter{
    constructor(db){
        super(db, "comments");
    }

    async deletePostComments(postid){
        let sql = `DELETE FROM public."${this.table}" WHERE post_id = $1 RETURNING id`;
        const res = await this.db.query(sql, [postid]);
        return res.rows.length > 0 ? res.rows : null;
    }
    
    async deleteUserComments(userid){
        let sql = `DELETE FROM public."${this.table}" WHERE user_id = $1 RETURNING id`;
        const res = await this.db.query(sql, [userid]);
        return res.rows.length > 0 ? res.rows : null;
    }
}

module.exports = CommentAdapter;