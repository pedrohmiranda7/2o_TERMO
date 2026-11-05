-- Active: 1788435991428@@127.0.0.1@3306@smartcoffee_dml_pedro
-- Views ou Visões - Transformar determinadas consultas em visões reutilizáveis.

-- Como posso disponibilizar uma consulta como se ela fosse uma tabela?
-- RESPOSTA: Views

-- EX 1: View - Como consultar uma visão lógica:

    CREATE VIEW VW_PRODUTOS_ATIVOS AS SELECT ID_PRODUTO, NOME, PRECO
    FROM PRODUTO
    WHERE ATIVO = TRUE;

    SELECT * FROM VW_PRODUTOS_ATIVOS;

    -- VISUALIZAR A CONSULTA ATRAVÉS DA VIEW
        SELECT * FROM VW_PRODUTOS_ATIVOS;

    -- APAGAR VIEWS:
        DROP VIEW VW_PEDIDOS_CLIENTES;

    -- OBS: A View guarda a definição da consulta. Em uma view comum os dados continuam pertencendo as tabelas de origem.

    -- Tabela - Armazena registros
    -- View - Representa o resultado lógico da consulta

        -- Por que utilizar o view?:
            -- Porque desejo simplificar a minha consulta
            -- Reutilizar lógica onde a consulta ganha um nome
            -- Padronização de relatórios
            -- Restrição de exposição da lógica

    -- Resumo 1:
        -- Uma consulta original ou inicial:
            SELECT ID_PRODUTO, NOME, PRECO
            FROM PRODUTO
            WHERE ATIVO = TRUE;

        -- Transformar em uma View:
            CREATE VIEW VW_PRODUTOS_ATIVOS AS SELECT ID_PRODUTO, NOME, PRECO
            FROM PRODUTO
            WHERE ATIVO = TRUE;

        -- Como utilizar:
            SELECT * FROM VW_PRODUTOS_ATIVOS

-- EX 2: UTILIZAR FILTROS NAS VIEWS:
    SELECT ID_PRODUTO, NOME, PRECO
    FROM PRODUTO
    WHERE PRECO >= 10.00
    ORDER BY PRECO DESC;

    SELECT * FROM VW_PRODUTOS_ATIVOS
    WHERE PRECO >= 10.00
    ORDER BY PRECO DESC;

    -- OBS: View não elimina a possibilidade de usar WHERE, ORDER BY e outras cláusulas.

-- EX 3: VIEW COM JOINS - MOSTRAR PRODUTOS E CATEGORIAS:
    SELECT P.ID_PRODUTO, P.NOME AS PRODUTO, CA.NOME AS CATEGORIA, P.PRECO
    FROM PRODUTO AS P
    INNER JOIN CATEGORIA AS CA
    ON CA.ID_CATEGORIA = P.ID_CATEGORIA;

    -- Criando em View:
        CREATE VIEW VW_PRODUTOS_CATEGORIAS AS
        SELECT P.ID_PRODUTO, P.NOME AS PRODUTO, CA.NOME AS CATEGORIA, P.PRECO
        FROM PRODUTO AS P
        INNER JOIN CATEGORIA AS CA
        ON CA.ID_CATEGORIA = P.ID_CATEGORIA;

    -- Resultado visual por View:
        SELECT * FROM VW_PRODUTOS_CATEGORIAS
        ORDER BY CATEGORIA, PRODUTO;

-- EX 4: VIEW COM VÁRIAS TABELAS - RELATÓRIO DE PEDIDOS:
    CREATE VIEW VW_PEDIDOS_CLIENTES AS
    SELECT P.ID_PEDIDO, P.DATA_PEDIDO, P.STATUS_PEDIDO, C.ID_CLIENTE, C.NOME AS CLIENTE
    FROM PEDIDO AS P
    INNER JOIN CLIENTE AS C
    ON C.ID_CLIENTE = P.ID_CLIENTE;

    -- Resultado visual:
        SELECT * FROM VW_PEDIDOS_CLIENTES
        WHERE STATUS_PEDIDO = 'ABERTO'

-- EX 5: VIEW PARA UM RELATÓRIO COMPLETO:
    CREATE VIEW VW_ITENS_PEDIDOS AS
    SELECT PE.ID_PEDIDO, PE.DATA_PEDIDO, C.NOME AS CLIENTE, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
    FROM PEDIDO AS PE
    INNER JOIN CLIENTE AS C
    ON C.ID_CLIENTE = PE.ID_PEDIDO
    INNER JOIN ITEM_PEDIDO AS IP
    ON IP.ID_PEDIDO = PE.ID_PEDIDO
    INNER JOIN PRODUTO AS PR
    ON PR.ID_PRODUTO = IP.ID_PRODUTO

    -- Resultado visual:
    SELECT * FROM VW_ITENS_PEDIDOS
    WHERE ID_PEDIDO = 22;

