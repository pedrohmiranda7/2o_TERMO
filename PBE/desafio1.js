const entrada = require("readline-sync")

const nome = entrada.question("Digite seu nome:\n")
const idade = entrada.questionInt("Digite a sua idade:\n")
const autorização = entrada.keyInYNStrict("Você possui autorização? true/false: \n")
const acompanhamento = entrada.keyInYNStrict("Você está acompanhado de seu professor? true/false: \n")
const suspenso = entrada.keyInYNStrict("Você está suspenso? true/false: \n ")

if ((idade >= 16 && autorização === true || acompanhamento === true) && suspenso === false) {
    console.log("ACESSO LIBERADO!");
} else {
    console.log("ACESSO NEGADO!");
}

// // EXEMPLO DO PROFESSOR

// const entrada = require("readline-sync");

// console.log("=== CONTROLE DE ACESSO AO LABORATÓRIO ===")

// const idade = entrada.questionInt("Digite a idade do aluno: \n");

// const autorização = entrada.question("Possui autorização? (S/N): \n").toUpperCase();

// const acompanhado = entrada.question("Está acompanhado por um professor? (S/N): \n").toUpperCase();

// if ((idade >= 16 && autorização === "S") || acompanhado === "S") {
//     console.log("ACESSO LIBERADO!");
// } else {
//     console.log("ACESSO NEGADO!");
// }