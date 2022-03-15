const Sequelize = require("sequelize");
const db = require("../config/database");

const Country = db.define(
    "countries",
    {
        name: { type: Sequelize.STRING },
        description: { type: Sequelize.STRING },
    },
    {
        freezeTableName: true
    }
);

Country.associate = models => {
    Country.hasOne(models.Place, {
        foreignKey: "id"
    });
}

module.exports = Country;