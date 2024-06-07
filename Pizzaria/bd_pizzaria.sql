-- Tabela clientes
CREATE TABLE clientes (
    tipo_pagamento VARCHAR(50),
    cpf_cliente VARCHAR(15),
    endereco_cliente VARCHAR(100),
    nome_cliente VARCHAR(100),
    id_pedido SERIAL PRIMARY KEY
);

INSERT INTO clientes (tipo_pagamento, cpf_cliente, endereco_cliente, nome_cliente, id_pedido)
VALUES
  ('Cartão de crédito', '123.456.789-00', 'Rua das Estrelas, 321, Bairro Central', 'Gabriel Oliveira', default),
('Dinheiro', '987.654.321-11', 'Avenida da Liberdade, 789, Bairro do Comércio', 'Luciana Pereira', default),
('Pix', '555.444.333-22', 'Travessa das Maravilhas, 456, Bairro Industrial', 'Rafael Santos', default),
('Transferência bancária', '888.999.777-66', 'Praça das Flores, 202, Bairro Residencial', 'Isabela Almeida', default),
('Vale-refeição', '111.222.333-44', 'Alameda dos Girassóis, 555, Bairro Novo', 'Marcos Costa', default);


SELECT * FROM clientes


-- Tabela contatos / certo
CREATE TABLE contatos (
    id_contato SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cel VARCHAR(20),
    pizza VARCHAR(100),
    cadastro DATE
);

INSERT INTO contatos (nome, email, cel, pizza, cadastro)

VALUES('Leonardo', 'rafael.silva@email.com', '(11) 12345-6789', 'Quatro Queijos', '2024-08-30'),
('Camily', 'camila.rodrigues@email.com', '(22) 98765-4321', 'Portuguesa', '2023-11-20'),
('Lucas', 'lucas.moreira@email.com', '(33) 55555-4444', 'Pepperoni', '2025-03-15'),
('igor', 'larissa.santos@email.com', '(44) 77777-6666', 'Calabresa', '2023-07-05'),
('Mateus', 'mateus.oliveira@email.com', '(55) 99999-8888', 'Margherita', '2022-10-10');


SELECT * FROM contatos


-- Tabela encomenda / certo
CREATE TABLE encomenda (
    id_pizza SERIAL PRIMARY KEY,
    id_pedido INT
);

INSERT INTO encomenda (id_pizza, id_pedido)
VALUES
    (001, 1001),
    (002, 1002),
    (003, 1003),
    (004, 1004),
    (005, 1005);
SELECT * FROM encomenda



-- Tabela funcionarios
CREATE TABLE funcionarios (
    data_funcionario DATE,
    tipo_funcionario VARCHAR(50),
    nome_funcionario VARCHAR(100),
    id_funcionarios SERIAL PRIMARY KEY
);

INSERT INTO funcionarios (data_funcionario, tipo_funcionario, nome_funcionario, id_funcionarios)
VALUES
('2024-08-25', 'Chef Pâtissier', 'Leonardo', default),
('2025-12-05', 'Entregador', 'Camily', default),
('2023-06-20', 'Atendente', 'Roger', default),
('2022-11-30', 'Gerente', 'Manu', default),
('2026-03-15', 'Marketing', 'Felipe', default);


SELECT * FROM funcionarios


-- Tabela pedidos / certo
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    tempo_entrega VARCHAR(50),
    status_pedido VARCHAR(50),
    data_pedido DATE
);

INSERT INTO pedidos (id_pedido, tempo_entrega, status_pedido, data_pedido)
VALUES
    (1006, '35 minutos', 'Em preparo', '2024-04-16'),
    (1007, '25 minutos', 'Em entrega', '2024-04-16'),
    (1008, '25 minutos', 'Entregue', '2024-04-15'),
    (1009, '40 minutos', 'Em andamento', '2024-04-14'),
    (1010, '50 minutos', 'Aguardando confirmação', '2024-04-14');

SELECT * FROM pedidos



-- Tabela pizza / certo
CREATE TABLE pizza (
    id_pizza SERIAL PRIMARY KEY,
    preco_pizza VARCHAR(20),
    tamanho_pizza VARCHAR(20),
    sabor_pizza VARCHAR(100)
);

