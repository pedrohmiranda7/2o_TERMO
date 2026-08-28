const entrada = require('readline-sync');
const { verificarPeso } = require('./funcoesBalanca');

while (true) {
  try {
    const peso = entrada.question('Digite o peso da peca (ou "sair"): ');

    if (peso.toLowerCase() === 'sair') {
      console.log('Encerrando o sistema da balanca.');
      break;
    }

    const resultado = verificarPeso(peso);
    console.log(resultado);

  } catch (erro) {
    console.log(`⚠️ ALERTA: ${erro.message}`);
  }
}