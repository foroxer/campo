USE [campo]
GO
/****** Object:  Trigger [usuario_data_update_trigger2]    Script Date: 31/10/2022 23:23:41 ******/
DROP TRIGGER [dbo].[usuario_data_update_trigger2]
GO
/****** Object:  Trigger [usuario_data_update_trigger]    Script Date: 31/10/2022 23:23:41 ******/
DROP TRIGGER [dbo].[usuario_data_update_trigger]
GO
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuarios_permisos]') AND type in (N'U'))
DROP TABLE [dbo].[usuarios_permisos]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuarios]') AND type in (N'U'))
DROP TABLE [dbo].[usuarios]
GO
/****** Object:  Table [dbo].[usuario_data]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usuario_data]') AND type in (N'U'))
DROP TABLE [dbo].[usuario_data]
GO
/****** Object:  Table [dbo].[user_changes_control]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user_changes_control]') AND type in (N'U'))
DROP TABLE [dbo].[user_changes_control]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[traduccion]') AND type in (N'U'))
DROP TABLE [dbo].[traduccion]
GO
/****** Object:  Table [dbo].[tipo_maquina]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipo_maquina]') AND type in (N'U'))
DROP TABLE [dbo].[tipo_maquina]
GO
/****** Object:  Table [dbo].[tipo_grupo_muscular]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tipo_grupo_muscular]') AND type in (N'U'))
DROP TABLE [dbo].[tipo_grupo_muscular]
GO
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permiso_permiso]') AND type in (N'U'))
DROP TABLE [dbo].[permiso_permiso]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[permiso]') AND type in (N'U'))
DROP TABLE [dbo].[permiso]
GO
/****** Object:  Table [dbo].[maquina]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maquina]') AND type in (N'U'))
DROP TABLE [dbo].[maquina]
GO
/****** Object:  Table [dbo].[idioma]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[idioma]') AND type in (N'U'))
DROP TABLE [dbo].[idioma]
GO
/****** Object:  Table [dbo].[grupo_muscular_maquina]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[grupo_muscular_maquina]') AND type in (N'U'))
DROP TABLE [dbo].[grupo_muscular_maquina]
GO
/****** Object:  Table [dbo].[ejercicios_usuario]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ejercicios_usuario]') AND type in (N'U'))
DROP TABLE [dbo].[ejercicios_usuario]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 31/10/2022 23:23:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bitacora]') AND type in (N'U'))
DROP TABLE [dbo].[bitacora]
GO
USE [master]
GO
/****** Object:  Database [campo]    Script Date: 31/10/2022 23:23:41 ******/
DROP DATABASE [campo]
GO
/****** Object:  Database [campo]    Script Date: 31/10/2022 23:23:41 ******/
CREATE DATABASE [campo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'campo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\campo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'campo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\campo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [campo] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [campo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'campo', N'ON'
GO
ALTER DATABASE [campo] SET QUERY_STORE = OFF
GO
USE [campo]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mensaje] [nchar](500) NOT NULL,
	[prioridad] [nchar](10) NOT NULL,
	[fecha] [nchar](100) NOT NULL,
	[usuario] [nchar](100) NOT NULL,
 CONSTRAINT [PK_bitacora] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicios_usuario]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ejercicios_usuario](
	[id_usuario] [int] NOT NULL,
	[id_grupo_muscular] [int] NOT NULL,
	[repeticiones] [int] NOT NULL,
	[peso] [decimal](5, 2) NULL,
 CONSTRAINT [PK_ejercicios_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_grupo_muscular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo_muscular_maquina]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo_muscular_maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_maquina] [int] NOT NULL,
	[id_tipo_grupo_muscular] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_grupo_muscular_maquina] PRIMARY KEY CLUSTERED 
