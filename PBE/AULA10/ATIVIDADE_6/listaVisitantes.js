const entrada = require('readline-sync');

let listaVisitantes = [];

while (true) {
    let opcao = entrada.question("Deseja cadastrar um visitante? (s/n): ");

    if (opcao.toLowerCase() !== 's') {
        break; // Sai do loop se não for 's'
    }

    let nome = entrada.question("Nome do visitante: ");
    let empresa = entrada.question("Empresa: ");
    
    listaVisitantes.push({
        nome: nome,
        empresa: empresa
    });

    console.log("Registrado com sucesso!\n");
}

console.log("\n=== VISITANTES DO DIA ===");

for (let i = 0; i < listaVisitantes.length; i++) {
    console.log(`${i + 1}. ${listaVisitantes[i].nome} (${listaVisitantes[i].empresa})`);
}