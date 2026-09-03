# 🗄️ BCD — Banco de Dados

## 📋 1. Visão Geral da Disciplina

**Curso:** Desenvolvimento de Sistemas  
**Disciplina:** BCD — Banco de Dados  
**Carga Horária:** Conforme plano de ensino  
**Área:** Banco de Dados

### 🎯 Objetivo Geral

Capacitar o aluno a compreender, modelar, criar e manipular bancos de dados relacionais, utilizando conceitos de modelagem de dados e comandos SQL para armazenamento, consulta e gerenciamento de informações.

---

## 🧩 2. Módulo I: Fundamentos de Banco de Dados

### 1.1 Introdução a Banco de Dados

- 🗄️ Conceito de banco de dados.
- ⚙️ Sistemas de gerenciamento de banco de dados.
- 🔗 Banco de dados relacional.
- 📊 Tabelas, registros e campos.
- 🔑 Chaves primárias e estrangeiras.
- 🛡️ Integridade dos dados.

### 1.2 Sistemas Gerenciadores de Banco de Dados

- 💾 Conceito de SGBD.
- 🐬 MySQL.
- 🖥️ MySQL Workbench.
- 🗄️ Criação e gerenciamento de bancos.
- 🔌 Conexão com bancos de dados.

---

## 📐 3. Módulo II: Modelagem de Dados

### 2.1 Modelo Entidade-Relacionamento

- 📦 Entidades.
- 🏷️ Atributos.
- 🔗 Relacionamentos.
- 📊 Cardinalidade.
- 🔑 Chaves primárias.
- 🔐 Chaves estrangeiras.

### 2.2 Modelo Relacional

Transformação do modelo conceitual para estruturas relacionais.

Exemplo:

```text
┌─────────────────────┐
│       CLIENTE       │
├─────────────────────┤
│ id_cliente          │
│ nome                │
│ email               │
│ telefone            │
└─────────────────────┘

┌─────────────────────┐
│        PEDIDO       │
├─────────────────────┤
│ id_pedido           │
│ data                │
│ valor               │
│ id_cliente          │
└─────────────────────┘

2.3 Normalização
🧹 Redundância de dados.
1️⃣ Primeira Forma Normal.
2️⃣ Segunda Forma Normal.
3️⃣ Terceira Forma Normal.
📊 Organização e consistência dos dados.
💻 4. Módulo III: SQL
3.1 Criação e Alteração
Utilização de comandos para criação e gerenciamento de estruturas.

CREATE DATABASE sistema;

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100)
);

3.2 Manipulação de Dados
Principais comandos:

INSERT
UPDATE
DELETE
SELECT

3.3 Consultas
🔎 SELECT.
🔍 WHERE.
↕️ ORDER BY.
📊 GROUP BY.
🧮 HAVING.
🔢 DISTINCT.
⚖️ Operadores relacionais e lógicos.
3.4 Relacionamentos e JOINs
🔗 INNER JOIN.
🔗 LEFT JOIN.
🔗 RIGHT JOIN.
📊 Relacionamento entre tabelas.
🔎 Consultas envolvendo múltiplas tabelas.
📅 5. Cronograma de Aulas Sugerido
Aula	Conteúdo	Tecnologia Foco
01	🗄️ Introdução a Banco de Dados	Conceitos
02	⚙️ SGBD e MySQL	MySQL
03	📊 Tabelas e tipos de dados	SQL
04	🔑 Chaves e relacionamentos	Modelagem
05	📐 Modelo Entidade-Relacionamento	MER
06	💻 Criação de bancos e tabelas	SQL
07	➕ INSERT, UPDATE e DELETE	SQL
08	🔎 SELECT e filtros	SQL
09	🔗 JOINs e consultas avançadas	SQL
10	🚀 Projeto de banco de dados	MySQL

📝 6. Metodologia de Avaliação e Projetos
🧪 Atividades Práticas
Desenvolvimento de exercícios envolvendo criação de bancos, tabelas, inserção de dados, consultas e relacionamentos.

🚀 Projeto Final
Criação de um banco de dados completo para um sistema, incluindo:

📐 Modelagem;
📊 Criação das tabelas;
🔑 Definição das chaves;
🔗 Relacionamentos;
➕ Inserção de dados;
🔎 Consultas SQL.
🛠️ Tecnologias Utilizadas
🗄️ SQL
🐬 MySQL
🖥️ MySQL Workbench
💻 Visual Studio Code
🔀 Git
🐙 GitHub
🚀 Objetivo da Pasta
Esta pasta tem como objetivo armazenar os exercícios, scripts SQL, atividades e projetos desenvolvidos durante a disciplina de Banco de Dados.

📌 Curso: Desenvolvimento de Sistemas
📚 Disciplina: BCD — Banco de Dados
💾 Área: Banco de Dados