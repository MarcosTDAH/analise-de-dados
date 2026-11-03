
BEGIN;

-- 1. Inserir cinco produtos fictícios
INSERT INTO public.produtos (nome, categoria, preco)
VALUES
    ('Notebook', 'Computadores', 3500.00),
    ('Mouse', 'Periféricos', 80.00),
    ('Teclado', 'Periféricos', 150.00),
    ('Monitor', 'Monitores', 900.00),
    ('Headset', 'Áudio', 200.00);

-- 2. Inserir doze vendas fictícias
-- Localizar os produtos pelo nome evita presumir IDs fixos
INSERT INTO public.vendas (produto_id, quantidade, data_venda)
SELECT p.id, dados.quantidade, dados.data_venda
FROM (
    VALUES
        ('Notebook', 2, DATE '2026-10-01'),
        ('Mouse', 5, DATE '2026-10-02'),
        ('Teclado', 3, DATE '2026-10-03'),
        ('Monitor', 2, DATE '2026-10-04'),
        ('Headset', 4, DATE '2026-10-05'),
        ('Notebook', 1, DATE '2026-10-08'),
        ('Mouse', 8, DATE '2026-10-10'),
        ('Monitor', 3, DATE '2026-10-12'),
        ('Teclado', 6, DATE '2026-10-15'),
        ('Headset', 2, DATE '2026-10-18'),
        ('Notebook', 1, DATE '2026-10-20'),
        ('Mouse', 4, DATE '2026-10-22')
) AS dados(nome_produto, quantidade, data_venda)
JOIN public.produtos p
    ON p.nome = dados.nome_produto;

COMMIT;
