const readline = require("readline-sync");

const nome = readline.question("Digite o nome do aluno: ");
const disciplina = readline.question("Digite a disciplina: ");
const nota1 = Number(readline.question("Digite a primeira nota: "));
const nota2 = Number(readline.question("Digite a segunda nota: "));
const faltas = Number(readline.question("Digite a quantidade de faltas: "));

const turma = readline.question("Digite a turma do aluno: ");
const escola = readline.question("Digite o nome da escola: ");

const media = (nota1 + nota2) / 2;

console.log("\n=================================");
console.log("--- RELATÓRIO DO ALUNO ---");
console.log("=================================");
console.log("Escola:", escola);
console.log("Turma:", turma);
console.log("Aluno:", nome);
console.log("Disciplina:", disciplina);
console.log("---------------------------------");
console.log("Nota 1:", nota1);
console.log("Nota 2:", nota2);
console.log("Média Final:", media);
console.log("Quantidade de Faltas:", faltas);
console.log("=================================");