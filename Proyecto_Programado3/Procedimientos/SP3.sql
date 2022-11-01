USE [Proyecto_Programado_2]
GO

/****** Object:  StoredProcedure [dbo].[ReporteB]    Script Date: 05/05/2021 11:54:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[ReporteB]
@Id_Tienda Int
as
Select Top 100
p.Id, p.Nombre as Producto, v.Cant_vendida as Cantidad_vendida_en_el_mes
From Productos p, Ventas_clientes v
Where Id_tiendas = @Id_tienda and
DATEPART (month, Fecha_venta) = DatePart (month, Getdate())
Order by v.Cant_vendida desc

Declare @Tienda varchar(25)
Select @Tienda = Provincia From Tiendas
Declare @VentaMes date
Set @VentaMes = GetDate()
Print 'Tienda el Tramito: Reporte B ' Print  @Tienda Print 'Mes: ' Print Datepart (Month, @VentaMes)
GO


