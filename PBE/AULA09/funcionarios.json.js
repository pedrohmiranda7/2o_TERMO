const fs = require("fs");

const funcionarios = [
    { id: 101, nome: "Ana", setor: "Usinagem" },
    { id: 102, nome: "Carlos", setor: "Manutenção" },
    { id: 103, nome: "João", setor: "Produção" }
];

let id = 101;

const funcionario = funcionarios.find(function(funcionario) {
    return funcionario.id == id;
});

if (funcionario) {
    console.log("Nome: " + funcionario.nome);
    console.log("Setor: " + funcionario.setor);
} else {
    console.log("Acesso Negado: ID não encontrado");
}
