const entrada = require('readline-sync');
const calculoEnergia = require('./calculoEnergia');

const nomeMaquina = entrada.question("Digite o nome da maquina: ");
const potenciaWatts = entrada.questionInt("Digite a potencia em Watts: ");
const horasUso = entrada.questionInt("Digite as horas de uso no mes: ");
const precoKwh = entrada.questionFloat("Digite o preco do kWh: ");

const totalKwh = calculoEnergia.calcularKwh(potenciaWatts, horasUso);
const custoTotal = calculoEnergia.calcularCusto(totalKwh, precoKwh);
const classificacao = calculoEnergia.classificarConsumo(totalKwh);

const maiusculo = nomeMaquina.toUpperCase();

console.log("-".repeat(25));
console.log("  RELATÓRIO DE EFICIÊNCIA");
console.log("-".repeat(29));
console.log(`Máquina: ${maiusculo}`);
console.log(`Consumo Total: ${totalKwh.toFixed(2)} kWh`);
console.log(`Custo Total: R$ ${custoTotal.toFixed(2)}`);
console.log(`Classificação: ${classificacao}`);
console.log("-".repeat(29));