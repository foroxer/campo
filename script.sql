USE [master]
GO
/****** Object:  Database [campo]    Script Date: 24/11/2022 17:57:18 ******/
CREATE DATABASE [campo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'campo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\campo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'campo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\campo_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [campo] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[bitacora]    Script Date: 24/11/2022 17:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mensaje] [varchar](500) NOT NULL,
	[prioridad] [varchar](10) NOT NULL,
	[fecha] [varchar](100) NOT NULL,
	[usuario] [varchar](100) NOT NULL,
	[dvh] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 24/11/2022 17:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[tablename] [varchar](50) NOT NULL,
	[dvv] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicios_usuario]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[grupo_muscular_maquina]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[idioma]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[maquina]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 24/11/2022 17:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[id_permiso_padre] [int] NOT NULL,
	[id_permiso_hijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_grupo_muscular]    Script Date: 24/11/2022 17:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_grupo_muscular](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_maquina]    Script Date: 24/11/2022 17:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[user_changes_control]    Script Date: 24/11/2022 17:57:19 ******/
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
/****** Object:  Table [dbo].[usuario_data]    Script Date: 24/11/2022 17:57:19 ******/
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
	[dvh] [varchar](100) NULL,
 CONSTRAINT [PK_usuario_data] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 24/11/2022 17:57:19 ******/
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
	[dvh] [varchar](100) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[nic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 24/11/2022 17:57:19 ******/
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

INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (1, N'Start up', N'Low', N'638030211987799905', N'System', N'd1ca9a61eac2b56cc4b001ca97c3632695eb9d2023c1d9f9f81e6196cce5d662')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (2, N'Start up', N'Low', N'638030212745226998', N'System', N'01ee9773f31ecf58f96ee801ae40d5f8c662f3fa0944268ec02d529e02385b90')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (3, N'Start up', N'Low', N'638030317777407340', N'System', N'2b61bac8268f39a062bea560e2607a88578c83825f067df2096cc54cd4f45d1d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (4, N'Start up', N'Low', N'638030323060135613', N'System', N'69b236a2a46a73478a0c9c3f93f0a6a9886b707280d1f4977254ec618363772d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (5, N'Start up', N'Low', N'638030325946805017', N'System', N'cd3587e59eee196edd103dcf8a2eb1733b6945ef189ef4d54dbcb894492d45d7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (6, N'Start up', N'Low', N'638030326454636279', N'System', N'6b45ff1195832751caa0e6c3995fa8aea4673e0e279d84ada56a1981bcbd986f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (7, N'Start up', N'Low', N'638030337904912656', N'System', N'6f2eb14815f81a95ea595a81ee6d35ee7044ff81d9a2959dd2e84205dc47d11e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (8, N'Start up', N'Low', N'638030343441812351', N'System', N'4f9aa1757f7c1dbc70452fd74ebfb43b4fcb9b287330fbe58e3943bb2335c191')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (253, N'Start up', N'Low', N'638031121570160419', N'System', N'495af966f050282ea05e7aabbf34333d08784ca6c5cb3dca54ce6d3a4b49bc23')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (10, N'Start up', N'Low', N'638030346888101158', N'System', N'bc7597e984ff07c6507b26a3b731a488f4eed53e2907a9472a85dac8ea711006')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (11, N'Intento fallido de modificacion del usuario: 21', N'High', N'638030347260232008', N'1', N'3a7ad1147c9dd668b29110f00c2e950ee183518090f19e7f7cd3489f23a520d4')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (12, N'Start up', N'Low', N'638030348159932662', N'System', N'b73af8a01eddeb0c2da15806a2fb90c78e2dd50e201819126a9a3d278d63c74a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (13, N'Start up', N'Low', N'638030351884686334', N'System', N'6ec62e59ca674de975b04fa4e16055498a116323104a5a38f203177bbfacb6ab')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (17, N'Start up', N'Low', N'638030397102113755', N'System', N'647e4bbe6a8e8539e369e8f9ad3c54a38a70b18032111f1c4ab9002e75ee4636')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (18, N'Falló el backup ', N'High', N'638030397354282551', N'System', N'b0c506b30d76e144844e1e8907f74c13d703e5a417666389cdc4d02b9def1f99')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (21, N'Start up', N'Low', N'638030405073263081', N'System', N'4198082f734fd5606a1fdb9ef6b3ed279240db454cd0446325ad36ed435e7a78')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (22, N'Se realizo un backup con exito', N'Medium', N'638030405343500031', N'System', N'a052e1ad127a4e08e79092157d80fbced207bdc76398742d3fa35323c4579b3a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (23, N'Start up', N'Low', N'638030407306289546', N'System', N'ca3eadfa81f8ec11d408eeb159545e7d4dbe6afff49b07f9c92c724d75670ac7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (24, N'Start up', N'Low', N'638030409003351872', N'System', N'a861e3d88fca0f166034f640f0c63081485a15b8f7e445bd869c4ba7eb6431f2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (31, N'Falló el restore', N'High', N'638030420329216083', N'System', N'7279f927af3a836bb9694e4d0fe7dac3e3b08feb56ecb5e873a48a433b731c0e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (32, N'Falló el backup ', N'High', N'638030420523001426', N'System', N'2d9820bf09d93945c6e5e21133f65fed95fa4334b8dd03b719fb185dc7811b65')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (33, N'Se realizo un backup con exito', N'Medium', N'638030420894799108', N'System', N'a39dbaf02334b72b061424bed62a46bcc7f672cabaf49527ebfd23d32e3f9941')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (34, N'Se realizo un backup con exito', N'Medium', N'638030420959897088', N'System', N'36b4b810506605d20e74f697cd46bb01b73e907fdb83ce6978803a0b9ea1ac3f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (35, N'Start up', N'Low', N'638030424900194675', N'System', N'e7aa2aaea29a446c706a0f1f809b0bfe587beb5014f5f3290b98dfb482d3b917')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (36, N'Se realizo un backup con exito', N'Medium', N'638030425069785472', N'System', N'd8a633c71e65d8a9244194d6c7d42028bd48d3560416d95a5a2bdafb7d3a570a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (40, N'Start up', N'Low', N'638030428150358511', N'System', N'e07b391e8960408fc7152aa5c34edfffbfe5291f940f186ff6295edbf61d9a1b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (41, N'Falló el restore', N'High', N'638030431299816044', N'System', N'644c29a9ca2ff466039ad0bf531ea175841c93fd7e5e80c5a5abc7449b9d73bb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (42, N'Start up', N'Low', N'638030861587009871', N'System', N'f85afca9d1ff4b131b7e7f5b4efa6214a432526c1ee0304788123b9230628310')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (43, N'Start up', N'Low', N'638030863513647527', N'System', N'2687182279e5dffb8201489524e153646d89187bc7a738666a93b1916cb17e55')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (44, N'Start up', N'Low', N'638030864183738478', N'System', N'2255bdd3a2f950ba31af30fc6a669d164d1f093dd8253fc9f67736cb46a6342f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (48, N'Start up', N'Low', N'638030921435070407', N'System', N'3e12bb96be4560d91b014f0a06ba6b0ca4ab480d0195d2128d9f2473d1b129d2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (49, N'Start up', N'Low', N'638030921955476611', N'System', N'eb7c689348c6821a15aca363ff8a75dd9862cb4f86e800a43b4816a57eb104a0')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (50, N'Start up', N'Low', N'638030933958956401', N'System', N'5222012660276b65b4dc91d2ed4954db67066e7e58f84ab3d088f727066d4f9a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (52, N'Start up', N'Low', N'638030934847601457', N'System', N'c43fc6146e1eb5629700417725f6abd4b592eec5a10ae79fa1b5f38a530d7e3e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (53, N'Start up', N'Low', N'638030935347566090', N'System', N'8707b995435ef6f3f1b26707904b1753abcebb45e2e6d3db1d3406b5fc953cb1')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (54, N'Start up', N'Low', N'638030951964223736', N'System', N'310f08615e0f0b31eedbf865492df2bafbb004925430f59b5eaf0bef53b4b6e0')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (55, N'Start up', N'Low', N'638030999044829768', N'System', N'698b53958c5371a3ab3b4b70d44dc94b21b7d505a49206474091f27f99717251')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (56, N'Falló el restore', N'High', N'638030999464418302', N'System', N'40762fc61c64847d465bf5832fc947cb6a76c2fc96d23d5585047bdeb6371dab')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (57, N'Start up', N'Low', N'638031012660147180', N'System', N'd6c77987373d4cdc6fb5493665d8a903a598ba61375750d2315d39b0369cfcd8')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (59, N'Start up', N'Low', N'638031074524955911', N'System', N'b123bcac6a87af61e21e496a772e5a9549e0f39c660280ccf744b5f97d51785c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (60, N'Start up', N'Low', N'638031076124948795', N'System', N'4fde742a823777a3b7df69f638043725105df5b1924dc982de20e5fda80d5f81')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (62, N'Start up', N'Low', N'638031077412522305', N'System', N'b65850095b65a1f0e61eff52bd3939b242a9c4a1514144fc948357d2fe067730')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (63, N'Start up', N'Low', N'638031077584174715', N'System', N'18b9892ae1df47c9ae9861b0a6873c059de62c05b9f3238debf002be5a21590a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (64, N'Start up', N'Low', N'638031078327227794', N'System', N'711124583f5f1460b765ff9dcad3e5933409db6758d620dc07a79c7fdc156de0')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (69, N'Start up', N'Low', N'638031090003947138', N'System', N'e4ad76cd4ec0a8a274054bb3f91cbdbdb8aafbc2e43a7bb034772011dcf62253')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (70, N'Start up', N'Low', N'638031090791535414', N'System', N'85007ffe9c84675e06a5c55d961fc6bdb019376ccc228490854a07bf993624f8')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (79, N'Start up', N'Low', N'638031094980836097', N'System', N'd3863dd1c9b9ced916491bb276a248aaa68c6bf8655f114fa7066b0e80dc50ea')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (80, N'Start up', N'Low', N'638031095071658756', N'System', N'295ce867b71d159f978a0ec703d3e4c30f02e7c672a4089d218b37c2fcd28d67')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (81, N'Start up', N'Low', N'638031095159342257', N'System', N'7d5e41a8abe89bfa2d2deff8423e8ec37224c0274455ff659fe7b426a9be4d4d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (82, N'Start up', N'Low', N'638031099105940532', N'System', N'e8b9b20ae4c440e57fecf17d814efdce884ad4e11e7c6a49c40d8970e20d3c22')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (83, N'Start up', N'Low', N'638031099394728727', N'System', N'1f76294f538713356846a100d2c2707d52d7958d03dc189d1189704918cacf2b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (85, N'Start up', N'Low', N'638031102360011876', N'System', N'bad473eb57563f8cf3004b4afa43b98452ccf9b3e32a2943db0e4c759e2f7770')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (86, N'Start up', N'Low', N'638031102475331577', N'System', N'034f9e782305dca878a11c8a8488a08ab7b39da4b8c4955ae5b95f785c87e0f3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (87, N'Start up', N'Low', N'638031102836199824', N'System', N'dd23ea94b80f4f4613eb459cba9c34aa9b244bafc2fe7b8504a70c1013644c52')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (88, N'Start up', N'Low', N'638031103102230170', N'System', N'bd45494c9af444374c26627a2c2a14d85a7d3a038d5778553ee0363fc7194f0b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (94, N'Start up', N'Low', N'638031104622198656', N'System', N'024c24494361ca59236269273f15405d8a6772d16ff4592e3766458f0675dd44')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (95, N'Start up', N'Low', N'638031108052832495', N'System', N'aa14fba9caaaa3c3e6219b15ebb0f9b891e3408765326be93bee353ba8bbbcd7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (96, N'Start up', N'Low', N'638031108678827925', N'System', N'6678fd8652f9e87f57aa1ffe9ff921ed9e9dc6eb36f0da4cdea939dc96c1bd56')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (97, N'Start up', N'Low', N'638031109061994660', N'System', N'fe26fb7337eb24cb844ae28ddbb905a104ce2d57ed770bdc51410cc687f1bf0e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (98, N'Start up', N'Low', N'638031109199897675', N'System', N'b6addbf9b4815f2113099fde05d420c3bef1edce91d7884b8837fdd985188bc9')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (101, N'Start up', N'Low', N'638031110632832076', N'System', N'2bb595deaf36f004b594c6cd4fcd78bd99afba4ae8dd759f738c7b49b0f836eb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (14, N'Start up', N'Low', N'638030360058464016', N'System', N'1c935f9bba52953145af49e30e464f72f6f84e6131b13af9e523b2ea1902331b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (15, N'Start up', N'Low', N'638030360804656893', N'System', N'003a7ca9a8c11186b18419a0a8087cb6006af298cb0f4ed87654e03dfb5ad12b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (16, N'modificacion del usuario: 23', N'Medium', N'638030362938898851', N'1', N'1353f8c46c6f6c6f87f185940b7cc828d7a044bfabe074ffe4139588cec048c9')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (19, N'Start up', N'Low', N'638030399165418295', N'System', N'b2dbd816f596e9329f950c49d114b70322572a48600a20aa08c5fa827772b680')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (20, N'Falló el backup ', N'High', N'638030400674078948', N'System', N'e4438e9acb3920c6fdf42816e4a7c8d4bfbf4c181a672025da155a8cbe0c420b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (30, N'Start up', N'Low', N'638030414894732396', N'System', N'cd489563ad99980b9a0e2e8c190484bb79952c9000babdb8adbeea039591c9a2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (51, N'Start up', N'Low', N'638030934534407588', N'System', N'0c96a5a565e8145b6e15e5fabdbc9cba546f207551530d6265e4f2eabd252823')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (58, N'Start up', N'Low', N'638031014923474127', N'System', N'29136ebcd979d3172003f13d331eeec884c1889a08e56ab14cc01cf4cc129620')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (102, N'Start up', N'Low', N'638031112114258460', N'System', N'f7d1aaf4efc733d080ed02e589f422439dce8c01004d2eba439f05567f5f19db')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (106, N'Start up', N'Low', N'638031112918256625', N'System', N'4937767220f3f079f3d2efa1511ab9b47525b22cc2d655139e6833240375e10a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (107, N'Start up', N'Low', N'638031113152726773', N'System', N'bfc9b8eb6e9bd9b9c5c49f5a2334fba3f7af9f77550c073d1fa029606e75f31d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (108, N'Start up', N'Low', N'638031113456489832', N'System', N'649bdd75f1dc11f80a2ed37aa39bac864eaefde0baf7bd7f4e4bbbd35baa7982')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (109, N'Start up', N'Low', N'638031113609797015', N'System', N'29e6fd8ef11410a8fa3db8a22bf2aa71f437eab494bc56286367469fd7559da5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (110, N'Start up', N'Low', N'638031113859644223', N'System', N'6a0768eedc84e4f4c4be7d9c8a72efa77bc17c5c1f484ce0c650fbbae2719814')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (111, N'Start up', N'Low', N'638031113929158471', N'System', N'930dc337756d2aa209731686bcbc73672d94ff7d7b983a30d0650b1dcb172b9f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (112, N'Start up', N'Low', N'638031114284449830', N'System', N'fdbe392246921ffbc378597d89ea7f97e3af9f4d7ffcce0a83aa3ae2c02ba155')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (113, N'Start up', N'Low', N'638031114885872476', N'System', N'3f12f5f44261c7c7f9f9fd5f47d8b2d1e544e88b3ad750c229036fc10f3abddd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (125, N'Start up', N'Low', N'638031125036919210', N'System', N'67206c22c3f9d36479aa1300a2af2a615e3693ecef8687309ed865ceb8e0f1dd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (126, N'Start up', N'Low', N'638031125138598747', N'System', N'720b521f4f4fb7de42137db8f7810ed40809d9aa93b7a9e0cbb64fed7733c9ae')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (127, N'Start up', N'Low', N'638031125334100769', N'System', N'903223f6376661d5ff224cb3f83eaf2bf3236310929ce0737e20479ec63a03cb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (128, N'Start up', N'Low', N'638031125909865017', N'System', N'2d36a8904166956e5fa7ad58e405265dca0003f1208c061d1753384f8797e0c6')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (131, N'Start up', N'Low', N'638031130302779759', N'System', N'ed8e407112ca91d90739cfce1fe42d4b72ae8aaa9e98645de8f3f872733a5c90')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (133, N'Start up', N'Low', N'638031135158917470', N'System', N'792fe20224931b10a140e9606afc23694c5f2552876bb29891830ecd02aa01ca')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (134, N'Start up', N'Low', N'638031135788534987', N'System', N'3d22fd1d58e355a8bd9570773a04a0ac78cd6e83b305eb9a98f3fd44d131208b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (135, N'Start up', N'Low', N'638031136036915739', N'System', N'b834c87b87e1e504f3b761c2e57699c81f3e17b6024f105b470d53c01bf10151')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (136, N'Start up', N'Low', N'638031138181969386', N'System', N'679a2be56419e15e576941fb732e6dd20a7059c33b38c5021878896af6bd5933')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (137, N'Start up', N'Low', N'638031140260177496', N'System', N'4a258c4bad32558796674f6871a1b40ac4733dff98b52d5e966245c49b45cd1e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (138, N'Start up', N'Low', N'638031140351802192', N'System', N'1e8f72082f85e2077caf10b2011fe0a2048efb56705e282f452572ebd82c286e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (139, N'Start up', N'Low', N'638031141647781962', N'System', N'b403358e30162d82233c33390d33edbcc84f33ea0eca1801deb694d8a45d61c5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (140, N'Start up', N'Low', N'638031141998266100', N'System', N'b8e9794046408a21f257f673150a9d19f57891585ada3bcaa2fc5cb3201b733e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (141, N'Start up', N'Low', N'638031142218811887', N'System', N'16b00cff0a9bb468c0d34f6e73bffb77d201c5de2cc7e08f76ef1b1b0899d2d1')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (144, N'Falló el restore', N'High', N'638031144311600578', N'System', N'ea28446d6c290a99c5e5c1c7987785f831f68e5eabf2ce89fcc4d1840b572c3f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (145, N'Intento fallido de modificacion del usuario: 21', N'High', N'638031150427992046', N'1', N'838ed4ff3f380f0d6c90d1c910e67001baafb65e150719cc9cf46a5e4f977d2b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (146, N'modificacion del usuario: 21', N'Medium', N'638031150471037526', N'1', N'4ce7d8de76b22fa0c3fbad0ea7e1375ad5390aac1dde8c7f1dd279ad174085ad')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (155, N'Start up', N'Low', N'638031183627565710', N'System', N'37a8c2a83058d5d053c90f3f01d0d8606534968453e52a1b2e096faf568ee146')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (157, N'Start up', N'Low', N'638031187605590612', N'System', N'3d4ea14aa512ab8f212556cc72ba4210d15e712261ca65cded95d660c844edea')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (158, N'Start up', N'Low', N'638031187897073511', N'System', N'ac8b7692941f30b1bf4d5980f20c7bf36cdd3da800245b4230637e72e3ec9309')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (159, N'modificacion del usuario: 21', N'Medium', N'638031188373653742', N'1', N'ccabc500ddc351a98fe54783fcdcb643c1d98284600806fe1c66f61ebe2e2c56')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (160, N'Start up', N'Low', N'638031188558838320', N'System', N'1b12f2dd411c5da6efc99d12d72fb2b31a0d6ed33ef3f8da9e52ff65e081e611')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (163, N'Start up', N'Low', N'638031191683549058', N'System', N'd4b02ee5a5825715b907151bddfbd72281e49ec03639188defede6a849df59e7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (168, N'Start up', N'Low', N'638031195802264587', N'System', N'b8ccac39d2e6558c75bd6d308020ee7496ef3d67d0f7d96eb6f152fc0a4d8097')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (169, N'Start up failed', N'High', N'638031196869859225', N'System', N'fb731552fb03a590bc0f1574f93668b4712fb95b59b30749bf32cd7bf358ddee')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (170, N'Start up failed', N'High', N'638031197047516021', N'System', N'4501f06253e2a855d25af3b1586a48c81621ac61ecc9ed7775ed50865774a240')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (171, N'Start up', N'Low', N'638031197205237986', N'System', N'9ead5263d906b875e7e494d673c40ea1959fa51c2f5fead75c9333a514401325')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (173, N'Start up', N'Low', N'638031199283379828', N'System', N'78d33d3c26a3cbb8a73e06725ab56d6d8f031f8268caa19f09dcb2055dfb97e8')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (174, N'Start up', N'Low', N'638031201872324777', N'System', N'f8eab2ad2957d176dabe6f12eb7222c58df51617d9acd6a2adb4f4a4d88cf3bb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (292, N'Start up', N'Low', N'638041347569157334', N'System', N'868623c95b73b587f1ef7da4a047af55efeeb6c43afa34054d1ea93a0910dc5d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (293, N'Start up', N'Low', N'638042096121367259', N'System', N'404ab8d8ab9b3e15228f53908a96a1b2c28481703410fac9bcfca1b991f512fd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (295, N'Se realizo un backup con exito', N'Medium', N'638042104659687979', N'System', N'e0bd9717f0f094046acd7117b20724f07b9fd8b7a9815c1eaa36d96a2eb66c59')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (296, N'Start up', N'Low', N'638042424218815445', N'System', N'820198e16d380cc3fcffbc52b232660470a93136e83e313a372912b40743d395')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (297, N'Start up', N'Low', N'638042457055254642', N'System', N'cf8e2fc59ec19fdbf363681e92d99438bba1f8e226f5a08a659b2d45464f5cff')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (299, N'Start up', N'Low', N'638042457932072652', N'System', N'ff3df2cebcefdabf2c4215009ed47e8f156982d848219c5fad68a1d2085bd8de')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (300, N'Start up', N'Low', N'638042458190147917', N'System', N'0e69b0d9442522908ff914f70a55fcb20ad11e8760382a07c781c0625f340e05')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (301, N'Start up', N'Low', N'638042558482105044', N'System', N'b839c1e052b41a1564502b1899fd201e96bdaf72535e9397f2d855704c77fa7d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (302, N'Start up', N'Low', N'638042558813535624', N'System', N'fa1f1baf3fadd499592ec357ea8a622fac4ebd16dfa0f70b1da0a17bed0b2360')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (303, N'Start up', N'Low', N'638042559635387022', N'System', N'839dae11ab19c25e450659bd2e8b4a038d897aff530761166669f071aa262cba')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (306, N'Start up', N'Low', N'638042568050033887', N'System', N'e925fcf89cf69c1ba3142a4ff0e43f7aa7f7b7f58d9f899544b5b47489c41207')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (307, N'Start up', N'Low', N'638042571418409444', N'System', N'f5ccebf2d6b1835f4b23d8a77273aace566cfeb3231d880979a359e743eaef78')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (308, N'Start up', N'Low', N'638042572673297250', N'System', N'e6d0645b5d1f0fa3705c35f5b19d1040a4b006a725ed4a9e8141723d0c29951f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (309, N'Start up', N'Low', N'638042574089148046', N'System', N'50de2a0c4b7f23a628c29664f8e5a8719564e1938e222940a8b42d865d71c91f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (310, N'Start up', N'Low', N'638042574768232499', N'System', N'9deb8ed6626df35b9a9d54261f990c44f4089f680f904a3e5bedd22219801dc5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (25, N'Start up', N'Low', N'638030410423733030', N'System', N'6456b296cc0e0560266d3ee5bdbf1c69b9694a0ce5bf34692435526c4ce2583d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (26, N'Se realizo un backup con exito', N'Medium', N'638030410552513454', N'System', N'bb2cd2b635c6d0c271405f445541c750ed494bf1c074430a7356d963ae7d3009')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (27, N'Start up', N'Low', N'638030410826822177', N'System', N'87bd559866443fc41549260239473405d4b63ff116834e2d33f10b9f4f1e1628')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (28, N'Se realizo un backup con exito', N'Medium', N'638030410947962536', N'System', N'0a89975eb948c85ad20c56062e9e0a0f9aaa8b287039a128f53e8875a0695f8e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (29, N'Start up', N'Low', N'638030411187110314', N'System', N'd25bf4eefcc44d90ee64c05c8921479381516df2883f71ba990085500cbdc9e7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (45, N'Start up', N'Low', N'638030916905417108', N'System', N'3610cd8793beb8f7711d8bad16bade3c9371a3f7af6af769d9c7df8918bacdc2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (46, N'Start up', N'Low', N'638030917140760538', N'System', N'0b9de30c7353bcbcc0e681bcd5e0a42afdcbd925fc11d429127e0963dd69a8bd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (47, N'Start up', N'Low', N'638030917992852148', N'System', N'7e7908089831313c4e7734c439eb1b2607b247e9335dc044bf2979cf49568000')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (156, N'Start up', N'Low', N'638031186456244720', N'System', N'0348610da35eb830e898dd59b7e9a637e1345c68f079bf0f4fbb1ed7a636ce69')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (294, N'Start up', N'Low', N'638042101571760327', N'System', N'b5c4b82a82d099500ab2b3c343e43fcbb59d3fbec8d55caa92d9c9053fec9a21')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (298, N'frmPatentesFamilias', N'High', N'638042457637385398', N'1', N'9f01c2d8475e82ee8debe8aa14b95342c962536d6aaa381510d80e4d49d32781')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (304, N'Start up', N'Low', N'638042561532828500', N'System', N'dc9dd49ab800a8f6a3c68281c50dd8f2a7c9f6d54b4be12a762ee04df4dfa9b0')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (305, N'Start up', N'Low', N'638042566034651067', N'System', N'9480853a6bac56b961b9c4fcf711cda5a535c7465ae713ca874c173408ce4677')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (311, N'Start up', N'Low', N'638042576023411661', N'System', N'9f68eeca09e3b573a1f8ea035ec0285ad9cca29b9a8b2c02f0e8bcf14e0b42cb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (314, N'Start up', N'Low', N'638042582593404716', N'System', N'a48920601d76cfe44f818ca282e6ad4cdbc50b6fe585bb42a158b7a1bcc1d345')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (315, N'Start up', N'Low', N'638042583235600950', N'System', N'2d3122b27e210f84bd7283f74ce84e36898c11bb8092990e769f0e27d3f591ae')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (316, N'Start up', N'Low', N'638042583579059184', N'System', N'de0c9f16834f4651f1f164e74031f5e91e8937131027536eb86bb97c1aa3cf9a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (318, N'Start up', N'Low', N'638049011401819739', N'System', N'60458cf0dbea898adb058fd40ba1b25681a287aff0452d88e61994fe4e176fae')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (320, N'Start up', N'Low', N'638049023569882056', N'System', N'95686d5e9924473b25790d91496fd45fa91b1a4c7624e2d5867b417233ed6fe2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (321, N'Start up', N'Low', N'638049024525571223', N'System', N'a836c13cc4e3f606cf4cef1088671e4151c859d1b4cacef141635950cdf6e414')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (322, N'Start up', N'Low', N'638049025974250786', N'System', N'40116cebeecc87e9b2eadb7b413019736eecc294de8ee717dd7fe00dd7032664')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (323, N'Start up', N'Low', N'638049026506880209', N'System', N'5a7dc4550475c75a320e465ee4b9df207e2ddafbbe6684cb2ac18550871d0343')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (324, N'Start up', N'Low', N'638049038090874726', N'System', N'88832b2393fcbab044f78f4646c94f9834468c8f24a81545333565d7da4fe3eb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (326, N'Start up', N'Low', N'638049053778187218', N'System', N'4e2d3066d6e4c436b483084f7cf36f067e9f3fd1d5fa3c8f1d5951396f919b25')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (327, N'Start up', N'Low', N'638049054645985490', N'System', N'b5efd83765e80b648555fcc0bb38df8e8124d1df6efb75f9df56bee43807e69a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (37, N'Start up', N'Low', N'638030426445890556', N'System', N'3b0411fbc0fbf9e1a389d70fb2b0c0f2ebd9a80e7d1ee5429a25a215941e078c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (38, N'Start up', N'Low', N'638030426611426150', N'System', N'a39c409719172abbd4b91b56751ba05e9988f29683fdb05879ecb4117cafd421')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (39, N'Start up', N'Low', N'638030426922288768', N'System', N'b69ad12218169313f3594a884624164131932aa749cbdbd8090e7c9488f9e285')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (175, N'Start up', N'Low', N'638031212002726335', N'System', N'902fa5248699a3fe0cebce1103764bf2f9d9af8ea01c4f36fa44577e120e5530')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (291, N'Start up', N'Low', N'638041157876434275', N'System', N'427c36fe4716c2d7689d3bde0db4f21ecb8e803cc38b8e887ffec679bc76137f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (61, N'Start up', N'Low', N'638031076415050978', N'System', N'1fc26c09593859f5894d2f0909ce16c9b881e20038b13cc3c63fa5fde86ecf19')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (65, N'Start up', N'Low', N'638031080466401879', N'System', N'a565866931df30aca134547aafb3c0f129f7f6a2d80869b2b74bf36dbf780f62')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (66, N'Start up', N'Low', N'638031080645820912', N'System', N'ef096c2206fca171b15eda09d162286dfa78f8d40d3843296ca59c58a1191c22')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (67, N'Start up', N'Low', N'638031081886995368', N'System', N'c94c032dbf43cab2d242bbd81c52a3a52148e667796aeded3a9cb904e945b89e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (68, N'Start up', N'Low', N'638031082125090397', N'System', N'f2fd1c18d780792f142798d2228244c86e1932196e8f1d9846985edea4dee2c3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (71, N'Start up', N'Low', N'638031091770173174', N'System', N'45242fb683b5828e5e5e5eacf38176675e21c41df755ee02b787c663bb9a1011')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (72, N'Start up', N'Low', N'638031093326195646', N'System', N'd97686e9bf22e603c00362b3cdd3e5d39b6263923d922eec6eb143f33b1ed26a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (73, N'Start up', N'Low', N'638031093508188749', N'System', N'69aa5dfdf0bd7b41f5c1aeac51f8f7a65e1068131cd515f41600d87ee5bcd7aa')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (74, N'Start up', N'Low', N'638031093635114294', N'System', N'6cab4bf3d9e83dc1a1188b7b8007b13dd93a3af7a58d7ccf0eea86f68a9cb0e5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (75, N'Start up', N'Low', N'638031093890230650', N'System', N'3632662daae6d3985a187f2ed86ebbf779eec873af163dc1350b9c92a4ef737a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (76, N'Start up', N'Low', N'638031094150002754', N'System', N'00cdbd3a369265dd54dd45f82429cd57d696bb060654db912dc072fd3bf66e7b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (77, N'Start up', N'Low', N'638031094419321004', N'System', N'0a30f40e397eb0c66f1f59b33465b91065c4930f80557910041a55c299cfa8f8')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (78, N'Start up', N'Low', N'638031094738268019', N'System', N'2589b21d0ebef3b47e69d043c1844e275b008026184c2c15c4bb5596b5bb6a0c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (84, N'Start up', N'Low', N'638031100338376546', N'System', N'a947ddf4a424ab6682487560153c760bfc3d55b7ac3fb86c3ffa73d518dd2e64')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (89, N'Start up', N'Low', N'638031103549396303', N'System', N'9a1197f69a5359f22ed49a06a4115a61aca2c9ad66bdbb3730292337347aa94e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (90, N'Start up', N'Low', N'638031103658749143', N'System', N'f9fbe7bd6f632c7be9f116e26fb654d31ae42bd39a73e22c792a8d40a7891344')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (91, N'Start up', N'Low', N'638031103875602687', N'System', N'df107342b5bfcedc277f92e09ac8734d57d819423dcf602d5d860fbd13cbaba1')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (92, N'Start up', N'Low', N'638031104036749081', N'System', N'c208613a3b89739ca226302416bbacccddcfdd9215d294a82213e990c49f0920')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (93, N'Start up', N'Low', N'638031104270270044', N'System', N'e70e485f9215de6957bbd0d4f7330a88beebb1e1b7b498836b4c1c553ea4ed0e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (99, N'Start up', N'Low', N'638031109649162284', N'System', N'cb68e3a10aa4028147e9c5a53b1a03b9a0db7d1675e5cc12c116157a7f9680a9')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (100, N'Start up', N'Low', N'638031110171636647', N'System', N'1cf4b665eaa5feb01301029ed7d70c02673b384e13b07927e6abde6413f1b624')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (176, N'modificacion del usuario: 23', N'Medium', N'638030362938898851', N'1', N'1353f8c46c6f6c6f87f185940b7cc828d7a044bfabe074ffe4139588cec048c9')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (177, N'Start up', N'Low', N'638030399165418295', N'System', N'b2dbd816f596e9329f950c49d114b70322572a48600a20aa08c5fa827772b680')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (105, N'Start up', N'Low', N'638031112753118434', N'System', N'111cacd510e87f463468ba8798beeeb0427b5ed835c75bae26a21bffddac35d0')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (114, N'Start up', N'Low', N'638031115617658803', N'System', N'5f8798e0148fe4342712b87c1d7e1d8dbe04534e31cd155b1e2b6e103a3321bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (115, N'Start up', N'Low', N'638031116042194494', N'System', N'f09dbe7388ab2e7c1e96bb1d0591076019aa710eb09b334837321d5de00ec5a3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (116, N'Start up', N'Low', N'638031116229891727', N'System', N'f596d214745c4458078d6b1355ea3d78149cf09721414669b226c6af58688d2f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (117, N'Start up', N'Low', N'638031117424819616', N'System', N'65c1ef21c6e30308cd8f7cd9968bdac4cba2c2096aff5ea63aae7e56ce249052')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (118, N'Start up', N'Low', N'638031117484208558', N'System', N'29c9a0bb2295005c5d32a53a826964d1a8531d7f0d94d1292953de2bb33d3a35')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (119, N'Start up', N'Low', N'638031121570160419', N'System', N'495af966f050282ea05e7aabbf34333d08784ca6c5cb3dca54ce6d3a4b49bc23')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (120, N'Start up', N'Low', N'638031121697346194', N'System', N'68fabe9b956f4cedc80ac75feecaae9b11ba0f306eb3c18fdd79c3118548d92f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (123, N'Start up', N'Low', N'638031124258899825', N'System', N'87d1134dc12faa6d1aa65a1bdab0ab367e80c922c1ff630a58b3a169c06fac38')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (124, N'Start up', N'Low', N'638031124418530498', N'System', N'028ebc8837c13d720c272135e5c19e464d97ac6f79e40d8d64127b0fa67c6748')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (129, N'Start up', N'Low', N'638031128728959717', N'System', N'59dcb7646b51c428312b00a08e49fb8eaac0337b93cc93aaf2ae34c16afd0765')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (130, N'Start up', N'Low', N'638031129680300169', N'System', N'fea501de2f9ea6b9f82ce698d6c9cac9d63f4403a2d93864b2362976c55fa982')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (178, N'Falló el backup ', N'High', N'638030400674078948', N'System', N'e4438e9acb3920c6fdf42816e4a7c8d4bfbf4c181a672025da155a8cbe0c420b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (179, N'Start up', N'Low', N'638030414894732396', N'System', N'cd489563ad99980b9a0e2e8c190484bb79952c9000babdb8adbeea039591c9a2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (180, N'Start up', N'Low', N'638030934534407588', N'System', N'0c96a5a565e8145b6e15e5fabdbc9cba546f207551530d6265e4f2eabd252823')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (181, N'Start up', N'Low', N'638031014923474127', N'System', N'29136ebcd979d3172003f13d331eeec884c1889a08e56ab14cc01cf4cc129620')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (182, N'Start up', N'Low', N'638031112114258460', N'System', N'f7d1aaf4efc733d080ed02e589f422439dce8c01004d2eba439f05567f5f19db')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (183, N'Start up', N'Low', N'638031112918256625', N'System', N'4937767220f3f079f3d2efa1511ab9b47525b22cc2d655139e6833240375e10a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (184, N'Start up', N'Low', N'638031113152726773', N'System', N'bfc9b8eb6e9bd9b9c5c49f5a2334fba3f7af9f77550c073d1fa029606e75f31d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (185, N'Start up', N'Low', N'638031113456489832', N'System', N'649bdd75f1dc11f80a2ed37aa39bac864eaefde0baf7bd7f4e4bbbd35baa7982')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (186, N'Start up', N'Low', N'638031113609797015', N'System', N'29e6fd8ef11410a8fa3db8a22bf2aa71f437eab494bc56286367469fd7559da5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (187, N'Start up', N'Low', N'638031113859644223', N'System', N'6a0768eedc84e4f4c4be7d9c8a72efa77bc17c5c1f484ce0c650fbbae2719814')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (188, N'Start up', N'Low', N'638031113929158471', N'System', N'930dc337756d2aa209731686bcbc73672d94ff7d7b983a30d0650b1dcb172b9f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (189, N'Start up', N'Low', N'638031114284449830', N'System', N'fdbe392246921ffbc378597d89ea7f97e3af9f4d7ffcce0a83aa3ae2c02ba155')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (190, N'Start up', N'Low', N'638031114885872476', N'System', N'3f12f5f44261c7c7f9f9fd5f47d8b2d1e544e88b3ad750c229036fc10f3abddd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (191, N'Start up', N'Low', N'638031125036919210', N'System', N'67206c22c3f9d36479aa1300a2af2a615e3693ecef8687309ed865ceb8e0f1dd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (192, N'Start up', N'Low', N'638031125138598747', N'System', N'720b521f4f4fb7de42137db8f7810ed40809d9aa93b7a9e0cbb64fed7733c9ae')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (193, N'Start up', N'Low', N'638031125334100769', N'System', N'903223f6376661d5ff224cb3f83eaf2bf3236310929ce0737e20479ec63a03cb')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (194, N'Start up', N'Low', N'638031125909865017', N'System', N'2d36a8904166956e5fa7ad58e405265dca0003f1208c061d1753384f8797e0c6')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (195, N'Start up', N'Low', N'638031130302779759', N'System', N'ed8e407112ca91d90739cfce1fe42d4b72ae8aaa9e98645de8f3f872733a5c90')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (196, N'Start up', N'Low', N'638031135158917470', N'System', N'792fe20224931b10a140e9606afc23694c5f2552876bb29891830ecd02aa01ca')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (197, N'Start up', N'Low', N'638031135788534987', N'System', N'3d22fd1d58e355a8bd9570773a04a0ac78cd6e83b305eb9a98f3fd44d131208b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (198, N'Start up', N'Low', N'638031136036915739', N'System', N'b834c87b87e1e504f3b761c2e57699c81f3e17b6024f105b470d53c01bf10151')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (199, N'Start up', N'Low', N'638031138181969386', N'System', N'679a2be56419e15e576941fb732e6dd20a7059c33b38c5021878896af6bd5933')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (200, N'Start up', N'Low', N'638031140260177496', N'System', N'4a258c4bad32558796674f6871a1b40ac4733dff98b52d5e966245c49b45cd1e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (201, N'Start up', N'Low', N'638031140351802192', N'System', N'1e8f72082f85e2077caf10b2011fe0a2048efb56705e282f452572ebd82c286e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (202, N'Start up', N'Low', N'638031141647781962', N'System', N'b403358e30162d82233c33390d33edbcc84f33ea0eca1801deb694d8a45d61c5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (203, N'Start up', N'Low', N'638031141998266100', N'System', N'b8e9794046408a21f257f673150a9d19f57891585ada3bcaa2fc5cb3201b733e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (204, N'Start up', N'Low', N'638031142218811887', N'System', N'16b00cff0a9bb468c0d34f6e73bffb77d201c5de2cc7e08f76ef1b1b0899d2d1')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (121, N'Start up', N'Low', N'638031123324086871', N'System', N'5919ba9f79ddb66dcfffb71acc98425f8fc1a27b61698c924e8d3245c13e1a6c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (122, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (132, N'Start up', N'Low', N'638031131158088243', N'System', N'2a750a388e075665813d994c6118551c74bd4e80d736ab26bd046be4009d6775')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (142, N'Start up', N'Low', N'638031142902367416', N'System', N'e313582df8434ee8bd4e30aa2b01cb569ad43dad3049b3aaa1c43ac5df4581ac')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (143, N'Se realizo un backup con exito', N'Medium', N'638031143625635926', N'System', N'22b5a564f7a243293bc57aa42478e50b91154be08e470953da241e230d04895e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (147, N'Start up', N'Low', N'638031151842909528', N'System', N'f4277eff85d2030aa54604c7a36766848a46896db604ade62410ae0850f87854')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (148, N'modificacion del usuario: 22', N'Medium', N'638031152049653665', N'1', N'6ab787b7193a994ad44f31bd3fa337945f79315c8ec0ddf603ca3cc6241ad006')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (149, N'Start up', N'Low', N'638031176002282135', N'System', N'cdcd0e641a2c0513e42acdf3130747d2db0297db460113468aa39272b48cd446')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (150, N'Start up', N'Low', N'638031179788790578', N'System', N'2c5444a8ada3772f05d6574df10ac3c31b60e0fced887057b2be05a580d810b4')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (151, N'frmPatentesFamilias', N'High', N'638031181088465223', N'1', N'33469918d589c376649fb2d381ecffd75c5ee85efda11bc287307ebd3d2f54dd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (152, N'Start up', N'Low', N'638031182302723844', N'System', N'e97d855d73297d878877df5a6f6aed56279b3a848906c6338ae5d39e0d6f7c64')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (153, N'Start up', N'Low', N'638031182762325956', N'System', N'56cabc092394a5afb0b440fbf91f4f91301557b6d4470a82b84a3794626de06d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (154, N'Start up', N'Low', N'638031183162836913', N'System', N'23797a38d353671d1ea8b89a1aa7a30d790cb82e62b6dc02cf09434f09dc7c0b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (205, N'Falló el restore', N'High', N'638031144311600578', N'System', N'ea28446d6c290a99c5e5c1c7987785f831f68e5eabf2ce89fcc4d1840b572c3f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (206, N'Intento fallido de modificacion del usuario: 21', N'High', N'638031150427992046', N'1', N'838ed4ff3f380f0d6c90d1c910e67001baafb65e150719cc9cf46a5e4f977d2b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (207, N'modificacion del usuario: 21', N'Medium', N'638031150471037526', N'1', N'4ce7d8de76b22fa0c3fbad0ea7e1375ad5390aac1dde8c7f1dd279ad174085ad')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (208, N'Start up', N'Low', N'638031183627565710', N'System', N'37a8c2a83058d5d053c90f3f01d0d8606534968453e52a1b2e096faf568ee146')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (209, N'Start up', N'Low', N'638031187605590612', N'System', N'3d4ea14aa512ab8f212556cc72ba4210d15e712261ca65cded95d660c844edea')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (210, N'Start up', N'Low', N'638031187897073511', N'System', N'ac8b7692941f30b1bf4d5980f20c7bf36cdd3da800245b4230637e72e3ec9309')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (211, N'modificacion del usuario: 21', N'Medium', N'638031188373653742', N'1', N'ccabc500ddc351a98fe54783fcdcb643c1d98284600806fe1c66f61ebe2e2c56')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (212, N'Start up', N'Low', N'638031188558838320', N'System', N'1b12f2dd411c5da6efc99d12d72fb2b31a0d6ed33ef3f8da9e52ff65e081e611')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (213, N'Start up', N'Low', N'638031191683549058', N'System', N'd4b02ee5a5825715b907151bddfbd72281e49ec03639188defede6a849df59e7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (214, N'Start up', N'Low', N'638030410423733030', N'System', N'6456b296cc0e0560266d3ee5bdbf1c69b9694a0ce5bf34692435526c4ce2583d')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (215, N'Se realizo un backup con exito', N'Medium', N'638030410552513454', N'System', N'bb2cd2b635c6d0c271405f445541c750ed494bf1c074430a7356d963ae7d3009')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (216, N'Start up', N'Low', N'638030410826822177', N'System', N'87bd559866443fc41549260239473405d4b63ff116834e2d33f10b9f4f1e1628')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (217, N'Se realizo un backup con exito', N'Medium', N'638030410947962536', N'System', N'0a89975eb948c85ad20c56062e9e0a0f9aaa8b287039a128f53e8875a0695f8e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (218, N'Start up', N'Low', N'638030411187110314', N'System', N'd25bf4eefcc44d90ee64c05c8921479381516df2883f71ba990085500cbdc9e7')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (219, N'Start up', N'Low', N'638030916905417108', N'System', N'3610cd8793beb8f7711d8bad16bade3c9371a3f7af6af769d9c7df8918bacdc2')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (220, N'Start up', N'Low', N'638030917140760538', N'System', N'0b9de30c7353bcbcc0e681bcd5e0a42afdcbd925fc11d429127e0963dd69a8bd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (221, N'Start up', N'Low', N'638030917992852148', N'System', N'7e7908089831313c4e7734c439eb1b2607b247e9335dc044bf2979cf49568000')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (222, N'Start up', N'Low', N'638031186456244720', N'System', N'0348610da35eb830e898dd59b7e9a637e1345c68f079bf0f4fbb1ed7a636ce69')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (223, N'Start up', N'Low', N'638030426445890556', N'System', N'3b0411fbc0fbf9e1a389d70fb2b0c0f2ebd9a80e7d1ee5429a25a215941e078c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (224, N'Start up', N'Low', N'638030426611426150', N'System', N'a39c409719172abbd4b91b56751ba05e9988f29683fdb05879ecb4117cafd421')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (225, N'Start up', N'Low', N'638030426922288768', N'System', N'b69ad12218169313f3594a884624164131932aa749cbdbd8090e7c9488f9e285')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (226, N'Start up', N'Low', N'638031076415050978', N'System', N'1fc26c09593859f5894d2f0909ce16c9b881e20038b13cc3c63fa5fde86ecf19')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (227, N'Start up', N'Low', N'638031080466401879', N'System', N'a565866931df30aca134547aafb3c0f129f7f6a2d80869b2b74bf36dbf780f62')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (228, N'Start up', N'Low', N'638031080645820912', N'System', N'ef096c2206fca171b15eda09d162286dfa78f8d40d3843296ca59c58a1191c22')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (229, N'Start up', N'Low', N'638031081886995368', N'System', N'c94c032dbf43cab2d242bbd81c52a3a52148e667796aeded3a9cb904e945b89e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (230, N'Start up', N'Low', N'638031082125090397', N'System', N'f2fd1c18d780792f142798d2228244c86e1932196e8f1d9846985edea4dee2c3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (231, N'Start up', N'Low', N'638031091770173174', N'System', N'45242fb683b5828e5e5e5eacf38176675e21c41df755ee02b787c663bb9a1011')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (232, N'Start up', N'Low', N'638031093326195646', N'System', N'd97686e9bf22e603c00362b3cdd3e5d39b6263923d922eec6eb143f33b1ed26a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (233, N'Start up', N'Low', N'638031093508188749', N'System', N'69aa5dfdf0bd7b41f5c1aeac51f8f7a65e1068131cd515f41600d87ee5bcd7aa')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (234, N'Start up', N'Low', N'638031093635114294', N'System', N'6cab4bf3d9e83dc1a1188b7b8007b13dd93a3af7a58d7ccf0eea86f68a9cb0e5')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (235, N'Start up', N'Low', N'638031093890230650', N'System', N'3632662daae6d3985a187f2ed86ebbf779eec873af163dc1350b9c92a4ef737a')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (236, N'Start up', N'Low', N'638031094150002754', N'System', N'00cdbd3a369265dd54dd45f82429cd57d696bb060654db912dc072fd3bf66e7b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (237, N'Start up', N'Low', N'638031094419321004', N'System', N'0a30f40e397eb0c66f1f59b33465b91065c4930f80557910041a55c299cfa8f8')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (238, N'Start up', N'Low', N'638031094738268019', N'System', N'2589b21d0ebef3b47e69d043c1844e275b008026184c2c15c4bb5596b5bb6a0c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (239, N'Start up', N'Low', N'638031100338376546', N'System', N'a947ddf4a424ab6682487560153c760bfc3d55b7ac3fb86c3ffa73d518dd2e64')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (240, N'Start up', N'Low', N'638031103549396303', N'System', N'9a1197f69a5359f22ed49a06a4115a61aca2c9ad66bdbb3730292337347aa94e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (241, N'Start up', N'Low', N'638031103658749143', N'System', N'f9fbe7bd6f632c7be9f116e26fb654d31ae42bd39a73e22c792a8d40a7891344')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (242, N'Start up', N'Low', N'638031103875602687', N'System', N'df107342b5bfcedc277f92e09ac8734d57d819423dcf602d5d860fbd13cbaba1')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (243, N'Start up', N'Low', N'638031104036749081', N'System', N'c208613a3b89739ca226302416bbacccddcfdd9215d294a82213e990c49f0920')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (244, N'Start up', N'Low', N'638031104270270044', N'System', N'e70e485f9215de6957bbd0d4f7330a88beebb1e1b7b498836b4c1c553ea4ed0e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (245, N'Start up', N'Low', N'638031109649162284', N'System', N'cb68e3a10aa4028147e9c5a53b1a03b9a0db7d1675e5cc12c116157a7f9680a9')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (246, N'Start up', N'Low', N'638031110171636647', N'System', N'1cf4b665eaa5feb01301029ed7d70c02673b384e13b07927e6abde6413f1b624')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (247, N'Start up', N'Low', N'638031112753118434', N'System', N'111cacd510e87f463468ba8798beeeb0427b5ed835c75bae26a21bffddac35d0')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (248, N'Start up', N'Low', N'638031115617658803', N'System', N'5f8798e0148fe4342712b87c1d7e1d8dbe04534e31cd155b1e2b6e103a3321bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (249, N'Start up', N'Low', N'638031116042194494', N'System', N'f09dbe7388ab2e7c1e96bb1d0591076019aa710eb09b334837321d5de00ec5a3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (250, N'Start up', N'Low', N'638031116229891727', N'System', N'f596d214745c4458078d6b1355ea3d78149cf09721414669b226c6af58688d2f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (251, N'Start up', N'Low', N'638031117424819616', N'System', N'65c1ef21c6e30308cd8f7cd9968bdac4cba2c2096aff5ea63aae7e56ce249052')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (252, N'Start up', N'Low', N'638031117484208558', N'System', N'29c9a0bb2295005c5d32a53a826964d1a8531d7f0d94d1292953de2bb33d3a35')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (161, N'Start up', N'Low', N'638031188887804149', N'System', N'2160b1de45aaf1516ee6ce7ec6b262986a40aa287575fc6dc68281de505d109f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (162, N'Start up', N'Low', N'638031189202850550', N'System', N'11a1e537559546d483993a5d20038aab0088de41e10c1bfe03a2e5c6154023d4')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (164, N'Start up', N'Low', N'638031192021027216', N'System', N'dc1f6ea34cc151d026deb64da0a52505cbb3db70c3bd7aa87260d850788d589e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (165, N'Start up', N'Low', N'638031192475846720', N'System', N'f9362fd34d44cd45a41cd7bddf810ab6fff9729a0fff8018b6f8d7258d5ac02f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (166, N'Start up', N'Low', N'638031193593458716', N'System', N'3cbd13a1f183eee3bb5214e3f0acd512f02b239fa57c7098a3a850304aa8d2a3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (167, N'Start up', N'Low', N'638031194101554832', N'System', N'e36e83c6fd25a9c91f5ab0f6896837a4f8e3b381743640632f19834d732c86c3')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (172, N'Start up', N'Low', N'638031198973160865', N'System', N'57872df616514f338633d83632c783570c5d0cbe353e85a91481e3342a94670e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (254, N'Start up', N'Low', N'638031121697346194', N'System', N'68fabe9b956f4cedc80ac75feecaae9b11ba0f306eb3c18fdd79c3118548d92f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (255, N'Start up', N'Low', N'638031124258899825', N'System', N'87d1134dc12faa6d1aa65a1bdab0ab367e80c922c1ff630a58b3a169c06fac38')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (256, N'Start up', N'Low', N'638031124418530498', N'System', N'028ebc8837c13d720c272135e5c19e464d97ac6f79e40d8d64127b0fa67c6748')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (257, N'Start up', N'Low', N'638031128728959717', N'System', N'59dcb7646b51c428312b00a08e49fb8eaac0337b93cc93aaf2ae34c16afd0765')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (258, N'Start up', N'Low', N'638031129680300169', N'System', N'fea501de2f9ea6b9f82ce698d6c9cac9d63f4403a2d93864b2362976c55fa982')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (259, N'Start up', N'Low', N'638031123324086871', N'System', N'5919ba9f79ddb66dcfffb71acc98425f8fc1a27b61698c924e8d3245c13e1a6c')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (260, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (261, N'Start up', N'Low', N'638031131158088243', N'System', N'2a750a388e075665813d994c6118551c74bd4e80d736ab26bd046be4009d6775')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (262, N'Start up', N'Low', N'638031142902367416', N'System', N'e313582df8434ee8bd4e30aa2b01cb569ad43dad3049b3aaa1c43ac5df4581ac')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (263, N'Se realizo un backup con exito', N'Medium', N'638031143625635926', N'System', N'22b5a564f7a243293bc57aa42478e50b91154be08e470953da241e230d04895e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (264, N'Start up', N'Low', N'638031151842909528', N'System', N'f4277eff85d2030aa54604c7a36766848a46896db604ade62410ae0850f87854')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (265, N'modificacion del usuario: 22', N'Medium', N'638031152049653665', N'1', N'6ab787b7193a994ad44f31bd3fa337945f79315c8ec0ddf603ca3cc6241ad006')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (266, N'Start up', N'Low', N'638031176002282135', N'System', N'cdcd0e641a2c0513e42acdf3130747d2db0297db460113468aa39272b48cd446')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (267, N'Start up', N'Low', N'638031179788790578', N'System', N'2c5444a8ada3772f05d6574df10ac3c31b60e0fced887057b2be05a580d810b4')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (268, N'frmPatentesFamilias', N'High', N'638031181088465223', N'1', N'33469918d589c376649fb2d381ecffd75c5ee85efda11bc287307ebd3d2f54dd')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (269, N'Start up', N'Low', N'638031182302723844', N'System', N'e97d855d73297d878877df5a6f6aed56279b3a848906c6338ae5d39e0d6f7c64')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (270, N'Start up', N'Low', N'638031182762325956', N'System', N'56cabc092394a5afb0b440fbf91f4f91301557b6d4470a82b84a3794626de06d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (271, N'Start up', N'Low', N'638031183162836913', N'System', N'23797a38d353671d1ea8b89a1aa7a30d790cb82e62b6dc02cf09434f09dc7c0b')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (272, N'Start up', N'Low', N'638031188887804149', N'System', N'2160b1de45aaf1516ee6ce7ec6b262986a40aa287575fc6dc68281de505d109f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (273, N'Start up', N'Low', N'638031189202850550', N'System', N'11a1e537559546d483993a5d20038aab0088de41e10c1bfe03a2e5c6154023d4')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (274, N'Start up', N'Low', N'638031192021027216', N'System', N'dc1f6ea34cc151d026deb64da0a52505cbb3db70c3bd7aa87260d850788d589e')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (275, N'Start up', N'Low', N'638031192475846720', N'System', N'f9362fd34d44cd45a41cd7bddf810ab6fff9729a0fff8018b6f8d7258d5ac02f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (276, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (277, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (278, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (279, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (280, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (281, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (282, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (283, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (284, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (285, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (286, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (287, N'Start up', N'Low', N'638031187605590612', N'System', N'3d4ea14aa512ab8f212556cc72ba4210d15e712261ca65cded95d660c844edea')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (290, N'Start up', N'Low', N'638037154366715320', N'System', N'2f4b1604194019cde0d0b6da89360df196d9f8532d4160f35540f8d2c0e90721')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (313, N'Start up', N'Low', N'638042580972949174', N'System', N'20da4158b090663f6557fbb208e1aabe8663bff44d7411db7e42b17430ef1631')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (312, N'Start up', N'Low', N'638042578048655983', N'System', N'1c8ea0729ec0ab4fedb785c609a70b4ac28943121de0fbdfe96893f28d5a7bb8')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (325, N'Start up', N'Low', N'638049051487936847', N'System', N'306b17b764b8d617a9687f7c63982f567347be3db8b5a4eaeb441281a1fa0e86')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (317, N'Start up', N'Low', N'638045524542050325', N'System', N'cb66534c2187593dc12290b843c453ce1301dcb67585ae9c53e646ab5047cea9')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (319, N'Start up', N'Low', N'638049012447306809', N'System', N'004964f33568f90904fecd336a13f1f291ed7833c73bf549ac982d2186811c58')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (328, N'frmPatentesFamilias', N'High', N'638049062032935701', N'1', N'bc21f323abd8fc3f14cf0143e0e0b295e24d0c4cb6b8dbc99d104add6d0c461f')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (329, N'frmPatentesFamilias', N'High', N'638049062976894656', N'1', N'96e3c623345eddf7ff9f0b933747a50e6b0930155ffbfee5e8cab1bbc6acb8be')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (330, N'frmPatentesFamilias', N'High', N'638049063186846211', N'1', N'd71024f3b022fe52bfbd00b18b85b62939790e70af5d22a544b51489e661d382')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (331, N'frmPatentesFamilias', N'High', N'638049066184834914', N'1', N'c2b36b100c30439b898977f011a30282cb2a96490c731676e4c90f9966fa0a22')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (332, N'Start up', N'Low', N'638049066628933727', N'System', N'cb6c815ded5e96e04a4a4cfe27d121969ef96a84a13e9170d9809a7113858b69')
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (333, N'frmPatentesFamilias', N'High', N'638049066691602708', N'1', N'ad8e3b669e500b3f62ae9af349e14eef096a567943dbe871fcefba3e40b8386d')
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'bitacora', N'35b1f86a97e48210337b5deca9b7dafdcf7439277be7eb7849110bda3c18f2fb')
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'usuarios', N'7d8ab6cad1d0dd30968227a965c7a85e5242660706e7d9821a5445640c5a6346')
GO
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
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 

INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'AsignarEjercicios', 16, N'AsignarEjercicios', N'Asignacion de ejercicios a los usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Backup', 17, N'Backup', N'Realizar Backup de la BD')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Bitacora', 21, N'Bitacora', N'Pantalla de visualizacion de Bitacora')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'ChangesControl', 20, N'ChangesControl', N'Pantalla de control de cambios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'ConfigIdioma', 14, N'ConfigIdioma', N'Pantalla de configuracion de tags e diomas')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'ConfigurarEjercicios', 15, N'ConfigurarEjercicios', N'Configuracion de ejercicios , aparatos y grupos musculares')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Default', 3, N'Default', N'Este permiso lo tienen todos los usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'domenech', 13, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'DVRecalc', 19, N'DVRecalc', N'Realizar el recalculo de digitos verificadores')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'familiatest', 22, NULL, NULL)
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'PatentesFamilias', 4, N'PatentesFamilias', N'Menu Patentes y familias')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'PatentesUsuarios', 5, N'PatentesUsuarios', N'Menu Patentes de Usuarios')
INSERT [dbo].[permiso] ([nombre], [id], [permiso], [descripcion]) VALUES (N'Restore', 18, N'Restore', N'Realizar Restore de la BD')
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
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 17)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 21)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 12)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (13, 11)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (13, 12)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 14)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 7)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 15)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 20)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 14)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 19)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 4)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 5)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 18)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 7)
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (22, 16)
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
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'bitacora', N'Bitacora')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'borrar', N'Borrar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'cancelar', N'Cancelar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configuracion', N'Configuración')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configurar', N'Configurar')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configurarFamilia', N'Configurar Familia')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'contraseña', N'Contraseña')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'controldecambios', N'Control de cambios')
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
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'rutinas', N'Rutinas')
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
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'bitacora', N'Logbook')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'borrar', N'Delete')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'cancelar', N'Cancel')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configuracion', N'Configuration')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configurar', N'Config')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configurarFamilia', N'Config Family')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'contraseña', N'Password')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'controldecambios', N'Changes Control')
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
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'rutinas', N'Rutines')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'seleccionarIdioma', N'Select Language')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'selectLanguage', N'Select Language')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tableadress', N'Adress')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tableblocked', N'Blocked')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablelastname', N'Last Name')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablename', N'Name')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablephone', N'Phone')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'telefono', N'Phone')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'todasLasFamilias', N'All Families')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'todasLasPatentes', N'All Patents')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'traducciones', N'Translations')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'usuario', N'User')
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'usuarios', N'Users')
GO
SET IDENTITY_INSERT [dbo].[user_changes_control] ON 

INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (2, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'123', N'638027619721166666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (3, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638027624722666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (4, 21, N'asdf', N'asdasd@sdasd', 2, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638027625409866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (12, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027676507200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (13, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027677608000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (14, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028558982533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (15, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028559672200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (16, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028561992200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (19, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028568461333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (20, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028569038333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (23, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028578677266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (27, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638029304501133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (30, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030203459066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (31, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030205715000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (87, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030360096200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (88, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030360096233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (89, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030360896300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (90, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030360896333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (91, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030362676933333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (92, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030362676966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (93, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030362916000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (94, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030362916000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (95, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'apellido', N'345345345', N'asdfadvd', N'345345345', N'638030363846066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (96, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'apellido', N'345345345', N'asdfadvd', N'345345345', N'638030363846100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (99, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030399202866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (100, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030399202900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (101, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030405116000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (102, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030405116033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (104, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030406082666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (105, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030406082666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (118, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030421055900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (119, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030424939266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (120, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030424939300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (125, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030428183000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (126, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030428183000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (127, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030861683666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (128, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030861683733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (129, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030863599400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (130, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030863599400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (131, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030864220466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (132, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030864220466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (133, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030999086533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (135, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031012784800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (136, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031012784900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (137, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031014969333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (138, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031014969366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (139, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031100291000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (142, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031142950333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (143, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031142950333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (144, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031144622933333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (145, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031144623000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (146, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031144623033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (147, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031144623033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (148, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031145520700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (149, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031145520700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (150, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638031150458900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (151, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638031150458900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (152, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'1112312312', N'dasdasd', N'1234', N'638031151152066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (153, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'1112312312', N'dasdasd', N'1234', N'638031151152100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (172, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031187297466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (174, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031187969433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (175, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031187969466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (176, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'111', N'dasdasd', N'1234', N'638031188353066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (177, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'111', N'dasdasd', N'1234', N'638031188353100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (178, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031197272066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (179, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031197272066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (186, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042422705900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (187, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042422706000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (188, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042422706100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (189, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042422706100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (190, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042422706200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (191, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042422706233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (5, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027643516033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (7, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027661173533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (8, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027666379966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (24, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028580291833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (25, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028580888866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (26, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028581265600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (77, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030343562200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (78, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030343562233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (79, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030343616500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (80, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030343616500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (85, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030351917266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (86, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030351917300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (116, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030414949033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (117, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030414949033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (134, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030999086533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (140, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031142601500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (173, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031187297466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (192, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042422706333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (193, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042422706366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (194, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042422706566666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (195, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042422706600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (196, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042422706733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (197, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042422706766666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (221, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042502886300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (222, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042502886366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (223, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042502886433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (224, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042502886433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (225, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042502886500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (226, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042502886533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (227, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042502886600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (228, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042502886600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (229, 23, N'qwertjq', N'qweqwasdqwd', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042502886700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (230, 23, N'qwertjq', N'qweqwasdqwd', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042502886700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (231, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042502886733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (232, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042502886766666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (233, 23, N'qwertjq', N'qweqwasdqwd', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042503820333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (234, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042558320400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (235, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042558320466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (236, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042558320533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (237, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042558320566666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (238, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042558320633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (239, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042558320633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (240, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042558320700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (241, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042558320733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (242, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042558320800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (243, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042558320800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (244, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042558320866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (245, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042558320866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (246, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042558481933333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (247, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042558481933333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (248, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042558813400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (249, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042558813400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (250, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042559635300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (251, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042559635300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (256, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042568049866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (258, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042571418300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (259, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042571418300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (260, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042572673133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (261, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042572673166666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (262, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042574089033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (263, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042574089033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (264, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042574768100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (265, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042574768100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (266, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042576023300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (267, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042576023300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (272, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042582593266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (273, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042582593266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (274, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042583235500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (275, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042583235500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (276, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042583578966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (277, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042583578966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (6, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027652387600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (9, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027671789233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (10, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027672857933333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (17, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028564617233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (18, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028564999633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (21, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028571836700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (22, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638028572730000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (32, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030212085566666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (33, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030212780366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (55, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030323098366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (56, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030323098400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (57, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030323336400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (58, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030323336433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (59, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030323540400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (60, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030323540433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (61, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030323540500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (62, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030323540500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (63, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030325979066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (64, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030325979100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (65, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030327334500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (66, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030327334533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (67, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030337972666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (68, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030337972700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (69, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030338072966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (70, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030338073000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (71, 18, N'carlos', N'wqwewq', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638030338316400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (72, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638030338316433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (73, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030339083733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (74, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030339083766666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (75, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030339161233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (76, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030339161266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (81, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030346954833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (82, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030346954833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (83, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030348193800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (84, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030348193833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (97, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030397136433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (98, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030397136500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (182, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638041157909066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (183, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638041157909100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (280, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049011401800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (281, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049011401800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (284, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049023569733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (285, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049023569733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (286, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049024525600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (287, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049024525633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (288, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049025974133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (289, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049025974133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (290, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049026506800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (291, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049026506800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (292, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638049038090733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (293, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638049038090766666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (296, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049053778100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (298, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638049054645900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (299, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638049054645900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (11, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638027674572000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (28, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030201485833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (29, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030201904333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (34, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030298613800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (35, 18, N'carlos', N'wqwewq', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638030298619000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (36, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030298628766666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (37, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030298645100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (38, 18, N'carlos', N'wqwewq', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638030298660433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (39, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030298671233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (40, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030298681900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (41, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030298750600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (42, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030298762100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (43, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030298988100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (44, 18, N'carlos', N'wqwewq', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638030299006433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (45, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030299027066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (46, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030299051266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (47, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030299069633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (48, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030299120100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (49, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030299211866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (50, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030299221300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (51, 18, N'carlos', N'wqwewq', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638030299230700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (52, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638030299237333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (53, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638030299244133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (54, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638030299251200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (103, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638030405902066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (106, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030407356300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (107, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030407356300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (108, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030409036066666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (109, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030409036100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (110, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030410454700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (111, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030410454700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (112, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030410858366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (113, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030410858366666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (114, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030411224000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (115, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030411224000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (170, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sd', N'11', N'dasdasd', N'1234', N'638031182604300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (171, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031183126400000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (180, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638037154498800003')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (181, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638037154498900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (121, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030426646633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (122, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030426646633333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (123, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030426957700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (124, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638030426957700000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (154, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031151891500000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (155, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031151891533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (156, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031152031233333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (157, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638031152031300000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (158, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'111', N'sdasdasdasd', N'123123', N'638031152568433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (159, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'111', N'sdasdasdasd', N'123123', N'638031152568433333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (160, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031176062800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (161, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031176062800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (162, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031176944133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (163, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031176944133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (164, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031177254800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (165, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031177254800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (166, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031178048333333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (167, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031178394266666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (168, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031179871966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (169, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031179871966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (184, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638041164303100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (185, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638041164303100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (257, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042568049866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (270, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042580972833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (271, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042580972833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (297, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049053778100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (141, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638031142601533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (254, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042566034566666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (255, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042566034600000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (268, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042578048533333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (269, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042578048566666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (294, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049051487800000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (295, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049051487833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (198, 23, N'qwertjq', N's@a', 1, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042424129200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (201, 23, N'qwertjq', N's@a', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042424337033333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (202, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042456815833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (203, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'638042456815866666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (204, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042456815900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (205, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638042456815900000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (206, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042456815966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (207, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042456815966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (208, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042456816000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (209, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638042456816000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (210, 23, N'qwertjq', N'asdasd', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042456816100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (211, 23, N'qwertjq', N'asdasd', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042456816100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (212, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042456816133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (213, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638042456816133333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (214, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042457055100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (215, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042457055100000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (216, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042457931966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (217, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042457931966666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (218, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042458190000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (219, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042458190000000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (220, 23, N'qwertjq', N'asdasd', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638042475264466666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (252, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042561532666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (253, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042561532666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (199, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042424218666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (200, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638042424218666666')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (278, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638045524541733333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (279, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638045524541833333')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (282, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049012447200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (283, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638049012447200000')
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (300, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638049066628833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (301, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638049066628833333')
SET IDENTITY_INSERT [dbo].[user_changes_control] OFF
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (1, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'a7c33381185a04f1ea69d658adcecd789498bb84ef7395feb769fbad17ad33ab')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'6eb657082206807f666008ec8373691aaa508663c81ef6cec872d2f584dd6bcb')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (18, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'3fa1c5df4a87f3b3aa5d68fad67451dd93e23b015465506e4a26b39177943f20')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (21, N'asd', N'apellido', N'111', N'dasdasd', N'1234', N'bfada7237963f8af070c9cbf55e43301372100321695b22f781dea911b5091e3')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (22, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'fe853c6ef4c79149a092d2d6067cca189c8b80e17012b7bb686a1ebed5f9458d')
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (23, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'20dbf6268eea433df53e37a5e58a7253e97fe0b95e33f43790750970d4b8880e')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (21, N'asdf', N'7c13c90fc7bca100f46b7fe3024974274e018949f7b820eef83254db9648b36a', N'asdasd@sdasd', 1, 0, 0, N'bfada7237963f8af070c9cbf55e43301372100321695b22f781dea911b5091e3')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (18, N'carlos', N'e1df45ab86870fb474c9d6fa5999ef72b4711806cc157f37cfe67a512dce79b4', N'wqwewq@asd', 1, 0, 0, N'3fa1c5df4a87f3b3aa5d68fad67451dd93e23b015465506e4a26b39177943f20')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (1, N'juan', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'juan@mail.com', 2, 0, 0, N'a7c33381185a04f1ea69d658adcecd789498bb84ef7395feb769fbad17ad33ab')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (2, N'martin', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'martin@mail.com', 2, 0, 0, N'6eb657082206807f666008ec8373691aaa508663c81ef6cec872d2f584dd6bcb')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (23, N'qwertjq', N'214b3a71c51f19de7642180d0125b97d68ecb641d33173f0639469eee65aaac4', N'8897979', 2, 0, 0, N'20dbf6268eea433df53e37a5e58a7253e97fe0b95e33f43790750970d4b8880e')
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (22, N'tito', N'57c12086feb49c1bee19debf7cdd9066bab6e2c5c0fba2e295fbbd828b53d770', N'dsdasd@asdasd', 1, 0, 0, N'fe853c6ef4c79149a092d2d6067cca189c8b80e17012b7bb686a1ebed5f9458d')
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
