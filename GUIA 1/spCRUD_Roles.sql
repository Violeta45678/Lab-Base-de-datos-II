CREATE PROCEDURE dbo.spCRUD_Roles
    @Accion NVARCHAR(10), 
    @idRol INT = NULL,
    @Nombre NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;  -- Evita mensajes de recuento de filas

    IF @Accion = 'SELECT'
    BEGIN
        SELECT * 
        FROM Roles
        WHERE (@Nombre IS NULL OR rol LIKE '%' + @Nombre + '%');
    END
    ELSE IF @Accion = 'INSERT'
    BEGIN
        INSERT INTO Roles (rol) 
        VALUES (@Nombre);
    END
    ELSE IF @Accion = 'UPDATE'
    BEGIN
        UPDATE Roles
        SET rol = @Nombre
        WHERE idRol = @idRol;
    END
    ELSE IF @Accion = 'DELETE'
    BEGIN
        -- Eliminar las asignaciones relacionadas antes de eliminar el rol
        DELETE FROM AsignacionRolesOpciones 
        WHERE idRol = @idRol;

        -- Eliminar el rol
        DELETE FROM Roles 
        WHERE idRol = @idRol;
    END
    ELSE
    BEGIN
        RAISERROR('Acción no reconocida.', 16, 1);
    END
END;
GO


-- Insertar un nuevo rol
EXEC dbo.spCRUD_Roles 'INSERT', NULL, 'Usuario';

-- Seleccionar todos los roles
EXEC dbo.spCRUD_Roles 'SELECT', NULL, NULL;

-- Actualizar un rol existente
EXEC dbo.spCRUD_Roles 'UPDATE', 8, 'Cliente';

-- Eliminar un rol
EXEC dbo.spCRUD_Roles 'DELETE', 9, NULL;
