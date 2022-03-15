const Sequelize = require("sequelize");
const db = require("../config/database");
const City = require("./City");
const Country = require("./Country");
const Feature = require("./Feature");
const Photo = require("./Photo");

const Place = db.define(
    "places",
    {
        name: { type: Sequelize.STRING },
        description: { type: Sequelize.STRING },
        city_id: { type: Sequelize.INTEGER },
        country_id: { type: Sequelize.BIGINT },
        price: { type: Sequelize.INTEGER },
        rating: { type: Sequelize.INTEGER },
        imageUrl: { type: Sequelize.TEXT },
        address: { type: Sequelize.STRING },
        phone: { type: Sequelize.STRING },
        mapUrl: { type: Sequelize.STRING },
        isFavorite: { type: Sequelize.BOOLEAN },
    },
    {
        freezeTableName: true
    }
);

Place.belongsTo(City, { as: "city", foreignKey: 'city_id'});

Place.belongsTo(Country, { as: "country", foreignKey: 'country_id'});

Place.belongsTo(Feature, { as: "feature", foreignKey: 'featureId'});

Place.hasMany(Photo, {as: "photo"});

module.exports = Place;