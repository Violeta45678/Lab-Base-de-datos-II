
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MILTON CUADRAA
-- Create date: 13/10/2024
-- Description:	Funcion que mandando un idtipoequipaje devuelve el tipo,precio y peso
-- =============================================
CREATE FUNCTION ListarEquipaje
(	
	@idTipoEquipaje INT
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT te.TipoEquipaje, e.Peso, te.Precio
    FROM equipaje e
    INNER JOIN tipoequipaje te ON e.idTipoEquipaje = te.idTipoEquipaje
    WHERE te.idTipoEquipaje = @idTipoEquipaje
)
GO
