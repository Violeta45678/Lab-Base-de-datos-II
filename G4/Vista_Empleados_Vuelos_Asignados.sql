--Vista de empleados y sus vuelos asignados
CREATE VIEW Vista_Empleados_Vuelos_Asignados AS
SELECT 
    E.nombre AS Nombre_Empleado,
    E.apellidos AS Apellidos_Empleado,
    V.numeroVuelo
FROM 
    Empleado E
INNER JOIN 
    Piloto P ON E.idEmpleado = P.idEmpleado
INNER JOIN 
    Vuelo V ON P.idPiloto = V.idAeronave;

 SELECT * FROM Vista_Empleados_Vuelos_Asignados
