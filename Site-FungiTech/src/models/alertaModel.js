var database = require("../database/config")

function verificar_empresa(CNPJEmpresa) {

    console.log('chegou aqui', CNPJEmpresa);
    
    var instrucaoSql = `
            SELECT 
            Estufa.idEstufa as Estufa, 
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
            Funcionario.cpf = ${CNPJEmpresa}
        GROUP BY 
            Estufa
        ORDER BY 
            qtdAlerta DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

		function verificar_usuario(CPFUsuario) {
			var instrucaoSql = `
			select fkEmpresa from funcionario where cpf = ${CPFUsuario};
			`;
			console.log("Executando a instrução SQL: \n" + instrucaoSql);
			return database.executar(instrucaoSql);
		}


module.exports = {
    verificar_usuario,
	verificar_empresa
};