BEGIN TRANSACTION;

BEGIN TRY
    
    DECLARE @idPasajero INT;


    INSERT INTO Pasajero (nombre, apellidos, DUI, pasaporte, genero, celular, idDireccion, numPasajeroFrecuente)
    VALUES ('Maria', 'Pérez', '1234567890', 'P125456789', 'M', 12348578, 2, 50); -- Cambia los valores según corresponda
    SET @idPasajero = SCOPE_IDENTITY();

    INSERT INTO Equipaje (idTipoEquipaje, idPasajero, peso)
    VALUES (1, @idPasajero, 20.5); 
    
    INSERT INTO Equipaje (idTipoEquipaje, idPasajero, peso)
    VALUES (2, @idPasajero, 10.0); 


    COMMIT TRANSACTION;
    PRINT 'Pasajero y equipajes registrados exitosamente.';
END TRY
BEGIN CATCH
   
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

SELECT*FROM Equipaje;
SELECT*FROM Pasajero;
