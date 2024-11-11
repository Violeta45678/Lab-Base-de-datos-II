CREATE SEQUENCE SeqSalidaNoCycle
START WITH 1
INCREMENT BY 1
NO CYCLE;


INSERT INTO salida (idOrigen, idEscala, idDestino, idFecha) VALUES
(1, 3, 5, 1),
(2, 4, 4, 2),
(3, 1, 2, 3),
(4, 5, 3, 4),
(5, 2, 4, 5);

select * from Salida;
SELECT * FROM salida WHERE idSalida = (SELECT MAX(idSalida) FROM salida);

SELECT current_value AS Salida
FROM sys.sequences 
WHERE name = 'SeqSalidaNoCycle';
