--MILTON CUADRA  

USE [Aerolinea];
GO

-- Crea una secuencia para los números de vuelo
CREATE SEQUENCE dbo.NumeroVuelo
    START WITH 1001
    INCREMENT BY 1
    MINVALUE 1001
    MAXVALUE 9999 
    CYCLE; -- La secuencia reinicia cuando llega a 9999
GO
-- Inserta en la tabla [Vuelo] utilizando la secuencia para numeroVuelo
INSERT INTO dbo.Vuelo (idOrigen, idDestino, localizador, numeroVuelo, idAeronave)
VALUES (1, 2, 'ABC12', FORMAT(NEXT VALUE FOR dbo.NumeroVuelo, 'D4'), 1); 
GO
