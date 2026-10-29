// PROJETO DO ALUNO - complete as funções abaixo.
// Execute com: npm start
const fs = require('node:fs');
const caminho = require('node:path');
const ARQUIVO = caminho.join(__dirname, 'maquinas.json');

function carregarMaquinas() {
  // TODO 1: ler ARQUIVO com fs.readFileSync(ARQUIVO, 'utf8').
  const texto = fs.readFileSync(maquinas.json, 'utf8');
  console.log(typeof texto);
  console.log(texto)

  // TODO 2: converter o texto JSON em array com JSON.parse(...).
  const maquinas = JSON.parse(texto);

  // TODO 3: retornar o array.
  console.log(maquinas)
  throw new Error('Implementar carregarMaquinas')
}

function listarMaquinas(maquinas) {
  // TODO 4: percorrer com forEach e apresentar id, nome e status.
  maquinas.forEach(function(maquina) {
    console.log("ID:", maquina.id, "| Nome:", maquina.nome, "| Status:", maquina.status);
  });
}

function buscarPorId(maquinas, id) {
  // TODO 5: encontrar com find(). O ID recebido deve ser número.
  const idNum = Number(id);
  return maquinas.find(function(maquina) {
    return maquina.id === idNum;
  });
}

function filtrarPorStatus(maquinas, status) {
  // TODO 6: retornar um novo array com filter().
  return maquinas.filter(function(maquina) {
    return maquina.status === status;
  });
}

function filtrarPorSetor(maquinas, setor) {
  // DESAFIO: retornar máquinas do setor informado.
  return maquinas.filter(function(maquina) {
    return maquina.setor === setor;
  });
}

function executar() {
  // TODO 7: chamar carregarMaquinas, listarMaquinas e fazer consultas.
  // Exemplos a testar: id 3, id 99, status 'manutencao'.
  console.log('Sistema de consultas industriais - CRUD READ');

  const maquinas = carregarMaquinas();
  listarMaquinas(maquinas);

  // Testes simples
  console.log("Buscar ID 3:", buscarPorId(maquinas, 3));
  console.log("Buscar ID 99:", buscarPorId(maquinas, 99));
  console.log("Filtrar manutenção:", filtrarPorStatus(maquinas, 'manutencao'));
}

if (require.main === module) executar();
module.exports = {
  carregarMaquinas, listarMaquinas, buscarPorId, filtrarPorStatus,filtrarPorSetor 
};