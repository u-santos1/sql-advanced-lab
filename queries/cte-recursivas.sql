
WITH gastos_por_cliente AS (
    SELECT 
        a.cliente_id, 
        SUM(s.preco) AS total_gasto
    FROM agendamentos a
    JOIN servicos s ON a.servico_id = s.id
    WHERE a.status = 'CONCLUIDO'
    GROUP BY a.cliente_id
)
SELECT 
    c.nome, 
    gpc.total_gasto
FROM gastos_por_cliente gpc
JOIN clientes c ON gpc.cliente_id = c.id
WHERE gpc.total_gasto > 100;


WITH RECURSIVE calendario AS (
    
    SELECT CAST(CURRENT_DATE AS DATE) AS dia
    UNION ALL
    
    SELECT CAST(dia + INTERVAL '1 day' AS DATE)
    FROM calendario
    WHERE dia < CURRENT_DATE + INTERVAL '6 days'
)

SELECT 
    c.dia AS data_relatorio,
    COUNT(a.id) AS total_agendamentos_no_dia
FROM calendario c
LEFT JOIN agendamentos a ON DATE(a.data_hora) = c.dia
GROUP BY c.dia
ORDER BY c.dia;
