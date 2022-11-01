Use Proyecto_Programado_2
Go

Create Procedure Eliminar_prod
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

	