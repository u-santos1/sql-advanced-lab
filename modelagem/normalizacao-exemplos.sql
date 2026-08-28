-- ==========================================
-- EXEMPLOS DE NORMALIZAÇÃO DE BANCO DE DADOS
-- ==========================================

-- Cenário: Uma barbearia que guarda tudo em uma planilha gigante (Não normalizado)

-- ❌ TABELA NÃO NORMALIZADA (Tudo misturado)
-- Problemas: Redundância (nome do barbeiro repete), anomalias de atualização, etc.
/*
CREATE TABLE agendamentos_planilha (
    id SERIAL PRIMARY KEY,
    cliente_nome VARCHAR(100),
    cliente_telefone VARCHAR(20),
    barbeiro_nome VARCHAR(100),
    barbeiro_telefone VARCHAR(20),
    servicos_solicitados VARCHAR(255), -- Ex: "Corte, Barba" (Viola a 1FN)
    valor_total DECIMAL(10,2),
    data_hora TIMESTAMP
);
*/


-- ✅ 1FN (Primeira Forma Normal)
-- Regra: Valores atômicos (sem listas ou arrays na mesma coluna). Cada coluna deve ter apenas 1 informação.
-- Solução: O campo 'servicos_solicitados' não pode ter "Corte, Barba". Precisamos de uma tabela associativa.
-- OBS: Aqui ainda temos o problema do barbeiro e cliente se repetindo (resolvido na 2FN/3FN).


-- ✅ 2FN (Segunda Forma Normal)
-- Regra: Estar na 1FN e todas as colunas devem depender inteiramente da Chave Primária.
-- Solução: Separar as entidades que têm vida própria. Clientes são clientes, Barbeiros são barbeiros.

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE barbeiros (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    telefone VARCHAR(20)
);


-- ✅ 3FN (Terceira Forma Normal)
-- Regra: Estar na 2FN e não ter dependências transitivas (campos que dependem de campos que não são a chave).
-- Solução: Criar a estrutura final separando Serviços e Agendamentos corretamente.

CREATE TABLE servicos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE agendamentos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    barbeiro_id INT REFERENCES barbeiros(id),
    servico_id INT REFERENCES servicos(id),
    data_hora TIMESTAMP
);

-- Conclusão: Nossa estrutura final dividida em 'clientes', 'barbeiros', 'servicos' e 'agendamentos' 
-- já está na 3ª Forma Normal! Cada dado está em seu devido lugar, sem duplicações desnecessárias.
