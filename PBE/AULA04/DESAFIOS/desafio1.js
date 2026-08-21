// Desafio 1

// • O Verificador de Votação (Básico)
// • Objetivo: Praticar `if/else` simples.
// • Enunciado: Crie um programa que peça o nome do usuário e o ano de nascimento. O programa deve calcular a idade e dizer se ele já tem idade mínima para votar (16 anos).

const entrada = require('readline-sync');

const nome = entrada.question("Digite seu nome: ");
const ano_nascimento = entrada.questionInt("Digite o ano que você nasceu: ");
const ano_atual = entrada.questionInt("Digite o ano em que estamos: ");

const idade = ano_atual - ano_nascimento;

console.log(`${nome}, você tem ${idade} anos.`);

if (idade >= 16) {
    console.log("Você já pode votar!");
} else {
    console.log("Você ainda não pode votar.");
}