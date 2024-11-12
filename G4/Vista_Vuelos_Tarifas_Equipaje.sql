CREATE VIEW Vista_Vuelos_Tarifas_Equipaje AS
SELECT 
    V.idVuelo,
    T.tipoTarifa,
    TE.TipoEquipaje
FROM 
    Vuelo V
RIGHT JOIN 
    Tarifa T ON V.idAeronave = T.idTipoEquipaje
LEFT JOIN 
    TipoEquipaje TE ON T.idTipoEquipaje = TE.idTipoEquipaje;

	SELECT * FROM Vista_Vuelos_Tarifas_Equipaje