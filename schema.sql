
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE barbeiros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50), 
    ativo BOOLEAN DEFAULT TRUE,
    data_contratacao DATE NOT NULL
);


CREATE TABLE servicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    duracao_minutos INTEGER NOT NULL 
);

CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER NOT NULL REFERENCES clientes(id) ON DELETE CASCADE,
    barbeiro_id INTEGER NOT NULL REFERENCES barbeiros(id) ON DELETE RESTRICT,
    servico_id INTEGER NOT NULL REFERENCES servicos(id) ON DELETE RESTRICT,
    data_hora TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDENTE', 
    observacoes TEXT
);
