const entrada = require('readline-sync');

console.log("---SISTEMA DE ANALISE DE CREDITO---")

// Coleta de Dados
const nome = entrada.question("Nome do Cliente: ");
const idade = entrada.questionInt("Idade: ");
const renda = entrada.questionFloat("Renda Mensal: ");
const temImovel = entrada.keyInYNStrict("Possui imovel próprio? "); 

// A Lógica Combinada
// (idade >= 18) é obrigatório
// (renda >= 2500 || temImovel === true) um dos dois tem que ser verdadeiro

if(idade >=18 && (renda >= 2500 || temImovel === true)) {
    console.log(`\nPARABÉNS, ${nome}! Seu crédito foi APROVADO!`);
} else {
    console.log(`\nSinto muito, ${nome}. Seu crédito foi NEGADO!`) 
}