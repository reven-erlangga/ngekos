const Sequelize = require("sequelize");
const db = require("../config/database");

const Photo = db.define(
    "photos",
    {
        placeId: { type: Sequelize.BIGINT },
        imageUrl: { type: Sequelize.TEXT },
    }
);

module.exports = Photo;