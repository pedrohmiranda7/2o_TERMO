-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
ID_Cliente int auto_increment primary key PRIMARY KEY,
Nome_Cliente varchar(50) not null
);

CREATE TABLE Pedido (
Data_Pedido datetime not null,
ID_Pedido int auto_increment primary key PRIMARY KEY,
ID_Cliente int auto_increment primary key,
FOREIGN KEY(ID_Cliente) REFERENCES Cliente (ID_Cliente)
);

CREATE TABLE Produto+Estoque (
ID_Produto int auto_increment primary key,
Nome_Produto varchar(50) not null,
ID_Estoque int auto_increment primary key,
Quantidade int not null,
PRIMARY KEY(ID_Produto,ID_Estoque)
);

CREATE TABLE Fornecedor (
Razão_Social varchar(50) not null,
ID_Fornecedor int auto_increment primary key PRIMARY KEY
);

CREATE TABLE Produto (
ID_Produto int auto_increment primary key PRIMARY KEY,
Nome_Produto varchar(50) not null
);

CREATE TABLE Item_Produto (
Valor decimal (10,2),
ID_Produto int not null,
ID_Fornecedor int not null,
ID_Item int auto_increment primary key PRIMARY KEY/
);

