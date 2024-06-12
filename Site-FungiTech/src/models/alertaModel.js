var database = require("../database/config")

function verificar_empresa(CNPJEmpresa) {

    console.log('chegou aqui', CNPJEmpresa);
    
    var instrucaoSql = `
    SELECT idEstufa as Estufa , count(Alerta.fkEstufa) as qtdAlerta FROM  Empresa
       JOIN Estufa
			ON Estufa.fkEmpresa = cnpj
        LEFT JOIN Sensor
                ON fkEstufa = idEstufa
        LEFT JOIN Alerta
			ON Alerta.fkEstufa = idEstufa
		WHERE cnpj = ${CNPJEmpresa}
        GROUP BY idEstufa
        ORDER BY count(distinct(Alerta.fkEstufa)) DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

		function verificar_usuario(CPFUsuario) {
			var instrucaoSql = `
			select fkEmpresa from Funcionario where cpf = ${CPFUsuario};
			`;
			console.log("Executando a instrução SQL: \n" + instrucaoSql);
			return database.executar(instrucaoSql);
		}


module.exports = {
    verificar_usuario,
	verificar_empresa
};