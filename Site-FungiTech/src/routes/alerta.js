var express = require("express");
var router = express.Router();

var alertaController = require("../controllers/alertaController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/verificar", function (req, res) {
    alertaController.verificar(req, res);
})


module.exports = router;