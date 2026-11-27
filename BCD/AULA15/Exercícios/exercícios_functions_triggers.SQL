-- Active: 1795086499168@@127.0.0.1@3306@smartcoffee_procedures_bruno
-- ATIVIDADE AMPLIADA - AULAS 14 E 15
-- Aluno: Pedro Henrique Miranda
-- Turma: 2DEVIS

-- 1. Function calcular_total_item
    DELIMITER $$
    CREATE FUNCTION calcular_total_item (p_valor DECIMAL (10, 2), p_quantidade INT)
    RETURNS DECIMAL (10, 2)
    DETERMINISTIC
    BEGIN
        RETURN p_valor * p_quantidade;
    END $$ 
    
    DELIMITER;

    SELECT nome, preco, calcular_total_item (preco, 5)
    FROM produto;

-- 2. Function classificar_fidelidade
    DELIMITER $$
    CREATE FUNCTION classificar_fidelidade_ex (p_pontos INT)
    RETURNS VARCHAR(20)
    DETERMINISTIC
    BEGIN
        IF p_pontos >= 500 THEN
            RETURN 'OURO';
        ELSEIF p_pontos >=200 THEN
            RETURN 'PRATA';
        ELSE
            RETURN 'BRONZE';
        END IF;
    END $$
    DELIMITER;

    SELECT nome, pontos_fidelidade, classificar_fidelidade (pontos_fidelidade) AS Nível  
    FROM cliente;

-- 3. Function calcular_desconto

    DELIMITER $$
    CREATE FUNCTION calcular_desconto_ex (p_valor DECIMAL (10, 2), p_pontos INT)
    RETURNS DECIMAL (10, 2)
    DETERMINISTIC
    BEGIN
        DECLARE v_percentual DECIMAL (5, 2);
        IF p_pontos >= 500 THEN
            SET v_percentual = 0.10;
        ELSEIF p_pontos >= 200 THEN
            SET v_percentual = 0.05;
        ELSE
            SET v_percentual = 0;
        END IF;
        RETURN p_valor * v_percentual;
    END $$
    DELIMITER;

    SELECT calcular_desconto_ex(10, 400)

-- 4. Function situacao_estoque

    DELIMITER $$
    CREATE FUNCTION situacao_estoque (p_id_produto INT)
    RETURNS VARCHAR(20)
    DETERMINISTIC
    BEGIN
        DECLARE quantidade_produto INT;

        SELECT quantidade
        INTO quantidade_produto
        FROM estoque
        WHERE id_produto = p_id_produto; 
        
        IF quantidade_produto >= 20 THEN
            RETURN 'ESTOQUE ALTO';
        ELSEIF quantidade_produto >= 5 THEN
            RETURN 'ATENÇÃO';
        ELSE
            RETURN 'SEM ESTOQUE';
        END IF;
    END $$
    DELIMITER;
        
    SELECT pr.nome AS produto, es.quantidade, situacao_estoque(pr.id_produto)
    FROM produto as PR
    INNER JOIN estoque AS es
    ON es.id_produto = pr.id_produto

-- 5. Testar todas em SELECT

    -- 1:
        SELECT nome, preco, calcular_total_item (preco, 5)
        FROM produto;

    -- 2:
        SELECT nome, pontos_fidelidade, classificar_fidelidade (pontos_fidelidade) AS Nível  
        FROM cliente;

    -- 3:
        SELECT calcular_desconto_ex(10, 400)

    -- 4:
        SELECT pr.nome AS produto, es.quantidade, situacao_estoque(pr.id_produto)
        FROM produto as PR
        INNER JOIN estoque AS es
        ON es.id_produto = pr.id_produto

-- 6. Criar auditoria_preco
     CREATE TABLE AUDITORIA_PRECO_EX (
        ID_AUDITORIA_EX INT AUTO_INCREMENT,
        ID_PRODUTO_EX INT NOT NULL,
        PRECO_ANTERIOR DECIMAL (10, 2),
        PRECO_NOVO DECIMAL (10, 2),
        ALTERADO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,
        
        CONSTRAINT PK_ID_AUDITORIA_EX PRIMARY KEY (ID_AUDITORIA_EX),
        CONSTRAINT FK_PRODUTO_EX FOREIGN KEY (ID_PRODUTO_EX) REFERENCES PRODUTO (ID_PRODUTO)
    );

    DELIMITER $$

