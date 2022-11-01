USE [Proyecto_Programado_2]
GO

/****** Object:  StoredProcedure [dbo].[LotesVenc_con_Exist]    Script Date: 05/05/2021 11:55:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[LotesVenc_con_Exist]
@Id_Tienda Int
as

Select p.Id as Código, p.Nombre as Producto, i.Fecha_entrada, i.Fecha_vencimiento
From Productos p, Inventario i

Where Id_tienda = @Id_Tienda and Fecha_vencimiento > Getdate() and Gramos_disponibles > 0

Declare @Tienda varchar(25)
Select @Tienda = Provincia From Tiendas 
Print 'Tienda el Tramito: Lotes Vencidos con Existencias, Tienda:  ' Print @Tienda
GO


