# 🗄️ sql-advanced-lab

Projeto de estudo focado em SQL avançado — indo além do CRUD básico. Dataset baseado num domínio de barbearia, pra praticar com queries que fazem sentido pra um sistema real.

## 🎯 Objetivo
Dominar SQL além do `SELECT * WHERE id = ?`: joins complexos, subqueries, window functions, otimização de performance com índices, stored procedures/triggers/views, e fundamentos de modelagem de dados. SQL é um dos requisitos mais citados em vagas de backend — este projeto fecha essa base.

## 📁 Estrutura do projeto
```text
sql-advanced-lab/
├── schema.sql                         # estrutura das tabelas (barbeiro, cliente, servico, agendamento)
├── seed.sql                           # dados fake para testar as queries
├── queries/
│   ├── joins-avancados.sql            # self join, full outer join
│   ├── subqueries.sql                 # correlacionadas vs não-correlacionadas
│   ├── window-functions.sql           # ROW_NUMBER, RANK, LAG/LEAD
│   └── cte-recursivas.sql             # Common Table Expressions recursivas
├── performance/
│   ├── explain-analyze-examples.sql   # leitura de plano de execução
│   ├── indices-demo.sql               # B-tree, índice composto
│   └── query-otimizada-vs-lenta.sql   # comparação antes/depois
├── procedures/
│   ├── stored-procedures.sql
│   ├── triggers.sql                   # ex: log de auditoria automático
│   └── views.sql                      # views e materialized views
├── modelagem/
│   └── normalizacao-exemplos.sql      # 1NF, 2NF, 3NF
└── README.md
```

## 🧠 O que cada módulo ensina

- **Queries:** Joins além do básico (self join, full outer), subqueries correlacionadas vs não-correlacionadas, window functions (essenciais para rankings e comparações entre linhas) e CTEs recursivas para dados hierárquicos.
- **Performance:** Como ler um EXPLAIN ANALYZE, quando um índice ajuda (e quando atrapalha), e comparação prática de uma mesma consulta otimizada vs não otimizada.
- **Procedures:** Lógica que roda no banco: stored procedures, triggers (ex: auditoria automática de mudanças) e views para simplificar consultas repetidas.
- **Modelagem:** Fundamentos de normalização (1NF, 2NF, 3NF) — por que evitar dados redundantes e como isso afeta integridade e performance.

## 🚀 Como rodar

```bash
# Sobe o banco PostgreSQL 15-alpine (já executando o schema.sql e seed.sql automaticamente)
docker compose up -d --build

# Para rodar as queries ou procedures pelo terminal:
Get-Content queries\window-functions.sql | docker exec -i barbearia_db psql -U wesley -d barbearia
```

## ✅ Requisitos
- PostgreSQL 14+ (local ou via Docker)
- Cliente SQL de sua preferência (psql, DBeaver, TablePlus)

## 📚 Por que este projeto existe
Parte da minha trilha de estudos backend Java, focada em fundamentos que o mercado realmente pede. Depois do `java-core-playground`, este é o segundo projeto — SQL aparece como requisito em praticamente toda vaga de backend, independente da stack.

## 🗒️ Status
✅ Concluído — Todos os conceitos avançados de SQL e infraestrutura Docker foram implementados e testados.

| Módulo | Status |
|---|---|
| Schema + Seed | ✅ Concluído |
| Queries avançadas | ✅ Concluído |
| Performance | ✅ Concluído |
| Procedures | ✅ Concluído |
| Modelagem | ✅ Concluído |

📌 Parte da minha trilha de estudos backend Java. Confira também: [java-core-playground](https://claude.ai/chat/c3c0bb9c-3278-4648-be15-def272634ece#), [spring-core-lab](https://claude.ai/chat/c3c0bb9c-3278-4648-be15-def272634ece#), [jpa-deep-dive](https://claude.ai/chat/c3c0bb9c-3278-4648-be15-def272634ece#).
