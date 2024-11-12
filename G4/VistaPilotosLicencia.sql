-- Pilotos y sus licencias
CREATE VIEW PilotosLicencias AS
SELECT P.idPiloto, P.licencia, P.tipo, E.nombre, E.apellidos
FROM Piloto P
INNER JOIN Empleado E ON P.idEmpleado = E.idEmpleado;
