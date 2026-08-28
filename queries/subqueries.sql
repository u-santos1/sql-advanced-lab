
SELECT nome, preco
FROM servicos
WHERE preco > (
    SELECT AVG(preco) FROM servicos
);


SELECT nome 
FROM clientes 
WHERE id IN (
    SELECT cliente_id 
    FROM agendamentos 
    WHERE status = 'CANCELADO'
);


SELECT 
    c.nome,
    (SELECT MAX(data_hora) 
     FROM agendamentos a 
     WHERE a.cliente_id = c.id) AS ultimo_agendamento
FROM clientes c;


SELECT b.nome
FROM barbeiros b
WHERE EXISTS (
    SELECT 1 
    FROM agendamentos a 
    WHERE a.barbeiro_id = b.id 
    AND a.status = 'PENDENTE'
);
