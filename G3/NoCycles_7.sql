CREATE SEQUENCE SeqPagoNoCycle
START WITH 1
INCREMENT BY 1
NO CYCLE;

INSERT INTO Pago (idMetodoPago, EstadoPago, TotalPago) VALUES 
    (1, 'Completado', 200.01),
    (1, 'Completado', 350.46),
    (3, 'Pendiente', 475.85),
    (3, 'Completado', 280.20),
    (2, 'Pendiente', 769.25);

SELECT * FROM Pago;
SELECT current_value AS Pagos
FROM sys.sequences 
WHERE name = 'SeqPagoNoCycle';

SELECT NEXT VALUE FOR SeqPagoNoCycle AS Pagos;

