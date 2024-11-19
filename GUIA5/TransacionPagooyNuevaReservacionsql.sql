BEGIN TRANSACTION;
INSERT INTO Pago (idMetodoPago, EstadoPago, TotalPago)
VALUES (1, 'Completado', 150.50);
DECLARE @idPago INT = SCOPE_IDENTITY();
INSERT INTO Reservacion (estado, idPago)
VALUES ('Confirmada', @idPago);
COMMIT TRANSACTION;

SELECT * FROM Reservacion;
SELECT * FROM Pago;

