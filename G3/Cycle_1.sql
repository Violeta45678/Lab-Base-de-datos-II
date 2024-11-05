-- Crear la secuencia para el número de asiento
CREATE SEQUENCE Aerolinea.SecuenciaNumeroAsiento
START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 100 
    CYCLE;

-- Insertar en la tabla Asiento utilizando la secuencia para el número de asiento
INSERT INTO dbo.Asiento (Columna, Numero, idClases)
VALUES ('A', CAST(NEXT VALUE FOR Aerolinea.SecuenciaNumeroAsiento AS CHAR(5)), 1);

INSERT INTO dbo.Asiento (Columna, Numero, idClases)
VALUES ('B', CAST(NEXT VALUE FOR Aerolinea.SecuenciaNumeroAsiento AS CHAR(5)), 2);

INSERT INTO dbo.Asiento (Columna, Numero, idClases)
VALUES ('C', CAST(NEXT VALUE FOR Aerolinea.SecuenciaNumeroAsiento AS CHAR(5)), 3);
