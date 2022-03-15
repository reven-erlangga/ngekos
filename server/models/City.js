const Sequelize = require("sequelize");
const db = require("../config/database");

const City = db.define(
    "cities",
    {
        name: { type: Sequelize.STRING },
        description: { type: Sequelize.STRING },
        imageUrl: { type: Sequelize.STRING },
        isPopuler: { type: Sequelize.BOOLEAN },
    },
    {
        freezeTableName: true
    }
);

City.associate = models => {
    City.hasOne(models.Place, {
        foreignKey: "id"
    });
}

module.exports = City;