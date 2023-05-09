-- Quests
-- Pelo shell usar

-- 1 - Quantas tabelas ele possui ?
USE pizzaria;
SHOW tables
-- 2 - Quantos Clientes Cadastrados ?
SELECT * FROM clientes
-- 3 - Quantas Pizzas Cadastradas ?
SELECT * FROM pizzas;
-- 4 - Quantas Pizzas o pedido n°3 possui ?
SELECT * FROM pizzas;
SELECT * FROM pedidos;
SELECT * FROM itens_pedido;
SELECT sum(quantidade) FROM itens_pedido WHERE itens_pedido = 3;
-- 5 - Qual Cliente fez o pedido n°3 ?
DESCRIBE pedidos;
DESCRIBE clientes;
SELECT * FROM pedidos WHERE pedido_id = 3;
SELECT * FROM clientes WHERE cliente_id = 2; 

SELECT c.nome  FROM  pedidos p INNER JOIN clientes c  
ON c.cliente = p.cliente_id
WHERE p.pedido_id = 3;

-- 6 
--Nomesdas pizzas do pedido 3
SELECT * FROM itens_pedido WHERE pedido_id = 3;
SELECT pizza_id FROM itens_pedido WHERE pizza_id = 3;
SELECT * FROM pizzas WHERE pizza_id IN (7,5,8,9,3,10,16);

--Com Subconsulta

SELECT * FROM pizzas WHERE pizza_id
    IN (SELECT pizza_id FROM itens_pedido WHERE pedido_id = 3);
SELECT nome FROM pizzas WHERE pizza_id
    IN (SELECT pizza_id FROM itens_pedido WHERE pedido_id = 3);

-- Com InnerJoin

SELECT p.nome FROM itens_pedido i INNER JOIN  pizzas p 
ON i.pizza_id = p.pizza_id
WHERE i.pedido_id = 3


-- Com inner Join e mostrando todos os itens de pedido

SELECT i.*, p.nome FROM itens_pedido i INNER JOIN pizzas p 
ON i.pizza_id = p.pizza_id
WHERE i.pedido_id = 3


-- 7 

CREATE VIEW relatorio AS 
    SELECT 