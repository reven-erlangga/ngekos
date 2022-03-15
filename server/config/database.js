const Sequalize = require("sequelize");

const database = new Sequalize("db_ngekos", "root", "", {
    dialect: "mysql"});

database.sync({});

module.exports = database;