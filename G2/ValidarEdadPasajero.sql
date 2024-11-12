--Modificaciones necesarias
ALTER TABLE Pasajero
ADD fechaNacimiento DATE NULL;

UPDATE Pasajero
SET fechaNacimiento = '2000-01-01';

--Instead - Ej 3
CREATE TRIGGER trgValidarEdadPasajero
ON Pasajero
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @fechaNacimiento DATE;
    DECLARE @edad INT;

    DECLARE cur CURSOR FOR
    SELECT fechaNacimiento FROM inserted;

    OPEN cur;

    FETCH NEXT FROM cur INTO @fechaNacimiento;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @edad = DATEDIFF(YEAR, @fechaNacimiento, GETDATE());
        IF @edad >= 18
        BEGIN
            INSERT INTO Pasajero (nombre, apellidos, fechaNacimiento, DUI, pasaporte, genero, celular, idDireccion, numPasajeroFrecuente)
            SELECT nombre, apellidos, fechaNacimiento, DUI, pasaporte, genero, celular, idDireccion, numPasajeroFrecuente
            FROM inserted
            WHERE fechaNacimiento = @fechaNacimiento;
        END
        ELSE
        BEGIN
            RAISERROR('La edad del pasajero debe ser mayor a 18 años.', 16, 1);
        END
        FETCH NEXT FROM cur INTO @fechaNacimiento;
    END
    CLOSE cur;
    DEALLOCATE cur;
END;
