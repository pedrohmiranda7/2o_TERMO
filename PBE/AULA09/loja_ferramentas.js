const fs = require('fs');

const produtos = [
    {id:1, nome: "parafuso", qtd:100},
    {id:1, nome: "porca", qtd:250},
    {id:1, nome: "arruela", qtd:100},
]

function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2)

    fs.writeFileSync('estoque.json', dadosTexto)
    console.log("Dados salvos sucesso no arquivo estoque.json");
}
function verEstoquebaixo() {
    console.log("\n --- produtos com estoque baixo (menos de 100) ---");

    const baixoEstoque = produtos.filter(p => p.qtd < 100);
    console.log(baixoEstoque);

}
salvarDados();