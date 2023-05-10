-- O cliente Walter Palo Costenaro quer 1 Pizza de Atum e 2 Pizzas de Napolitano

SELECT valor FROM pizzas WHERE pizza_id = 5;
SELECT valor FROM pizzas WHERE pizza_id = 28;

INSERT INTO pedidos VALUES
(default, 98, CURDATE(), NOW(), null);

SELECT * FROM pedidos ORDER BY pedido_id DESC LIMIT 1;
SELECT LAST_INSERT_ID();

-- pEDIDO_ID27

INSERT INTO itens_pedido VALUES
(27,5,1,(SELECT valor FROM pizzas WHERE pizza_id = 5));
(27,28,2,(SELECT valor FROM pizzas WHERE pizza_id = 28));

SELECT * FROM itens_pedido WHERE pedido_id = 27;
SELECT sum(valor * quantidade) FROM itens_pedido WHERE pedido_id = 27;

-- Vamos criar uma PROCEDURE que calcule o valor total do pedido
DELIMITER $
create procedure atualizaValorPedido(id,int)
update pedidos 
    BEGIN
        set valor - (select sum (valor * quantidade) from itens_pedido where pedido_id = 27)
        where pedido_id = id;

    END $
DELIMITER;

-- Excluir e criar denovo a mesma PROCEDURE sem alterar os delimitadores

DROP PROCEDURE IF EXISTS atualizaValorPedido();
CREATE PROCEDURE atualizaValorPedido(id int)
UPDATE pedidos 
    SET valor = (SELECT sum(valor * quantidade) FROM itens_pedido WHERE pedido_id = id)
    WHERE pedido_id = id


-- Para testar
SELECT* FROM pedidos WHERE pedido_id = 27;
-- Alterar o valor para nulo
UPDATE  pedidos SET valor = null WHERE pedido_id = 27;
SELECT * FROM pedidos WHERE pedido_id=27
-- Utilizar o Procedimento para alterar
CALL atualizaValorPedido(27);
SELECT * FROM pedidos WHERE pedido_id=27;

-- Para ver quais procedimentos um Banco de dados possui armazenado.
SHOW PROCEDURE STATUS;
-- Missão 2: A Cliente Sara Luzia de Melo quer 2 Pizzas Napolitanas
-- Registre este pedido:
SELECT * FROM clientes
SELECT * FROM pizzas
INSERT INTO pedidos VALUES (default,91,CURDATE(), NOW(),null);
INSERT INTO itens_pedido VALUES (28,28,2, (SELECT valor FROM pizzas WHERE pizza_id = 28))
SELECT * FROM pedidos WHERE pedido_id = 28;
CALL atualizaValorPedido(28);
SELECT * FROM pedidos WHERE pedido_id = 28;
-- DESAFIO: Crie um Procedimento ARmazenado que receba três parâmetros
-- cliente_id, pizza_id e quantidade e registre um pedido de um item
-- calculando o total ex: pedidoDeUmItem(cli_id int, pizza_id int, qtd int)