INSERT INTO pizza (preco_pizza, tamanho_pizza, sabor_pizza)
VALUES

('R$ 27,00', 'Média', 'Quatro Queijos'),
('R$ 32,00', 'Grande', 'Pepperoni'),
('R$ 29,00', 'Família', 'Vegetariana'),
('R$ 33,00', 'Gigante', 'Bacon com Milho'),
('R$ 36,00', 'Individual', 'Frango com Catupiry'),
('R$ 28,00', 'Média', 'Margherita'),
('R$ 33,00', 'Grande', 'Calabresa'),
('R$ 32,00', 'Grande', 'Mussarela');


SELECT * FROM pizza



-- Tabela prepara / certo
CREATE TABLE prepara (
    id_pedido INT,
    id_funcionarios INT
);

INSERT INTO prepara (id_pedido, id_funcionarios)
VALUES
    (1001, 001),
    (1002, 002),
    (1003, 003),
    (1004, 004),
    (1005, 005);

SELECT * FROM prepara



-- Tabela produz / certo
CREATE TABLE produz (
    id_pizza INT,
    id_funcionarios INT
);

INSERT INTO produz (id_pizza, id_funcionarios)
VALUES
    (101, 001),
    (102, 002),
    (103, 003),
    (104, 004),
    (105, 005);

SELECT * FROM produz



-- Tabela ingredientes
CREATE TABLE ingredientes (
    id_ingrediente SERIAL PRIMARY KEY,
    nome_ingrediente VARCHAR(100),
    quantidade INT,
    id_pizza INT,
    FOREIGN KEY (id_pizza) REFERENCES pizza(id_pizza)
);

INSERT INTO ingredientes (nome_ingrediente, quantidade, id_pizza)
VALUES

    ('Mussarela', 200, 7), -- Mussarela, id_pizza = 7
    ('Calabresa', 150, 8), -- Calabresa, id_pizza = 8
    ('Pepperoni', 100, 2), -- Pepperoni, id_pizza = 2
    ('Tomate', 50, 7),     -- Tomate, id_pizza = 7
    ('Cebola', 30, 8),    -- Cebola, id_pizza = 8
    ('Frango desfiado', 150, 5),          -- Frango desfiado para a pizza de Frango com Catupiry
    ('Catupiry', 100, 5),                  -- Catupiry para a pizza de Frango com Catupiry
    ('Tomate', 50, 6),                     -- Tomate para a pizza Margherita
    ('Muçarela', 200, 6),                  -- Muçarela para a pizza Margherita
    ('Bacon', 100, 4),                     -- Bacon para a pizza de Bacon com Milho
    ('Milho', 80, 4),                      -- Milho para a pizza de Bacon com Milho
    ('Gorgonzola', 70, 1),                 -- Gorgonzola para a pizza de Quatro Queijos
    ('Parmesão', 60, 1),                   -- Parmesão para a pizza de Quatro Queijos
    ('Provolone', 80, 1),                  -- Provolone para a pizza de Quatro Queijos
    ('Mussarela', 200, 3),                 -- Mussarela para a pizza Vegetariana
    ('Tomate', 50, 3),                     -- Tomate para a pizza Vegetariana
    ('Cebola', 30, 3),                     -- Cebola para a pizza Vegetariana
    ('Pimentão', 30, 3),                   -- Pimentão para a pizza Vegetariana
    ('Azeitonas', 20, 3);                  -- Azeitonas para a pizza Vegetariana

SELECT * FROM ingredientes;


-- Tabela entrega
CREATE TABLE entrega (
    id_entrega SERIAL PRIMARY KEY,
    id_pedido INT,
    data_entrega DATE,
    status_entrega VARCHAR(50),
    observacao TEXT
);

INSERT INTO entrega (id_pedido, data_entrega, status_entrega, observacao)
VALUES
    (1006, '2024-04-16', 'Entregue', 'Cliente recebeu a pizza corretamente.'),
    (1007, '2024-04-16', 'Entregue', 'Entrega realizada com sucesso.'),
    (1008, '2024-04-15', 'Entregue', 'Pedido entregue dentro do prazo.'),
    (1009, NULL, 'Em andamento', 'Pedido aguardando confirmação de entrega.'),
    (1010, NULL, 'Pendente', 'Aguardando preparo do pedido.');

