
SELECT 
    c.nome AS cliente,
    a.data_hora,
    s.nome AS servico,
    ROW_NUMBER() OVER (PARTITION BY a.cliente_id ORDER BY a.data_hora ASC) AS numero_agendamento
FROM agendamentos a
JOIN clientes c ON a.cliente_id = c.id
JOIN servicos s ON a.servico_id = s.id;


WITH barbeiros_stats AS (
    SELECT b.nome, COUNT(a.id) AS total_atendimentos
    FROM barbeiros b
    LEFT JOIN agendamentos a ON b.id = a.barbeiro_id AND a.status = 'CONCLUIDO'
    GROUP BY b.id, b.nome
)
SELECT 
    nome, 
    total_atendimentos,
    RANK() OVER (ORDER BY total_atendimentos DESC) AS ranking,
    DENSE_RANK() OVER (ORDER BY total_atendimentos DESC) AS ranking_denso
FROM barbeiros_stats;


SELECT 
    c.nome,
    a.data_hora AS agendamento_atual,
    LAG(a.data_hora) OVER (PARTITION BY c.id ORDER BY a.data_hora) AS agendamento_anterior,
    EXTRACT(DAY FROM (a.data_hora - LAG(a.data_hora) OVER (PARTITION BY c.id ORDER BY a.data_hora))) AS dias_desde_ultima_visita
FROM agendamentos a
JOIN clientes c ON a.cliente_id = c.id
ORDER BY c.nome, a.data_hora;
