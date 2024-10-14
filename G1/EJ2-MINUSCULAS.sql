
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MILTON
-- Create date: 13/10/2024
-- Description:	Funcion para convertir texto a minusculas
-- =============================================
CREATE FUNCTION TextoAminusculas
(
	@pTexto NVARCHAR(50)
)
RETURNS NVARCHAR(50)
AS
BEGIN

	DECLARE @minus NVARCHAR(50)

	
	set @minus = LOWER(@ptexto)
	
	RETURN @minus

END
GO