-- Tabela supervisor
CREATE TABLE supervisor (
    id_supervisor SERIAL PRIMARY KEY,
    nome_supervisor VARCHAR(100),
    cargo_supervisor VARCHAR(50)
);

INSERT INTO supervisor (nome_supervisor, cargo_supervisor)
VALUES
    ('Maria', 'Gerente'),
    ('João', 'Gerente de Operações'),
    ('Pedro', 'Supervisor de Produção'),
    ('Ana', 'Supervisora de Entregas'),
    ('Carla', 'Supervisora de Atendimento');

-- Listar os registros da tabela entrega
SELECT * FROM entrega;

-- Listar os registros da tabela supervisor
SELECT * FROM supervisor;



-- Criar a tabela de promoções
CREATE TABLE promocoes (
    id_promocao SERIAL PRIMARY KEY,
    id_pizza INT REFERENCES pizza(id_pizza),
    descricao VARCHAR(100),
    desconto INT
);

-- Adicionar inserts para demonstração
INSERT INTO promocoes (id_pizza, descricao, desconto)
VALUES
    (1, 'Desconto de 10% na compra de 2 pizzas', 10),
    (2, 'Pizza em dobro toda sexta-feira', 20),
    (3, 'Promoção leve 3 pague 2', 15),
    (4, 'Desconto de 20% para pedidos acima de R$50', 12),
    (5, 'Pizza do mês com preço especial', 18),
    (6, 'Combo família: 2 pizzas grandes + refrigerante 2L por R$50', 25),
    (7, 'Desconto de 15% para pedidos feitos pelo aplicativo', 15),
    (8, 'Pizza grátis a cada 10 pedidos realizados', 100);


-- Criar a tabela de horário de funcionamento
CREATE TABLE horario_funcionamento (
    id_horario SERIAL PRIMARY KEY,
    dia_semana VARCHAR(20),
    hora_abertura TIME,
    hora_fechamento TIME
);

-- Adicionar inserts de exemplo
INSERT INTO horario_funcionamento (dia_semana, hora_abertura, hora_fechamento)
VALUES
    ('Segunda-feira', '10:00:00', '22:00:00'),
    ('Terça-feira', '10:00:00', '22:00:00'),
    ('Quarta-feira', '10:00:00', '22:00:00'),
    ('Quinta-feira', '10:00:00', '22:00:00'),
    ('Sexta-feira', '10:00:00', '23:00:00'),
    ('Sábado', '12:00:00', '23:00:00'),
    ('Domingo', '12:00:00', '22:00:00');





-- 1.  Listar todos os pedidos com detalhes do cliente. Consulta para obter informações sobre os pedidos e os clientes que os fizeram.
SELECT pedidos.*, clientes.*
FROM pedidos
JOIN clientes ON pedidos.id_pedido = clientes.nome_cliente;
--nao foi 



--2. Listar todos os itens de pedidos com detalhes da pizza. Consulta para mostrar os itens de pedidos e os detalhes das pizzas associadas a eles.
SELECT encomenda.*, pizza.*
FROM encomenda
INNER JOIN pizza ON encomenda.id_pizza = pizza.id_pizza;



--3. Listar todos os funcionários com suas respectivas atribuições. Consulta para mostrar os funcionários e as áreas em que estão trabalhando.
SELECT funcionarios.*, prepara.*, produz.*
FROM funcionarios
LEFT JOIN prepara ON funcionarios.id_funcionarios = prepara.id_funcionarios
LEFT JOIN produz ON funcionarios.id_funcionarios = produz.id_funcionarios;


--4. Listar todos os pedidos com status e funcionários responsáveis. Consulta para mostrar os pedidos, seus status e os funcionários responsáveis pelo atendimento.
SELECT pedidos.*, funcionarios.*
FROM pedidos
LEFT JOIN funcionarios ON pedidos.id_pedido = funcionarios.id_funcionarios;


--5. Listar todos os clientes com seus pedidos realizados. Consulta para exibir os clientes e todos os pedidos que eles fizeram.
SELECT clientes.*, pedidos.*
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;


--6. Listar todas as pizzas disponíveis com seus respectivos ingredientes. Consulta para mostrar todas as pizzas disponíveis e seus ingredientes.
SELECT pizza.*, ingredientes.*
FROM pizza
LEFT JOIN ingredientes ON pizza.id_pizza = ingredientes.id_pizza


