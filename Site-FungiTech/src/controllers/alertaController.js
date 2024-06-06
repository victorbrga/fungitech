var alertaModel = require("../models/alertaModel");

function verificar(req,res){

    var CNPJEmpresa = req.body.cnpjEmpresaServer;
    
    console.log(CNPJEmpresa + 'estou no controller')

    alertaModel.verificar(CNPJEmpresa)
    .then(
        function (resultado_verificar_alertas) {

            res.json({
                
                resultado_verificar_alertas
            });
}
    )
}


function verificar_empresa(req,res){

    var CPFUsuario = req.body.cpfUsuarioServer;
    
    console.log(CPFUsuario + 'estou no controller')

    alertaModel.verificar(CPFUsuario)
    .then(
        function (resultado_verificar_empresa) {

            res.json({
                
                resultado_verificar_empresa
            });
}
    )
}


module.exports = {
    verificar,
    verificar_empresa
}