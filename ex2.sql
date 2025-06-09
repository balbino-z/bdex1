-- Criação do Banco de Dados db_generation_game_online
CREATE DATABASE IF NOT EXISTS db_generation_game_online;
USE db_generation_game_online;

-- Criação da tabela tb_classes
CREATE TABLE IF NOT EXISTS tb_classes (
    id BIGINT AUTO_INCREMENT,
    nome_classe VARCHAR(50) NOT NULL,
    descricao_classe VARCHAR(255),
    PRIMARY KEY (id)
);

-- Inserção de 5 registros na tabela tb_classes
INSERT INTO tb_classes (nome_classe, descricao_classe) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo e alta defesa.'),
('Mago', 'Controla elementos e causa dano mágico à distância.'),
('Arqueiro', 'Ataca inimigos de longe com arcos e flechas.'),
('Curandeiro', 'Focado em suporte, cura aliados e remove efeitos negativos.'),
('Assassino', 'Veloz e furtivo, especializado em dano crítico.');

-- Criação da tabela tb_personagens
CREATE TABLE IF NOT EXISTS tb_personagens (
    id BIGINT AUTO_INCREMENT,
    nome_personagem VARCHAR(100) NOT NULL,
    nivel INT NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    classe_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- Inserção de 8 registros na tabela tb_personagens
INSERT INTO tb_personagens (nome_personagem, nivel, poder_ataque, poder_defesa, classe_id) VALUES
('Conan, o Bárbaro', 50, 2500, 1800, 1), -- Guerreiro
('Gandalf, o Cinzento', 60, 3000, 1200, 2), -- Mago
('Legolas Greenleaf', 45, 2200, 900, 3), -- Arqueiro
('Atena, a Protetora', 40, 800, 2500, 4), -- Curandeiro
('Ezra, a Sombra', 55, 3200, 700, 5), -- Assassino
('Boromir, o Bravo', 48, 1900, 1500, 1), -- Guerreiro
('Morgana, a Feiticeira', 52, 2800, 1050, 2), -- Mago
('Clint Barton', 42, 2100, 850, 3); -- Arqueiro

-- SELECT que retorna todos os personagens cujo poder de ataque seja maior do que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- SELECT que retorna todos os personagens cujo poder de defesa esteja no intervalo 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE, buscando todos os personagens que possuam a letra C no atributo nome
SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes
SELECT 
    p.nome_personagem, 
    p.nivel, 
    p.poder_ataque, 
    p.poder_defesa, 
    c.nome_classe, 
    c.descricao_classe
FROM 
    tb_personagens AS p
INNER JOIN 
    tb_classes AS c ON p.classe_id = c.id;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todos os personagens da classe dos arqueiros)
SELECT 
    p.nome_personagem, 
    p.nivel, 
    p.poder_ataque, 
    p.poder_defesa, 
    c.nome_classe
FROM 
    tb_personagens AS p
INNER JOIN 
    tb_classes AS c ON p.classe_id = c.id
WHERE 
    c.nome_classe = 'Arqueiro';