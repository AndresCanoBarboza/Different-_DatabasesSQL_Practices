
Use Proyecto_Programado_2

GO
/****** Object:  Index [IX_Fecha_vencimiento]    Script Date: 10/04/2021 23:11:30 ******/
CREATE NONCLUSTERED INDEX [IX_Fecha_vencimiento] ON [dbo].[Inventario]
(
	[Fecha_vencimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Gramos_disponibles]    Script Date: 10/04/2021 23:11:30 ******/
CREATE NONCLUSTERED INDEX [IX_Gramos_disponibles] ON [dbo].[Inventario]
(
	[Gramos_disponibles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Lote_disponible_en_tienda]    Script Date: 10/04/2021 23:11:30 ******/
CREATE NONCLUSTERED INDEX [IX_Lote_disponible_en_tienda] ON [dbo].[Inventario]
(
	[Lote_en_tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cant_vendida]    Script Date: 10/04/2021 23:11:30 ******/
CREATE NONCLUSTERED INDEX [IX_Cant_vendida] ON [dbo].[Ventas_clientes]
(
	[Cant_vendida] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO