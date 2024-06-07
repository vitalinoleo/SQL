-- Listar todos os itens de pedidos com detalhes da pizza. 

SELECT pedidos.pedido_id, clientes.nome AS nome_cliente, pedidos.status
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id;

-- Listar todos os pedidos com detalhes do cliente.

SELECT pedidos.pedido_id, clientes.nome AS nome_cliente, pedidos.status
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id; 


-- Listar todos os itens de pedidos com detalhes da pizza.

SELECT pedidos.pedido_id, pizzas.nome AS nome_pizza, pizzas.preco
FROM pedidos
INNER JOIN itens_pedido ON pedidos.pedido_id = itens_pedido.pedido_id
INNER JOIN pizzas ON itens_pedido.pizza_id = pizzas.pizza_id;

-- Listar todos os funcionários com suas respectivas atribuições.

SELECT funcionarios.nome AS nome_funcionario, areas_trabalho.nome AS area_trabalho
FROM funcionarios
INNER JOIN atribuicoes ON funcionarios.funcionario_id = atribuicoes.funcionario_id
INNER JOIN areas_trabalho ON atribuicoes.area_id = areas_trabalho.area_id;

-- Listar todos os pedidos com status e funcionários responsáveis.

SELECT pedidos.pedido_id, pedidos.status, funcionarios.nome AS nome_funcionario
FROM pedidos
LEFT JOIN funcionarios ON pedidos.funcionario_id = funcionarios.funcionario_id;

-- Listar todos os clientes com seus pedidos realizados.

SELECT clientes.nome AS nome_cliente, pedidos.pedido_id, pedidos.status
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

-- Listar todas as pizzas disponíveis com seus respectivos ingredientes.

SELECT pizzas.nome AS nome_pizza, ingredientes.nome AS ingrediente
FROM pizzas
LEFT JOIN pizza_ingredientes ON pizzas.pizza_id = pizza_ingredientes.pizza_id
LEFT JOIN ingredientes ON pizza_ingredientes.ingrediente_id = ingredientes.ingrediente_id;

-- Listar todos os pedidos com detalhes de entrega (se disponível).

SELECT pedidos.pedido_id, pedidos.status, entregas.detalhes
FROM pedidos
LEFT JOIN entregas ON pedidos.pedido_id = entregas.pedido_id; 


-- Listar todos os funcionários com seus respectivos supervisores.

SELECT f1.nome AS nome_funcionario, f2.nome AS nome_supervisor
FROM funcionarios AS f1
LEFT JOIN funcionarios AS f2 ON f1.supervisor_id = f2.funcionario_id;

-- Listar todos os itens de pedidos com seus respectivos tamanhos.


SELECT ip.pedido_id, p.nome AS nome_pizza, t.tamanho
FROM itens_pedido AS ip
INNER JOIN pizzas AS p ON ip.pizza_id = p.pizza_id
INNER JOIN tamanhos AS t ON p.tamanho_id = t.tamanho_id; 

-- Listar todas as pizzas com suas respectivas promoções.


SELECT p.nome AS nome_pizza, prom.promocao
FROM pizzas AS p
LEFT JOIN promocoes AS prom ON p.promocao_id = prom.promocao_id;

-- Listar todos os clientes cadastrados.

SELECT *
FROM clientes;

-- Listar todos os pedidos realizados em um determinado período.


SELECT *
FROM pedidos
WHERE data_pedido BETWEEN '2024-01-01' AND '2024-03-31';

-- Listar os itens de um pedido específico.

SELECT p.nome AS nome_pizza, ip.quantidade, ip.preco_unitario
FROM itens_pedido AS ip
INNER JOIN pizzas AS p ON ip.pizza_id = p.pizza_id
WHERE ip.pedido_id = <ID_DO_PEDIDO>;

-- Calcular o total gasto por um cliente.

SELECT c.nome AS nome_cliente, SUM(ip.preco_unitario * ip.quantidade) AS total_gasto
FROM clientes AS c
INNER JOIN pedidos AS p ON c.cliente_id = p.cliente_id
INNER JOIN itens_pedido AS ip ON p.pedido_id = ip.pedido_id
GROUP BY c.cliente_id, c.nome;

-- Listar os sabores de pizza mais populares.

SELECT p.nome AS nome_pizza, COUNT(ip.pizza_id) AS quantidade_pedidos
FROM pizzas AS p
LEFT JOIN itens_pedido AS ip ON p.pizza_id = ip.pizza_id
GROUP BY p.pizza_id, p.nome
ORDER BY quantidade_pedidos DESC;

-- Verificar a disponibilidade de um determinado sabor de pizza.

SELECT nome
FROM pizzas
WHERE nome = 'Nome da Pizza';

-- Listar todos os funcionários.

SELECT *
FROM funcionarios;