USE Aerolinea
GO

CREATE TABLE Reservacion2 (
	idReservacion INT PRIMARY KEY,
    estado VARCHAR(25) NOT NULL,
    idPago INT NOT NULL
);

-- Crear la secuencia para idReservacion
CREATE SEQUENCE dbo.idReservacion
    START WITH 1 
    INCREMENT BY 1 
    NO CYCLE;
GO
-- Insertar un registro en la tabla Reservacion usando la secuencia
INSERT INTO Reservacion2 (idReservacion, estado, idPago)
VALUES (NEXT VALUE FOR dbo.idReservacion, 'Confirmada', 1);


