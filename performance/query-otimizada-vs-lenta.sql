
-- A QUERY LENTA (Não é SARGable)
-- Digamos que 'data_hora' tem um índice. 
-- Ao usar a função EXTRACT() ou YEAR(), o banco não consegue usar o índice!
-- Ele vai ter que extrair o mês de todos os agendamentos da história para depois filtrar.
SELECT * 
FROM agendamentos
WHERE EXTRACT(MONTH FROM data_hora) = 10 AND EXTRACT(YEAR FROM data_hora) = 2023;


-- A QUERY OTIMIZADA (SARGable)
-- Aqui nós deixamos a coluna 'data_hora' SOZINHA de um lado da igualdade/comparação.
-- O banco consegue usar o índice perfeitamente para buscar esse intervalo (range).
SELECT * 
FROM agendamentos 
WHERE  data_hora >= '2023-10-01' AND data_hora < '2023-11-01';