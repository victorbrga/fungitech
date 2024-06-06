var alertaModel = require("../models/alertaModel");

function verificar(req,res){

    var CPFUsuario = req.body.cpfUsuarioServer;
    
    console.log(CPFUsuario + 'estou no controller')

    alertaModel.verificar(CPFUsuario)
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