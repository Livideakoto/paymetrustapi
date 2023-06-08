class BaseAdapter {
    constructor(db, table, timestamp){
        this.db = db;
        this.table = table;
        this.timestamp = timestamp == undefined ? true : timestamp;
    }

    async add(datas){
        if(this.timestamp){
            datas.created_at = new Date();
            datas.updated_at = null;
        }

        let sql = `INSERT INTO public."${this.table}" (id, `;
        let values = [];
        let iterator = 1;

        for (const index in datas) {
            sql += `${index}, `;
        }
        sql = `${sql.substring(0, sql.length-2)}) VALUES (DEFAULT, `;

        for (const index in datas) {
            sql += `$${iterator}, `;
            iterator++;
            let val = datas[index];
            values = [...values, val];
        }
        sql = `${sql.substring(0, sql.length-2)}) RETURNING id`;

        const res = await this.db.query(sql, values);
        return {id: res.rows[0].id};
    }

    addMany(datasArray){
        let results = [];

        // console.log(datasArray);
        datasArray.map((data, index) => {
            let r = this.add(data);
            r.then((row) => {
                results.push(r.id);
            })
        });

        return results;
    }
    
    async get(id){
        let sql = `SELECT * FROM public."${this.table}" WHERE id = $1`;
        const res = await this.db.query(sql, [id]);
        return res.rows.length > 0 ? res.rows[0] : null;
    }

    async getAll(infos){
        if(!infos){
            infos = {'order': 'id'};
        }

        let sql = `SELECT * FROM public."${this.table}"`;

        if(infos.where){ // Clause WHERE ajoutée
            sql += ` WHERE ${infos.where}`;
        }
        
        if(infos.order){ // Clause WHERE ajoutée
            sql += ` ORDER BY ${infos.order}`;
        }
        
        if(infos.limit){ // Clause WHERE ajoutée
            sql += ` LIMIT ${infos.limit}`;
        }

        const res = await this.db.query(sql);
        const elements = [];

        for(const i in res.rows){
            const element = await this.get(res.rows[i].id);
            elements.push(element);
        }

        return elements;
    }

    async update(datas){
        let id = datas.id;
        delete datas.id;

        if(this.timestamp)
            datas.updated_at = new Date();

        let values = [];
        let iterator = 1;

        let sql = `UPDATE public.${this.table} SET `;
        
        for (const index in datas) {
            sql += `${index}=$${iterator}, `;
            iterator++;
            values = [...values, datas[index]];
        }

        values.push(id);

        sql = `${sql.substring(0, sql.length-2)} WHERE id=$${iterator} RETURNING id`;
        const res = await this.db.query(sql, values);
        return this.get(res.rows[0].id);
    }

    async delete(id){
        let sql = `DELETE FROM public."${this.table}" WHERE id = $1 RETURNING id`;
        const res = await this.db.query(sql, [id]);
        return res.rows.length > 0 ? res.rows[0] : null;
    }
}

module.exports = BaseAdapter;