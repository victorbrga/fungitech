// sessão
function validarSessao() {
    var cpf = sessionStorage.CPF_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    var b_usuario = document.getElementById("b_usuario");

    if (cpf != null && nome != null) {
        b_usuario.innerHTML = nome;
    } else {
        window.location = "../Login-FungiTech.html";
    }
}

function limparSessao() {
    sessionStorage.clear();
    window.location = "../Login-FungiTech.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.style.display = "flex";
        divErrosLogin.innerHTML = texto;
    }
}

