var database = require("../database/config")

function verificar(CPFUsuario) {

    console.log('chegou aqui', CPFUsuario);

    CPFUsuario = "10458256422"
    
    var instrucaoSql = `
    SELECT concat('Estufa ' , idEstufa) as Estufa , count(fkSensor) as qtdAlerta FROM  estufa
	JOIN sensor
		ON fkEstufa = idEstufa
	JOIN alerta
		ON fkSensor = idSensor
	JOIN funcionario
		ON fkCpf = Cpf
	JOIN empresa
		ON fkEmpresa = Cnpj
	GROUP BY concat('Estufa ' , idEstufa)
    WHERE Cnpj = ${CNPJEmpresa}
	ORDER BY count(distinct(fkSensor)) DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    verificar
};