const express = require("express");
const controller = require("../controllers/person");
const router = express.Router();

//localhost:5000/api/person/get

router.get("/:serchValue", controller.getPerson);
// router.post("/get", controller.getPerson);

module.exports = router;
