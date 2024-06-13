// const { alerta_umidade } = require("../controllers/alertaController");
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

		function dadosUmidade() {
			var instrucao = `
					SELECT fkSensor as sensor, umidade, date_format(dtHora, '%H:%i:%s') as hora from Dados 
		WHERE fkSensor = 4;
		`;
			console.log("Executando a instrução SQL: \n" + instrucao);
			return database.executar(instrucao);
		  }

		  
		function dadosUmidade2() {
			var instrucao = `
					SELECT fkSensor as sensor, umidade, date_format(dtHora, '%H:%i:%s') as hora from Dados 
		WHERE fkSensor = 1;
		`;
			console.log("Executando a instrução SQL: \n" + instrucao);
			return database.executar(instrucao);
		  }

		  function dadosTemp() {
			var instrucao = `
					SELECT fkSensor as sensor, temperatura, date_format(dtHora, '%H:%i:%s') as hora from Dados 
		WHERE fkSensor = 4;
		`;
			console.log("Executando a instrução SQL: \n" + instrucao);
			return database.executar(instrucao);
		  }


		  function dadosTemp2() {
			var instrucao = `
					SELECT fkSensor as sensor, temperatura, date_format(dtHora, '%H:%i:%s') as hora from Dados 
		WHERE fkSensor = 1;
		`;
			console.log("Executando a instrução SQL: \n" + instrucao);
			return database.executar(instrucao);
		  }

		  function alerta_um() {
			var instrucao = `
					
    select count(temperatura) as 'Alerta da Temperatura' from Dados join Sensor on fkSensor = idSensor join Estufa on idEstufa = fkEstufa join Empresa on fkEmpresa = cnpj where temperatura > 25 or temperatura < 20 and cnpj = ${idEmpresa};;
		`;
			console.log("Executando a instrução SQL: \n" + instrucao);
			return database.executar(instrucao);
		  }

	 	  function alerta_umidade() {
	 		var instrucao = `
					
     select count(umidade) as 'Alerta da umidade' from Dados join Sensor on fkSensor = idSensor join Estufa on idEstufa = fkEstufa join Empresa on fkEmpresa = cnpj where umidade > 95 or umidade < 75 and cnpj = 4;
	 	`;
	 		console.log("Executando a instrução SQL: \n" + instrucao);
	 		return database.executar(instrucao);
	 	  }
		  


module.exports = {
    verificar_usuario,
	verificar_empresa,
	dadosUmidade,
	dadosUmidade2,
	dadosTemp,
	dadosTemp2,
	alerta_um,
	alerta_umidade,
};