-- 7. Trigger AFTER UPDATE de preço
    CREATE TRIGGER TRG_PRODUTO_PRECO_UPDATE_EX
    AFTER UPDATE ON `PRODUTO`
    FOR EACH ROW
    BEGIN
        IF OLD.PRECO <> NEW.PRECO THEN
            INSERT INTO AUDITORIA_PRECO (ID_PRODUTO, PRECO_ANTERIOR, PRECO_NOVO) VALUES
            (NEW.ID_PRODUTO, OLD.PRECO, NEW.PRECO);
        END IF;
    END $$
    DELIMITER;

-- 8. Trigger BEFORE UPDATE impedindo estoque negativo
        DELIMITER $$
        CREATE TRIGGER TRG_PRODUTO_BEFORE_INSERT_EX
        BEFORE INSERT ON PRODUTO
        FOR EACH ROW
        BEGIN
            IF NEW.PRECO <= 0 THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'PREÇO DEVE SER MAIOR QUE ZERO';
            END IF;
        END $$
        DELIMITER;

-- 9. Criar log_exclusao_produto
    CREATE TABLE LOG_EXCLUSAO_PRODUTO_EX (
        ID_LOG_EX INT AUTO_INCREMENT,
        ID_PRODUTO_EX INT,
        NOME_PRODUTO VARCHAR (200),
        EXCLUIDO_EM DATETIME DEFAULT CURRENT_TIMESTAMP,

        CONSTRAINT PK_ID_LOG_EX PRIMARY KEY (ID_LOG_EX),
        CONSTRAINT FK_ID_PRODUTO_EX FOREIGN KEY (ID_PRODUTO_EX) REFERENCES PRODUTO (ID_PRODUTO)
    );

-- 10. Trigger AFTER DELETE
    DELIMITER $$
    CREATE TRIGGER TRG_PRODUTO_AFTER_DELETE_EX
    AFTER DELETE ON PRODUTO
    FOR EACH ROW
    BEGIN
        INSERT INTO LOG_EXCLUSAO_PRODUTO (ID_PRODUTO, NOME_PRODUTO) VALUES
        (OLD.ID_PRODUTO, OLD.NOME);
    END $$

    DELIMITER;

-- 11. Demonstrar operação bloqueada
    INSERT INTO log_exclusao_produto (`ID_PRODUTO`, `NOME_PRODUTO`) VALUES
    (67, 'TESTE')

    SELECT * FROM log_exclusao_produto;

    DELETE FROM log_exclusao_produto
    WHERE `ID_LOG` = 67

-- 12. Demonstrar histórico gerado automaticamente
    SELECT * FROM AUDITORIA_PRECO_EX

-- 13. SHOW TRIGGERS
    SHOW TRIGGERS;

-- 14. SHOW CREATE TRIGGER
    SHOW CREATE TRIGGER TRG_PRODUTO_BEFORE_INSERT_EX;

-- 15. Explique: Function x Procedure x View x Trigger

    -- Function: É uma operação que usamos para criar uma ação contínua, como um cálculo de preço ou desconto. 

    -- Procedure: É um conjunto de instruções que realizamos passo a passo, como criação de itens, selects, exclusão de itens, etc, tudo feito por etapas.

    -- View: É um metódo que utilizmaos para consultar itens que precisamos verificar frequentemente, criando um atalho (view) e armazenando todos os dados que precisamos ficar consultando constantemente, e depois, ao invés de ficar selecionando todos os atributos que precisamos ver um por um, nós conseguimos apenas chamar a view que criamos para ver todas as informações juntas de maneira rápida e eficaz

    -- Trigger: Assim como as outras funções, o trigger serve como atalho rápido para realizar ações depois de determinados eventos, como verificar estoque, atualizar preços dos produtos, etc. Ele avalia uma condição, e dependo do estado, o trigger entra em ação modificando dados, como acrescentando algo, enviando uma mensagem de alerta, etc.

-- 16. Cite 3 regras em que CHECK/UNIQUE/FK seriam melhores que Trigger

    -- CHECK: Garantir PRECO > 0 em PRODUTO e QUANTIDADE >= 0 em ESTOQUE (evita criar triggers com SIGNAL SQLSTATE só para validar faixa de valor).

    -- UNIQUE: Impedir atributos ou valores duplicado na tabelas, garantindo que determinado item não se repita.

    -- FK (FOREIGN KEY): Garantir que ID_CATEGORIA em PRODUTO  se relacionem entre si e exista na tabela CATEGORIA.

-- DESAFIO: crie uma automação própria e justifique a escolha do recurso.

