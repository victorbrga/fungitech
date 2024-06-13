var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.post("/ultimas", function (req, res) {
    medidaController.ultimas(req, res);
});

router.post("/tempo_real", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
});


module.exports = router;