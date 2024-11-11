CREATE SEQUENCE SeqMillasCycle
START WITH 1
INCREMENT BY 10
MINVALUE 1
MAXVALUE 100
CYCLE;

-- Inserción en la tabla Millas usando la secuencia
INSERT INTO millas (Millas) VALUES 
(10000),
(15000),
(45000),
(17000),
(5000);


SELECT current_value AS Millas
FROM sys.sequences 
WHERE name = 'SeqMillasCycle';
select * from Millas;