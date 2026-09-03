const fs = require('fs');

const produtos = [
    {id:1, nome: "teclado", qtd:90},
    {id:1, nome: "mouse", qtd:30},
    {id:1, nome: "monitor",qtd: 50},
   
]

function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2);
    fs.writeFileSync('produtos.json', dadosTexto);
}
function verEstoquebaixo() {
    console.log("\n --- produtos com estoque baixo (menos de 100) ---");
    const baixoEstoque = produtos.filter(p => p.qtd < 100);
    console.log(baixoEstoque);
}
salvarDados();
verEstoquebaixo();