CREATE VIEW Vista_Itinerarios_Salidas_Regresos AS
SELECT 
    I.idItinerario,
    S.idSalida,
    R.idRegreso,
    FS.fecha AS Fecha_Salida,
    FR.fecha AS Fecha_Regreso
FROM 
    Itinerario I
LEFT JOIN 
    Salida S ON I.idSalida = S.idSalida
LEFT JOIN 
    Regreso R ON I.idRegreso = R.idRegreso
LEFT JOIN 
    Fecha FS ON S.idFecha = FS.idFecha
LEFT JOIN 
    Fecha FR ON R.idFecha = FR.idFecha;

	SELECT * FROM Vista_Itinerarios_Salidas_Regresos
