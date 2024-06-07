-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CARRINHO (
id produto FOREIGN KEY PRIMARY KEY,
valor total DECIMAL (7,22),
valor produto FOREIGN KEY ,
descricao prodouto FOREIGN KEY
)

CREATE TABLE PRODUTOS (
id produto SERIAL PRIMARY KEY PRIMARY KEY,
estoque do produto int,
valor produto DECIMAL (7,22),
descricao do produto VARCHAR (100)
)

CREATE TABLE FUNCIONARIOS (
email VARCHAR(100) PRIMARY KEY,
matricula INT NOT FULL,
usuario VARCHAR(20),
senha VARCHAR (50)
)

CREATE TABLE CLIENTES (
email VARCHAR (100) PRIMARY KEY,
CPF Texto(1),
senha VARCHAR (50),
data nascimento Texto(1)
)

CREATE TABLE Relação_1 (
email VARCHAR(100),
-- Erro: nome do campo duplicado nesta tabela!
email VARCHAR (100),
id produto SERIAL PRIMARY KEY,
-- Erro: nome do campo duplicado nesta tabela!
id produto FOREIGN KEY,
PRIMARY KEY(email,email,id produto,id produto)
)

