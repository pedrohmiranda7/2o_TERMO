const entrada = require ('readline-sync')
const leitor = require ('./sensor')

const Temperatura = entrada.questionFloat("Digite a Temperatura atual: \n")
const Umidade = entrada.questionFloat("Digite a Umidade atual: \n")

console.log(leitor.checarTemperatura(Temperatura));
console.log(leitor.checarUmidade(Umidade));