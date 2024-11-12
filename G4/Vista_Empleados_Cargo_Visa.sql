CREATE VIEW Vista_Empleados_Cargo_Visa AS
SELECT 
    E.nombre AS Nombre_Empleado,
    E.apellidos AS Apellidos_Empleado,
    C.cargo AS Cargo_Empleado,
    V.numVisa AS Numero_Visa
FROM 
    Empleado E
RIGHT JOIN 
    Cargo C ON E.idCargo = C.idCargo
RIGHT JOIN 
    Visa V ON E.idVisa = V.idVisa;

	SELECT * FROM Vista_Empleados_Cargo_Visa