--7. Listar todos os pedidos com detalhes de entrega (se disponível). Consulta para mostrar os pedidos com detalhes de entrega, se disponíveis.
SELECT pedidos.*, entrega.*
FROM pedidos
LEFT JOIN entrega ON pedidos.id_pedido = entrega.id_pedido;


--8.  Listar todos os funcionários com seus respectivos supervisores. Consulta para exibir os funcionários e seus supervisores, se aplicável.
SELECT f.nome_funcionario AS funcionario, f.tipo_funcionario AS cargo, s.nome_funcionario AS supervisor
FROM funcionarios f
LEFT JOIN funcionarios s ON f.supervisor_id = s.id_funcionario;


--9. Listar todos os itens de pedidos com seus respectivos tamanhos. Consulta para mostrar os itens de pedidos e os tamanhos das pizzas associadas a eles.
SELECT e.*, p.tamanho_pizza
FROM encomenda e
LEFT JOIN pizza p ON e.id_pizza = p.id_pizza;


--10. Listar todas as pizzas com suas respectivas promoções. Consulta para mostrar todas as pizzas e suas promoções, se houver.
SELECT pizza.*, promocoes.*
FROM pizza
LEFT JOIN promocoes ON pizza.id_pizza = promocoes.id_pizza;




--Segunda Parte (Consultas com comandos SQL básicos)
 
--1. Listar todos os clientes cadastrados. Consulta para recuperar todos os clientes que já fizeram pedidos na pizzaria.
SELECT * FROM clientes;

--2. Listar todos os pedidos realizados em um determinado período. Consulta para visualizar todos os pedidos feitos dentro de um intervalo de datas específico.
SELECT * FROM pedidos
WHERE data_pedido BETWEEN '2024-04-01' AND '2024-04-15';

--3.N -Listar os itens de um pedido específico. Consulta para ver todos os itens (pizzas, bebidas, etc.) em um pedido específico.
SELECT e.*, p.*
FROM encomenda e
JOIN pizza p ON e.id_pizza = p.id_pizza
WHERE e.id_pedido = 1006;


--4. N - Calcular o total gasto por um cliente. Consulta para somar o valor de todos os pedidos feitos por um cliente específico.
SELECT c.nome_cliente, SUM(p.preco_pizza) AS total_gasto
FROM clientes c
JOIN pedidos pd ON c.id_cliente = pd.id_cliente
JOIN encomenda e ON pd.id_pedido = e.id_pedido
JOIN pizza p ON e.id_pizza = p.id_pizza
GROUP BY c.nome_cliente;


--5. Listar os sabores de pizza mais populares. Consulta para mostrar os sabores de pizza mais pedidos pelos clientes.
SELECT p.sabor_pizza, COUNT(*) AS total_pedidos
FROM pizza p
JOIN encomenda e ON p.id_pizza = e.id_pizza
GROUP BY p.sabor_pizza
ORDER BY total_pedidos DESC;


--6. Verificar a disponibilidade de um determinado sabor de pizza. Consulta para verificar se um sabor específico de pizza está disponível no momento.
SELECT *
FROM pizza
WHERE sabor_pizza = 'Margherita';

--7. Listar todos os funcionários. Consulta para recuperar informações de todos os funcionários da pizzaria.
SELECT * FROM funcionarios;

--8. Verificar o horário de funcionamento da pizzaria. Consulta para saber os horários de abertura e fechamento da pizzaria.
SELECT * FROM horario_funcionamento;

--9. Listar os pedidos em andamento. Consulta para ver todos os pedidos que ainda não foram entregues.
SELECT * FROM pedidos WHERE status_pedido IN ('Em preparo', 'Em entrega', 'Em andamento', 'Aguardando confirmação');

--10. Calcular o tempo médio de espera dos pedidos. Consulta para calcular o tempo médio que os clientes esperam pelos pedidos.
SELECT AVG(EXTRACT(EPOCH FROM AGE(p.data_entrega, p.data_pedido)) / 60) AS tempo_medio_espera_minutos
FROM pedidos p
LEFT JOIN entrega e ON p.id_pedido = e.id_pedido
WHERE p.status_pedido = 'Entregue';

