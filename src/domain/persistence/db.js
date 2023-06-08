const { Pool } = require('pg');

const getDBClient = () => {
    const client = new Pool();
    return client;
}

module.exports = {
    getDBClient
}