-- MILTON CUADRA

USE [Aerolinea];
GO

-- Crear la tabla [Avion2] con una columna adicional para numeroHangar
CREATE TABLE dbo.Avion2 (
    idAeronave INT IDENTITY(1,1) NOT NULL,
    Modelo VARCHAR(25) NOT NULL,
    envergadura FLOAT NULL,
    capacidad INT NOT NULL,
    marca VARCHAR(25) NOT NULL,
    idClases INT NOT NULL,
    numeroHangar INT NOT NULL, -- Nueva columna para el número de hangar
    PRIMARY KEY CLUSTERED (idAeronave ASC)
) ON [PRIMARY];
GO
-- Crear la secuencia para los números de hangar
CREATE SEQUENCE dbo.NumeroHangar
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 40 -- 40 hangares disponibles 
    CYCLE; 
GO
-- Inserta un registro en la tabla [Avion2] utilizando la secuencia para numeroHangar
INSERT INTO dbo.Avion2 (Modelo, envergadura, capacidad, marca, idClases, numeroHangar)
VALUES ('Boeing 737', 35.8, 180, 'Boeing', 1, NEXT VALUE FOR dbo.NumeroHangar);
GO
