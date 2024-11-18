BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @idReservacion INT;
    INSERT INTO Reservacion (estado, idPago) VALUES ('Activa', 1);
    SET @idReservacion = SCOPE_IDENTITY();

    INSERT INTO Boleto (idPasajero, idReservacion, idVuelo, idAsiento, idSalida, idTarifa)
    VALUES (1, @idReservacion, 3, 1, 1,1);

    COMMIT TRANSACTION;
    PRINT 'Reservación y boleto registrados exitosamente.';
END TRY
BEGIN CATCH
    
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;


SELECT * FROM Boleto;
SELECT * FROM Reservacion;