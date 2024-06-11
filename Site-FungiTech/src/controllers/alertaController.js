var alertaModel = require("../models/alertaModel");

function verificar_empresa(req,res){

    var CNPJEmpresa = req.body.cnpjEmpresaServer;
    
    console.log(CNPJEmpresa + 'estou no controller')

    alertaModel.verificar_empresa(CNPJEmpresa)
    .then(
        function (resultado_verificar_empresa) {

            res.json({
                
                resultado_verificar_empresa
            });
}
    )
}


function verificar_usuario(req,res){

    var CPFUsuario = req.body.cpfUsuarioServer;
    
    console.log(CPFUsuario + 'estou no controller')

    alertaModel.verificar_usuario(CPFUsuario)
    .then(
        function (resultado_verificar_usuario) {

            res.json({
                
                resultado_verificar_usuario
            });
}
    )
}


module.exports = {
    verificar_usuario,
    verificar_empresa
}