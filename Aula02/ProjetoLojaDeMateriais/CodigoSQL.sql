
CREATE TABLE CARRINHO (
valortotal DECIMAL (7,22),
idproduto INT,	
valorproduto DECIMAL (7,22),
descricaoprodouto VARCHAR (100)
)

CREATE TABLE PRODUTOS (
idproduto SERIAL PRIMARY KEY,
estoqueproduto int,
valorproduto DECIMAL (7,22),
descricaoproduto VARCHAR (100)
)

CREATE TABLE FUNCIONARIOS (
email VARCHAR(100),
matricula INT NOT NULL,
usuario VARCHAR(20),
senha VARCHAR (50)
)

CREATE TABLE CLIENTES (
email VARCHAR (100),
CPF CHAR(14),
senha VARCHAR (50),
datanascimento DATE
) 

SELECT * FROM CARRINHO, CLIENTES, FUNCIONARIOS, PRODUTOS


