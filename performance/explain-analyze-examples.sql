EXPLAIN 
SELECT * FROM clientes c 
JOIN agendamentos a ON c.id = a.cliente_id
WHERE c.email = 'wesley@email.com';

EXPLAIN ANALYSE
SELECT * FROM clientes c 
JOIN agendamentos a ON c.id = a.cliente_id
WHERE c.email = 'wesley@email.com'