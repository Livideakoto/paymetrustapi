const BaseAdapter = require("./BaseAdapter");
const crypto = require('crypto');

class CommentAdapter extends BaseAdapter{
    constructor(db){
        super(db, "comments");
    }

    async add(datas){
        let added = await super.add(datas);
        // console.log(added);
        return this.get(added.id);
    }

    async get(id){
        let comment = await super.get(id);

        let sql = `SELECT * FROM public."users" WHERE id = $1`;
        const res = await this.db.query(sql, [comment.user_id]);
        let user = res.rows[0];
        
        delete user.password;
        delete user.created_at;
        delete user.updated_at;
        delete user.token;

        user.emailhash = crypto.createHash('md5').update(user.email).digest("hex");

        comment.user = user;
        return comment;
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