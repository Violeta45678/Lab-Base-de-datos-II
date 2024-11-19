BEGIN TRANSACTION;
BEGIN TRY
    -- Actualizar estado de reservación
    UPDATE Reservacion
    SET estado = 'Cancelada'
    WHERE idReservacion = 3;

    -- Actualizar estado del pago
    UPDATE Pago
    SET EstadoPago = 'Reembolsado'
    WHERE idPago = (SELECT idPago FROM Reservacion WHERE idReservacion = 3);

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error al cancelar la reservación.';
END CATCH;
