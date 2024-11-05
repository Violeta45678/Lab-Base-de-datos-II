USE Aerolinea
GO
CREATE TABLE Aeropuerto2 (
	idAeropuerto INT PRIMARY KEY,
    codigoAeropuerto CHAR(3),
    Nombre VARCHAR(100),
    idDireccion INT NOT NULL
);

-- Crear la secuencia para idAeropuerto
CREATE SEQUENCE dbo.idAeropuerto 
    START WITH 1 
    INCREMENT BY 1 
    NO CYCLE;
GO

-- Insertar un registro en la tabla Aeropuerto usando la secuencia
INSERT INTO Aeropuerto2 (idAeropuerto, codigoAeropuerto, Nombre, idDireccion)
VALUES (NEXT VALUE FOR dbo.idAeropuerto, 'LAX', 'Los Angeles International', 1);
