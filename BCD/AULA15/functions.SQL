-- Active: 1795086499168@@127.0.0.1@3306@smartcoffee_procedures_bruno

-- FUNCTION: Armazena uma rotina criada dentro do MYSQL que recebe parâmetros, executa uma lógica e devolve um valor com RETURN.

-- Exemplos de utilização:
--     - Cálculo de frete (valor do frete)
--     - Escola (classificar médias com aprovado e reprovado)
--     - Financeiro (calcular juros - valor corrigido)
--     - Estoque (situação estoque - opções de checagem)

-- EX 0: Estrutura básica (Modelo): (É pra dar errado, é só um teste para ver como monta uma função):
    CREATE FUNCTION nome_funcao(parametro TIPO)
    RETURNS TIPO_DE_RETORNO
    DETERMINISTIC
    BEGIN
        --PROCESSAMENTO
        RETURN VALOR;
    END $$
    DELIMITER;

    -- OBS: RETURNS: informa qual tipo será devolvido. RETURN informa o resultado devolvido.

-- EX 1: Total de item:
    DELIMITER $$
    CREATE FUNCTION calcular_total_item (p_preco DECIMAL (10, 2), p_quantidade INT)
    RETURNS DECIMAL (10,2)
    DETERMINISTIC
    BEGIN
        RETURN p_preco * p_quantidade;
    END $$
    DELIMITER;

    -- OBS: Agora a função pode ser usada como se fosse uma função nativa
    -- Apresentar o resultado da FUNCTION

    SELECT nome, preco, calcular_total_item(preco, 3) AS Total_3_Unidades
    FROM produto;

-- EX 2: COM DECISÃO - Base em fidelidade
    DELIMITER $$
    CREATE FUNCTION classificar_fidelidade (p_pontos INT)
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

-- EX 3: Exemplo com variável local:
    DELIMITER $$
    CREATE FUNCTION calcular_desconto (p_valor DECIMAL (10, 2), p_pontos INT)
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
    -- OBS: DETERMINISTIC;
    -- Uma função marcada como DETERMINISTIC declara que, para os mesmos valores de entrada, o resultado será o mesmo.

-- Comparações entre FUNCTION  X PROCEDURE X VIEW
    
    -- VIEW: SELECT ... FROM view - consulta de itens/dados -vw_pedidos_abertos

    -- PROCEDURE: CALL ... - processso com várias etapas - registrar_pedido

    -- FUNCTION: Dentro da expressão / SELECT - cálculo ou classificação - calcular_desconto

--------------------------------------------------------------------------------------------
