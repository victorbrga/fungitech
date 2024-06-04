var alertaModel = require("../models/alertaModel");

function verificar(req,res){

    var CPFUsuario = req.body.cpfUsuarioServer;

    alertaModel.verificar(CPFUsuario)
    console.log(CPFUsuario + 'estou no controller')
    .then(
        function (resultado_verificar_alertas) {

            res.json({
                
                resultado_verificar_alertas
            });
}
    )
}

module.exports = {
    verificar
}