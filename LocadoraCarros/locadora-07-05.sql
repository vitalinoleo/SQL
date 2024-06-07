-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE Carro (
    Ano VARCHAR(255) NOT NULL,
    Id_Carro VARCHAR(255) NOT NULL PRIMARY KEY,
    Placa VARCHAR(255) NOT NULL,
    Modelo VARCHAR(255) NOT NULL,
    Tipo VARCHAR(255) NOT NULL,
    Disponibilidade VARCHAR(255) NOT NULL
);

CREATE TABLE Cliente (
    Id_Cliente VARCHAR(255) NOT NULL PRIMARY KEY,
    Estado VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    Cidade VARCHAR(255) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Celular VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Id_Pagamento VARCHAR(255) NOT NULL
--     FOREIGN KEY(Id_Pagamento) REFERENCES Pagamento(Id_Pagamento)
); 

-- Adicionando a chave estrangeira à tabela Cliente
ALTER TABLE Cliente
ADD CONSTRAINT fk_cliente_pagamento
FOREIGN KEY (Id_Pagamento) REFERENCES Pagamento(Id_Pagamento);


CREATE TABLE Funcionario (
    Cargo VARCHAR(255) NOT NULL,
    Id_Funcionario VARCHAR(255) NOT NULL PRIMARY KEY,
    Sobrenome VARCHAR(255) NOT NULL,
    Nome VARCHAR(255) NOT NULL,
    Data_Contratacao VARCHAR(255) NOT NULL,
    Salario VARCHAR(255) NOT NULL,
    Num_Agencia VARCHAR(255) NOT NULL,
    FOREIGN KEY(Num_Agencia) REFERENCES Agenda(Num_Agencia)
);

CREATE TABLE Agenda (
    Num_Agencia VARCHAR(255) NOT NULL PRIMARY KEY,
    Contato VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Estado VARCHAR(255) NOT NULL,
    Cidade VARCHAR(255) NOT NULL
);

CREATE TABLE Pagamento  (
    Id_Pagamento VARCHAR(255) NOT NULL PRIMARY KEY,
    Valor VARCHAR(255) NOT NULL,
    Data_Pagamento VARCHAR(255) NOT NULL,
    Status_Pagamento VARCHAR(255) NOT NULL,
    Forma_Pagamento VARCHAR(255) NOT NULL,
    Id_Realiza VARCHAR(255) NOT NULL,
    Comprovante VARCHAR(255)
--     FOREIGN KEY(Id_Realiza) REFERENCES Realiza(Id_Realiza)
); 

-- Adicionando a chave estrangeira à tabela Pagamento
ALTER TABLE Pagamento
ADD CONSTRAINT fk_pagamento_realiza
FOREIGN KEY (Id_Realiza) REFERENCES Realiza(Id_Realiza);


CREATE TABLE Manutencao (
    Id_Manutencao VARCHAR(255) NOT NULL PRIMARY KEY,
    Data_Manutencao VARCHAR(255) NOT NULL,
    Tipo_Manutencao VARCHAR(255) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    KM VARCHAR(255) NOT NULL,
    Custo VARCHAR(255) NOT NULL
);

CREATE TABLE FeedBack (
    Id_Feedback VARCHAR(255) NOT NULL PRIMARY KEY,
    Comentario VARCHAR(255) NOT NULL,
    Avaliacao VARCHAR(255) NOT NULL,
    Data_Feedback VARCHAR(255) NOT NULL
);

