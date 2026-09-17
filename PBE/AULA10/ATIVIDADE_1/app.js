const entrada = require('readline-sync');
const moeda = require('./conversor');

const valor = entrada.questionFloat("Digite o valor em Dolar (US$): ");
const resultado = moeda.converterDolar(valor);

console.log(`O valor convertido e: R$ ${resultado.toFixed(2)}`);