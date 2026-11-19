-- Active: 1795086499168@@127.0.0.1@3306@smartcoffee_procedures_bruno
USE SMARTCOFFEE_PROCEDURES_BRUNO;

-- AULA 14 - ATIVIDADE STORED PROCEDURES
-- Aluno: Pedro Henrique Miranda
-- Turma: 2DEVIS

-- 1. listar_clientes_ativos()

    DELIMITER $$
    CREATE PROCEDURE LISTAR_CLIENTES_ATIVOS()
    BEGIN
        SELECT * FROM cliente
        WHERE ATIVO = TRUE;
    END 
    DELIMITER;
    CALL LISTAR_CLIENTES_ATIVOS;

-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))

    DELIMITER $$
    CREATE PROCEDURE BUSCAR_PRODUTO_POR_NOME(IN P_BUSCAR VARCHAR(100))
    BEGIN
        SELECT NOME FROM PRODUTO
        WHERE NOME = P_BUSCAR;
    END

    DELIMITER;

    CALL BUSCAR_PRODUTO_POR_NOME('Espresso')

-- 3. produtos_por_categoria(IN p_id_categoria INT)

    DELIMITER $$
    CREATE PROCEDURE PRODUTOS_POR_CATEGORIA(IN P_ID_CATEGORIA INT)
    BEGIN
        SELECT * FROM PRODUTO
        WHERE ID_CATEGORIA = P_ID_CATEGORIA;
    END

    DELIMITER;

    CALL PRODUTOS_POR_CATEGORIA(1)

-- 4. total_clientes(OUT p_total INT)

    DELIMITER $$
    CREATE PROCEDURE TOTAL_CLIENTES (OUT P_TOTAL INT)
    BEGIN
        SELECT COUNT(*)
        INTO P_TOTAL
        FROM CLIENTE;
    END $$
    DELIMITER;

    CALL TOTAL_CLIENTES(@CLIENTES);
    SELECT @CLIENTES;

-- 5. consultar_estoque(IN p_id_produto INT) usando variável local

    DELIMITER $$
    CREATE PROCEDURE CONSULTAR_ESTOQUE (IN P_ID_PRODUTO INT)
    BEGIN 
        SELECT * FROM ESTOQUE
        WHERE ID_PRODUTO = P_ID_PRODUTO;
    END $$

    DELIMITER;

    CALL CONSULTAR_ESTOQUE(1)

-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL

    DELIMITER $$
    CREATE PROCEDURE CLASSIFICAR_ESTOQUE (IN P_ID_PRODUTO INT)
    BEGIN
        DECLARE V_QUANTIDADE INT;

        SELECT QUANTIDADE
        INTO V_QUANTIDADE
        FROM ESTOQUE
        WHERE ID_PRODUTO = P_ID_PRODUTO;

        IF V_QUANTIDADE = 0 THEN
            SELECT 'SEM ESTOQUE' AS SITUAÇÃO;
        ELSEIF V_QUANTIDADE <= 5 THEN
            SELECT 'BAIXO' AS SITUAÇÃO;
        ELSE
            SELECT 'NORMAL' AS SITUAÇÃO;
        END IF;
    END $$

    DELIMITER;

    CALL CLASSIFICAR_ESTOQUE(3); 

-- 7. cadastrar_cliente(...) com três parâmetros IN

    DELIMITER $$
    CREATE PROCEDURE CADASTRAR_CLIENTE (
        IN NOME VARCHAR (100),
        IN EMAIL VARCHAR (120),
        IN ATIVO BOOLEAN
    )
    BEGIN
        INSERT INTO CLIENTE (NOME, EMAIL, ATIVO) 
        VALUES (NOME, EMAIL, ATIVO);
    END $$

    DELIMITER;

    CALL CADASTRAR_CLIENTE ('Neymar', 'neymar@email.com', TRUE);

    SELECT * FROM CLIENTE;

-- 8. alterar_preco(...) impedindo valor <= 0

    DELIMITER $$
    CREATE PROCEDURE ALTERAR_PRECO(IN P_ID_PRODUTO INT, IN PRECO_ATUALIZADO)
    BEGIN
        IF P_ID_PRODUTO <= 0
            UPDATE PRODUTO
            SET PRECO = PRECO_ATUALIZADO
            WHERE ID_PRODUTO = P_ID_PRODUTO
        END IF;
    END $$

    DELIMITER;

    CALL ALTERNAR_PRECO (1, 67)

    SELECT * FROM PRODUTO

