
-- Crear la funci�n para calcular la edad de un empleado
CREATE FUNCTION dbo.fn_CalcularEdad (@fechaNacimiento DATE)
RETURNS INT
AS
BEGIN
    DECLARE @edad INT;
    
    -- Calcular la edad en funci�n de la diferencia de a�os
    SET @edad = DATEDIFF(YEAR, @fechaNacimiento, GETDATE());

    -- Ajustar la edad si la fecha de cumplea�os a�n no ha pasado en el a�o actual
    IF (MONTH(@fechaNacimiento) > MONTH(GETDATE()))
        OR (MONTH(@fechaNacimiento) = MONTH(GETDATE()) AND DAY(@fechaNacimiento) > DAY(GETDATE()))
    BEGIN
        SET @edad = @edad - 1;
    END
    
    RETURN @edad;
END;
GO

-- Ejemplo de uso de la funci�n
SELECT dbo.fn_CalcularEdad('1985-05-12') AS EdadEmpleado;
