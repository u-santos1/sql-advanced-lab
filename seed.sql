-- ==========================================
-- 🗄️ SQL Advanced Lab - Dados de Exemplo (Seed)
-- ==========================================

-- Limpando as tabelas antes de inserir para evitar duplicidade caso o script rode 2x
TRUNCATE TABLE agendamentos, servicos, barbeiros, clientes RESTART IDENTITY CASCADE;

-- 1. Inserindo Clientes
INSERT INTO clientes (nome, email, telefone, data_cadastro) VALUES
('Wesley', 'wesley@email.com', '11999999999', '2023-01-10 10:00:00'),
('João Silva', 'joao@email.com', '11888888888', '2023-02-15 14:30:00'),
('Carlos Moura', 'carlos@email.com', '11777777777', '2023-03-20 09:15:00'),
('Pedro Santos', 'pedro@email.com', '11666666666', '2023-04-05 16:45:00'),
('Lucas Almeida', 'lucas@email.com', '11555555555', '2023-05-12 11:20:00');

-- 2. Inserindo Barbeiros
INSERT INTO barbeiros (nome, especialidade, ativo, data_contratacao) VALUES
('Marcos', 'Corte Clássico', TRUE, '2022-01-15'),
('Roberto', 'Degradê e Platinado', TRUE, '2022-06-20'),
('Fernando', 'Barboterapia', TRUE, '2023-01-05'),
('Thiago', 'Corte Infantil', FALSE, '2021-03-10'); -- Barbeiro inativo

-- 3. Inserindo Serviços
INSERT INTO servicos (nome, descricao, preco, duracao_minutos) VALUES
('Corte Social', 'Corte tradicional na tesoura ou máquina', 40.00, 30),
('Corte Degradê', 'Corte moderno com fade', 50.00, 45),
('Barba Simples', 'Aparar barba com máquina', 30.00, 20),
('Barboterapia', 'Barba com toalha quente e massagem', 60.00, 40),
('Corte + Barba', 'Combo tradicional', 65.00, 50),
('Platinado', 'Descoloração global', 150.00, 120);

-- 4. Inserindo Agendamentos
-- Gerando um histórico interessante para as queries (alguns pendentes, concluídos, cancelados)
INSERT INTO agendamentos (cliente_id, barbeiro_id, servico_id, data_hora, status, observacoes) VALUES
-- Cliente 1 (Wesley) gosta muito do Marcos e sempre corta com ele
(1, 1, 1, '2023-06-01 10:00:00', 'CONCLUIDO', NULL),
(1, 1, 5, '2023-07-01 10:00:00', 'CONCLUIDO', 'Pediu para deixar o topo um pouco maior'),
(1, 1, 5, '2023-08-01 10:00:00', 'CONCLUIDO', NULL),

-- Cliente 2 (João) experimenta vários serviços
(2, 2, 2, '2023-06-15 14:00:00', 'CONCLUIDO', NULL),
(2, 3, 4, '2023-07-20 16:00:00', 'CONCLUIDO', 'Adorou a toalha quente'),
(2, 2, 6, '2023-08-25 15:00:00', 'CANCELADO', 'Imprevisto no trabalho'),

-- Cliente 3 (Carlos)
(3, 1, 1, '2023-07-10 09:00:00', 'CONCLUIDO', NULL),
(3, 3, 3, '2023-08-10 09:30:00', 'CONCLUIDO', NULL),

-- Cliente 4 (Pedro) fez um agendamento futuro (pendente)
(4, 2, 2, '2023-09-05 18:00:00', 'PENDENTE', 'Primeira vez na barbearia'),

-- Agendamento cancelado pelo Cliente 5 (Lucas) com um barbeiro inativo no passado
(5, 4, 1, '2022-12-10 11:00:00', 'CANCELADO', 'O barbeiro ficou doente');
