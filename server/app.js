const express = require("express");
const bodyParser = require("body-parser");
const personRouts = require("./routs/person");
const indexRouts = require("./routs/index");
const app = express();

app.use(require("cors")());
app.use(require("morgan")("dev"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(express.static("public"));
app.use("/", indexRouts);
app.use("/api/person", personRouts);

module.exports = app;