CREATE TABLE Locacao (
    Data_locacao VARCHAR(255) NOT NULL,
    Data_Devolucao VARCHAR(255) NOT NULL,
    Id_locacao VARCHAR(255) NOT NULL PRIMARY KEY,
    Valor_total VARCHAR(255) NOT NULL,
    Id_Carro VARCHAR(255) NOT NULL,
    Id_Cliente VARCHAR(255) NOT NULL,
    FOREIGN KEY(Id_Carro) REFERENCES Carro (Id_Carro),
    FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

CREATE TABLE Faz (
    Id_Manutencao VARCHAR(255) NOT NULL,
    Id_Carro VARCHAR(255) NOT NULL,
    FOREIGN KEY(Id_Manutencao) REFERENCES Manutencao (Id_Manutencao),
    FOREIGN KEY(Id_Carro) REFERENCES Carro (Id_Carro)
);

CREATE TABLE Registra (
    Id_Feedback VARCHAR(255) NOT NULL,
    Id_Cliente VARCHAR(255) NOT NULL,
    FOREIGN KEY(Id_Feedback) REFERENCES FeedBack (Id_Feedback),
    FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
);

CREATE TABLE Realiza (
    Id_Realiza VARCHAR(255) NOT NULL PRIMARY KEY,
    Id_Pagamento VARCHAR(255) NOT NULL,
    FOREIGN KEY(Id_Pagamento) REFERENCES Pagamento (Id_Pagamento)
);

ALTER TABLE Cliente ADD FOREIGN KEY(Id_Pagamento) REFERENCES Pagamento(Id_Pagamento);
ALTER TABLE Funcionario ADD FOREIGN KEY(Num_Agencia) REFERENCES Agenda (Num_Agencia);


-- Inserindo dados na tabela Carro
INSERT INTO Carro (Ano, Id_Carro, Placa, Modelo, Tipo, Disponibilidade)
VALUES 
    ('2022', 'CAR001', 'ABC1234', 'Fusca', 'Sedan', 'Disponível'),
    ('2020', 'CAR002', 'DEF5678', 'Gol', 'Hatchback', 'Alugado'),
    ('2021', 'CAR003', 'GHI9012', 'Corolla', 'Sedan', 'Disponível');

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Id_Cliente, Estado, Sobrenome, Cidade, Nome, Endereco, Celular, Email, Id_Pagamento)
VALUES 
    ('CLI001', 'SP', 'Silva', 'São Paulo', 'João', 'Rua A, 123', '11999999999', 'joao@email.com', 'PAG001'),
    ('CLI002', 'RJ', 'Santos', 'Rio de Janeiro', 'Maria', 'Av. B, 456', '21988888888', 'maria@email.com', 'PAG002'),
    ('CLI003', 'MG', 'Oliveira', 'Belo Horizonte', 'Pedro', 'Rua C, 789', '31977777777', 'pedro@email.com', 'PAG003');

-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (Cargo, Id_Funcionario, Sobrenome, Nome, Data_Contratacao, Salario, Num_Agencia)
VALUES 
    ('Gerente', 'FUNC001', 'Ferreira', 'Carlos', '2020-01-01', '5000.00', 'AG001'),
    ('Atendente', 'FUNC002', 'Santana', 'Ana', '2021-03-15', '2500.00', 'AG002'),
    ('Motorista', 'FUNC003', 'Machado', 'Paulo', '2022-02-10', '3000.00', 'AG003');

-- Inserindo dados na tabela Agenda
INSERT INTO Agenda (Num_Agencia, Contato, Endereco, Estado, Cidade)
VALUES 
    ('AG001', 'João Silva', 'Rua X, 123', 'SP', 'São Paulo'),
    ('AG002', 'Maria Santos', 'Av. Y, 456', 'RJ', 'Rio de Janeiro'),
    ('AG003', 'Pedro Oliveira', 'Rua Z, 789', 'MG', 'Belo Horizonte');

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (Id_Pagamento, Valor, Data_Pagamento, Status_Pagamento, Forma_Pagamento, Id_Realiza, Comprovante)
VALUES 
    ('PAG001', '1000.00', '2022-01-05', 'Pago', 'Cartão de Crédito', 'R001', 'comp001.pdf'),
    ('PAG002', '1500.00', '2022-02-10', 'Pago', 'Boleto Bancário', 'R002', 'comp002.pdf'),
    ('PAG003', '2000.00', '2022-03-15', 'Pago', 'Transferência Bancária', 'R003', 'comp003.pdf');

-- Inserindo dados na tabela Manutencao
INSERT INTO Manutencao (Id_Manutencao, Data_Manutencao, Tipo_Manutencao, Descricao, KM, Custo)
VALUES 
    ('MNT001', '2022-01-10', 'Corretiva', 'Troca de óleo e filtros', '10000', '200.00'),
    ('MNT002', '2022-02-20', 'Preventiva', 'Verificação geral', '15000', '300.00'),
    ('MNT003', '2022-03-30', 'Corretiva', 'Reparo no sistema elétrico', '20000', '250.00');

-- Inserindo dados na tabela FeedBack
INSERT INTO FeedBack (Id_Feedback, Comentario, Avaliacao, Data_Feedback)
VALUES 
    ('FB001', 'Ótimo atendimento!', '5', '2022-01-15'),
    ('FB002', 'Carro com problema no ar condicionado.', '3', '2022-02-25'),
    ('FB003', 'Entrega do carro atrasada.', '2', '2022-04-05'); 
	
