const express = require("express");
const bodyParser = require('body-parser');
const app = express();

const db = require("./config/database");
const Place = require("./models/Place");
const City = require("./models/City");
const Country = require("./models/Country");
const Feature = require("./models/Feature");
const Photo = require("./models/Photo");

app.get("/", (req, res) => res.send("respon nodejs berhasil"));

db.authenticate().then(() => console.log('berhasil connect ke db'));

app.use(express.urlencoded({extended: true}));

app.get("/places", async (req, res) => {
    try {
        const getAllPlaces = await Place.findAll({
            include: [
                {
                    model: Country, as: 'country'
                },
                {
                    model: City, as: 'city'
                },
                {
                    model: Feature, as: 'feature'
                },
                {
                    model: Photo, as: 'photo'
                }
            ]
        });
        
        res.json({
            status: 'success',
            message: "",
            data: getAllPlaces
        });
    } catch (error) {
        console.error(error.message);
        res.status(500).send("server failed");
    }
});

app.get("/cities", async (req, res) => {
    try {
        const getAllCity = await City.findAll({});
        
        res.json({
            status: 'success',
            message: "",
            data: getAllCity
        });
    } catch (error) {
        console.error(error.message);
        res.status(500).send("server failed");
    }
});

app.listen(3000, () => console.log('Port berjalan di 3000'));