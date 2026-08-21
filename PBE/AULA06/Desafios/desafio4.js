const entrada = require('readline-sync')

const filmes = [
    {nome: "Spiderman", idade: 12},
    {nome: "Batman", idade: 18},
    {nome: "Aquaman", idade: 14}
];

const idade = entrada.questionInt("Digite a sua idade: \n")

for (let i = 0; i < filmes.length; i++) {
    if (idade >= filmes[i].idade){
        console.log(`Filme ${filmes[i].nome} disponivel`)
    }
}