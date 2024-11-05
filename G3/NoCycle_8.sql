USE Aerolinea
GO

-- Crear la secuencia para numPasajeroFrecuente
CREATE SEQUENCE dbo.numPasajeroFrecuente 
    START WITH 1 
    INCREMENT BY 1 
    NO CYCLE;
GO

-- Insertar un registro en la tabla Pasajero usando la secuencia dbo.numPasajeroFrecuente
INSERT INTO Pasajero (nombre, apellidos, DUI, pasaporte, genero, celular, idDireccion, numPasajeroFrecuente, fechaNacimiento)
VALUES ('Violeta', 'Martinez', '1234567890', 'A1234567', 'F', 123456789, 1, NEXT VALUE FOR dbo.numPasajeroFrecuente, '12-10-2002');
