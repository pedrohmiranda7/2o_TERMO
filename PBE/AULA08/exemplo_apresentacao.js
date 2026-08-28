class Produto {
  
  constructor(nome, preco) {
    this.nome = nome;   // Atributo
    this.preco = preco; // Atributo
  }

  exibir() {
    console.log(`${this.nome} - R$ ${this.preco}`);
  }
}

const produto1 = new Produto("Mouse", 80);

produto1.exibir(); 

// class Aluno {
//   // O construtor define como o objeto será criado
//   constructor(nome, idade) {
//     this.nome = nome;   // Atributo
//     this.idade = idade; // Atributo
//   }
// }

// // O operador 'new' executa o construtor nos bastidores
// const aluno1 = new Aluno("Ana", 20); 