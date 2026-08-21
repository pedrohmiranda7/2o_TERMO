// Desafio 5

// • Desafio 5: O Simulador de Empréstimo (Operadores Lógicos)
// • Objetivo: Praticar `&&` e `||`.
// • Enunciado: Um banco aprova empréstimos se o cliente preencher dois requisitos:
// • 1. Ter renda mensal acima de R$ 2.000,00.
// • 2. NÃO ter o nome sujo (pergunte ao usuário: "Seu nome está limpo? true/false").
// • O programa deve ler a renda e o status do nome e dizer "Empréstimo Aprovado" ou "Empréstimo Negado".

const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ")
const renda = entrada.questionFloat("Digite sua renda mensal: ");
const nome_limpo = entrada.question("Seu nome está limpo? (true/false): ");

if (renda > 2000 && nome_limpo == "true") {
    console.log(`${nome}, Seu empréstimo está aprovado!`);
} else {
    console.log(`${nome}, Seu empréstimo foi negado!`);
}