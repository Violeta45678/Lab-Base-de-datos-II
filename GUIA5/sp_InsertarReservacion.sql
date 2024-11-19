CREATE PROCEDURE sp_InsertarReservacion
@estado VARCHAR(25),
@idPago INT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Pago WHERE idPago = @idPago)
            THROW 50002, 'El ID del pago no existe.', 1;

        INSERT INTO Reservacion (estado, idPago)
        VALUES (@estado, @idPago);
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE();
    END CATCH
END;

EXEC sp_InsertarReservacion @estado = 'Confirmada', @idPago = 3;

