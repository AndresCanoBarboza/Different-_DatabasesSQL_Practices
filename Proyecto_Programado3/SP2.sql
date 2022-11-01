use Proyecto_Programado_2
Go

Create Procedure ReporteA
@Id_Tienda Int
as
Select Nombre as Producto, Gramos_disponibles as Disponible, Lote_en_tienda as Lotes_disponibles_en_la_tienda
From Productos, Inventario
Where Id_tienda = @Id_Tienda

Declare @Tienda varchar(25)
Select @Tienda = Provincia From Tiendas 
Print 'Tienda el Tramito: Reporte A ' Print @Tienda

