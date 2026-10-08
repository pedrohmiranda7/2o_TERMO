-- Active: 1788435991428@@127.0.0.1@3306@smartcoffee_dml_pedro
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: PEDRO HENRIQUE MIRANDA 
-- Turma: _2DEVIS Data: 08/10/2026
-- Base: smartcoffee_dql
-- ============================================================
USE SMARTCOFFEE_DML_PEDRO;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * 
FROM CLIENTE

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT NOME, CIDADE, EMAIL
FROM CLIENTE;

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT CIDADE
FROM CLIENTE;

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME, PRECO
FROM PRODUTO
ORDER BY PRECO ASC;

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT NOME, PRECO
FROM PRODUTO
ORDER BY PRECO DESC
LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT NOME, PRECO
FROM PRODUTO
WHERE PRECO BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT NOME, CIDADE
FROM CLIENTE
WHERE CIDADE = 'LIMEIRA' OR CIDADE = 'AMERICANA';

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT NOME
FROM PRODUTO
WHERE NOME LIKE 'CAFÉ%';

-- 9. Liste os clientes que não informaram telefone.
SELECT NOME, TELEFONE
FROM CLIENTE
WHERE TELEFONE IS NULL

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT VALOR_TOTAL
FROM PEDIDO
WHERE STATUS_PEDIDO = 'FINALIZADO' AND VALOR_TOTAL > 20.00
ORDER BY VALOR_TOTAL DESC;

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.
SELECT COUNT (*) AS PRODUTOS_CADASTRADOS
FROM PRODUTO;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.
SELECT MIN (PRECO) AS MENOR_PRECO, MAX (PRECO) AS MAIOR_PRECO, AVG (PRECO) AS MEDIA_PRECO
FROM PRODUTO;

-- 13. Informe quantos clientes existem em cada cidade.
SELECT CIDADE, COUNT (*) QUANTIDADE_CLIENTES
FROM CLIENTE
GROUP BY CIDADE

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.
SELECT CIDADE, COUNT (*) AS QUANTIDADE_CLIENTES
FROM CLIENTE
GROUP BY CIDADE
HAVING COUNT (*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM (VALOR_TOTAL) AS TOTAL
FROM PEDIDO 
WHERE STATUS_PEDIDO = 'FINALIZADOS'
