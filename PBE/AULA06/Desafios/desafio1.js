const entrada = require('readline-sync')

const nome = entrada.question("Digite o seu nome: \n")
const idade = entrada.questionInt("Digite a sua idade: \n")
const tempo_contribuicao = entrada.questionInt("Digite quantos anos você tem de trabalho: \n")

if ((idade >= 65) || tempo_contribuicao >= 30) {
    console.log("Você ja pode se aposentar!")
} else {
    console.log("Você não pode se aposentar ainda!")
}