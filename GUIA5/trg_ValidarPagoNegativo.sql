CREATE TRIGGER trg_ValidarPagoNegativo
ON Pago
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE TotalPago < 0)
    BEGIN
        RAISERROR('No se permite insertar un pago con monto negativo.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- Caso válido
INSERT INTO Pago (idMetodoPago, EstadoPago, TotalPago) VALUES (1, 'Pendiente', 100);

-- Caso inválido
INSERT INTO Pago (idMetodoPago, EstadoPago, TotalPago) VALUES (1, 'Pendiente', -50); -- Debe fallar

SELECT * FROM Pago;