-- EX 6: VIEW COM FUNÇÕES DE AGREGAÇÃO:
    CREATE VIEW VW_VENDAS_POR_PRODUTO AS
    SELECT PR.ID_PRODUTO, PR.NOME AS PRODUTO, SUM (IP.QUANTIDADE) AS UNIDADES_VENDIDAS, SUM(IP.QUANTIDADE * IP.PRECO_UNITARIO) AS FATURAMENTO
    FROM PRODUTO AS PR
    INNER JOIN ITEM_PEDIDO AS IP
    ON IP.ID_PRODUTO = PR.ID_PRODUTO
    INNER JOIN PEDIDO AS PE
    ON PE.ID_PEDIDO - IP.ID_PEDIDO
    WHERE PE.STATUS_PEDIDO = 'PREPARANDO'
    GROUP BY PR.ID_PRODUTO, PR.NOME

    -- Resultado visual:
        SELECT * FROM VW_VENDAS_POR_PRODUTO
        ORDER BY FATURAMENTO DESC;

-- EX 7: VIEW COM LEFT JOIN - QUEREMOS TODOS OS CLIENTES INCLUSIVE QUEM NUNCA REALIZOU PEDIDOS:
    CREATE VIEW VW_CLIENTES_RESUMO AS
    SELECT C.ID_CLIENTE, C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QUANTIDADE_PEDIDOS
    FROM CLIENTE AS C
    LEFT JOIN PEDIDO AS P
    ON P.ID_CLIENTE = C.ID_CLIENTE
    GROUP BY C.ID_CLIENTE, C.NOME

    -- Resultado visual
        SELECT * FROM VW_CLIENTES_RESUMO
        WHERE QUANTIDADE_PEDIDOS = 0;

-- EX 8: NOMEANDO VIEWS:
    -- AS ALÍASES (AS) TORNAM AS VIEWS MAIS CLARAS

        CREATE VIEW VW_PRECOS_PRODUTOS AS
        SELECT ID_PRODUTO, NOME AS PRODUTO, PRECO AS PRECO_ATUAL
        FROM PRODUTO;

    -- Resultado Visual:
        SELECT * FROM VW_PRECOS_PRODUTOS;

-- EX 9: VISUALIZAR AS VIEWS EXISTENTES:

    -- VISUALIZAR O RESULTADO DE TODAS AS VIEWS CRIADAS
        SHOW FULL TABLES WHERE TABLE_TYPE ='VIEW';

    -- Podemos consultar o catálogo:
    -- Quer dizer todo o BD MySQL;
        SELECT TABLE_NAME FROM information_schema.VIEWS
        WHERE TABLE_SCHEMA = DATABASE();

-- EX 10: VISUALIZANDO DEFINIÇÕES:  
    SHOW CREATE VIEW VW_PRODUTOS_CATEGORIAS

-- EX 11: CREATE OR REPLACE VIEW:
        CREATE OR REPLACE VIEW VW_PRODUTO_ATIVOS AS
        SELECT ID_PRODUTO, NOME, PRECO, ID_CATEGORIA
        FROM PRODUTO
        WHERE ATIVO = TRUE;
    -- OBS: Irá substituir ou alterar uma view já criada com suas informações

-- EX 12: VIEW ATUALIZÁVEL:
        CREATE VIEW VW_CLIENTES_ATIVOS AS
        SELECT ID_CLIENTE, NOME, EMAIL, ATIVO
        FROM CLIENTE
        WHERE ATIVO = TRUE;

    -- Atualizar a tabela Cliente:
        UPDATE VW_CLIENTES_ATIVOS
        SET NOME = 'Ana Francis'
        WHERE ID_CLIENTE = 91;

-- EX 13: VIEW NÃO ATUALIZÁVEL:
        UPDATE VW_VENDAS_POR_PRODUTO
        SET `FATURAMENTO` = 1000
        WHERE `ID_PRODUTO` = 1

    -- OBS: O campo é calculado. Simplesmente não é possíbel receber 1000.

-- EX 14: WITH CHECK OPTION - VIEW QUE MOSTRA APENAS PRODUTOS ATIVOS:
        CREATE OR REPLACE VIEW VW_PRODUTOS_ATIVOS AS
        SELECT ID_PRODUTO,  NOME, PRECO, ATIVO, ID_CATEGORIA
        FROM PRODUTO
        WHERE ATIVO = TRUE
        WITH CHECK OPTION

        SELECT * FROM VW_PRODUTOS_ATIVOS;

    -- OBS: O With Check Option ajuda a impedir alterações realizada pelas view que fariam o registro.

    -- Check Option: Verificar se tudo o que eu pedi para ele está naquela condição correta, nesse caso ele vai verificar para mim se todos os produtos que eu listei são ativos e não tem algum falso no meio.

-- EX 15: PADRÃO DEFINIÇÃO DE NOMENCLATURA

    -- VW - VIEWS
    -- NOME - COMPLEMENTAR A TABELA OU CONSULTAR A QUE DESEJA REALIZAR.
    -- VW_NOME_DESEJO
    -- VW_NOME_DA_FIDELIDADE
    -- VW_PRODUTOS_ATIVOS