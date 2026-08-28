
SELECT 
    a.data_hora,
    c.nome AS nome_cliente,
    b.nome AS nome_barbeiro,
    s.nome AS nome_servico
FROM agendamentos a
INNER JOIN clientes c ON a.cliente_id = c.id
INNER JOIN barbeiros b ON a.barbeiro_id = b.id
INNER JOIN servicos s ON a.servico_id = s.id;



SELECT 
    c.nome AS cliente,
    a.data_hora AS data_agendamento
FROM clientes c
LEFT JOIN agendamentos a ON c.id = a.cliente_id;


SELECT 
    c.nome AS cliente,
    c.email
FROM clientes c
LEFT JOIN agendamentos a ON c.id = a.cliente_id
WHERE a.id IS NULL; 



SELECT 
    c.nome AS cliente,
    b.nome AS barbeiro,
    a.data_hora
FROM clientes c
FULL OUTER JOIN agendamentos a ON c.id = a.cliente_id
FULL OUTER JOIN barbeiros b ON a.barbeiro_id = b.id;


SELECT 
    c1.nome AS cliente_1,
    c2.nome AS cliente_2,
    DATE(c1.data_cadastro) AS data_cadastro
FROM clientes c1
JOIN clientes c2 
  ON DATE(c1.data_cadastro) = DATE(c2.data_cadastro) 
  AND c1.id != c2.id; 
