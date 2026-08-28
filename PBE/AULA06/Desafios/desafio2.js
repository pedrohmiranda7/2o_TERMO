const entrada = require('readline-sync')
let valor_total = entrada.questionFloat("Digite o valor total do produto: \n")
const quantidade_parcelas = entrada.questionInt("Digite a quantidade de parcelas de 1 a 12x: \n")


let valor_parcela = valor_total / quantidade_parcelas;

for (let i = 1; i <= quantidade_parcelas; i++) {
    console.log(`Parcela ${i}: R$ ${valor_parcela.toFixed(2)}`);
}
