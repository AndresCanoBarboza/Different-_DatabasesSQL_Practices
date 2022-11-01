use Proyecto_Programado_2

Go

Create Procedure LotesVenc_con_Exist
@Id_Tienda Int
as

Select p.Id as Código, p.Nombre as Producto, i.Fecha_entrada, i.Fecha_vencimiento
From Productos p, Inventario i

Where Id_tienda = @Id_Tienda and Fecha_vencimiento > Getdate() and Gramos_disponibles > 0

Declare @Tienda varchar(25)
Select @Tienda = Provincia From Tiendas 
Print 'Tienda el Tramito: Lotes Vencidos con Existencias, Tienda:  ' Print @Tienda
