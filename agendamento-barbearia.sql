-- ================================================
-- BANCO DE DADOS: agendamento-barbearia
-- ================================================

CREATE DATABASE IF NOT EXISTS `agendamento-barbearia`;
USE `agendamento-barbearia`;

-- ================================================
-- TABELAS
-- ================================================

-- TABELA CLIENTE
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(150)
);

-- TABELA BARBEIRO
CREATE TABLE barbeiro (
    id_barbeiro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

-- TABELA SERVICO
CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    duracao_min INT NOT NULL
);

-- TABELA AGENDAMENTO
CREATE TABLE agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_barbeiro INT NOT NULL,
    id_servico INT NOT NULL,
    data_agendamento DATE NOT NULL,
    hora_agendamento TIME NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE',

    CONSTRAINT fk_ag_cliente 
        FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_ag_barbeiro 
        FOREIGN KEY (id_barbeiro) REFERENCES barbeiro(id_barbeiro),
    CONSTRAINT fk_ag_servico 
        FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

-- ================================================
-- INSERTS (DADOS)
-- ================================================

-- CLIENTES
INSERT INTO cliente (nome, telefone, email) VALUES
('João Silva', '1199999-1111', 'joao@gmail.com'),
('Carlos Pereira', '1198888-2222', 'carlos@gmail.com'),
('Matheus Rocha', '1197777-3333', 'matheus@gmail.com');

-- BARBEIROS
INSERT INTO barbeiro (nome, especialidade) VALUES
('Bruno Souza', 'Corte Fade'),
('Ricardo Alves', 'Barba'),
('Eduardo Lima', 'Corte e Barba');

-- SERVIÇOS
INSERT INTO servico (nome, preco, duracao_min) VALUES
('Corte Masculino', 35.00, 20),
('Barba', 25.00, 15),
('Corte + Barba', 55.00, 35);

-- AGENDAMENTOS
INSERT INTO agendamento (id_cliente, id_barbeiro, id_servico, data_agendamento, hora_agendamento, status)
VALUES
(1, 1, 1, '2025-01-10', '09:00:00', 'CONFIRMADO'),
(2, 2, 2, '2025-01-10', '10:00:00', 'PENDENTE'),
(3, 3, 3, '2025-01-10', '11:00:00', 'CONFIRMADO');

-- ================================================
-- CONSULTAS SELECT
-- ================================================

-- 1. Listar todos os agendamentos com nome do cliente, barbeiro e serviço
SELECT a.id_agendamento, c.nome AS cliente, b.nome AS barbeiro, s.nome AS servico,
       a.data_agendamento, a.hora_agendamento, a.status
FROM agendamento a
JOIN cliente c ON a.id_cliente = c.id_cliente
JOIN barbeiro b ON a.id_barbeiro = b.id_barbeiro
JOIN servico s ON a.id_servico = s.id_servico;

-- 2. Agendamentos confirmados
SELECT * FROM agendamento WHERE status = 'CONFIRMADO';

-- 3. Próximos horários por ordem crescente
SELECT * FROM agendamento ORDER BY data_agendamento, hora_agendamento LIMIT 10;

-- 4. Serviços mais caros primeiro
SELECT * FROM servico ORDER BY preco DESC;

-- 5. Consultar por cliente específico
SELECT * FROM agendamento WHERE id_cliente = 1;

-- ================================================
-- UPDATES
-- ================================================

-- 1. Alterar status de um agendamento
UPDATE agendamento SET status = 'CANCELADO' WHERE id_agendamento = 2;

-- 2. Atualizar telefone do cliente
UPDATE cliente SET telefone = '1190000-0000' WHERE id_cliente = 3;

-- 3. Atualizar preço de serviço
UPDATE servico SET preco = 40.00 WHERE id_servico = 1;

-- ================================================
-- DELETES
-- ================================================

-- 1. Deletar um agendamento cancelado
DELETE FROM agendamento WHERE status = 'CANCELADO';

-- 2. Deletar um cliente sem agendamentos
DELETE FROM cliente WHERE id_cliente = 3;

-- 3. Deletar um serviço não utilizado
DELETE FROM servico WHERE id_servico = 2;