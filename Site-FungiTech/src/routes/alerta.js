var express = require("express");
var router = express.Router();

var alertaController = require("../controllers/alertaController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/verificar_usuario", function (req, res) {
    alertaController.verificar_usuario(req, res);
})

router.post("/verificar_empresa", function (req, res) {
    alertaController.verificar_empresa(req, res);
})



module.exports = router;