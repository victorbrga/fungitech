var database = require("../database/config")

function verificar_empresa(CNPJEmpresa) {

    console.log('chegou aqui', CNPJEmpresa);
    
    var instrucaoSql = `
    select Estufa.idEstufa as Estufa, count(Alerta.fkEstufa) as qtdAlerta
    from Alerta join Estufa on fkEstufa = idEstufa 
    join Empresa on fkEmpresa = cnpj 
    where Empresa.cnpj = ${CNPJEmpresa}
    group by Estufa.idEstufa
    order by qtdAlerta DESC;
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