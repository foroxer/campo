USE [master]
GO
/****** Object:  Database [campo]    Script Date: 27/6/2022 02:08:52 ******/
CREATE DATABASE [campo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'campo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\campo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'campo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\campo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [campo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [campo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [campo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [campo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [campo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [campo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [campo] SET ARITHABORT OFF 
GO
ALTER DATABASE [campo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [campo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [campo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [campo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [campo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [campo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [campo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [campo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [campo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [campo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [campo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [campo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [campo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [campo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [campo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [campo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [campo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [campo] SET RECOVERY FULL 
GO
ALTER DATABASE [campo] SET  MULTI_USER 
GO
ALTER DATABASE [campo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [campo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [campo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [campo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [campo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'campo', N'ON'
GO
ALTER DATABASE [campo] SET QUERY_STORE = OFF
GO
USE [campo]
GO
/****** Object:  Table [dbo].[idioma]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idioma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[key] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[nombre] [varchar](100) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[permiso] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[id_permiso_padre] [int] NOT NULL,
	[id_permiso_hijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traduccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_idioma] [int] NOT NULL,
	[key] [varchar](100) NOT NULL,
	[traduccion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_traduccion] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC,
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_data]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_data](
	[id_usuario] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[telefono] [varchar](100) NULL,
	[direccion] [varchar](300) NULL,
	[dni] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuario_data] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nic] [varchar](100) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[mail] [varchar](200) NOT NULL,
	[key_idioma] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[nic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 27/6/2022 02:08:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_permisos](
	[id_usuario] [int] NOT NULL,
	[id_permiso] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[idioma] ON 

INSERT [dbo].[idioma] ([id], [name], [key]) VALUES (1, N'Español', N'ES')
INSERT [dbo].[idioma] ([id], [name], [key]) VALUES (2, N'English', N'EN')
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Default', 3, N'Default', N'Permiso Default')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'MenuConfiguracion', 10, N'MenuConfig', N'Menu de configuraciones')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'PatentesFamilias', 4, N'PatentesFamilias', N'Menu Patentes y familias')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'PatentesUsuarios', 5, N'PatentesUsuarios', N'Menu Patentes de Usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'UsuarioDefault', 1, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'UsuarioEmpleado', 2, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'UsuarioGerente', 8, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Usuarios', 7, N'Usuarios', N'Menu Usuarios')
SET IDENTITY_INSERT [dbo].[permiso] OFF
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 3)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (2, 7)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 5)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 10)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 4)
GO
SET IDENTITY_INSERT [dbo].[traduccion] ON 

INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (1, 1, N'aceptar', N'Aceptar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (9, 1, N'agregar', N'Agregar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (3, 1, N'cancelar', N'Cancelar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (5, 1, N'configuracion', N'Configuración')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (11, 1, N'eliminar', N'Eliminar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (15, 1, N'guardar', N'Guardar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (7, 1, N'patentesyfamilias', N'Patentes yFamilias')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (17, 1, N'seleccionarIdioma', N'Seleccionar Idioma')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (13, 1, N'usuarios', N'Usuarios')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (2, 2, N'aceptar', N'Accept')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (10, 2, N'agregar', N'Add')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (4, 2, N'cancelar', N'Cancel')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (6, 2, N'configuracion', N'Configuration')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (12, 2, N'eliminar', N'Remove')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (16, 2, N'guardar', N'Save')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (8, 2, N'patentesyfamilias', N'Patents and Families')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (18, 2, N'seleccionarIdioma', N'Select Language')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (14, 2, N'usuarios', N'Users')
SET IDENTITY_INSERT [dbo].[traduccion] OFF
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (1, N'juan', N'castelli', N'1145285750', N'mi direccion', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (8, N'name', N'apellido', N'123', N'dire', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (11, N'qwe', N'qwe', N'qwe', N'qwe', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (13, N'zxc', N'zxc', N'zxc', N'zxc', N'zxc')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma]) VALUES (13, N'1234', N'4ba8d0b9aee36455aa137682f8f61b1d03d20549ea768cdd293c2b3fc2a5a737', N'zxc', N'ES')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma]) VALUES (8, N'asd', N'44423b26a64af0064aeed205d75090143d3a3fbfa42f6b1d6ddf0621aad52856', N'mail', N'ES')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma]) VALUES (1, N'juan', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'juan@mail.com', N'ES')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma]) VALUES (2, N'martin', N'62195fd653ebc252be78bd0eaa0caf10108173e733af94babf0df3e294b9be2c', N'martin@mail.com', N'EN')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma]) VALUES (11, N'qwe', N'f60605f69eb6a278fecaa4e4359a0a9ba0f34bf3cfa274518956c736a41d49a7', N'qwe', N'ES')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 8)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 2)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (2, 1)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (11, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (12, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (13, 3)
GO
USE [master]
GO
ALTER DATABASE [campo] SET  READ_WRITE 
GO

