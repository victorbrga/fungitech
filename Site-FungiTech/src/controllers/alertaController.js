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

function dadosUmidade(req, res) {
    alertaModel.dadosUmidade().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
  }

  function dadosUmidade2(req, res) {
    alertaModel.dadosUmidade2().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
  }

  function dadosTemp(req, res) {
    alertaModel.dadosTemp().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
  }

  function dadosTemp2(req, res) {
    alertaModel.dadosTemp2().then(function(resultado){
        // precisamos informar que o resultado voltará para o front-end como uma resposta em json
        res.status(200).json(resultado);
    }).catch(function(erro){
        res.status(500).json(erro.sqlMessage);
    })
  }

  
function alerta_um() {
    var idEmpresa = req.body.CNPJEmpresaServer;

    usuarioModel.alerta_um(idEmpresa)
    .then(
        function (resultado) {
            res.json(resultado)
        }
    )
    .catch(
        function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao realizar o cadastro! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
        }
    )
};


 function alerta_umidade() {
     var idEmpresa = req.body.CNPJEmpresaServer;

     usuarioModel.alerta_umidade(idEmpresa)
     .then(
         function (resultado) {
             res.json(resultado)
         }
     )
     .catch(
         function (erro) {
             console.log(erro);
             console.log(
                 "\nHouve um erro ao realizar o cadastro! Erro: ",
                 erro.sqlMessage
             );
             res.status(500).json(erro.sqlMessage);
         }
     )
 };
module.exports = {
    verificar_usuario,
    verificar_empresa,
    dadosUmidade,
    dadosUmidade2,
    dadosTemp,
    dadosTemp2,
    alerta_um,
    alerta_umidade
}