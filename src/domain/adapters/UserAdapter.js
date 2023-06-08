const BaseAdapter = require("./BaseAdapter");

class UserAdapter extends BaseAdapter{
    constructor(db){
        super(db, "users");
    }
}

module.exports = UserAdapter;