var medidaModel = require("../models/medidaModel");

function ultimas(req, res) {
    
    var CPFUsuario = req.body.cpfUsuarioServer;
    
    medidaModel.ultimas(CPFUsuario)
    .then(
        function (resultado_ultimas) {

            res.json({
                
                resultado_ultimas
            });
}
    )
}


function buscarMedidasEmTempoReal(req, res) {

    var idAquario = req.params.idAquario;

    console.log(`Recuperando medidas em tempo real`);

    medidaModel.buscarMedidasEmTempoReal(idAquario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    ultimas,
    buscarMedidasEmTempoReal

}