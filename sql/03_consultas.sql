
-- CONSULTA 1: Visualizar todos os produtos
SELECT
    id,
    nome,
    categoria,
    preco
FROM public.produtos
ORDER BY nome;


-- CONSULTA 2: Visualizar as vendas com seus produtos
SELECT
    v.id AS venda_id,
    p.nome AS produto,
    v.quantidade,
    p.preco AS preco_unitario,
    v.data_venda
FROM public.vendas v
INNER JOIN public.produtos p
    ON v.produto_id = p.id
ORDER BY v.data_venda;


-- CONSULTA 3: Calcular faturamento por venda
SELECT
    v.id AS venda_id,
    p.nome AS produto,
    v.quantidade,
    p.preco,
    v.quantidade * p.preco AS faturamento
FROM public.vendas v
INNER JOIN public.produtos p
    ON v.produto_id = p.id
ORDER BY faturamento DESC;


-- CONSULTA 4: Faturamento total e quantidade vendida
SELECT
    COUNT(*) AS total_registros_vendas,
    SUM(v.quantidade) AS unidades_vendidas,
    SUM(v.quantidade * p.preco) AS faturamento_total
FROM public.vendas v
INNER JOIN public.produtos p
    ON v.produto_id = p.id;


-- CONSULTA 5: Faturamento por produto
SELECT
    p.nome AS produto,
    SUM(v.quantidade) AS unidades_vendidas,
    SUM(v.quantidade * p.preco) AS faturamento
FROM public.vendas v
INNER JOIN public.produtos p
    ON v.produto_id = p.id
GROUP BY p.id, p.nome
ORDER BY faturamento DESC;


-- CONSULTA 6: Faturamento por categoria
SELECT
    p.categoria,
    SUM(v.quantidade) AS unidades_vendidas,
    SUM(v.quantidade * p.preco) AS faturamento
FROM public.vendas v
INNER JOIN public.produtos p
    ON v.produto_id = p.id
GROUP BY p.categoria
ORDER BY faturamento DESC;


-- CONSULTA 7: Vendas de outubro de 2026
SELECT
    p.nome AS produto,
    v.quantidade,
    v.data_venda
FROM public.vendas v
INNER JOIN public.produtos p
    ON v.produto_id = p.id
WHERE v.data_venda >= DATE '2026-10-01'
  AND v.data_venda < DATE '2026-11-01'
ORDER BY v.data_venda;
