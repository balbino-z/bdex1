-- Criação do Banco de Dados db_pizzaria_legal
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal;
USE db_pizzaria_legal;

-- Criação da tabela tb_categorias
CREATE TABLE IF NOT EXISTS tb_categorias (
    id BIGINT AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255),
    PRIMARY KEY (id)
);

-- Inserção de 5 registros na tabela tb_categorias
INSERT INTO tb_categorias (tipo, descricao_categoria) VALUES
('Salgada Tradicional', 'Pizzas com recheios clássicos salgados.'),
('Salgada Especial', 'Pizzas salgadas com ingredientes diferenciados.'),
('Doce', 'Pizzas com recheios doces.'),
('Vegetariana', 'Pizzas sem carne, com vegetais e queijos.'),
('Vegana', 'Pizzas sem nenhum ingrediente de origem animal.');

-- Criação da tabela tb_pizzas
CREATE TABLE IF NOT EXISTS tb_pizzas (
    id BIGINT AUTO_INCREMENT,
    nome_pizza VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(20) NOT NULL,
    borda_recheada BOOLEAN,
    categoria_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de 8 registros na tabela tb_pizzas
INSERT INTO tb_pizzas (nome_pizza, preco, tamanho, borda_recheada, categoria_id) VALUES
('Mussarela', 40.00, 'Média', FALSE, 1),
('Calabresa', 48.00, 'Média', TRUE, 1),
('Frango com Catupiry', 65.00, 'Grande', TRUE, 2),
('Chocolate com Morango', 55.00, 'Pequena', FALSE, 3),
('Quatro Queijos', 52.00, 'Média', FALSE, 1),
('Portuguesa', 60.00, 'Grande', TRUE, 2),
('Abobrinha com Tomate Seco', 58.00, 'Média', FALSE, 4),
('Brócolis com Palmito', 47.00, 'Média', FALSE, 4);


-- SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

-- SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome
SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias
SELECT 
    p.nome_pizza, 
    p.preco, 
    p.tamanho, 
    p.borda_recheada, 
    c.tipo AS categoria_tipo, 
    c.descricao_categoria
FROM 
    tb_pizzas AS p
INNER JOIN 
    tb_categorias AS c ON p.categoria_id = c.id;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são Doce)
SELECT 
    p.nome_pizza, 
    p.preco, 
    p.tamanho, 
    c.tipo AS categoria_tipo
FROM 
    tb_pizzas AS p
INNER JOIN 
    tb_categorias AS c ON p.categoria_id = c.id
WHERE 
    c.tipo = 'Doce';