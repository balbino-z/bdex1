-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS rh_empresa;
USE rh_empresa;

-- Criação da tabela de colaboradores
CREATE TABLE IF NOT EXISTS colaboradores (
    id_colaborador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    data_contratacao DATE,
    departamento VARCHAR(50)
);

-- Inserção de dados (registros) na tabela colaboradores
INSERT INTO colaboradores (nome, cargo, salario, data_contratacao, departamento) VALUES
('João Silva', 'Analista de RH', 2500.00, '2022-01-15', 'Recursos Humanos'),
('Maria Oliveira', 'Desenvolvedora Fullstack', 3500.00, '2021-03-20', 'Tecnologia'),
('Pedro Souza', 'Estagiário', 1500.00, '2023-06-01', 'Marketing'),
('Ana Paula', 'Gerente de Projetos', 4800.00, '2020-09-10', 'Projetos'),
('Carlos Lima', 'Assistente Administrativo', 1800.00, '2023-01-25', 'Administrativo'),
('Fernanda Costa', 'Analista Financeiro', 2200.00, '2022-07-01', 'Finanças');


-- SELECT que retorna todos os colaboradores com salário maior que 2000
SELECT * FROM colaboradores WHERE salario > 2000.00;

-- SELECT que retorna todos os colaboradores com salário menor que 2000
SELECT * FROM colaboradores WHERE salario < 2000.00;

-- Atualização de um registro na tabela
UPDATE colaboradores
SET salario = 2800.00, cargo = 'Analista de RH Sênior'
WHERE id_colaborador = 1;