INSERT INTO Locacao (Data_locacao, Data_Devolucao, Id_locacao, Valor_total, Id_Carro, Id_Cliente)
VALUES 
    ('2022-01-20', '2022-01-25', 'LOC001', '300.00', 'CAR001', 'CLI001'),
    ('2022-02-05', '2022-02-10', 'LOC002', '250.00', 'CAR002', 'CLI002'),
    ('2022-03-10', '2022-03-15', 'LOC003', '400.00', 'CAR003', 'CLI003');

-- Inserindo dados na tabela Faz
INSERT INTO Faz (Id_Manutencao, Id_Carro)
VALUES 
    ('MNT001', 'CAR001'),
    ('MNT002', 'CAR002'),
    ('MNT003', 'CAR003');

-- Inserindo dados na tabela Registra
INSERT INTO Registra (Id_Feedback, Id_Cliente)
VALUES 
    ('FB001', 'CLI001'),
    ('FB002', 'CLI002'),
    ('FB003', 'CLI003');

-- Inserindo dados na tabela Realiza
INSERT INTO Realiza (Id_Realiza) VALUES 
    ('R001'),
    ('R002'),
    ('R003'); 

-- Alterar a definição da coluna Id_Pagamento para permitir valores nulos
ALTER TABLE Realiza
ALTER COLUMN Id_Pagamento DROP NOT NULL; 

UPDATE Realiza
SET Id_Pagamento = 'PAG001'
WHERE Id_Realiza = 'R001';

UPDATE Realiza
SET Id_Pagamento = 'PAG002'
WHERE Id_Realiza = 'R002';

UPDATE Realiza
SET Id_Pagamento = 'PAG003'
WHERE Id_Realiza = 'R003'; 


-- 1. **SELECT:**
-- - Selecione todos os carros disponíveis na locadora.
-- - Liste todos os clientes que alugaram um carro nos últimos 3 meses.
-- - Mostre os funcionários que estão cadastrados na agência "X".
-- - Exiba os pagamentos realizados por um cliente específico.
-- - Liste os carros que precisam de manutenção.
-- - Escreva uma consulta para encontrar os clientes que alugaram carros mais de uma vez
-- usando uma subconsulta correlacionada.
-- - Identifique os carros alugados por clientes que vivem na mesma cidade que um
-- determinado funcionário.

SELECT *
FROM Carro
WHERE Disponibilidade = 'Disponível'; 

SELECT *
FROM Cliente
WHERE Id_Cliente IN (
    SELECT DISTINCT Id_Cliente
    FROM Locacao
    WHERE Data_locacao >= CURRENT_DATE - INTERVAL '3 months'
);

SELECT *
FROM Funcionario
WHERE Num_Agencia = 'X';

SELECT *
FROM Pagamento
WHERE Id_Realiza IN (
    SELECT Id_Realiza
    FROM Realiza
    WHERE Id_Pagamento IN (
        SELECT Id_Pagamento
        FROM Cliente
        WHERE Nome = 'Nome do Cliente'
    )
);

SELECT *
FROM Carro
WHERE Id_Carro IN (
    SELECT DISTINCT Id_Carro
    FROM Faz
    WHERE Id_Manutencao IN (
        SELECT Id_Manutencao
        FROM Manutencao
    )
);

SELECT *
FROM Cliente c
WHERE (
    SELECT COUNT(*)
    FROM Locacao l
    WHERE l.Id_Cliente = c.Id_Cliente
) > 1;

SELECT *
FROM Carro
WHERE Id_Carro IN (
    SELECT DISTINCT l.Id_Carro
    FROM Locacao l
    INNER JOIN Cliente c ON l.Id_Cliente = c.Id_Cliente
    INNER JOIN Funcionario f ON c.Cidade = f.Cidade
    WHERE f.Nome = 'Nome do Funcionário'
);

-- 2. **UPDATE:**
-- - Atualize o preço do aluguel de todos os carros da marca "Toyota".
-- - Modifique a data de retorno de um carro alugado por um cliente.
-- - Atualize o status de manutenção de um carro após ter sido consertado.
UPDATE Carro
SET Preco_aluguel = novo_preco
WHERE Marca = 'Toyota';

UPDATE Locacao
SET Data_Devolucao = 'nova_data'
WHERE Id_Carro = 'carro_id' AND Id_Cliente = 'cliente_id'; 

UPDATE Carro
SET Status_manutencao = 'Consertado'
WHERE Id_Carro = 'carro_id';

-- 3. **ALTER TABLE:**
-- - Adicione uma nova coluna à tabela de Carro para armazenar o status de
-- disponibilidade.
-- - Modifique o tipo de dados de uma coluna na tabela de Pagamento.
-- - Remova uma coluna não utilizada da tabela de Cliente.
ALTER TABLE Carro
ADD COLUMN Disponibilidade VARCHAR(255); 

