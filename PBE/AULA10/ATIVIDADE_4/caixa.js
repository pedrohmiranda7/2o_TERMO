const entrada = require ('readline-sync')
const venda = require ('./calculosVenda')


const nome = entrada.question("Nome do cliente: ");
const preco = entrada.questionFloat("Preco do produto: ");
const quantidade = entrada.questionInt("Quantidade: ");

const total = venda.calcularTotal(preco, quantidade);
const cupom = venda.gerarCupom(nome, total);

console.log("\n--- CUPOM FISCAL ---");
console.log(cupom);