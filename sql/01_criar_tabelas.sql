
BEGIN;

CREATE TABLE public.produtos (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco >= 0)
);

CREATE TABLE public.vendas (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    data_venda DATE NOT NULL,
    CONSTRAINT fk_vendas_produtos
        FOREIGN KEY (produto_id)
        REFERENCES public.produtos(id)
);

COMMIT;
