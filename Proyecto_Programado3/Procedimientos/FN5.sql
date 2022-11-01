USE [Proyecto_Programado_2]
GO

/****** Object:  StoredProcedure [dbo].[Eliminar_prod]    Script Date: 05/05/2021 11:56:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[Eliminar_prod]
@Codigo_Producto int,
@Fechaingreso date,
@Tienda int
as

If ((select Fecha_vencimiento From Inventario) > GetDate())	
	begin
	Update Inventario Set Gramos_disponibles = 0
	Update Inventario Set Lote_en_tienda = 0
	where Id_producto=@Codigo_Producto and Fecha_entrada=@Fechaingreso and Id_tienda=@Tienda
	Print 'Después de la eliminación física del producto, las existencias han sido restablecidas a 0'
	end
else
	begin
	Print 'Hubo un error en el procedimiento, revise los datos ingresados para repetir el proceso.'
	end
GO