ALTER TABLE Pagamento
ALTER COLUMN Valor TYPE novo_tipo_de_dados;

ALTER TABLE Cliente
DROP COLUMN nome_da_coluna;

-- 4. **JOIN:**
-- - Liste todos os alugueis de carros, incluindo o nome do cliente, modelo do carro e data
-- de aluguel.
-- - Mostre os pagamentos feitos por clientes, incluindo o nome do cliente e o valor pago. 
-- - Exiba os feedbacks deixados pelos clientes, juntamente com o nome do cliente e o
-- modelo do carro alugado. 

SELECT c.Nome AS Nome_Cliente, car.Modelo, l.Data_locacao
FROM Locacao l
JOIN Cliente c ON l.Id_Cliente = c.Id_Cliente
JOIN Carro car ON l.Id_Carro = car.Id_Carro;

SELECT c.Nome AS Nome_Cliente, p.Valor
FROM Pagamento p
JOIN Realiza r ON p.Id_Pagamento = r.Id_Pagamento
JOIN Cliente c ON r.Id_Cliente = c.Id_Cliente;

SELECT c.Nome AS Nome_Cliente, car.Modelo, f.Comentario
FROM Feedback f
JOIN Registra rg ON f.Id_Feedback = rg.Id_Feedback
JOIN Cliente c ON rg.Id_Cliente = c.Id_Cliente
JOIN Locacao l ON c.Id_Cliente = l.Id_Cliente
JOIN Carro car ON l.Id_Carro = car.Id_Carro; 


-- 5. **INNER JOIN:**
-- - Liste os carros disponíveis na agência "X".
-- - Mostre todos os alugueis de carros feitos por clientes que estão na cidade "Y".
-- - Exiba os funcionários que trabalham em agências que têm pelo menos um carro da
-- marca "Toyota". 

SELECT c.Modelo
FROM Carro c
INNER JOIN Locacao l ON c.Id_Carro = l.Id_Carro
INNER JOIN Agenda a ON l.Id_Agencia = a.Id_Agencia
WHERE a.Nome_Agencia = 'X';

SELECT c.Modelo, cl.Nome
FROM Locacao l
INNER JOIN Cliente cl ON l.Id_Cliente = cl.Id_Cliente
INNER JOIN Carro c ON l.Id_Carro = c.Id_Carro
WHERE cl.Cidade = 'Y';


SELECT DISTINCT f.Nome
FROM Funcionario f
INNER JOIN Agenda a ON f.Id_Agencia = a.Id_Agencia
INNER JOIN Locacao l ON a.Id_Agencia = l.Id_Agencia
INNER JOIN Carro c ON l.Id_Carro = c.Id_Carro
WHERE c.Marca = 'Toyota';

-- 6. **LEFT JOIN:**
-- - Liste todos os carros e, se disponível, mostre o feedback associado a cada carro.
-- - Mostre todos os clientes, incluindo aqueles que ainda não alugaram nenhum carro.
-- - Exiba todas as agências e, se houver, o número total de carros disponíveis em cada
-- agência. 

SELECT c.Modelo, f.Comentario
FROM Carro c
LEFT JOIN FeedBack f ON c.Id_Carro = f.Id_Carro;

SELECT cl.Nome, l.Data_locacao
FROM Cliente cl
LEFT JOIN Locacao l ON cl.Id_Cliente = l.Id_Cliente;

SELECT a.Nome_Agencia, COUNT(l.Id_Carro) AS Total_Carros
FROM Agenda a
LEFT JOIN Locacao l ON a.Id_Agencia = l.Id_Agencia
GROUP BY a.Nome_Agencia;

-- 7. **RIGHT JOIN:**
-- - Liste todos os feedbacks deixados pelos clientes, incluindo aqueles que não estão
-- associados a nenhum aluguel de carro.
-- - Mostre todos os carros, incluindo aqueles que ainda não foram alugados por nenhum
-- cliente.
-- - Exiba todas as manutenções realizadas, incluindo aquelas que não estão associadas a
-- nenhum carro específico. 

SELECT f.*, l.Id_locacao
FROM FeedBack f
RIGHT JOIN Locacao l ON f.Id_Feedback = l.Id_Feedback;


SELECT c.*, l.Id_locacao
FROM Carro c
RIGHT JOIN Locacao l ON c.Id_Carro = l.Id_Carro; 

SELECT m.*, f.Id_Carro
FROM Manutencao m
RIGHT JOIN Faz f ON m.Id_Manutencao = f.Id_Manutencao;

