CREATE PROCEDURE sp_InsertarPasajero
    @nombre VARCHAR(45),
    @apellidos VARCHAR(45),
    @DUI CHAR(10),
    @pasaporte VARCHAR(45),
    @genero CHAR(2),
    @celular INT,
    @idDireccion INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Pasajero (nombre, apellidos, DUI, pasaporte, genero, celular, idDireccion)
        VALUES (@nombre, @apellidos, @DUI, @pasaporte, @genero, @celular, @idDireccion);
        PRINT 'Pasajero agregado exitosamente.';
    END TRY
    BEGIN CATCH
        PRINT 'Error al agregar el pasajero.';
        PRINT ERROR_MESSAGE();
        PRINT ERROR_NUMBER();
        PRINT ERROR_LINE();
    END CATCH
END;
