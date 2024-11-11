USE Aerolinea
GO
CREATE TABLE Factura2(
	IdFactura2 int IDENTITY(1,1) NOT NULL,
	Total decimal(10, 2) NOT NULL,
	numeroFactura int NOT NULL
	);

-- Crear la secuencia para los n�meros de factura
CREATE SEQUENCE dbo.NumeroFactura
    START WITH 10000001 -- Comienza en un n�mero de 8 d�gitos
    INCREMENT BY 1
    MINVALUE 10000001
    MAXVALUE 99999999 -- M�ximo valor de 8 d�gitos
    CYCLE; -- Reinicia al llegar al m�ximo
GO
-- Inserta en la tabla [Factura] utilizando la secuencia para numeroFactura
INSERT INTO dbo.Factura2 (Total, numeroFactura)
VALUES (500.00, NEXT VALUE FOR dbo.NumeroFactura);
GO