(
	[id_tipo_maquina] ASC,
	[id_tipo_grupo_muscular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[idioma]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[idioma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maquina]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_maquina] [int] NOT NULL,
	[identificador] [varchar](50) NOT NULL,
 CONSTRAINT [PK_maquina] PRIMARY KEY CLUSTERED 
(
	[identificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso]    Script Date: 31/10/2022 23:23:41 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[id_permiso_padre] [int] NOT NULL,
	[id_permiso_hijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_grupo_muscular]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_grupo_muscular](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_maquina]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[traduccion](
	[id_idioma] [int] NOT NULL,
	[key] [varchar](100) NOT NULL,
	[traduccion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_traduccion] PRIMARY KEY CLUSTERED 
(
	[id_idioma] ASC,
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_changes_control]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_changes_control](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[nic] [varchar](100) NOT NULL,
	[mail] [varchar](200) NOT NULL,
	[key_idioma] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[telefono] [varchar](100) NULL,
	[direccion] [varchar](300) NULL,
	[dni] [varchar](50) NOT NULL,
	[fecha] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_data]    Script Date: 31/10/2022 23:23:41 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nic] [varchar](100) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[mail] [varchar](200) NOT NULL,
	[key_idioma] [int] NOT NULL,
	[intentos] [int] NOT NULL,
	[bloqueado] [bit] NOT NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[nic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 31/10/2022 23:23:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_permisos](
	[id_usuario] [int] NOT NULL,
	[id_permiso] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 

INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (4, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012900617372497                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (5, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012904708032018                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (6, N'frmPatentesFamilias                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'High      ', N'638012904916083671                                                                                  ', N'1                                                                                                   ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (7, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012936552900572                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (8, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012947273024593                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (9, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012953777759008                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (10, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012954926655798                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (11, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012957162495045                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (12, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012961078550390                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (13, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012961795252006                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (14, N'frmPatentesFamilias                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'High      ', N'638012962023697148                                                                                  ', N'1                                                                                                   ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (15, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012962473275124                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (16, N'frmPatentesFamilias                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'High      ', N'638012965651072314                                                                                  ', N'1                                                                                                   ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (17, N'frmPatentesFamilias                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', N'High      ', N'638012966012980412                                                                                  ', N'1                                                                                                   ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (18, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012969132136594                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (19, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012971572301491                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (20, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012972752440918                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (21, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012975824039362                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (22, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012976705112261                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (23, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012978182970662                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (24, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012978918750341                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (25, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012979525582813                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (26, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012980002228200                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (27, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012980775145713                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (28, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012981035643940                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (29, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012984493385478                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (30, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012986765705484                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (31, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012990425474930                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (32, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012991667537223                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (33, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012992315751242                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (34, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012993818503710                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (35, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012996585630203                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (36, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012997427939738                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (37, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638012998321893714                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (38, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027481847441773                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (39, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027483471224058                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (40, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027497296662513                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (41, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027499045239692                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (42, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027500511315180                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (43, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027500584558140                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (44, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027501737588453                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (45, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027507866575551                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (46, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027508294793571                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (47, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027509298468170                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (48, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027510406851628                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (49, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027511120892662                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (50, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027511559593935                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (51, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027643480271202                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (52, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027652357301675                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (53, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027661115012470                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (54, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027662231967829                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (55, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027671758970657                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (56, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027672818041864                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (57, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027674538660515                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (58, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027676473149981                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (59, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027677366612099                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (60, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027677567553845                                                                                  ', N'System                                                                                              ')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario]) VALUES (61, N'Start up                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ', N'Low       ', N'638027677965786911                                                                                  ', N'System                                                                                              ')
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (1, 2, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (2, 1, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (2, 3, 1, CAST(0.00 AS Decimal(5, 2)))
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (21, 1, 1, CAST(0.75 AS Decimal(5, 2)))
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (23, 2, 1, CAST(1.75 AS Decimal(5, 2)))
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (23, 4, 1, CAST(1.75 AS Decimal(5, 2)))
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (23, 5, 1, CAST(1.75 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[grupo_muscular_maquina] ON 

INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (23, 1, 1, N'esta es una descripcion estandar')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (2, 1, 2, N'descripcion del ejercicio 1-2')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (3, 1, 3, N'descripcion del ejercicio  1-3')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (4, 1, 4, N'descripcion del ejercicio  1-4')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (5, 1, 5, N'1-5')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (6, 1, 6, N'1-6')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (7, 2, 2, N'2-2')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (8, 3, 3, N'3-3')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (9, 4, 4, N'4-4')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (20, 5, 1, N'1234567890')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (10, 5, 5, N'5-5')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (12, 7, 1, N'7-1')
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (13, 8, 2, N'8-2')
SET IDENTITY_INSERT [dbo].[grupo_muscular_maquina] OFF
GO
SET IDENTITY_INSERT [dbo].[idioma] ON 

INSERT [dbo].[idioma] ([id], [name]) VALUES (1, N'Español')
INSERT [dbo].[idioma] ([id], [name]) VALUES (2, N'English')
INSERT [dbo].[idioma] ([id], [name]) VALUES (3, N'Paquistani')
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'AsignarEjercicios', 16, N'AsignarEjercicios', N'Asignacion de ejercicios a los usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'ConfigIdioma', 14, N'ConfigIdioma', N'Pantalla de configuracion de tags e diomas')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'ConfigurarEjercicios', 15, N'ConfigurarEjercicios', N'Configuracion de ejercicios , aparatos y grupos musculares')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Default', 3, N'Default', N'Este permiso lo tienen todos los usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'domenech', 13, NULL, NULL)
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
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 4)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (2, 16)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 2)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 8)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 12)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (13, 11)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (13, 12)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 14)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 7)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 15)
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
SET IDENTITY_INSERT [dbo].[tipo_maquina] OFF
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'aceptar', N'Aceptar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'actualizarTraduccion', N'Actualizar Traduccion')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'agregar', N'Agregar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'alta', N'Alta')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'apellido', N'Apellido')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'asd', N'test')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'borrar', N'Borrar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'cancelar', N'Cancelar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configuracion', N'Configuración')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configurar', N'Configurar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configurarFamilia', N'Configurar Familia')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'contraseña', N'Contraseña')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'crear', N'Crear')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'crearIdioma', N'Crear Idioma')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'crearTraduccion', N'Crear Traduccion')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'descripcion', N'Descripción')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'direccion', N'Dirección')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'dni', N'DNI')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'eliminar', N'Eliminar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'familia', N'Familia')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'familias', N'Familias')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'guardar', N'Guardar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'idioma', N'Idioma')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'inicio', N'Inicio')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'lista', N'Lista')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'logOut', N'Cerrar sesion')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'mail', N'Email')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'main', N'Main')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'modificar', N'Modificar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nic', N'NIC')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nombre', N'Nombre')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nuevaContraseña', N'Nueva Contraseña')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nuevaFamilia', N'Nueva Familia')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'patentes', N'Patentes')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'patentesyfamilias', N'Patentes y Familias')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'permisos', N'Permisos')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'resetPssword', N'Cambiar Password')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'seleccionarIdioma', N'Seleccionar Idioma')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'selectLanguage', N'Seleccionar Idioma')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tableadress', N'Dirección')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tableblocked', N'Bloqueado')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tablelastname', N'Apellido')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tablename', N'Nombre')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tablephone', N'Teléfono')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'telefono', N'Telefono')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'todasLasFamilias', N'Todas las Familias')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'todasLasPatentes', N'Todas las patentes')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'traducciones', N'Traducciones')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'usuario', N'Usuario')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'usuarios', N'Usuarios')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'aceptar', N'Accept')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'actualizarTraduccion', N'Update Translation')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'agregar', N'Add')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'alta', N'Create')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'apellido', N'Last Name')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'asd', N'testEnglish')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'borrar', N'Delete')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'cancelar', N'Cancel')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configuracion', N'Configuration')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configurar', N'Config')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configurarFamilia', N'Config Family')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'contraseña', N'Password')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'crear', N'Create')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'crearIdioma', N'Create Language')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'crearTraduccion', N'Create Translation')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'descripcion', N'Description')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'direccion', N'Adress')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'dni', N'DNI')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'eliminar', N'Remove')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'familia', N'Family')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'familias', N'Families')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'guardar', N'Save')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'idioma', N'Language')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'inicio', N'Home')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'lista', N'List')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'logOut', N'LogOut')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'mail', N'Mail')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'main', N'Main')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'modificar', N'Modify')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nic', N'NIC')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nombre', N'Name')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nuevaContraseña', N'New Password')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nuevaFamilia', N'New Family')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'patentes', N'Patents')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'patentesyfamilias', N'Patents and Families')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'permisos', N'Permissions')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'resetPssword', N'Change Password')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'seleccionarIdioma', N'Select Language')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'selectLanguage', N'Select Language')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tableadress', N'Adress')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tableblocked', N'Blocked')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablelastname', N'Last Name')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablename', N'Name')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablephone', N'Phone')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'telefono', N'Phone')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'todasLasFamilias', N'All Families')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'todasLasPatentes', N'All Patents')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'traducciones', N'Translations')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'usuario', N'User')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'usuarios', N'Users')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (3, N'aceptar', N'asda')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (3, N'borrar', N'aca se borra')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (3, N'cancelar', N'cancelarrr')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (3, N'guardar', N'guardarrrr')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (3, N'inicio', N'pepitooooo')
GO
SET IDENTITY_INSERT [dbo].[user_changes_control] ON 

INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (2, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'123', N'638027619721166666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (3, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638027624722666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (4, 21, N'asdf', N'asdasd@sdasd', 2, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638027625409866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (12, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027676507200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (13, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027677608000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (5, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027643516033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (7, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027661173533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (8, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027666379966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (6, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027652387600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (9, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027671789233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (10, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027672857933333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (11, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027674572000000')
SET IDENTITY_INSERT [dbo].[user_changes_control] OFF
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (1, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (2, N'martin', N'rrrr', N'12345678', N'adress', N'12')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (18, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (21, N'asd', N'sd', N'11', N'dasdasd', N'1234')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (22, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni]) VALUES (23, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado]) VALUES (21, N'asdf', N'7c13c90fc7bca100f46b7fe3024974274e018949f7b820eef83254db9648b36a', N'asdasd@sdasd', 1, 0, 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado]) VALUES (18, N'carlos', N'e1df45ab86870fb474c9d6fa5999ef72b4711806cc157f37cfe67a512dce79b4', N'wqwewq', 1, 0, 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado]) VALUES (1, N'juan', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'juan@mail.com', 2, 0, 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado]) VALUES (2, N'martin', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'martin@mail.com', 2, 0, 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado]) VALUES (23, N'qwertjq', N'214b3a71c51f19de7642180d0125b97d68ecb641d33173f0639469eee65aaac4', N's@a', 1, 0, 0)
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado]) VALUES (22, N'tito', N'57c12086feb49c1bee19debf7cdd9066bab6e2c5c0fba2e295fbbd828b53d770', N'dsdasd@asdasd', 1, 0, 0)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 11)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (2, 1)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (13, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (11, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (12, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (8, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (18, 3)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (18, 12)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 4)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 5)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 12)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 10)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (23, 12)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (17, 12)
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (21, 12)
GO
/****** Object:  Trigger [dbo].[usuario_data_update_trigger]    Script Date: 31/10/2022 23:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[usuario_data_update_trigger]
on [dbo].[usuario_data]
FOR UPDATE, DELETE, INSERT
AS
insert into [dbo].[user_changes_control]
select d.id_usuario,
		nic,
		mail,
		key_idioma,
		nombre,
		apellido,
		telefono,
		direccion,
		dni,
		(DATEDIFF_BIG( microsecond, '00010101', GETDATE() ) * 10 +
           ( DATEPART( NANOSECOND, GETDATE() ) % 1000 ) / 100) as fecha
		from deleted as d inner join usuarios as u on d.id_usuario = u.id_usuario ;

GO
ALTER TABLE [dbo].[usuario_data] ENABLE TRIGGER [usuario_data_update_trigger]
GO
/****** Object:  Trigger [dbo].[usuario_data_update_trigger2]    Script Date: 31/10/2022 23:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[usuario_data_update_trigger2]
on [dbo].[usuarios]
FOR UPDATE, DELETE, INSERT
AS
insert into [dbo].[user_changes_control]
select d.id_usuario,
		nic,
		mail,
		key_idioma,
		nombre,
		apellido,
		telefono,
		direccion,
		dni,
		(DATEDIFF_BIG( microsecond, '00010101', GETDATE() ) * 10 +
           ( DATEPART( NANOSECOND, GETDATE() ) % 1000 ) / 100) as fecha
		from deleted as d inner join usuario_data as u on d.id_usuario = u.id_usuario ;
GO
ALTER TABLE [dbo].[usuarios] ENABLE TRIGGER [usuario_data_update_trigger2]
GO
USE [master]
GO
ALTER DATABASE [campo] SET  READ_WRITE 
GO
