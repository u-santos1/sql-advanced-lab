CREATE TABLE log_agendamentos(
    id SERIAL PRIMARY KEY,
    agendamento_id INT, 
    data_cancelamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION fn_log_cancelamento() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log_agendamentos (agendamento_id)
    VALUES(OLD.id);
    RETURN OLD;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER tr_agendamento_deletado
AFTER DELETE ON agendamentos
FOR EACH ROW
EXECUTE FUNCTION fn_log_cancelamento();

DELETE FROM agendamentos WHERE id=5;