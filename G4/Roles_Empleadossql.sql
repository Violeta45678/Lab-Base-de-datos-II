CREATE VIEW Roles_Empleados AS
SELECT Empleado.nombre, Empleado.apellidos, Cargo.cargo, Roles.rol
FROM Empleado
INNER JOIN Cargo ON Empleado.idCargo = Cargo.idCargo
INNER JOIN Usuarios ON Empleado.idEmpleado = Usuarios.idEmpleado
INNER JOIN Roles ON Usuarios.idRol = Roles.idRol;

select*from Roles_Empleados;