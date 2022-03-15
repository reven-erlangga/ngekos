const Sequelize = require("sequelize");
const db = require("../config/database");

const Feature = db.define(
    "features",
    {
        kitchen: { type: Sequelize.INTEGER },
        bedroom: { type: Sequelize.INTEGER },
        cupboard: { type: Sequelize.INTEGER },
    }
)

module.exports = Feature;