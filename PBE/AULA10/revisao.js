// // Lista = forma de armazenar informações, é em forma de "[]"

// // Array e Lista são quase a mesma coisa 

// // Laço (loop) = for e while

// // Objetos vão armazenar dados de uma variável, utilizamos "{}"

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// // Contéudos que vão cair na prova:
    
// //     função,
// //     lista,
// //     array,
// //     laço,
// //     objeto;

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// FUNÇÃO;

// const entrada = require('readline-sync')
// function calcularMedia (n1,n2) {
//     return (n1 + n2) / 2;
// }

// const numero1 = entrada.questionInt("Qual a sua nota 1? \n")
// const numero2 = entrada.questionInt("Qual a sua nota 2? \n")

// const resultado = calcularMedia (numero1, numero2)

// console.log(`A média calculada foi ${resultado}`);

// console.log()

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// OBJETO;

// const produto = {
//     nome: "Teclado mecânico",
//     preco: 150.00,
//     estoque: 25,
//     emOferta: true
// };

// console.log(`Produto: ${produto.nome}`);
// console.log(`Preço: R$ ${produto.preco.toFixed}`)
// console.log(produto)
// console.log(`Produto: ${produto.nome} | ${produto.preco} | ${produto.estoque} | ${produto.emOferta} |`)

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// // Função para validar status (Aprovado/Reprovado)
// function verificarStatus (nota) {
//     return nota >= 7 ? "APROVADO" : "REPROVADO";
// }

// const turma = [];

// // Loop para cadastrar objetos no Array;
// for (let i = 0; i < 3; i++) {
//     console.log(`\n--- Cadastro do Aluno ${i+1} ---`);
//     let nomeAluno = entrada.question("Nome: ");
//     let notaAluno = entrada.questionFloat("Nota: ");


//     // Criando o objeto e guardando no Array
//     const novoALuno = {
//         nome: nomeAluno,
//         nota: notaAluno,
//         status: verificarStatus (notaAluno) // Usando a função aqui!
//     };

//     turma.push(novoALuno);
// }


// console.log("\n======= RELATÓRIO FINAL =======");
// for (let i = 0; i < turma.length; i++) {
//     console.log(`${turma[i].nome} - Nota: ${turma[i].nota} | Status: ${turma[i].status}`);
// }

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// const entrada = require('readline-sync');

// // Criando a "ferramenta" de conversão
// function converterParaFahrenheit(celsius) {
//     let fahrenheit = (celsius * 9/5) + 32;
//     return fahrenheit; // Devolve o resultado para quem chamou
// }

// const tempC = entrada.questionFloat("Digite a temperatura em Celsius: ");

// // Chamando a função e guardando o que ela "cuspiu" de volta
// const tempF = converterParaFahrenheit(tempC);

// console.log(`A temperatura convertida e: ${tempF.toFixed(1)}°F`);
// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// // Função que calcula 15% de desconto
// function calcularDesconto(precoOriginal) {
//     return precoOriginal * 0.85; // Retorna 85% do valor (ou seja, 15% de desconto)
// }

// const produtos = ["Monitor", "Teclado", "Mouse"];
// const precos = [800, 150, 80];

// console.log("=== TABELA DE PRECOS COM DESCONTO (15%) ===");

// for (let i = 0; i < produtos.length; i++) {
//     // Usamos a mesma função para cada item do array!
//     let precoComDesconto = calcularDesconto(precos[i]);
    
//     console.log(`${produtos[i]}: de R$ ${precos[i]} por R$ ${precoComDesconto.toFixed(2)}`);

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//     const entrada = require('readline-sync');

// // Função que decide se a peca passa ou nao
// function validarPeca(diametro) {
//     if (diametro >= 20 && diametro <= 25) {
//         return "APROVADA";
//     } else {
//         return "REPROVADA";
//     }
// }

// console.log("--- CONTROLE DE QUALIDADE ---");

// for (let i = 1; i <= 3; i++) {
//     let leitura = entrada.questionFloat(`Digite o diametro da peca ${i} (mm): `);
    
//     // A função recebe o número e devolve o texto do status
//     let status = validarPeca(leitura);
    
//     console.log(`Resultado da peca ${i}: ${status}\n`);
// }

// //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// const entrada = require('readline-sync');

// function calcularDesconto(precoOriginal) {
//     return precoOriginal * 0.85; 
// }

// const estoque = [
//     { nome: "Monitor", preco: 800 },
//     { nome: "Teclado", preco: 150 },
//     { nome: "Mouse", preco: 80 }
// ];

// console.log("=== TABELA DE PRECOS COM OBJETOS (15% OFF) ===");

// for (let i = 0; i < estoque.length; i++) {
    
    
//     let precoComDesconto = calcularDesconto(estoque[i].preco);
    
//     console.log(`${estoque[i].nome}:`);
//     console.log(`   De: R$ ${estoque[i].preco.toFixed(2)}`);
//     console.log(`   Por: R$ ${precoComDesconto.toFixed(2)}\n`);
// };