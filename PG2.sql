USE [master]
GO
/****** Object:  Database [PG_2]    Script Date: 25/10/2023 23:36:37 ******/
CREATE DATABASE [PG_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PG_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MVICENTE\MSSQL\DATA\PG_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PG_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MVICENTE\MSSQL\DATA\PG_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PG_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PG_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PG_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PG_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PG_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PG_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PG_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PG_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PG_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PG_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PG_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PG_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PG_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PG_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PG_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PG_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PG_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PG_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PG_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PG_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PG_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PG_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PG_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PG_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PG_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PG_2] SET  MULTI_USER 
GO
ALTER DATABASE [PG_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PG_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PG_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PG_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PG_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PG_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PG_2] SET QUERY_STORE = OFF
GO
USE [PG_2]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuracion]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuracion](
	[recurso] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[valor] [varchar](60) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[marcaProducto] [varchar](100) NULL,
	[descripcionProducto] [varchar](100) NULL,
	[categoriaProducto] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[idMenuPadre] [int] NULL,
	[icono] [varchar](30) NULL,
	[controlador] [varchar](30) NULL,
	[paginaAccion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Negocio]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[idNegocio] [int] NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[nombreLogo] [varchar](100) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[porcentajeImpuesto] [decimal](10, 2) NULL,
	[simboloMoneda] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeroCorrelativo]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroCorrelativo](
	[idNumeroCorrelativo] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NULL,
	[cantidadDigitos] [int] NULL,
	[gestion] [varchar](100) NULL,
	[fechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumeroCorrelativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoBarra] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[urlImagen] [varchar](500) NULL,
	[nombreImagen] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolMenu]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[idRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idMenu] [int] NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumentoVenta]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoVenta](
	[idTipoDocumentoVenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[idRol] [int] NULL,
	[urlFoto] [varchar](500) NULL,
	[nombreFoto] [varchar](100) NULL,
	[clave] [varchar](100) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 25/10/2023 23:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroVenta] [varchar](6) NULL,
	[idTipoDocumentoVenta] [int] NULL,
	[idUsuario] [int] NULL,
	[documentoCliente] [varchar](10) NULL,
	[nombreCliente] [varchar](20) NULL,
	[subTotal] [decimal](10, 2) NULL,
	[impuestoTotal] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[TipoDocumentoVenta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([idMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idTipoDocumentoVenta])
REFERENCES [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
USE [master]
GO
ALTER DATABASE [PG_2] SET  READ_WRITE 
GO
