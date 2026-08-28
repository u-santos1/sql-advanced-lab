-- Sem índice, buscar por e-mail faz o banco ler a tabela toda
SELECT * FROM clientes WHERE email = 'joao@email.com';

-- Criando um índice para acelerar essa busca específica
CREATE INDEX idx_clientes_email ON clientes(email);
-- Criando um índice em múltiplas colunas
CREATE INDEX idx_agendamentos_data_barbeiro ON agendamentos(data_hora, barbeiro_id);