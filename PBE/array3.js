const entrada = require("readline-sync")

const notas = []

const quantidade = entrada.questionInt("Quantas notas deseja cadastrar? \n");

for (let i = 0; i < quantidade; i++) {
    let nota = entrada.questionFloat(
        `Digite a nota ${i + 1}:`);

       notas.push(nota);
}

console.log("\nNotas Cadastradas:");
console.log(notas);

console.log(`Quantidade de notas: ${notas.length}`);
