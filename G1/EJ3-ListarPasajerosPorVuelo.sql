CREATE FUNCTION dbo.ListarPasajerosPorVuelo
(
    @VueloId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        nombre AS Nombre,
        apellidos AS Apellido,
        Pasaporte AS NumeroPasaporte
    FROM 
        Pasajero
    WHERE 
        VueloId = @VueloId
);

SELECT * 
FROM dbo.ListarPasajerosPorVuelo(3);
