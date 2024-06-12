var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var cpf = req.body.cpfServer;
    var senha = req.body.senhaServer;

    if (cpf == undefined) {
        res.status(400).send("Seu cpf está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(cpf, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {
                        console.log(resultadoAutenticar);

                        
                                    res.json({
                                        cpf: resultadoAutenticar[0].cpf,
                                        nome: resultadoAutenticar[0].nomeUsuario,
                                        email: resultadoAutenticar[0].email,
                                        senha: resultadoAutenticar[0].senha,
                                        cnpj: resultadoAutenticar[0].fkEmpresa
                                        
                                    });
                                } else if (resultadoAutenticar.length == 0) {
                                    res.status(403).send("CPF e/ou senha inválido(s)");
                                } else {
                                    res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                                }
                            })
                        }
                
            
    

}

function cadastrar_funcionario(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var cpf = req.body.cpfServer;
    var email = req.body.emailServer;
    var nome = req.body.nomeServer;
    var senha = req.body.senhaServer;
    var cnpj = req.body.CNPJFuncionarioServer;

    console.log(`controller1: cpf ${cpf}, nome ${nome}, email${email}`)
    console.log("nome:: ", nome)
    console.log("cpf:: ", cpf)
    console.log("email:: ", email)
    console.log("senha:: ", senha)
    console.log("cnpj:: ", cnpj)


    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    }else if (cpf == undefined) {
        res.status(400).send("Seu CPF está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (cnpj == undefined) {
        res.status(400).send("Sua empresa está undefined!");
    }  else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar_funcionario(cpf, email, nome, senha, cnpj)
            .then(
                function (resultado) {
                    res.json(resultado);
                    console.log(`COntroller2: cpf ${cpf}, nome ${nome}, email${email}`)
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function cadastrar_empresa(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var razaoSocial = req.body.razaoSocialServer;
    var nomeFantasia = req.body.nomeFantasiaServer; 
    var CNPJEmpresa = req.body.CNPJEmpresaServer;
    var logradouro = req.body.logradouroServer;
    var CEP = req.body.CEPServer;
    console.log('cheguei aqui 2!')

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar_empresa(razaoSocial, nomeFantasia, CNPJEmpresa, logradouro, CEP)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    
}

module.exports = {
    autenticar,
    cadastrar_funcionario,
    cadastrar_empresa
}