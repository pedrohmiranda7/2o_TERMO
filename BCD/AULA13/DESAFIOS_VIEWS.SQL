-- Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos .

    CREATE VIEW VW_PRODUTOS_ATIVOS AS
    SELECT ID_PRODUTO, NOME, PRECO
    FROM PRODUTO;


-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.

    SELECT * 
    FROM VW_PRODUTOS_ATIVOS
    WHERE PRECO >= 10.00;

-- 3. Liste todas as views do banco.

    SHOW FULL TABLES WHERE TABLE_TYPE ='VIEW';


-- 4. Exiba a definição de vw_produtos_ativos .

    SHOW CREATE VIEW VW_PRODUTOS_CATEGORIAS

---------------------------------------------------------------------------------------------------------------

-- Parte B — Relacionamentos Intermediário

-- 5. Crie vw_produtos_categorias usando INNER JOIN.

    CREATE VIEW VW_PRODUTOS_CATEGORIAS AS
    SELECT PR.ID_PRODUTO, PR.NOME, CA.ID_CATEGORIA, CA.NOME
    INNER JOIN CA AS CATEGORIA
    ON CA.ID_CATEGORIA = PR.ID_PRODUTO

-- 6. Crie vw_pedidos_clientes .

    CREATE VIEW VW_PEDIDOS_CLIENTE AS
    SELECT ID_PEDIDO, STATUS_PEDIDO
    FROM PEDIDO


-- 7. Consulte somente pedidos FINALIZADOS pela view.

    SELECT * FROM VW_PEDIDOS_CLIENTES
    WHERE STATUS_PEDIDO = 'FINALIZADOS'

-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.

-- Parte C — Relatórios Intermediário/
-- Avançado

-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.

-- 10. Liste os produtos pelo maior faturamento.

-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.

-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção

-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.

-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.

-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.

-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.