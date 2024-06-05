var database = require("../database/config")

function verificar(CPFUsuario) {

    console.log('chegou aqui', CPFUsuario);

    CPFUsuario = "10458256422"
    
    var instrucaoSql = `
    select  estufa.idEstufa as estufa, sum(fkSensor) as alertas from alerta 
    join sensor on fkSensor = idSensor 
    join estufa on fkEstufa = idEstufa
    join funcionario on fkCPF = cpf
    where cpf = ${CPFUsuario}
    group by estufa.idEstufa, alerta.fksensor;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    verificar
};