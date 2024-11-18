
BEGIN TRANSACTION;

BEGIN TRY
    
    UPDATE Pago
    SET EstadoPago = 'Pagado'
    WHERE idPago = 1;

    
    UPDATE Reservacion
    SET estado = 'Completada'
    WHERE idPago = 1;

   
    COMMIT TRANSACTION;
    PRINT 'Pago completado y reservación actualizada.';
END TRY
BEGIN CATCH
  
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM Pago WHERE idPago = 1; -- Debe estar como 'Pagado'
SELECT * FROM Reservacion WHERE idPago = 1; -- Debe estar como 'Completada'
