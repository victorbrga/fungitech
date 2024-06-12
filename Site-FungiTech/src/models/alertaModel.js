var database = require("../database/config")

function verificar_empresa(CNPJEmpresa) {

    console.log('chegou aqui', CNPJEmpresa);
    
    var instrucaoSql = `
<<<<<<< HEAD
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
=======
    select Estufa.idEstufa as Estufa, count(Alerta.fkEstufa) as qtdAlerta
    from Alerta join Estufa on fkEstufa = idEstufa 
    join Empresa on fkEmpresa = cnpj 
    where Empresa.cnpj = ${CNPJEmpresa}
    group by Estufa.idEstufa
    order by qtdAlerta DESC;
>>>>>>> a262dc388fdbb3083efae1174b476f1727cd3c57
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