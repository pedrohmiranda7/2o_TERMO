const entrada = require ('readline-sync')

const pecasDefeituosas = [];

let pecas = entrada.questionInt("Quantas peças com defeito foram encontradads? \n")

for (let i = 0; i < pecas; i++) {
    let numeroSerie = entrada.questionInt(`Digite o número de série da peça ${i}: `);
    pecasDefeituosas.push(numeroSerie)
};