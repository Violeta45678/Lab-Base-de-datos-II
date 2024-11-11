CREATE VIEW Vista_Pasajeros_Frecuentes_Millas AS
SELECT 
    P.nombre AS Nombre_Pasajero,
    P.apellidos AS Apellidos_Pasajero,
    MF.Millas AS MillasAcumuladas
FROM 
    Pasajero P
LEFT JOIN 
    MetodoPago MP ON P.idPasajero = MP.idMillas
LEFT JOIN 
    Millas MF ON MP.idMillas = MF.idMillas
WHERE 
    P.numPasajeroFrecuente IS NOT NULL;

	SELECT * FROM Vista_Pasajeros_Frecuentes_Millas