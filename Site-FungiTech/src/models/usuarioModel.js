var database = require("../database/config")

function autenticar(cpf, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", cpf, senha)
    var instrucaoSql = `
        SELECT f.cpf, f.email, f.nomeFunc, f.senha, e.cnpj FROM Funcionario as f join Empresa as e on fkEmpresa = cnpj
        WHERE cpf = '${cpf}' AND senha = '${senha}';

    `;  
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar_funcionario(cpf, email, nome, senha, CNPJEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", cpf, email, nome, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO Funcionario (cpf, email, nomeFunc, senha, fkEmpresa) VALUES ('${cpf}', '${email}', '${nome}', '${senha}', '${CNPJEmpresa}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function cadastrar_empresa(razaoSocial, nomeFantasia, CNPJEmpresa, logradouro, CEP) {
  
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql2 = `
        INSERT INTO Empresa (cnpj, nomeFantasia, razaoSocial, cep, logradouro) VALUES ('${CNPJEmpresa}', '${nomeFantasia}', '${razaoSocial}', '${CEP}', '${logradouro}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql2);
    return database.executar(instrucaoSql2);
}

function capturar(cnpj) {
    var instrucaoSql2 = `
    SELECT Dados.temperatura, Dados.umidade, Sensor.nomeSensor FROM Dados 
 Inner JOIN Sensor ON idSensor = fkSensor 
inner JOIN Estufa on idEstufa = fkEstufa inner join Empresa on cnpj = fkEmpresa where cnpj = '${idEmpresa}';
    `;
console.log("Executando a instrução SQL: \n" + instrucaoSql2);
return database.executar(instrucaoSql2);
}

module.exports = {
    autenticar,
    cadastrar_funcionario,
    cadastrar_empresa,
    capturar
};