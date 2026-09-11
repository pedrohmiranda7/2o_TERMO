// Lista = forma de armazenar informações, é em forma de "[]"

// Array e Lista são quase a mesma coisa 

// Laço (loop) = for e while

// Objetos vão armazenar dados de uma variável, utilizamos "{}"

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Contéudos que vão cair na prova:
    
//     função,
//     lista,
//     array,
//     laço,
//     objeto;

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FUNÇÃO;

const entrada = require('readline-sync')
function calcularMedia (n1,n2) {
    return (n1 + n2) / 2;
}

const numero1 = entrada.questionInt("Qual a sua nota 1? \n")
const numero2 = entrada.questionInt("Qual a sua nota 2? \n")

const resultado = calcularMedia (numero1, numero2)

console.log(`A média calculada foi ${resultado}`);

console.log()

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OBJETO;

const produto = {
    nome: "Teclado mecânico",
    preco: 150.00,
    estoque: 25,
    emOferta: true
};

console.log(`Produto: ${produto.nome}`);
console.log(`Preço: R$ ${produto.preco.toFixed}`)
console.log(produto)
console.log(`Produto: ${produto.nome} | ${produto.preco} | ${produto.estoque} | ${produto.emOferta} |`)

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Função para validar status (Aprovado/Reprovado)
function verificarStatus (nota) {
    return nota >= 7 ? "APROVADO" : "REPROVADO";
}

const turma = [];

// Loop para cadastrar objetos no Array;
for (let i = 0; i < 3; i++) {
    console.log(`\n--- Cadastro do Aluno ${i+1} ---`);
    let nomeAluno = entrada.question("Nome: ");
    let notaAluno = entrada.questionFloat("Nota: ");


    // Criando o objeto e guardando no Array
    const novoALuno = {
        nome: nomeAluno,
        nota: notaAluno,
        status: verificarStatus (notaAluno) // Usando a função aqui!
    };

    turma.push(novoALuno);
}


console.log("\n======= RELATÓRIO FINAL =======");
for (let i = 0; i < turma.length; i++) {
    console.log(`${turma[i].nome} - Nota: ${turma[i].nota} | Status: ${turma[i].status}`);
}