function calcularTotal(preco,quantidade) {
    return preco * quantidade
}

function gerarCupom(nome,total) {
     return `Cliente: ${nome} - Total: ${total.toFixed(2)}`
};

module.exports = {
    calcularTotal,
    gerarCupom
};
