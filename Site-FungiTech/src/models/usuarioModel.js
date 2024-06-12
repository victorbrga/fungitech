var database = require("../database/config")

function autenticar(cpf, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", cpf, senha)
    var instrucaoSql = `
<<<<<<< HEAD
        SELECT cpf, email, nomeUsuario, senha, fkEmpresa FROM funcionario WHERE cpf = '${cpf}' AND senha = '${senha}';
=======
        SELECT cpf, email, nomeFunc, senha, fkEmpresa FROM Funcionario WHERE cpf = '${cpf}' AND senha = '${senha}';
>>>>>>> a262dc388fdbb3083efae1174b476f1727cd3c57
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
<<<<<<< HEAD
        INSERT INTO funcionario (cpf, email, nomeUsuario, senha, fkEmpresa) VALUES ('${cpf}', '${email}', '${nome}', '${senha}', '${CNPJEmpresa}');
=======
        INSERT INTO Funcionario (cpf, email, nomeFunc, senha, fkEmpresa) VALUES ('${cpf}', '${email}', '${nome}', '${senha}', '${CNPJEmpresa}');
>>>>>>> a262dc388fdbb3083efae1174b476f1727cd3c57
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

module.exports = {
    autenticar,
    cadastrar_funcionario,
    cadastrar_empresa
};