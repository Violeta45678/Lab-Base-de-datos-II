CREATE PROCEDURE vsInsertarReservacion
    @estado VARCHAR(25),
    @idPago INT
AS
BEGIN
    BEGIN TRY
        -- Validar estado permitido
        IF @estado NOT IN ('Activa', 'Cancelada', 'Pendiente')
        BEGIN
            RAISERROR('Estado inválido. Los estados permitidos son: Activa, Cancelada, Pendiente.', 16, 1);
        END

        -- Insertar la reservación
        INSERT INTO Reservacion (estado, idPago)
        VALUES (@estado, @idPago);

        PRINT 'Reservación registrada exitosamente.';
    END TRY
    BEGIN CATCH
        -- Manejar errores
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

EXEC vsInsertarReservacion 'Invalido', 1; -- Debe fallar
EXEC vsInsertarReservacion 'Activa', 1;   -- Debe funcionar

