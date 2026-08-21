// Desafio 2

// • O "Mão de Vaca" (Cálculo com Decisão)
// • Objetivo:** Praticar cálculos e `if/else`.
// • Enunciado: Um restaurante está dando 10% de desconto para contas acima de R$ 100,00. Peça o valor total da conta. Se for acima de 100, mostre o valor com desconto. Se for abaixo, mostre o valor normal.

const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ");
let valor_total = entrada.questionFloat("Digite o valor total da conta: ");


if (valor_total >= 100) {
    console.log(`${nome}, você recebeu um desconto de 10%. O valor total é de ${valor_total *0.9}.`);
} else {
    console.log(`O valor total é de ${valor_total}.`);
}    