BEGIN TRANSACTION;

-- Registrar nuevo empleado como piloto
INSERT INTO Empleado (nombre, apellidos, DUI, idDireccion, pasaporte, idVisa, genero, celular, idCargo, fechaNacimiento)
VALUES ('Juan', 'Pérez', '1234567890', 1, 'A12345678', 1, 'M', 123456789, 1, '1980-01-01');
DECLARE @idEmpleado INT = SCOPE_IDENTITY();

-- Registrar piloto
INSERT INTO Piloto (licencia, tipo, idEmpleado)
VALUES (4567, 'Comercial', @idEmpleado);

COMMIT TRANSACTION;
