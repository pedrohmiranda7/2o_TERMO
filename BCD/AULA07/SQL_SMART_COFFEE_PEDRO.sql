-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE Produtos (
    Quantidade_Produtos int not null,
    descricao varchar(100) not null,
    Tamanho_Produto float not null,
    ID_Produtos int auto_increment primary key
);

CREATE TABLE Funcionarios (
    Telefone_Funcionarios varchar(15) not null,
    Nome_Funcionarios varchar(50) not null,
    data_admissao date not null,
    Escala_Funcionario time not null,
    Cargo_Funcionarios varchar(50) not null,
    CPF varchar(14) not null unique,
    salario decimal(10, 2) not null,
    ID_Funcionarios int,
    PRIMARY KEY(CPF,ID_Funcionarios)
);

CREATE TABLE Pedidos (
    presencial varchar(50),
    delivery varchar(50),
    Valor_Total_Pedidos decimal(10,2) not null,
    Status_Pedido varchar(50) not null,
    Observacoes_Pedido varchar(100) not null,
    Data_Hora_Pedido datetime not null,
    ID_Pedidos int auto_increment primary key,
    ID_Pagamento int
);
CREATE TABLE pagamento (
    ID_Pagamento int auto_increment primary key,
    Comprovante_Pagamento int not null,
    Valor_pago decimal(10,2) not null,
    Data_Hora_Pagamento datetime not null,
    Status_Pagamento enum('pix', 'cartao', 'dinheiro') default 'cartao'
);

CREATE TABLE delivery (
    id_delivery int auto_increment PRIMARY KEY,
    id_pedidos int not null,
    endereco_entrega varchar(100) not null,
    previsao_entrega datetime not null,
    nome_entregador varchar(50) not null,
    status_entrega varchar(50) not null,
    taxa_entrega decimal(10,2) not null,
    data_hora_saida datetime not null,
    FOREIGN KEY (id_pedidos) REFERENCES Delivery(id_pedidos)
);

CREATE TABLE programa_fidelidade (
    id_fidelidade int auto_increment PRIMARY KEY,
    nivel_fidelidade varchar(50) not null,
    data_cadastro datetime not null,
    pontos_acumulados int not null,
    saldo_pontos int not null,
    data_validade_pontos datetime not null,
    data_ultima_atualizacao datetime not null
);

CREATE TABLE clientes (
    id_clientes int auto_increment primary key,
    nome_clientes varchar(50) not null,
    data_nascimento_clientes date not null,
    telefone_clientes varchar(15) not null,
    email_clientes varchar(100) not null,
    data_cadastro date not null,
    cpf varchar(14) not null unique,
    id_fidelidade int,
    FOREIGN KEY (id_fidelidade) REFERENCES clientes(id_fidelidade)
);

CREATE TABLE estoque (
    id_estoque int auto_increment primary key,
    nome_insumo varchar(50) not null,
    kg varchar(50),
    ml varchar(50),
    un varchar(50),
    validade_produto date not null,
    fornecedor_produto varchar(50) not null,
    quantidade_minima int not null
);

CREATE TABLE fornecedor (
    id_fornecedor int auto_increment primary key,
    nome_fornecedor varchar(50) not null,
    cnpj_fornecedor varchar(18) not null,
    email_fornecedor varchar(100) not null,
    telefone_fornecedor varchar(50) not null,
    id_estoque int,
    FOREIGN KEY (id_estoque) REFERENCES fornecedor (id_estoque)
);

CREATE TABLE categoria (
    id_categoria int auto_increment primary key,
    nome_categoria varchar(50) not null,
    setor_preparo varchar(50) not null,
    data_criacao_categoria datetime not null,
    tipo_servico varchar(50) not null,
    classificacao_categoria varchar(50) not null,
    id_produtos int,
    FOREIGN KEY (id_produtos) REFERENCES categoria(id_produtos)
);

CREATE TABLE realiza (
    id_pedidos int,
    cpf varchar(14),
    id_clientes int,
    FOREIGN KEY (id_pedidos) REFERENCES realiza (id_pedidos),
    FOREIGN KEY (id_clientes) REFERENCES realiza (id_clientes)
);

CREATE TABLE atende (
    id_pedidos int,
    cpf varchar(14),
    id_funcionarios int,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(ID_Pedidos),
    FOREIGN KEY (id_funcionarios) REFERENCES Funcionarios(ID_Funcionarios),
    
    CONSTRAINT fk_pedidos FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    CONSTRAINT fk_funcionarios FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios)
);

CREATE TABLE consome (
    id_estoque int,
    id_produtos int,
    FOREIGN KEY (id_estoque) REFERENCES consome(id_estoque),
    FOREIGN KEY (id_produtos) REFERENCES consome(id_produtos)
);

CREATE TABLE entrega (
    id_delivery int,
    cpf varchar(14),
    id_funcionarios int,
    FOREIGN KEY (id_delivery) REFERENCES entrega(id_delivery),
    FOREIGN KEY (id_funcionarios) REFERENCES entrega(id_funcionarios)
);

CREATE TABLE Compoem (
    ID_Produtos int ,
    ID_Pedidos int,
    FOREIGN KEY (id_produtos) REFERENCES compoem (id_produto),
    FOREIGN KEY (id_pedidos) REFERENCES compoem (id_pedido),
);

CREATE TABLE Contem (
    ID_Pedidos int,
    ID_Pagamento int,
    ID_Produtos int,
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_pagamento) REFERENCES pagamento(id_pagamento),
    FOREIGN KEY (id_produtos) REFERENCES produtos(id_produto)
);