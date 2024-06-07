create table cadfun (
CODFUN INT NOT NULL PRIMARY KEY, 
NOME VARCHAR (40) NOT NULL, 
DEPTO CHAR (2), 
FUNCAO CHAR (20), 
SALARIO NUMERIC (10,20)
)

INSERT INTO cadfun
VALUES (1, 'João Silva', 'RH', 'Analista de Recursos Humanos', 5000.00),
(2, 'Maria Santos', 'TI', 'Desenvolvedora de Software', 6000.00),
(3, 'José Oliveira', 'VENDAS', 'Gerente de Vendas', 7000.00),
(4, 'Ana Souza', 'FIN', 'Analista Financeiro', 5500.00);

SELECT CODFUN, NOME
FROM cadfun; 

SELECT NOME, SALARIO
FROM VENDEDOR;

SELECT DESCRICAO, VALORUNIT FROM PRODUTO;