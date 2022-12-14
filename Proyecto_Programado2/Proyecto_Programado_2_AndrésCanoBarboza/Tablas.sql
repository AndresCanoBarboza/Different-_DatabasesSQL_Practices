USE [master]
GO
/****** Object:  Database [Proyecto_Programado_2]    Script Date: 10/04/2021 23:11:23 ******/
CREATE DATABASE [Proyecto_Programado_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto_Programado_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Proyecto_Programado_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto_Programado_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Proyecto_Programado_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Proyecto_Programado_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto_Programado_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto_Programado_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto_Programado_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto_Programado_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto_Programado_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto_Programado_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto_Programado_2] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto_Programado_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto_Programado_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto_Programado_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto_Programado_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Proyecto_Programado_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Proyecto_Programado_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Proyecto_Programado_2] SET QUERY_STORE = OFF
GO
USE [Proyecto_Programado_2]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_clientes] [int] NOT NULL,
	[Nombre] [varbinary](25) NOT NULL,
	[Apellido1] [varbinary](25) NOT NULL,
	[Apellido2] [varbinary](25) NOT NULL,
	[Teléfono] [int] NULL,
	[Correo] [varbinary](25) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id_clientes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id] [int] NOT NULL,
	[Fecha_entrada] [date] NOT NULL,
	[Fecha_vencimiento] [date] NOT NULL,
	[Gramos_disponibles] [int] NOT NULL,
	[Lote_en_tienda] [int] NOT NULL,
	[Id_producto] [int] NULL,
	[Id_tienda] [int] NULL,
	[Id_presentacion] [int] NULL,
	[Id_proveedor] [int] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentación]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentación](
	[Id] [int] NOT NULL,
	[Entero] [varchar](10) NOT NULL,
	[Polvo] [varchar](10) NOT NULL,
	[Seco] [varchar](10) NOT NULL,
	[Fresco] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Presentación] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
	[Descripción_(Usos)] [varchar](100) NOT NULL,
	[Precio/gramo] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](25) NOT NULL,
	[Descripción] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiendas]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiendas](
	[Id] [int] NOT NULL,
	[Provincia] [varchar](25) NOT NULL,
	[Cantón] [varchar](25) NOT NULL,
	[Distrito] [varchar](25) NOT NULL,
	[Teléfono] [int] NOT NULL,
	[Correo] [varchar](25) NOT NULL,
	[Id_Producto] [int] NULL,
	[Id_ventas] [int] NULL,
 CONSTRAINT [PK_Tiendas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas_clientes]    Script Date: 10/04/2021 23:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas_clientes](
	[Id] [int] NOT NULL,
	[Fecha_venta] [date] NOT NULL,
	[Cant_vendida] [int] NOT NULL,
	[Id_clientes] [int] NULL,
	[Id_inventario] [int] NULL,
	[Id_producto] [int] NULL,
	[Id_tiendas] [int] NULL,
	[Id_presentacion] [int] NULL,
 CONSTRAINT [PK_Ventas_clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]



ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Presentación] FOREIGN KEY([Id_presentacion])
REFERENCES [dbo].[Presentación] ([Id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Presentación]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Productos] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Productos]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Proveedores] FOREIGN KEY([Id_proveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Proveedores]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Tiendas] FOREIGN KEY([Id_tienda])
REFERENCES [dbo].[Tiendas] ([Id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Tiendas]
GO
ALTER TABLE [dbo].[Tiendas]  WITH CHECK ADD  CONSTRAINT [FK_Tiendas_Productos] FOREIGN KEY([Id_Producto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Tiendas] CHECK CONSTRAINT [FK_Tiendas_Productos]
GO
ALTER TABLE [dbo].[Ventas_clientes]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_clientes_Clientes1] FOREIGN KEY([Id_clientes])
REFERENCES [dbo].[Clientes] ([Id_clientes])
GO
ALTER TABLE [dbo].[Ventas_clientes] CHECK CONSTRAINT [FK_Ventas_clientes_Clientes1]
GO
ALTER TABLE [dbo].[Ventas_clientes]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_clientes_Inventario] FOREIGN KEY([Id_inventario])
REFERENCES [dbo].[Inventario] ([id])
GO
ALTER TABLE [dbo].[Ventas_clientes] CHECK CONSTRAINT [FK_Ventas_clientes_Inventario]
GO
ALTER TABLE [dbo].[Ventas_clientes]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_clientes_Presentación] FOREIGN KEY([Id_presentacion])
REFERENCES [dbo].[Presentación] ([Id])
GO
ALTER TABLE [dbo].[Ventas_clientes] CHECK CONSTRAINT [FK_Ventas_clientes_Presentación]
GO
ALTER TABLE [dbo].[Ventas_clientes]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_clientes_Productos] FOREIGN KEY([Id_producto])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Ventas_clientes] CHECK CONSTRAINT [FK_Ventas_clientes_Productos]
GO
ALTER TABLE [dbo].[Ventas_clientes]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_clientes_Tiendas1] FOREIGN KEY([Id_tiendas])
REFERENCES [dbo].[Tiendas] ([Id])
GO
ALTER TABLE [dbo].[Ventas_clientes] CHECK CONSTRAINT [FK_Ventas_clientes_Tiendas1]
GO
USE [master]
GO
ALTER DATABASE [Proyecto_Programado_2] SET  READ_WRITE 
GO
