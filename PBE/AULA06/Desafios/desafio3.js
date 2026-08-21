// const entrada = require('readline-sync')

// function calcularArea(n1, n2) {
//     return n1 * n2; 
// }

// const largura1 = entrada.questionFloat("Digite a primeira largura: \n")
// const comprimento1 = entrada.questionFloat("Digite o primeiro comprimento: \n")

// const largura2 = entrada.questionFloat("Digite a segunda largura: \n")
// const comprimento2 = entrada.questionFloat("Digite o segundo comprimento: \n")

// const largura3 = entrada.questionFloat("Digite a terceira largura: \n")
// const comprimento3 = entrada.questionFloat("Digite o terceiro comprimento: \n")

// const area1 = calcularArea (largura1, comprimento1)
// const area2 = calcularArea (largura2, comprimento2)
// const area3 = calcularArea (largura3, comprimento3)

// console.log(`O tamanho do primeiro terreno é ${area1}! `)
// console.log(`O tamanho do segundo terreno é ${area2}! `)
// console.log(`O tamanho do terceiro terreno é ${area3}! `)

//Maneira do professor

const entrada = require('readline-sync')
function calcularArea(largura, comprimento) {
    return largura * comprimento
}

for(let i = 1; i < 4; i++) {
    let largura = entrada.questionFloat(`Informe a largura do terreno ${i}:\n`);

    let comprimento = entrada.questionFloat(`Informe o comprimento do terreno ${i}:\n`);

    let area = calcularArea(largura, comprimento);

    console.log(`O terreno ${i} tem area de ${area}`);
}