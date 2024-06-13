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

router.get("/dadosUmidade", function (req, res) {
    alertaController.dadosUmidade(req, res);
})

router.get("/dadosUmidade2", function (req, res) {
    alertaController.dadosUmidade2(req, res);
})

router.get("/dadosTemp", function (req, res) {
    alertaController.dadosTemp(req, res);
})

router.get("/dadosTemp2", function (req, res) {
    alertaController.dadosTemp2(req, res);
})
router.post("/alerta_um", function (req, res) {
    alertaController.alerta_um(req, res);
})
 router.post("/alerta_umidade", function (req, res) {
     alertaController.alerta_umidade(req, res);
 })



module.exports = router;