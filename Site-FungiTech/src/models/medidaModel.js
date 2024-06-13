var database = require("../database/config");

function ultimas(CPFUsuario) {
    var instrucaoSql = `SELECT 
    truncate(avg(temperatura),2) as Temperatura,
    truncate(avg(umidade),2) as Umidade, 
     date_format(dtHora, '%H:%i:%s') as hora,
    dtHora
    FROM Dados
    JOIN Sensor ON fkSensor = idSensor 
    join Estufa on fkEstufa = idEstufa 
    JOIN Empresa on Estufa.fkEmpresa = cnpj
    JOIN Funcionario on Funcionario.fkEmpresa = cnpj
     where cpf = '${CPFUsuario}'
     group by  dtHora;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    var instrucaoSql = `SELECT 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
                        fk_aquario 
                        FROM medida WHERE fk_aquario = ${idAquario} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    ultimas,
    buscarMedidasEmTempoReal
}
