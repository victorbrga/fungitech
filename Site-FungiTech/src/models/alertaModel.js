var database = require("../database/config")

function verificar(CNPJEmpresa) {

    console.log('chegou aqui', CNPJEmpresa);
    
    var instrucaoSql = `
    SELECT concat('Estufa ' , idEstufa) as Estufa , count(fkSensor) as qtdAlerta FROM  estufa
	JOIN sensor
		ON fkEstufa = idEstufa
	JOIN alerta
		ON fkSensor = idSensor
	JOIN funcionario
		ON fkCpf = Cpf
	JOIN empresa
		ON fkCNPJ = Cnpj
	GROUP BY concat('Estufa ' , idEstufa)
    WHERE Cnpj = ${CNPJEmpresa}
	ORDER BY count(distinct(fkSensor)) DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

		function verificar_empresa(CPFUsuario) {
			var instrucaoSql = `
			select fkCnpj as cnpj from funcionario where cpf = ${CPFUsuario};
			`;
			console.log("Executando a instrução SQL: \n" + instrucaoSql);
			return database.executar(instrucaoSql);
		}


module.exports = {
    verificar,
	verificar_empresa
};