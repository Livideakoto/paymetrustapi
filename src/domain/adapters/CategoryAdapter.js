const BaseAdapter = require("./BaseAdapter");

class CategoryAdapter extends BaseAdapter{
    constructor(db){
        super(db, "categories");
    }
}

module.exports = CategoryAdapter;