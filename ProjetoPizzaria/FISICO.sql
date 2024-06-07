-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE cad_funcionarios (
emailf VARCHAR(100) PRIMARY KEY,
matricula INT NOT NULL,
senhaf VARCHAR (100)
)

CREATE TABLE cad_clientes (
emailc VARCHAR (100) PRIMARY KEY,
numero_celular INT CHAR (11),
data_nascimento DATE,
cpf CHAR (14),
senhac VARCHAR (100),
endereco VARCHAR (100)
)

CREATE TABLE cardapio (
id_produto SERIAL PRIMARY KEY PRIMARY KEY,
observacao_produto VARCHAR (100),
ingredientes_produtos VARCHAR(100),
valor_produto DECIMAL (7,22)
)

CREATE TABLE carrinho (
id_produto REFERENCES CARDAPIO (id_produto) PRIMARY KEY,
preco_total DECIMAL (7,22),
valor_produto REFERENCES cardapio (valor_produto)
)

CREATE TABLE delivery (
id_produto REFERENCES CARDAPIO (id_produto) PRIMARY KEY,
valor_entrega DECIMAL (7,22),
valor_produto REFERENCES CARDAPIO (valor_produto),
endereco_entrega VARCHAR (100),
ingredientes_produtos REFERENCES CARDAPIO (ingredientes_produto),
preco_total DECIMAL (7,22)
)

CREATE TABLE Relação_1 (
emailc VARCHAR (100),
emailf VARCHAR(100),
FOREIGN KEY(emailc) REFERENCES cad_clientes (emailc),
FOREIGN KEY(emailf) REFERENCES cad_funcionarios (emailf)
)

CREATE TABLE Relação_2 (
id_produto SERIAL PRIMARY KEY,
-- Erro: nome do campo duplicado nesta tabela!
id_produto REFERENCES CARDAPIO (id_produto),
-- Erro: nome do campo duplicado nesta tabela!
id_produto REFERENCES CARDAPIO (id_produto),
PRIMARY KEY(id_produto,id_produto,id_produto)
)