-- 8. **Subconsultas (Subqueries):**
-- - Escreva uma consulta para encontrar os clientes que alugaram carros mais de uma
-- vez.
-- - Identifique os carros mais alugados por clientes que deram feedback positivo.

SELECT Id_Cliente, COUNT(*) AS total_alugueis
FROM Locacao
GROUP BY Id_Cliente
HAVING COUNT(*) > 1;

SELECT c.Modelo, COUNT(*) AS total_alugueis
FROM Carro c
JOIN Locacao l ON c.Id_Carro = l.Id_Carro
WHERE l.Id_Cliente IN (
    SELECT Id_Cliente
    FROM FeedBack
    WHERE Avaliacao = 'positivo'
)
GROUP BY c.Modelo
ORDER BY COUNT(*) DESC;

-- 9. **Agregações:**
-- - Calcule o total de pagamentos recebidos pela locadora em um determinado período.
-- - Determine a média de dias que os carros passam em manutenção antes de serem
-- novamente disponibilizados para aluguel. 

SELECT SUM(Valor) AS total_pagamentos
FROM Pagamento
WHERE Data_Pagamento BETWEEN '2024-01-01' AND '2024-03-31';

SELECT AVG(DATEDIFF(Data_Disponibilidade, Data_Manutencao)) AS media_dias_manutencao
FROM Manutencao;

-- 9.1 Agregações Simples:
-- Total de carros disponíveis na locadora
SELECT COUNT(*) AS total_carros_disponiveis
FROM Carro
WHERE Disponibilidade = 'Disponível';

-- Valor total arrecadado com alugueis no último trimestre
SELECT SUM(Valor_total) AS total_arrecadado
FROM Locacao
WHERE Data_locacao BETWEEN '2024-01-01' AND '2024-03-31';

-- Preço médio de aluguel por dia de todos os carros disponíveis
SELECT AVG(Valor_total / DATEDIFF(Data_Devolucao, Data_locacao)) AS preco_medio_diario
FROM Locacao
WHERE Data_locacao BETWEEN '2024-01-01' AND '2024-03-31';

-- 9.2 Agregações com Agrupamento:
-- Contagem de carros por modelo
SELECT Modelo, COUNT(*) AS quantidade
FROM Carro
GROUP BY Modelo;

-- Valor total de alugueis por mês
SELECT EXTRACT(MONTH FROM Data_locacao) AS mes, SUM(Valor_total) AS total_alugueis
FROM Locacao
GROUP BY EXTRACT(MONTH FROM Data_locacao);

-- Soma de pagamentos por método de pagamento
SELECT Forma_Pagamento, SUM(Valor) AS total_pagamentos
FROM Pagamento
GROUP BY Forma_Pagamento;

-- 9.3 Agregações com Filtros:
-- Número total de carros disponíveis apenas na agência "X"
SELECT COUNT(*) AS total_carros_agencia_X
FROM Carro c
JOIN Agenda a ON c.Num_Agencia = a.Num_Agencia
WHERE a.Cidade = 'X' AND c.Disponibilidade = 'Disponível';

-- Valor total arrecadado com alugueis apenas dos clientes que estão na cidade "Y"
SELECT SUM(l.Valor_total) AS total_arrecadado_cidade_Y
FROM Locacao l
JOIN Cliente cl ON l.Id_Cliente = cl.Id_Cliente
WHERE cl.Cidade = 'Y';

-- Média de dias que os carros da marca "Toyota" passam alugados
SELECT AVG(DATEDIFF(Data_Devolucao, Data_locacao)) AS media_dias_aluguel
FROM Locacao l
JOIN Carro c ON l.Id_Carro = c.Id_Carro
WHERE c.Marca = 'Toyota';

-- 9.4 Agregações com Condições Complexas:
-- Número total de alugueis de carros que excederam um determinado valor
SELECT COUNT(*) AS total_alugueis_acima_valor
FROM Locacao
WHERE Valor_total > 100; -- valor determinado

-- Valor total de pagamentos recebidos apenas dos clientes que já alugaram mais de uma vez
SELECT SUM(Valor) AS total_pagamentos_recebidos
FROM Pagamento
WHERE Id_Cliente IN (
    SELECT Id_Cliente
    FROM Locacao
    GROUP BY Id_Cliente
    HAVING COUNT(*) > 1
);

-- Média de dias que os carros passam em manutenção apenas se o custo da manutenção for superior a um determinado valor
SELECT AVG(DATEDIFF(Data_Disponibilidade, Data_Manutencao)) AS media_dias_manutencao
FROM Manutencao
WHERE Custo > 500; -- custo determinado

