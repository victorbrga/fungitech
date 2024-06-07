var database = require("../database/config")

function verificar(CNPJEmpresa) {

    console.log('chegou aqui', CNPJEmpresa);
    
    var instrucaoSql = `
	  SELECT 
    CONCAT('Estufa ', Estufa.idEstufa) as Estufa, 
    COUNT(Alerta.idAlerta) as qtdAlerta 
FROM 
    Estufa
JOIN 
    Sensor ON Sensor.fkEstufa = Estufa.idEstufa
JOIN 
    Alerta ON Alerta.fkEstufa = Estufa.idEstufa
JOIN 
    Empresa ON Estufa.fkEmpresa = Empresa.cnpj
JOIN 
    Funcionario ON Funcionario.fkEmpresa = Empresa.cnpj
WHERE 
    Funcionario.cpf = 12312312312
GROUP BY 
    Estufa
ORDER BY 
    qtdAlerta DESC;
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