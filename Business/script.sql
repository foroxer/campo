USE [master]
GO
/****** Object:  Database [campo]    Script Date: 28/6/2022 16:23:48 ******/
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
/****** Object:  Table [dbo].[grupo_muscular_maquina]    Script Date: 28/6/2022 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo_muscular_maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_maquina] [int] NOT NULL,
	[id_tipo_grupo_muscular] [int] NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_grupo_muscular_maquina] PRIMARY KEY CLUSTERED 
(
	[id_tipo_maquina] ASC,
	[id_tipo_grupo_muscular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idioma]    Script Date: 28/6/2022 16:23:48 ******/
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
/****** Object:  Table [dbo].[maquina]    Script Date: 28/6/2022 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maquina](
	[id] [int] NOT NULL,
	[id_maquina] [int] NOT NULL,
	[identificador] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 28/6/2022 16:23:48 ******/
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
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 28/6/2022 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[id_permiso_padre] [int] NOT NULL,
	[id_permiso_hijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_grupo_muscular]    Script Date: 28/6/2022 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_grupo_muscular](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_maquina]    Script Date: 28/6/2022 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 28/6/2022 16:23:48 ******/
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
/****** Object:  Table [dbo].[usuario_data]    Script Date: 28/6/2022 16:23:48 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 28/6/2022 16:23:48 ******/
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
	[intentos] [int] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[nic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 28/6/2022 16:23:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_permisos](
	[id_usuario] [int] NOT NULL,
	[id_permiso] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[grupo_muscular_maquina] ON 

INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (1, 1, 1, N'1-1')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (2, 1, 2, N'1-2')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (3, 1, 3, N'1-3')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (4, 1, 4, N'1-4')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (5, 1, 5, N'1-5')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (6, 1, 6, N'1-6')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (7, 2, 2, N'2-2')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (8, 3, 3, N'3-3')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (9, 4, 4, N'4-4')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (10, 5, 5, N'5-5')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (11, 6, 6, N'6-6')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (12, 7, 1, N'7-1')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (13, 8, 2, N'8-2')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (14, 21, 3, N'descripcion del ejercicio')
SET IDENTITY_INSERT [dbo].[grupo_muscular_maquina] OFF
GO
SET IDENTITY_INSERT [dbo].[idioma] ON 

INSERT [dbo].[idioma] ([id], [name], [key]) VALUES (1, N'Español', N'ES')
INSERT [dbo].[idioma] ([id], [name], [key]) VALUES (2, N'English', N'EN')
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Default', 3, N'Default', N'Este permiso lo tienen todos los usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'MenuConfiguracion', 10, N'MenuConfig', N'Menu de configuraciones')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'PatentesFamilias', 4, N'PatentesFamilias', N'Menu Patentes y familias')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'PatentesUsuarios', 5, N'PatentesUsuarios', N'Menu Patentes de Usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Super User', 11, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'UsuarioDefault', 1, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'UsuarioEmpleado', 2, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'UsuarioGerente', 8, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Usuarios', 7, N'Usuarios', N'Menu Usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'VerRutina', 12, N'VerRutina', N'Pantalla de rutinas')
SET IDENTITY_INSERT [dbo].[permiso] OFF
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 3)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (2, 7)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 5)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 10)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 4)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 2)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 8)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 12)
GO
SET IDENTITY_INSERT [dbo].[tipo_grupo_muscular] ON 

INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (1, N'Bíceps')
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (2, N'Tríceps')
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (3, N'Hombros')
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (4, N'Isquios')
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (5, N'Glúteos')
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (6, N'Abdominales')
SET IDENTITY_INSERT [dbo].[tipo_grupo_muscular] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_maquina] ON 

INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (1, N'Suelo')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (2, N'Cinta de Correr
')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (3, N'Bicicleta Vertical
')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (4, N'Elíptica')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (5, N'Escaladora')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (6, N'Remo')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (7, N'Banco Olímpico
')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (8, N'Máquina de Poleas
')
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (21, N'Prensa de Piernas')
SET IDENTITY_INSERT [dbo].[tipo_maquina] OFF
GO
SET IDENTITY_INSERT [dbo].[traduccion] ON 

INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (1, 1, N'aceptar', N'Aceptar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (9, 1, N'agregar', N'Agregar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (37, 1, N'alta', N'Alta')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (27, 1, N'apellido', N'Apellido')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (3, 1, N'cancelar', N'Cancelar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (5, 1, N'configuracion', N'Configuración')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (54, 1, N'configurar', N'Configurar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (60, 1, N'configurarFamilia', N'Configurar Familia')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (39, 1, N'crear', N'Crear')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (62, 1, N'descripcion', N'Descripción')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (35, 1, N'direccion', N'Dirección')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (29, 1, N'dni', N'DNI')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (11, 1, N'eliminar', N'Eliminar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (58, 1, N'familia', N'Familia')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (66, 1, N'familias', N'Familias')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (15, 1, N'guardar', N'Guardar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (33, 1, N'mail', N'Email')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (41, 1, N'modificar', N'Modificar')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (23, 1, N'nic', N'NIC')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (25, 1, N'nombre', N'Nombre')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (56, 1, N'nuevaFamilia', N'Nueva Familia')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (43, 1, N'patentes', N'Patentes')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (7, 1, N'patentesyfamilias', N'Patentes yFamilias')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (64, 1, N'permisos', N'Permisos')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (17, 1, N'seleccionarIdioma', N'Seleccionar Idioma')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (19, 1, N'selectLanguage', N'Seleccionar Idioma')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (31, 1, N'telefono', N'Telefono')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (50, 1, N'todasLasFamilias', N'Todas las Familias')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (45, 1, N'todasLasPatentes', N'Todas las patentes')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (21, 1, N'usuario', N'Usuario')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (13, 1, N'usuarios', N'Usuarios')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (2, 2, N'aceptar', N'Accept')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (10, 2, N'agregar', N'Add')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (38, 2, N'alta', N'Create')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (28, 2, N'apellido', N'Last Name')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (4, 2, N'cancelar', N'Cancel')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (6, 2, N'configuracion', N'Configuration')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (55, 2, N'configurar', N'Config')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (61, 2, N'configurarFamilia', N'Config Family')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (40, 2, N'crear', N'Create')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (63, 2, N'descripcion', N'Description')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (36, 2, N'direccion', N'Adress')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (30, 2, N'dni', N'DNI')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (12, 2, N'eliminar', N'Remove')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (59, 2, N'familia', N'Family')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (67, 2, N'familias', N'Families')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (16, 2, N'guardar', N'Save')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (34, 2, N'mail', N'Mail')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (42, 2, N'modificar', N'Modify')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (24, 2, N'nic', N'NIC')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (26, 2, N'nombre', N'Name')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (57, 2, N'nuevaFamilia', N'New Family')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (44, 2, N'patentes', N'Patents')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (8, 2, N'patentesyfamilias', N'Patents and Families')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (65, 2, N'permisos', N'Permissions')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (18, 2, N'seleccionarIdioma', N'Select Language')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (20, 2, N'selectLanguage', N'Select Language')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (32, 2, N'telefono', N'Phone')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (51, 2, N'todasLasFamilias', N'All Families')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (49, 2, N'todasLasPatentes', N'All Patents')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (22, 2, N'usuario', N'User')
INSERT [dbo].[traduccion] ([id], [id_idioma], [key], [traduccion]) VALUES (14, 2, N'usuarios', N'Users')
SET IDENTITY_INSERT [dbo].[traduccion] OFF
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (1, N'juan', N'castelli', N'1145285750', N'mi direccion', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (2, N'martin', N'r', N'12345678', N'', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (8, N'name', N'apellido', N'123', N'dire', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (11, N'qwe', N'qwe', N'qwe', N'qwe', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (13, N'zxc', N'zxc', N'zxc', N'zxc', N'zxc')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos]) VALUES (13, N'1234', N'4ba8d0b9aee36455aa137682f8f61b1d03d20549ea768cdd293c2b3fc2a5a737', N'zxc', N'ES', 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos]) VALUES (8, N'asd', N'44423b26a64af0064aeed205d75090143d3a3fbfa42f6b1d6ddf0621aad52856', N'mail', N'ES', 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos]) VALUES (1, N'juan', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'juan@mail.com', N'EN', 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos]) VALUES (2, N'martin', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'martin@mail.com', N'EN', 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos]) VALUES (11, N'qwe', N'f60605f69eb6a278fecaa4e4359a0a9ba0f34bf3cfa274518956c736a41d49a7', N'qwe', N'ES', 0)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 11)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (2, 1)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (11, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (12, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (13, 3)
GO
USE [master]
GO
ALTER DATABASE [campo] SET  READ_WRITE 
GO