-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)

    DELIMITER $$
    CREATE PROCEDURE CRIAR_PEDIDO (IN p_id_cliente INT, OUT p_id_pedido INT)
    BEGIN
        START TRANSACTION;
        INSERT INTO PEDIDO (ID_CLIENTE, DATA_PEDIDO, STATUS_PEDIDO) VALUES
        (P_ID_CLIENTE, NOW(), 'ABERTO');

        SET P_ID_PEDIDO = LAST_INSERT_ID();
        COMMIT;
    END $$

    DELIMITER;

    CALL CRIAR_PEDIDO(1, @PEDIDO_NOVO);
    SELECT @PEDIDO_NOVO;

-- 10. devolver ID com LAST_INSERT_ID()

    DELIMITER $$
    CREATE PROCEDURE DEVOLVER_ID(IN P_NOME VARCHAR(100), IN P_ID_CATEGORIA INT, IN P_PRECO DECIMAL(10,2))
    BEGIN
        INSERT INTO PRODUTO (NOME, PRECO, ID_CATEGORIA) VALUES (P_NOME, P_PRECO, P_ID_CATEGORIA);
        
        SELECT LAST_INSERT_ID() AS ID_NOVO;
    END $$
    DELIMITER ;

    CALL DEVOLVER_ID('Mouse', 10.00, 100);

-- 11. adicionar_item_pedido(...) buscando o preço atual

    DELIMITER $$
    CREATE PROCEDURE ADICIONAR_ITEM_PEDIDO2(IN P_ID_PEDIDO INT, IN P_ID_PRODUTO INT, IN P_QTD INT)
    BEGIN
        DECLARE V_PRECO DECIMAL(10,2);
        
        SELECT PRECO 
        INTO V_PRECO 
        FROM PRODUTO 
        WHERE ID_PRODUTO = P_ID_PRODUTO;
        
        INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO)
        VALUES (P_ID_PEDIDO, P_ID_PRODUTO, P_QTD, V_PRECO);
    END $$

    DELIMITER ;
    
    CALL ADICIONAR_ITEM_PEDIDO(1, 1, 2);

-- 12. Faça uma chamada inválida e explique o resultado.

    CALL `DEVOLVER_ID`('Mouse', 67, 100)
        -- Resposta: Deu erro na chave estrangeira (foreign key) porque não existe uma categoria com o id '67'.

-- 13. Use SHOW CREATE PROCEDURE.

    SHOW CREATE PROCEDURE CRIAR_PEDIDO;

-- 14. Remova uma procedure com DROP PROCEDURE IF EXISTS e recrie-a.

    DROP PROCEDURE IF EXISTS `CRIAR_PEDIDO`

    DELIMITER $$
    CREATE PROCEDURE CRIAR_PEDIDO (IN p_id_cliente INT, OUT p_id_pedido INT)
    BEGIN
        START TRANSACTION;
        INSERT INTO PEDIDO (ID_CLIENTE, DATA_PEDIDO, STATUS_PEDIDO) VALUES
        (P_ID_CLIENTE, NOW(), 'ABERTO');

        SET P_ID_PEDIDO = LAST_INSERT_ID();
        COMMIT;
    END $$

    DELIMITER;

    CALL CRIAR_PEDIDO(1, @PEDIDO_NOVO);
    SELECT @PEDIDO_NOVO;

-- DESAFIO FINAL:
-- Crie uma procedure de negócio com:
-- - pelo menos 2 parâmetros;
-- - variável local;
-- - IF;
-- - pelo menos uma alteração no banco.

    DELIMITER $$
    CREATE PROCEDURE ADICIONAR_ITEM (
        IN P_ID_PEDIDO INT,
        IN P_ID_PRODUTO INT,
        IN P_QUANTIDADE INT
    )
    BEGIN
        DECLARE V_PRECO DECIMAL (10, 2);
        IF P_QUANTIDADE <= 0 THEN
            SELECT 'QUANTIDADE INVÁLIDA' AS MENSAGEM;
        ELSE
            SELECT PRECO
            INTO V_PRECO
            FROM PRODUTO
            WHERE ID_PRODUTO = P_ID_PRODUTO
                AND ATIVO = TRUE;

            INSERT INTO ITEM_PEDIDO (
                ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO
            )
            VALUES (
                P_ID_PEDIDO, P_ID_PRODUTO, P_QUANTIDADE, V_PRECO
            );
            SELECT 'ITEM ADICIONADO' AS MENSAGEM;
        END IF;
    END $$

    DELIMITER;
    CALL ADICIONAR_ITEM (1, 5, 42);