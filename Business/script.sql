USE [campo]
GO
/****** Object:  Table [dbo].[bitacora]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[cupon]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cupon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discount] [int] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[emmitDate] [varchar](100) NOT NULL,
	[expirationDate] [varchar](100) NOT NULL,
	[code] [varchar](200) NOT NULL,
	[dvh] [varchar](200) NOT NULL,
 CONSTRAINT [PK_cupon] PRIMARY KEY CLUSTERED 
(
	[expirationDate] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvv]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvv](
	[tablename] [varchar](50) NOT NULL,
	[dvv] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ejercicios_usuario]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[grupo_muscular_maquina]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[idioma]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[maquina]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[permiso]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[permiso] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permiso_permiso]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso_permiso](
	[id_permiso_padre] [int] NOT NULL,
	[id_permiso_hijo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](500) NULL,
	[price] [decimal](15, 4) NOT NULL,
	[dvh] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_grupo_muscular]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_grupo_muscular](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_maquina]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_maquina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[traduccion]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[user_changes_control]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[usuario_data]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 30/11/2022 18:43:11 ******/
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
/****** Object:  Table [dbo].[usuarios_permisos]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_permisos](
	[id_usuario] [int] NOT NULL,
	[id_permiso] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [varchar](100) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idCupon] [int] NULL,
	[dvh] [varchar](200) NOT NULL,
	[subTotal] [varchar](50) NOT NULL,
	[total] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[venta_producto]    Script Date: 30/11/2022 18:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_producto](
	[idVenta] [int] NOT NULL,
	[idProducto] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bitacora] ON 
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (1, N'Start up', N'Low', N'638030211987799905', N'System', N'd1ca9a61eac2b56cc4b001ca97c3632695eb9d2023c1d9f9f81e6196cce5d662')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (2, N'Start up', N'Low', N'638030212745226998', N'System', N'01ee9773f31ecf58f96ee801ae40d5f8c662f3fa0944268ec02d529e02385b90')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (3, N'Start up', N'Low', N'638030317777407340', N'System', N'2b61bac8268f39a062bea560e2607a88578c83825f067df2096cc54cd4f45d1d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (4, N'Start up', N'Low', N'638030323060135613', N'System', N'69b236a2a46a73478a0c9c3f93f0a6a9886b707280d1f4977254ec618363772d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (5, N'Start up', N'Low', N'638030325946805017', N'System', N'cd3587e59eee196edd103dcf8a2eb1733b6945ef189ef4d54dbcb894492d45d7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (6, N'Start up', N'Low', N'638030326454636279', N'System', N'6b45ff1195832751caa0e6c3995fa8aea4673e0e279d84ada56a1981bcbd986f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (7, N'Start up', N'Low', N'638030337904912656', N'System', N'6f2eb14815f81a95ea595a81ee6d35ee7044ff81d9a2959dd2e84205dc47d11e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (8, N'Start up', N'Low', N'638030343441812351', N'System', N'4f9aa1757f7c1dbc70452fd74ebfb43b4fcb9b287330fbe58e3943bb2335c191')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (253, N'Start up', N'Low', N'638031121570160419', N'System', N'495af966f050282ea05e7aabbf34333d08784ca6c5cb3dca54ce6d3a4b49bc23')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (10, N'Start up', N'Low', N'638030346888101158', N'System', N'bc7597e984ff07c6507b26a3b731a488f4eed53e2907a9472a85dac8ea711006')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (11, N'Intento fallido de modificacion del usuario: 21', N'High', N'638030347260232008', N'1', N'3a7ad1147c9dd668b29110f00c2e950ee183518090f19e7f7cd3489f23a520d4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (12, N'Start up', N'Low', N'638030348159932662', N'System', N'b73af8a01eddeb0c2da15806a2fb90c78e2dd50e201819126a9a3d278d63c74a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (13, N'Start up', N'Low', N'638030351884686334', N'System', N'6ec62e59ca674de975b04fa4e16055498a116323104a5a38f203177bbfacb6ab')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (17, N'Start up', N'Low', N'638030397102113755', N'System', N'647e4bbe6a8e8539e369e8f9ad3c54a38a70b18032111f1c4ab9002e75ee4636')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (18, N'Falló el backup ', N'High', N'638030397354282551', N'System', N'b0c506b30d76e144844e1e8907f74c13d703e5a417666389cdc4d02b9def1f99')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (21, N'Start up', N'Low', N'638030405073263081', N'System', N'4198082f734fd5606a1fdb9ef6b3ed279240db454cd0446325ad36ed435e7a78')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (22, N'Se realizo un backup con exito', N'Medium', N'638030405343500031', N'System', N'a052e1ad127a4e08e79092157d80fbced207bdc76398742d3fa35323c4579b3a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (23, N'Start up', N'Low', N'638030407306289546', N'System', N'ca3eadfa81f8ec11d408eeb159545e7d4dbe6afff49b07f9c92c724d75670ac7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (24, N'Start up', N'Low', N'638030409003351872', N'System', N'a861e3d88fca0f166034f640f0c63081485a15b8f7e445bd869c4ba7eb6431f2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (31, N'Falló el restore', N'High', N'638030420329216083', N'System', N'7279f927af3a836bb9694e4d0fe7dac3e3b08feb56ecb5e873a48a433b731c0e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (32, N'Falló el backup ', N'High', N'638030420523001426', N'System', N'2d9820bf09d93945c6e5e21133f65fed95fa4334b8dd03b719fb185dc7811b65')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (33, N'Se realizo un backup con exito', N'Medium', N'638030420894799108', N'System', N'a39dbaf02334b72b061424bed62a46bcc7f672cabaf49527ebfd23d32e3f9941')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (34, N'Se realizo un backup con exito', N'Medium', N'638030420959897088', N'System', N'36b4b810506605d20e74f697cd46bb01b73e907fdb83ce6978803a0b9ea1ac3f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (35, N'Start up', N'Low', N'638030424900194675', N'System', N'e7aa2aaea29a446c706a0f1f809b0bfe587beb5014f5f3290b98dfb482d3b917')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (36, N'Se realizo un backup con exito', N'Medium', N'638030425069785472', N'System', N'd8a633c71e65d8a9244194d6c7d42028bd48d3560416d95a5a2bdafb7d3a570a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (40, N'Start up', N'Low', N'638030428150358511', N'System', N'e07b391e8960408fc7152aa5c34edfffbfe5291f940f186ff6295edbf61d9a1b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (41, N'Falló el restore', N'High', N'638030431299816044', N'System', N'644c29a9ca2ff466039ad0bf531ea175841c93fd7e5e80c5a5abc7449b9d73bb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (42, N'Start up', N'Low', N'638030861587009871', N'System', N'f85afca9d1ff4b131b7e7f5b4efa6214a432526c1ee0304788123b9230628310')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (43, N'Start up', N'Low', N'638030863513647527', N'System', N'2687182279e5dffb8201489524e153646d89187bc7a738666a93b1916cb17e55')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (44, N'Start up', N'Low', N'638030864183738478', N'System', N'2255bdd3a2f950ba31af30fc6a669d164d1f093dd8253fc9f67736cb46a6342f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (48, N'Start up', N'Low', N'638030921435070407', N'System', N'3e12bb96be4560d91b014f0a06ba6b0ca4ab480d0195d2128d9f2473d1b129d2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (49, N'Start up', N'Low', N'638030921955476611', N'System', N'eb7c689348c6821a15aca363ff8a75dd9862cb4f86e800a43b4816a57eb104a0')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (50, N'Start up', N'Low', N'638030933958956401', N'System', N'5222012660276b65b4dc91d2ed4954db67066e7e58f84ab3d088f727066d4f9a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (52, N'Start up', N'Low', N'638030934847601457', N'System', N'c43fc6146e1eb5629700417725f6abd4b592eec5a10ae79fa1b5f38a530d7e3e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (53, N'Start up', N'Low', N'638030935347566090', N'System', N'8707b995435ef6f3f1b26707904b1753abcebb45e2e6d3db1d3406b5fc953cb1')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (54, N'Start up', N'Low', N'638030951964223736', N'System', N'310f08615e0f0b31eedbf865492df2bafbb004925430f59b5eaf0bef53b4b6e0')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (55, N'Start up', N'Low', N'638030999044829768', N'System', N'698b53958c5371a3ab3b4b70d44dc94b21b7d505a49206474091f27f99717251')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (56, N'Falló el restore', N'High', N'638030999464418302', N'System', N'40762fc61c64847d465bf5832fc947cb6a76c2fc96d23d5585047bdeb6371dab')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (57, N'Start up', N'Low', N'638031012660147180', N'System', N'd6c77987373d4cdc6fb5493665d8a903a598ba61375750d2315d39b0369cfcd8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (59, N'Start up', N'Low', N'638031074524955911', N'System', N'b123bcac6a87af61e21e496a772e5a9549e0f39c660280ccf744b5f97d51785c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (60, N'Start up', N'Low', N'638031076124948795', N'System', N'4fde742a823777a3b7df69f638043725105df5b1924dc982de20e5fda80d5f81')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (62, N'Start up', N'Low', N'638031077412522305', N'System', N'b65850095b65a1f0e61eff52bd3939b242a9c4a1514144fc948357d2fe067730')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (63, N'Start up', N'Low', N'638031077584174715', N'System', N'18b9892ae1df47c9ae9861b0a6873c059de62c05b9f3238debf002be5a21590a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (64, N'Start up', N'Low', N'638031078327227794', N'System', N'711124583f5f1460b765ff9dcad3e5933409db6758d620dc07a79c7fdc156de0')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (69, N'Start up', N'Low', N'638031090003947138', N'System', N'e4ad76cd4ec0a8a274054bb3f91cbdbdb8aafbc2e43a7bb034772011dcf62253')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (70, N'Start up', N'Low', N'638031090791535414', N'System', N'85007ffe9c84675e06a5c55d961fc6bdb019376ccc228490854a07bf993624f8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (79, N'Start up', N'Low', N'638031094980836097', N'System', N'd3863dd1c9b9ced916491bb276a248aaa68c6bf8655f114fa7066b0e80dc50ea')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (80, N'Start up', N'Low', N'638031095071658756', N'System', N'295ce867b71d159f978a0ec703d3e4c30f02e7c672a4089d218b37c2fcd28d67')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (81, N'Start up', N'Low', N'638031095159342257', N'System', N'7d5e41a8abe89bfa2d2deff8423e8ec37224c0274455ff659fe7b426a9be4d4d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (82, N'Start up', N'Low', N'638031099105940532', N'System', N'e8b9b20ae4c440e57fecf17d814efdce884ad4e11e7c6a49c40d8970e20d3c22')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (83, N'Start up', N'Low', N'638031099394728727', N'System', N'1f76294f538713356846a100d2c2707d52d7958d03dc189d1189704918cacf2b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (85, N'Start up', N'Low', N'638031102360011876', N'System', N'bad473eb57563f8cf3004b4afa43b98452ccf9b3e32a2943db0e4c759e2f7770')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (86, N'Start up', N'Low', N'638031102475331577', N'System', N'034f9e782305dca878a11c8a8488a08ab7b39da4b8c4955ae5b95f785c87e0f3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (87, N'Start up', N'Low', N'638031102836199824', N'System', N'dd23ea94b80f4f4613eb459cba9c34aa9b244bafc2fe7b8504a70c1013644c52')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (88, N'Start up', N'Low', N'638031103102230170', N'System', N'bd45494c9af444374c26627a2c2a14d85a7d3a038d5778553ee0363fc7194f0b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (94, N'Start up', N'Low', N'638031104622198656', N'System', N'024c24494361ca59236269273f15405d8a6772d16ff4592e3766458f0675dd44')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (95, N'Start up', N'Low', N'638031108052832495', N'System', N'aa14fba9caaaa3c3e6219b15ebb0f9b891e3408765326be93bee353ba8bbbcd7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (96, N'Start up', N'Low', N'638031108678827925', N'System', N'6678fd8652f9e87f57aa1ffe9ff921ed9e9dc6eb36f0da4cdea939dc96c1bd56')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (97, N'Start up', N'Low', N'638031109061994660', N'System', N'fe26fb7337eb24cb844ae28ddbb905a104ce2d57ed770bdc51410cc687f1bf0e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (98, N'Start up', N'Low', N'638031109199897675', N'System', N'b6addbf9b4815f2113099fde05d420c3bef1edce91d7884b8837fdd985188bc9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (101, N'Start up', N'Low', N'638031110632832076', N'System', N'2bb595deaf36f004b594c6cd4fcd78bd99afba4ae8dd759f738c7b49b0f836eb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (14, N'Start up', N'Low', N'638030360058464016', N'System', N'1c935f9bba52953145af49e30e464f72f6f84e6131b13af9e523b2ea1902331b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (15, N'Start up', N'Low', N'638030360804656893', N'System', N'003a7ca9a8c11186b18419a0a8087cb6006af298cb0f4ed87654e03dfb5ad12b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (16, N'modificacion del usuario: 23', N'Medium', N'638030362938898851', N'1', N'1353f8c46c6f6c6f87f185940b7cc828d7a044bfabe074ffe4139588cec048c9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (19, N'Start up', N'Low', N'638030399165418295', N'System', N'b2dbd816f596e9329f950c49d114b70322572a48600a20aa08c5fa827772b680')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (20, N'Falló el backup ', N'High', N'638030400674078948', N'System', N'e4438e9acb3920c6fdf42816e4a7c8d4bfbf4c181a672025da155a8cbe0c420b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (30, N'Start up', N'Low', N'638030414894732396', N'System', N'cd489563ad99980b9a0e2e8c190484bb79952c9000babdb8adbeea039591c9a2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (51, N'Start up', N'Low', N'638030934534407588', N'System', N'0c96a5a565e8145b6e15e5fabdbc9cba546f207551530d6265e4f2eabd252823')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (58, N'Start up', N'Low', N'638031014923474127', N'System', N'29136ebcd979d3172003f13d331eeec884c1889a08e56ab14cc01cf4cc129620')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (102, N'Start up', N'Low', N'638031112114258460', N'System', N'f7d1aaf4efc733d080ed02e589f422439dce8c01004d2eba439f05567f5f19db')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (106, N'Start up', N'Low', N'638031112918256625', N'System', N'4937767220f3f079f3d2efa1511ab9b47525b22cc2d655139e6833240375e10a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (107, N'Start up', N'Low', N'638031113152726773', N'System', N'bfc9b8eb6e9bd9b9c5c49f5a2334fba3f7af9f77550c073d1fa029606e75f31d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (108, N'Start up', N'Low', N'638031113456489832', N'System', N'649bdd75f1dc11f80a2ed37aa39bac864eaefde0baf7bd7f4e4bbbd35baa7982')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (109, N'Start up', N'Low', N'638031113609797015', N'System', N'29e6fd8ef11410a8fa3db8a22bf2aa71f437eab494bc56286367469fd7559da5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (110, N'Start up', N'Low', N'638031113859644223', N'System', N'6a0768eedc84e4f4c4be7d9c8a72efa77bc17c5c1f484ce0c650fbbae2719814')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (111, N'Start up', N'Low', N'638031113929158471', N'System', N'930dc337756d2aa209731686bcbc73672d94ff7d7b983a30d0650b1dcb172b9f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (112, N'Start up', N'Low', N'638031114284449830', N'System', N'fdbe392246921ffbc378597d89ea7f97e3af9f4d7ffcce0a83aa3ae2c02ba155')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (113, N'Start up', N'Low', N'638031114885872476', N'System', N'3f12f5f44261c7c7f9f9fd5f47d8b2d1e544e88b3ad750c229036fc10f3abddd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (125, N'Start up', N'Low', N'638031125036919210', N'System', N'67206c22c3f9d36479aa1300a2af2a615e3693ecef8687309ed865ceb8e0f1dd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (126, N'Start up', N'Low', N'638031125138598747', N'System', N'720b521f4f4fb7de42137db8f7810ed40809d9aa93b7a9e0cbb64fed7733c9ae')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (127, N'Start up', N'Low', N'638031125334100769', N'System', N'903223f6376661d5ff224cb3f83eaf2bf3236310929ce0737e20479ec63a03cb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (128, N'Start up', N'Low', N'638031125909865017', N'System', N'2d36a8904166956e5fa7ad58e405265dca0003f1208c061d1753384f8797e0c6')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (131, N'Start up', N'Low', N'638031130302779759', N'System', N'ed8e407112ca91d90739cfce1fe42d4b72ae8aaa9e98645de8f3f872733a5c90')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (133, N'Start up', N'Low', N'638031135158917470', N'System', N'792fe20224931b10a140e9606afc23694c5f2552876bb29891830ecd02aa01ca')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (134, N'Start up', N'Low', N'638031135788534987', N'System', N'3d22fd1d58e355a8bd9570773a04a0ac78cd6e83b305eb9a98f3fd44d131208b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (135, N'Start up', N'Low', N'638031136036915739', N'System', N'b834c87b87e1e504f3b761c2e57699c81f3e17b6024f105b470d53c01bf10151')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (136, N'Start up', N'Low', N'638031138181969386', N'System', N'679a2be56419e15e576941fb732e6dd20a7059c33b38c5021878896af6bd5933')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (137, N'Start up', N'Low', N'638031140260177496', N'System', N'4a258c4bad32558796674f6871a1b40ac4733dff98b52d5e966245c49b45cd1e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (138, N'Start up', N'Low', N'638031140351802192', N'System', N'1e8f72082f85e2077caf10b2011fe0a2048efb56705e282f452572ebd82c286e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (139, N'Start up', N'Low', N'638031141647781962', N'System', N'b403358e30162d82233c33390d33edbcc84f33ea0eca1801deb694d8a45d61c5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (140, N'Start up', N'Low', N'638031141998266100', N'System', N'b8e9794046408a21f257f673150a9d19f57891585ada3bcaa2fc5cb3201b733e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (141, N'Start up', N'Low', N'638031142218811887', N'System', N'16b00cff0a9bb468c0d34f6e73bffb77d201c5de2cc7e08f76ef1b1b0899d2d1')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (144, N'Falló el restore', N'High', N'638031144311600578', N'System', N'ea28446d6c290a99c5e5c1c7987785f831f68e5eabf2ce89fcc4d1840b572c3f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (145, N'Intento fallido de modificacion del usuario: 21', N'High', N'638031150427992046', N'1', N'838ed4ff3f380f0d6c90d1c910e67001baafb65e150719cc9cf46a5e4f977d2b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (146, N'modificacion del usuario: 21', N'Medium', N'638031150471037526', N'1', N'4ce7d8de76b22fa0c3fbad0ea7e1375ad5390aac1dde8c7f1dd279ad174085ad')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (155, N'Start up', N'Low', N'638031183627565710', N'System', N'37a8c2a83058d5d053c90f3f01d0d8606534968453e52a1b2e096faf568ee146')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (157, N'Start up', N'Low', N'638031187605590612', N'System', N'3d4ea14aa512ab8f212556cc72ba4210d15e712261ca65cded95d660c844edea')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (158, N'Start up', N'Low', N'638031187897073511', N'System', N'ac8b7692941f30b1bf4d5980f20c7bf36cdd3da800245b4230637e72e3ec9309')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (159, N'modificacion del usuario: 21', N'Medium', N'638031188373653742', N'1', N'ccabc500ddc351a98fe54783fcdcb643c1d98284600806fe1c66f61ebe2e2c56')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (160, N'Start up', N'Low', N'638031188558838320', N'System', N'1b12f2dd411c5da6efc99d12d72fb2b31a0d6ed33ef3f8da9e52ff65e081e611')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (163, N'Start up', N'Low', N'638031191683549058', N'System', N'd4b02ee5a5825715b907151bddfbd72281e49ec03639188defede6a849df59e7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (168, N'Start up', N'Low', N'638031195802264587', N'System', N'b8ccac39d2e6558c75bd6d308020ee7496ef3d67d0f7d96eb6f152fc0a4d8097')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (169, N'Start up failed', N'High', N'638031196869859225', N'System', N'fb731552fb03a590bc0f1574f93668b4712fb95b59b30749bf32cd7bf358ddee')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (170, N'Start up failed', N'High', N'638031197047516021', N'System', N'4501f06253e2a855d25af3b1586a48c81621ac61ecc9ed7775ed50865774a240')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (171, N'Start up', N'Low', N'638031197205237986', N'System', N'9ead5263d906b875e7e494d673c40ea1959fa51c2f5fead75c9333a514401325')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (173, N'Start up', N'Low', N'638031199283379828', N'System', N'78d33d3c26a3cbb8a73e06725ab56d6d8f031f8268caa19f09dcb2055dfb97e8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (174, N'Start up', N'Low', N'638031201872324777', N'System', N'f8eab2ad2957d176dabe6f12eb7222c58df51617d9acd6a2adb4f4a4d88cf3bb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (292, N'Start up', N'Low', N'638041347569157334', N'System', N'868623c95b73b587f1ef7da4a047af55efeeb6c43afa34054d1ea93a0910dc5d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (293, N'Start up', N'Low', N'638042096121367259', N'System', N'404ab8d8ab9b3e15228f53908a96a1b2c28481703410fac9bcfca1b991f512fd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (295, N'Se realizo un backup con exito', N'Medium', N'638042104659687979', N'System', N'e0bd9717f0f094046acd7117b20724f07b9fd8b7a9815c1eaa36d96a2eb66c59')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (296, N'Start up', N'Low', N'638042424218815445', N'System', N'820198e16d380cc3fcffbc52b232660470a93136e83e313a372912b40743d395')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (297, N'Start up', N'Low', N'638042457055254642', N'System', N'cf8e2fc59ec19fdbf363681e92d99438bba1f8e226f5a08a659b2d45464f5cff')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (299, N'Start up', N'Low', N'638042457932072652', N'System', N'ff3df2cebcefdabf2c4215009ed47e8f156982d848219c5fad68a1d2085bd8de')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (300, N'Start up', N'Low', N'638042458190147917', N'System', N'0e69b0d9442522908ff914f70a55fcb20ad11e8760382a07c781c0625f340e05')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (301, N'Start up', N'Low', N'638042558482105044', N'System', N'b839c1e052b41a1564502b1899fd201e96bdaf72535e9397f2d855704c77fa7d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (302, N'Start up', N'Low', N'638042558813535624', N'System', N'fa1f1baf3fadd499592ec357ea8a622fac4ebd16dfa0f70b1da0a17bed0b2360')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (303, N'Start up', N'Low', N'638042559635387022', N'System', N'839dae11ab19c25e450659bd2e8b4a038d897aff530761166669f071aa262cba')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (306, N'Start up', N'Low', N'638042568050033887', N'System', N'e925fcf89cf69c1ba3142a4ff0e43f7aa7f7b7f58d9f899544b5b47489c41207')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (307, N'Start up', N'Low', N'638042571418409444', N'System', N'f5ccebf2d6b1835f4b23d8a77273aace566cfeb3231d880979a359e743eaef78')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (308, N'Start up', N'Low', N'638042572673297250', N'System', N'e6d0645b5d1f0fa3705c35f5b19d1040a4b006a725ed4a9e8141723d0c29951f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (309, N'Start up', N'Low', N'638042574089148046', N'System', N'50de2a0c4b7f23a628c29664f8e5a8719564e1938e222940a8b42d865d71c91f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (310, N'Start up', N'Low', N'638042574768232499', N'System', N'9deb8ed6626df35b9a9d54261f990c44f4089f680f904a3e5bedd22219801dc5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (25, N'Start up', N'Low', N'638030410423733030', N'System', N'6456b296cc0e0560266d3ee5bdbf1c69b9694a0ce5bf34692435526c4ce2583d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (26, N'Se realizo un backup con exito', N'Medium', N'638030410552513454', N'System', N'bb2cd2b635c6d0c271405f445541c750ed494bf1c074430a7356d963ae7d3009')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (27, N'Start up', N'Low', N'638030410826822177', N'System', N'87bd559866443fc41549260239473405d4b63ff116834e2d33f10b9f4f1e1628')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (28, N'Se realizo un backup con exito', N'Medium', N'638030410947962536', N'System', N'0a89975eb948c85ad20c56062e9e0a0f9aaa8b287039a128f53e8875a0695f8e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (29, N'Start up', N'Low', N'638030411187110314', N'System', N'd25bf4eefcc44d90ee64c05c8921479381516df2883f71ba990085500cbdc9e7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (45, N'Start up', N'Low', N'638030916905417108', N'System', N'3610cd8793beb8f7711d8bad16bade3c9371a3f7af6af769d9c7df8918bacdc2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (46, N'Start up', N'Low', N'638030917140760538', N'System', N'0b9de30c7353bcbcc0e681bcd5e0a42afdcbd925fc11d429127e0963dd69a8bd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (47, N'Start up', N'Low', N'638030917992852148', N'System', N'7e7908089831313c4e7734c439eb1b2607b247e9335dc044bf2979cf49568000')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (156, N'Start up', N'Low', N'638031186456244720', N'System', N'0348610da35eb830e898dd59b7e9a637e1345c68f079bf0f4fbb1ed7a636ce69')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (294, N'Start up', N'Low', N'638042101571760327', N'System', N'b5c4b82a82d099500ab2b3c343e43fcbb59d3fbec8d55caa92d9c9053fec9a21')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (298, N'frmPatentesFamilias', N'High', N'638042457637385398', N'1', N'9f01c2d8475e82ee8debe8aa14b95342c962536d6aaa381510d80e4d49d32781')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (304, N'Start up', N'Low', N'638042561532828500', N'System', N'dc9dd49ab800a8f6a3c68281c50dd8f2a7c9f6d54b4be12a762ee04df4dfa9b0')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (305, N'Start up', N'Low', N'638042566034651067', N'System', N'9480853a6bac56b961b9c4fcf711cda5a535c7465ae713ca874c173408ce4677')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (311, N'Start up', N'Low', N'638042576023411661', N'System', N'9f68eeca09e3b573a1f8ea035ec0285ad9cca29b9a8b2c02f0e8bcf14e0b42cb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (314, N'Start up', N'Low', N'638042582593404716', N'System', N'a48920601d76cfe44f818ca282e6ad4cdbc50b6fe585bb42a158b7a1bcc1d345')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (315, N'Start up', N'Low', N'638042583235600950', N'System', N'2d3122b27e210f84bd7283f74ce84e36898c11bb8092990e769f0e27d3f591ae')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (316, N'Start up', N'Low', N'638042583579059184', N'System', N'de0c9f16834f4651f1f164e74031f5e91e8937131027536eb86bb97c1aa3cf9a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (318, N'Start up', N'Low', N'638049011401819739', N'System', N'60458cf0dbea898adb058fd40ba1b25681a287aff0452d88e61994fe4e176fae')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (320, N'Start up', N'Low', N'638049023569882056', N'System', N'95686d5e9924473b25790d91496fd45fa91b1a4c7624e2d5867b417233ed6fe2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (321, N'Start up', N'Low', N'638049024525571223', N'System', N'a836c13cc4e3f606cf4cef1088671e4151c859d1b4cacef141635950cdf6e414')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (322, N'Start up', N'Low', N'638049025974250786', N'System', N'40116cebeecc87e9b2eadb7b413019736eecc294de8ee717dd7fe00dd7032664')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (323, N'Start up', N'Low', N'638049026506880209', N'System', N'5a7dc4550475c75a320e465ee4b9df207e2ddafbbe6684cb2ac18550871d0343')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (324, N'Start up', N'Low', N'638049038090874726', N'System', N'88832b2393fcbab044f78f4646c94f9834468c8f24a81545333565d7da4fe3eb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (326, N'Start up', N'Low', N'638049053778187218', N'System', N'4e2d3066d6e4c436b483084f7cf36f067e9f3fd1d5fa3c8f1d5951396f919b25')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (327, N'Start up', N'Low', N'638049054645985490', N'System', N'b5efd83765e80b648555fcc0bb38df8e8124d1df6efb75f9df56bee43807e69a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (37, N'Start up', N'Low', N'638030426445890556', N'System', N'3b0411fbc0fbf9e1a389d70fb2b0c0f2ebd9a80e7d1ee5429a25a215941e078c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (38, N'Start up', N'Low', N'638030426611426150', N'System', N'a39c409719172abbd4b91b56751ba05e9988f29683fdb05879ecb4117cafd421')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (39, N'Start up', N'Low', N'638030426922288768', N'System', N'b69ad12218169313f3594a884624164131932aa749cbdbd8090e7c9488f9e285')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (175, N'Start up', N'Low', N'638031212002726335', N'System', N'902fa5248699a3fe0cebce1103764bf2f9d9af8ea01c4f36fa44577e120e5530')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (291, N'Start up', N'Low', N'638041157876434275', N'System', N'427c36fe4716c2d7689d3bde0db4f21ecb8e803cc38b8e887ffec679bc76137f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (61, N'Start up', N'Low', N'638031076415050978', N'System', N'1fc26c09593859f5894d2f0909ce16c9b881e20038b13cc3c63fa5fde86ecf19')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (65, N'Start up', N'Low', N'638031080466401879', N'System', N'a565866931df30aca134547aafb3c0f129f7f6a2d80869b2b74bf36dbf780f62')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (66, N'Start up', N'Low', N'638031080645820912', N'System', N'ef096c2206fca171b15eda09d162286dfa78f8d40d3843296ca59c58a1191c22')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (67, N'Start up', N'Low', N'638031081886995368', N'System', N'c94c032dbf43cab2d242bbd81c52a3a52148e667796aeded3a9cb904e945b89e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (68, N'Start up', N'Low', N'638031082125090397', N'System', N'f2fd1c18d780792f142798d2228244c86e1932196e8f1d9846985edea4dee2c3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (71, N'Start up', N'Low', N'638031091770173174', N'System', N'45242fb683b5828e5e5e5eacf38176675e21c41df755ee02b787c663bb9a1011')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (72, N'Start up', N'Low', N'638031093326195646', N'System', N'd97686e9bf22e603c00362b3cdd3e5d39b6263923d922eec6eb143f33b1ed26a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (73, N'Start up', N'Low', N'638031093508188749', N'System', N'69aa5dfdf0bd7b41f5c1aeac51f8f7a65e1068131cd515f41600d87ee5bcd7aa')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (74, N'Start up', N'Low', N'638031093635114294', N'System', N'6cab4bf3d9e83dc1a1188b7b8007b13dd93a3af7a58d7ccf0eea86f68a9cb0e5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (75, N'Start up', N'Low', N'638031093890230650', N'System', N'3632662daae6d3985a187f2ed86ebbf779eec873af163dc1350b9c92a4ef737a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (76, N'Start up', N'Low', N'638031094150002754', N'System', N'00cdbd3a369265dd54dd45f82429cd57d696bb060654db912dc072fd3bf66e7b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (77, N'Start up', N'Low', N'638031094419321004', N'System', N'0a30f40e397eb0c66f1f59b33465b91065c4930f80557910041a55c299cfa8f8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (78, N'Start up', N'Low', N'638031094738268019', N'System', N'2589b21d0ebef3b47e69d043c1844e275b008026184c2c15c4bb5596b5bb6a0c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (84, N'Start up', N'Low', N'638031100338376546', N'System', N'a947ddf4a424ab6682487560153c760bfc3d55b7ac3fb86c3ffa73d518dd2e64')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (89, N'Start up', N'Low', N'638031103549396303', N'System', N'9a1197f69a5359f22ed49a06a4115a61aca2c9ad66bdbb3730292337347aa94e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (90, N'Start up', N'Low', N'638031103658749143', N'System', N'f9fbe7bd6f632c7be9f116e26fb654d31ae42bd39a73e22c792a8d40a7891344')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (91, N'Start up', N'Low', N'638031103875602687', N'System', N'df107342b5bfcedc277f92e09ac8734d57d819423dcf602d5d860fbd13cbaba1')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (92, N'Start up', N'Low', N'638031104036749081', N'System', N'c208613a3b89739ca226302416bbacccddcfdd9215d294a82213e990c49f0920')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (93, N'Start up', N'Low', N'638031104270270044', N'System', N'e70e485f9215de6957bbd0d4f7330a88beebb1e1b7b498836b4c1c553ea4ed0e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (99, N'Start up', N'Low', N'638031109649162284', N'System', N'cb68e3a10aa4028147e9c5a53b1a03b9a0db7d1675e5cc12c116157a7f9680a9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (100, N'Start up', N'Low', N'638031110171636647', N'System', N'1cf4b665eaa5feb01301029ed7d70c02673b384e13b07927e6abde6413f1b624')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (176, N'modificacion del usuario: 23', N'Medium', N'638030362938898851', N'1', N'1353f8c46c6f6c6f87f185940b7cc828d7a044bfabe074ffe4139588cec048c9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (177, N'Start up', N'Low', N'638030399165418295', N'System', N'b2dbd816f596e9329f950c49d114b70322572a48600a20aa08c5fa827772b680')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (105, N'Start up', N'Low', N'638031112753118434', N'System', N'111cacd510e87f463468ba8798beeeb0427b5ed835c75bae26a21bffddac35d0')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (114, N'Start up', N'Low', N'638031115617658803', N'System', N'5f8798e0148fe4342712b87c1d7e1d8dbe04534e31cd155b1e2b6e103a3321bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (115, N'Start up', N'Low', N'638031116042194494', N'System', N'f09dbe7388ab2e7c1e96bb1d0591076019aa710eb09b334837321d5de00ec5a3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (116, N'Start up', N'Low', N'638031116229891727', N'System', N'f596d214745c4458078d6b1355ea3d78149cf09721414669b226c6af58688d2f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (117, N'Start up', N'Low', N'638031117424819616', N'System', N'65c1ef21c6e30308cd8f7cd9968bdac4cba2c2096aff5ea63aae7e56ce249052')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (118, N'Start up', N'Low', N'638031117484208558', N'System', N'29c9a0bb2295005c5d32a53a826964d1a8531d7f0d94d1292953de2bb33d3a35')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (119, N'Start up', N'Low', N'638031121570160419', N'System', N'495af966f050282ea05e7aabbf34333d08784ca6c5cb3dca54ce6d3a4b49bc23')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (120, N'Start up', N'Low', N'638031121697346194', N'System', N'68fabe9b956f4cedc80ac75feecaae9b11ba0f306eb3c18fdd79c3118548d92f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (123, N'Start up', N'Low', N'638031124258899825', N'System', N'87d1134dc12faa6d1aa65a1bdab0ab367e80c922c1ff630a58b3a169c06fac38')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (124, N'Start up', N'Low', N'638031124418530498', N'System', N'028ebc8837c13d720c272135e5c19e464d97ac6f79e40d8d64127b0fa67c6748')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (129, N'Start up', N'Low', N'638031128728959717', N'System', N'59dcb7646b51c428312b00a08e49fb8eaac0337b93cc93aaf2ae34c16afd0765')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (130, N'Start up', N'Low', N'638031129680300169', N'System', N'fea501de2f9ea6b9f82ce698d6c9cac9d63f4403a2d93864b2362976c55fa982')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (178, N'Falló el backup ', N'High', N'638030400674078948', N'System', N'e4438e9acb3920c6fdf42816e4a7c8d4bfbf4c181a672025da155a8cbe0c420b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (179, N'Start up', N'Low', N'638030414894732396', N'System', N'cd489563ad99980b9a0e2e8c190484bb79952c9000babdb8adbeea039591c9a2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (180, N'Start up', N'Low', N'638030934534407588', N'System', N'0c96a5a565e8145b6e15e5fabdbc9cba546f207551530d6265e4f2eabd252823')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (181, N'Start up', N'Low', N'638031014923474127', N'System', N'29136ebcd979d3172003f13d331eeec884c1889a08e56ab14cc01cf4cc129620')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (182, N'Start up', N'Low', N'638031112114258460', N'System', N'f7d1aaf4efc733d080ed02e589f422439dce8c01004d2eba439f05567f5f19db')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (183, N'Start up', N'Low', N'638031112918256625', N'System', N'4937767220f3f079f3d2efa1511ab9b47525b22cc2d655139e6833240375e10a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (184, N'Start up', N'Low', N'638031113152726773', N'System', N'bfc9b8eb6e9bd9b9c5c49f5a2334fba3f7af9f77550c073d1fa029606e75f31d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (185, N'Start up', N'Low', N'638031113456489832', N'System', N'649bdd75f1dc11f80a2ed37aa39bac864eaefde0baf7bd7f4e4bbbd35baa7982')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (186, N'Start up', N'Low', N'638031113609797015', N'System', N'29e6fd8ef11410a8fa3db8a22bf2aa71f437eab494bc56286367469fd7559da5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (187, N'Start up', N'Low', N'638031113859644223', N'System', N'6a0768eedc84e4f4c4be7d9c8a72efa77bc17c5c1f484ce0c650fbbae2719814')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (188, N'Start up', N'Low', N'638031113929158471', N'System', N'930dc337756d2aa209731686bcbc73672d94ff7d7b983a30d0650b1dcb172b9f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (189, N'Start up', N'Low', N'638031114284449830', N'System', N'fdbe392246921ffbc378597d89ea7f97e3af9f4d7ffcce0a83aa3ae2c02ba155')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (190, N'Start up', N'Low', N'638031114885872476', N'System', N'3f12f5f44261c7c7f9f9fd5f47d8b2d1e544e88b3ad750c229036fc10f3abddd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (191, N'Start up', N'Low', N'638031125036919210', N'System', N'67206c22c3f9d36479aa1300a2af2a615e3693ecef8687309ed865ceb8e0f1dd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (192, N'Start up', N'Low', N'638031125138598747', N'System', N'720b521f4f4fb7de42137db8f7810ed40809d9aa93b7a9e0cbb64fed7733c9ae')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (193, N'Start up', N'Low', N'638031125334100769', N'System', N'903223f6376661d5ff224cb3f83eaf2bf3236310929ce0737e20479ec63a03cb')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (194, N'Start up', N'Low', N'638031125909865017', N'System', N'2d36a8904166956e5fa7ad58e405265dca0003f1208c061d1753384f8797e0c6')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (195, N'Start up', N'Low', N'638031130302779759', N'System', N'ed8e407112ca91d90739cfce1fe42d4b72ae8aaa9e98645de8f3f872733a5c90')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (196, N'Start up', N'Low', N'638031135158917470', N'System', N'792fe20224931b10a140e9606afc23694c5f2552876bb29891830ecd02aa01ca')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (197, N'Start up', N'Low', N'638031135788534987', N'System', N'3d22fd1d58e355a8bd9570773a04a0ac78cd6e83b305eb9a98f3fd44d131208b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (198, N'Start up', N'Low', N'638031136036915739', N'System', N'b834c87b87e1e504f3b761c2e57699c81f3e17b6024f105b470d53c01bf10151')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (199, N'Start up', N'Low', N'638031138181969386', N'System', N'679a2be56419e15e576941fb732e6dd20a7059c33b38c5021878896af6bd5933')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (200, N'Start up', N'Low', N'638031140260177496', N'System', N'4a258c4bad32558796674f6871a1b40ac4733dff98b52d5e966245c49b45cd1e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (201, N'Start up', N'Low', N'638031140351802192', N'System', N'1e8f72082f85e2077caf10b2011fe0a2048efb56705e282f452572ebd82c286e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (202, N'Start up', N'Low', N'638031141647781962', N'System', N'b403358e30162d82233c33390d33edbcc84f33ea0eca1801deb694d8a45d61c5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (203, N'Start up', N'Low', N'638031141998266100', N'System', N'b8e9794046408a21f257f673150a9d19f57891585ada3bcaa2fc5cb3201b733e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (204, N'Start up', N'Low', N'638031142218811887', N'System', N'16b00cff0a9bb468c0d34f6e73bffb77d201c5de2cc7e08f76ef1b1b0899d2d1')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (121, N'Start up', N'Low', N'638031123324086871', N'System', N'5919ba9f79ddb66dcfffb71acc98425f8fc1a27b61698c924e8d3245c13e1a6c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (122, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (132, N'Start up', N'Low', N'638031131158088243', N'System', N'2a750a388e075665813d994c6118551c74bd4e80d736ab26bd046be4009d6775')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (142, N'Start up', N'Low', N'638031142902367416', N'System', N'e313582df8434ee8bd4e30aa2b01cb569ad43dad3049b3aaa1c43ac5df4581ac')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (143, N'Se realizo un backup con exito', N'Medium', N'638031143625635926', N'System', N'22b5a564f7a243293bc57aa42478e50b91154be08e470953da241e230d04895e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (147, N'Start up', N'Low', N'638031151842909528', N'System', N'f4277eff85d2030aa54604c7a36766848a46896db604ade62410ae0850f87854')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (148, N'modificacion del usuario: 22', N'Medium', N'638031152049653665', N'1', N'6ab787b7193a994ad44f31bd3fa337945f79315c8ec0ddf603ca3cc6241ad006')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (149, N'Start up', N'Low', N'638031176002282135', N'System', N'cdcd0e641a2c0513e42acdf3130747d2db0297db460113468aa39272b48cd446')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (150, N'Start up', N'Low', N'638031179788790578', N'System', N'2c5444a8ada3772f05d6574df10ac3c31b60e0fced887057b2be05a580d810b4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (151, N'frmPatentesFamilias', N'High', N'638031181088465223', N'1', N'33469918d589c376649fb2d381ecffd75c5ee85efda11bc287307ebd3d2f54dd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (152, N'Start up', N'Low', N'638031182302723844', N'System', N'e97d855d73297d878877df5a6f6aed56279b3a848906c6338ae5d39e0d6f7c64')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (153, N'Start up', N'Low', N'638031182762325956', N'System', N'56cabc092394a5afb0b440fbf91f4f91301557b6d4470a82b84a3794626de06d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (154, N'Start up', N'Low', N'638031183162836913', N'System', N'23797a38d353671d1ea8b89a1aa7a30d790cb82e62b6dc02cf09434f09dc7c0b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (205, N'Falló el restore', N'High', N'638031144311600578', N'System', N'ea28446d6c290a99c5e5c1c7987785f831f68e5eabf2ce89fcc4d1840b572c3f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (206, N'Intento fallido de modificacion del usuario: 21', N'High', N'638031150427992046', N'1', N'838ed4ff3f380f0d6c90d1c910e67001baafb65e150719cc9cf46a5e4f977d2b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (207, N'modificacion del usuario: 21', N'Medium', N'638031150471037526', N'1', N'4ce7d8de76b22fa0c3fbad0ea7e1375ad5390aac1dde8c7f1dd279ad174085ad')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (208, N'Start up', N'Low', N'638031183627565710', N'System', N'37a8c2a83058d5d053c90f3f01d0d8606534968453e52a1b2e096faf568ee146')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (209, N'Start up', N'Low', N'638031187605590612', N'System', N'3d4ea14aa512ab8f212556cc72ba4210d15e712261ca65cded95d660c844edea')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (210, N'Start up', N'Low', N'638031187897073511', N'System', N'ac8b7692941f30b1bf4d5980f20c7bf36cdd3da800245b4230637e72e3ec9309')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (211, N'modificacion del usuario: 21', N'Medium', N'638031188373653742', N'1', N'ccabc500ddc351a98fe54783fcdcb643c1d98284600806fe1c66f61ebe2e2c56')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (212, N'Start up', N'Low', N'638031188558838320', N'System', N'1b12f2dd411c5da6efc99d12d72fb2b31a0d6ed33ef3f8da9e52ff65e081e611')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (213, N'Start up', N'Low', N'638031191683549058', N'System', N'd4b02ee5a5825715b907151bddfbd72281e49ec03639188defede6a849df59e7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (214, N'Start up', N'Low', N'638030410423733030', N'System', N'6456b296cc0e0560266d3ee5bdbf1c69b9694a0ce5bf34692435526c4ce2583d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (215, N'Se realizo un backup con exito', N'Medium', N'638030410552513454', N'System', N'bb2cd2b635c6d0c271405f445541c750ed494bf1c074430a7356d963ae7d3009')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (216, N'Start up', N'Low', N'638030410826822177', N'System', N'87bd559866443fc41549260239473405d4b63ff116834e2d33f10b9f4f1e1628')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (217, N'Se realizo un backup con exito', N'Medium', N'638030410947962536', N'System', N'0a89975eb948c85ad20c56062e9e0a0f9aaa8b287039a128f53e8875a0695f8e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (218, N'Start up', N'Low', N'638030411187110314', N'System', N'd25bf4eefcc44d90ee64c05c8921479381516df2883f71ba990085500cbdc9e7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (219, N'Start up', N'Low', N'638030916905417108', N'System', N'3610cd8793beb8f7711d8bad16bade3c9371a3f7af6af769d9c7df8918bacdc2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (220, N'Start up', N'Low', N'638030917140760538', N'System', N'0b9de30c7353bcbcc0e681bcd5e0a42afdcbd925fc11d429127e0963dd69a8bd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (221, N'Start up', N'Low', N'638030917992852148', N'System', N'7e7908089831313c4e7734c439eb1b2607b247e9335dc044bf2979cf49568000')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (222, N'Start up', N'Low', N'638031186456244720', N'System', N'0348610da35eb830e898dd59b7e9a637e1345c68f079bf0f4fbb1ed7a636ce69')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (223, N'Start up', N'Low', N'638030426445890556', N'System', N'3b0411fbc0fbf9e1a389d70fb2b0c0f2ebd9a80e7d1ee5429a25a215941e078c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (224, N'Start up', N'Low', N'638030426611426150', N'System', N'a39c409719172abbd4b91b56751ba05e9988f29683fdb05879ecb4117cafd421')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (225, N'Start up', N'Low', N'638030426922288768', N'System', N'b69ad12218169313f3594a884624164131932aa749cbdbd8090e7c9488f9e285')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (226, N'Start up', N'Low', N'638031076415050978', N'System', N'1fc26c09593859f5894d2f0909ce16c9b881e20038b13cc3c63fa5fde86ecf19')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (227, N'Start up', N'Low', N'638031080466401879', N'System', N'a565866931df30aca134547aafb3c0f129f7f6a2d80869b2b74bf36dbf780f62')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (228, N'Start up', N'Low', N'638031080645820912', N'System', N'ef096c2206fca171b15eda09d162286dfa78f8d40d3843296ca59c58a1191c22')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (229, N'Start up', N'Low', N'638031081886995368', N'System', N'c94c032dbf43cab2d242bbd81c52a3a52148e667796aeded3a9cb904e945b89e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (230, N'Start up', N'Low', N'638031082125090397', N'System', N'f2fd1c18d780792f142798d2228244c86e1932196e8f1d9846985edea4dee2c3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (231, N'Start up', N'Low', N'638031091770173174', N'System', N'45242fb683b5828e5e5e5eacf38176675e21c41df755ee02b787c663bb9a1011')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (232, N'Start up', N'Low', N'638031093326195646', N'System', N'd97686e9bf22e603c00362b3cdd3e5d39b6263923d922eec6eb143f33b1ed26a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (233, N'Start up', N'Low', N'638031093508188749', N'System', N'69aa5dfdf0bd7b41f5c1aeac51f8f7a65e1068131cd515f41600d87ee5bcd7aa')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (234, N'Start up', N'Low', N'638031093635114294', N'System', N'6cab4bf3d9e83dc1a1188b7b8007b13dd93a3af7a58d7ccf0eea86f68a9cb0e5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (235, N'Start up', N'Low', N'638031093890230650', N'System', N'3632662daae6d3985a187f2ed86ebbf779eec873af163dc1350b9c92a4ef737a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (236, N'Start up', N'Low', N'638031094150002754', N'System', N'00cdbd3a369265dd54dd45f82429cd57d696bb060654db912dc072fd3bf66e7b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (237, N'Start up', N'Low', N'638031094419321004', N'System', N'0a30f40e397eb0c66f1f59b33465b91065c4930f80557910041a55c299cfa8f8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (238, N'Start up', N'Low', N'638031094738268019', N'System', N'2589b21d0ebef3b47e69d043c1844e275b008026184c2c15c4bb5596b5bb6a0c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (239, N'Start up', N'Low', N'638031100338376546', N'System', N'a947ddf4a424ab6682487560153c760bfc3d55b7ac3fb86c3ffa73d518dd2e64')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (240, N'Start up', N'Low', N'638031103549396303', N'System', N'9a1197f69a5359f22ed49a06a4115a61aca2c9ad66bdbb3730292337347aa94e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (241, N'Start up', N'Low', N'638031103658749143', N'System', N'f9fbe7bd6f632c7be9f116e26fb654d31ae42bd39a73e22c792a8d40a7891344')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (242, N'Start up', N'Low', N'638031103875602687', N'System', N'df107342b5bfcedc277f92e09ac8734d57d819423dcf602d5d860fbd13cbaba1')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (243, N'Start up', N'Low', N'638031104036749081', N'System', N'c208613a3b89739ca226302416bbacccddcfdd9215d294a82213e990c49f0920')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (244, N'Start up', N'Low', N'638031104270270044', N'System', N'e70e485f9215de6957bbd0d4f7330a88beebb1e1b7b498836b4c1c553ea4ed0e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (245, N'Start up', N'Low', N'638031109649162284', N'System', N'cb68e3a10aa4028147e9c5a53b1a03b9a0db7d1675e5cc12c116157a7f9680a9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (246, N'Start up', N'Low', N'638031110171636647', N'System', N'1cf4b665eaa5feb01301029ed7d70c02673b384e13b07927e6abde6413f1b624')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (247, N'Start up', N'Low', N'638031112753118434', N'System', N'111cacd510e87f463468ba8798beeeb0427b5ed835c75bae26a21bffddac35d0')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (248, N'Start up', N'Low', N'638031115617658803', N'System', N'5f8798e0148fe4342712b87c1d7e1d8dbe04534e31cd155b1e2b6e103a3321bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (249, N'Start up', N'Low', N'638031116042194494', N'System', N'f09dbe7388ab2e7c1e96bb1d0591076019aa710eb09b334837321d5de00ec5a3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (250, N'Start up', N'Low', N'638031116229891727', N'System', N'f596d214745c4458078d6b1355ea3d78149cf09721414669b226c6af58688d2f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (251, N'Start up', N'Low', N'638031117424819616', N'System', N'65c1ef21c6e30308cd8f7cd9968bdac4cba2c2096aff5ea63aae7e56ce249052')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (252, N'Start up', N'Low', N'638031117484208558', N'System', N'29c9a0bb2295005c5d32a53a826964d1a8531d7f0d94d1292953de2bb33d3a35')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (161, N'Start up', N'Low', N'638031188887804149', N'System', N'2160b1de45aaf1516ee6ce7ec6b262986a40aa287575fc6dc68281de505d109f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (162, N'Start up', N'Low', N'638031189202850550', N'System', N'11a1e537559546d483993a5d20038aab0088de41e10c1bfe03a2e5c6154023d4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (164, N'Start up', N'Low', N'638031192021027216', N'System', N'dc1f6ea34cc151d026deb64da0a52505cbb3db70c3bd7aa87260d850788d589e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (165, N'Start up', N'Low', N'638031192475846720', N'System', N'f9362fd34d44cd45a41cd7bddf810ab6fff9729a0fff8018b6f8d7258d5ac02f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (166, N'Start up', N'Low', N'638031193593458716', N'System', N'3cbd13a1f183eee3bb5214e3f0acd512f02b239fa57c7098a3a850304aa8d2a3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (167, N'Start up', N'Low', N'638031194101554832', N'System', N'e36e83c6fd25a9c91f5ab0f6896837a4f8e3b381743640632f19834d732c86c3')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (172, N'Start up', N'Low', N'638031198973160865', N'System', N'57872df616514f338633d83632c783570c5d0cbe353e85a91481e3342a94670e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (254, N'Start up', N'Low', N'638031121697346194', N'System', N'68fabe9b956f4cedc80ac75feecaae9b11ba0f306eb3c18fdd79c3118548d92f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (255, N'Start up', N'Low', N'638031124258899825', N'System', N'87d1134dc12faa6d1aa65a1bdab0ab367e80c922c1ff630a58b3a169c06fac38')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (256, N'Start up', N'Low', N'638031124418530498', N'System', N'028ebc8837c13d720c272135e5c19e464d97ac6f79e40d8d64127b0fa67c6748')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (257, N'Start up', N'Low', N'638031128728959717', N'System', N'59dcb7646b51c428312b00a08e49fb8eaac0337b93cc93aaf2ae34c16afd0765')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (258, N'Start up', N'Low', N'638031129680300169', N'System', N'fea501de2f9ea6b9f82ce698d6c9cac9d63f4403a2d93864b2362976c55fa982')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (259, N'Start up', N'Low', N'638031123324086871', N'System', N'5919ba9f79ddb66dcfffb71acc98425f8fc1a27b61698c924e8d3245c13e1a6c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (260, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (261, N'Start up', N'Low', N'638031131158088243', N'System', N'2a750a388e075665813d994c6118551c74bd4e80d736ab26bd046be4009d6775')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (262, N'Start up', N'Low', N'638031142902367416', N'System', N'e313582df8434ee8bd4e30aa2b01cb569ad43dad3049b3aaa1c43ac5df4581ac')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (263, N'Se realizo un backup con exito', N'Medium', N'638031143625635926', N'System', N'22b5a564f7a243293bc57aa42478e50b91154be08e470953da241e230d04895e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (264, N'Start up', N'Low', N'638031151842909528', N'System', N'f4277eff85d2030aa54604c7a36766848a46896db604ade62410ae0850f87854')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (265, N'modificacion del usuario: 22', N'Medium', N'638031152049653665', N'1', N'6ab787b7193a994ad44f31bd3fa337945f79315c8ec0ddf603ca3cc6241ad006')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (266, N'Start up', N'Low', N'638031176002282135', N'System', N'cdcd0e641a2c0513e42acdf3130747d2db0297db460113468aa39272b48cd446')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (267, N'Start up', N'Low', N'638031179788790578', N'System', N'2c5444a8ada3772f05d6574df10ac3c31b60e0fced887057b2be05a580d810b4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (268, N'frmPatentesFamilias', N'High', N'638031181088465223', N'1', N'33469918d589c376649fb2d381ecffd75c5ee85efda11bc287307ebd3d2f54dd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (269, N'Start up', N'Low', N'638031182302723844', N'System', N'e97d855d73297d878877df5a6f6aed56279b3a848906c6338ae5d39e0d6f7c64')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (270, N'Start up', N'Low', N'638031182762325956', N'System', N'56cabc092394a5afb0b440fbf91f4f91301557b6d4470a82b84a3794626de06d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (271, N'Start up', N'Low', N'638031183162836913', N'System', N'23797a38d353671d1ea8b89a1aa7a30d790cb82e62b6dc02cf09434f09dc7c0b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (272, N'Start up', N'Low', N'638031188887804149', N'System', N'2160b1de45aaf1516ee6ce7ec6b262986a40aa287575fc6dc68281de505d109f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (273, N'Start up', N'Low', N'638031189202850550', N'System', N'11a1e537559546d483993a5d20038aab0088de41e10c1bfe03a2e5c6154023d4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (274, N'Start up', N'Low', N'638031192021027216', N'System', N'dc1f6ea34cc151d026deb64da0a52505cbb3db70c3bd7aa87260d850788d589e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (275, N'Start up', N'Low', N'638031192475846720', N'System', N'f9362fd34d44cd45a41cd7bddf810ab6fff9729a0fff8018b6f8d7258d5ac02f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (276, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (277, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (278, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (279, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (280, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (281, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (282, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (283, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (284, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (285, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (286, N'Start up', N'Low', N'638031123756450962', N'System', N'b8edc21be5c12191f01f38596ef80f5ccd33e7df0d4e55a9a938a03a45e1b2bf')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (287, N'Start up', N'Low', N'638031187605590612', N'System', N'3d4ea14aa512ab8f212556cc72ba4210d15e712261ca65cded95d660c844edea')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (290, N'Start up', N'Low', N'638037154366715320', N'System', N'2f4b1604194019cde0d0b6da89360df196d9f8532d4160f35540f8d2c0e90721')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (313, N'Start up', N'Low', N'638042580972949174', N'System', N'20da4158b090663f6557fbb208e1aabe8663bff44d7411db7e42b17430ef1631')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (312, N'Start up', N'Low', N'638042578048655983', N'System', N'1c8ea0729ec0ab4fedb785c609a70b4ac28943121de0fbdfe96893f28d5a7bb8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (325, N'Start up', N'Low', N'638049051487936847', N'System', N'306b17b764b8d617a9687f7c63982f567347be3db8b5a4eaeb441281a1fa0e86')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (317, N'Start up', N'Low', N'638045524542050325', N'System', N'cb66534c2187593dc12290b843c453ce1301dcb67585ae9c53e646ab5047cea9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (319, N'Start up', N'Low', N'638049012447306809', N'System', N'004964f33568f90904fecd336a13f1f291ed7833c73bf549ac982d2186811c58')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (328, N'frmPatentesFamilias', N'High', N'638049062032935701', N'1', N'bc21f323abd8fc3f14cf0143e0e0b295e24d0c4cb6b8dbc99d104add6d0c461f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (329, N'frmPatentesFamilias', N'High', N'638049062976894656', N'1', N'96e3c623345eddf7ff9f0b933747a50e6b0930155ffbfee5e8cab1bbc6acb8be')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (330, N'frmPatentesFamilias', N'High', N'638049063186846211', N'1', N'd71024f3b022fe52bfbd00b18b85b62939790e70af5d22a544b51489e661d382')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (331, N'frmPatentesFamilias', N'High', N'638049066184834914', N'1', N'c2b36b100c30439b898977f011a30282cb2a96490c731676e4c90f9966fa0a22')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (332, N'Start up', N'Low', N'638049066628933727', N'System', N'cb6c815ded5e96e04a4a4cfe27d121969ef96a84a13e9170d9809a7113858b69')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (333, N'frmPatentesFamilias', N'High', N'638049066691602708', N'1', N'ad8e3b669e500b3f62ae9af349e14eef096a567943dbe871fcefba3e40b8386d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (334, N'Start up', N'Low', N'638050982964498273', N'System', N'c67df598536a5a0183cd0c4daabf62536f7e4f9a8579ccace9d5198f0ca81bb1')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (335, N'Start up', N'Low', N'638051023827218216', N'System', N'8944ee464681282b7bd8d38a1992c02759d11ceb6c0b954b4a35766b023fbb8a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (336, N'Start up', N'Low', N'638051029294190535', N'System', N'd3ef6b7d5dadc593402cef68f79e975b9eb416257398ee4658f90468c1a37b6f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (337, N'frmPatentesFamilias', N'High', N'638051029560989352', N'1', N'eea0f607c7bdd413e6969e679c2293c0af6db4e1afbebde5afd85e02ef7227e9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (338, N'Start up', N'Low', N'638051039183924476', N'System', N'e2ac3c96e027a5bb3bf3d57faa75c257ef1892a2b3768de8093b2b5937d265a9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (339, N'Start up', N'Low', N'638051046212985338', N'System', N'53978f6bf841ba3f94f83836ea8603108a42cd0d6392923b413170e3d1603be8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (340, N'frmPatentesFamilias', N'High', N'638051046240921914', N'1', N'a6eaf562db642a3f6807aaf75e03128f2fa47aa2f849b14f5620d1ea59e7cf96')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (341, N'Start up', N'Low', N'638051629375195994', N'System', N'e56d27a20f68558e41a80a3c8a7089eafa2c915b4e6eb7a0732399b682a8f895')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (342, N'Start up', N'Low', N'638051637646157912', N'System', N'81099c5ba9df47cf644542dc530ad22a4c44a07c8d6e7df96ea67f0b6bdc57f4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (343, N'Start up', N'Low', N'638051640284006316', N'System', N'ea0b9718bb543aec7b4174a6657f8fe283199a275def889afec59453d369df61')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (346, N'Start up', N'Low', N'638051660715948453', N'System', N'9e7446ab4b46961236243f105888a7646d2ae2cb5df01fb1ec068f3d2c298dec')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (347, N'modificacion del usuario: 21', N'Medium', N'638051660888775671', N'1', N'098cc3ca9ffa764b5a9ec326aed24eb25a7423345c824f9ab86f5800f5888918')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (348, N'modificacion del usuario: 21', N'Medium', N'638051661175130270', N'1', N'0429bb20f507684aa63fbd8055426e202e6708db02583875f873d8c816522988')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (349, N'modificacion del usuario: 21', N'Medium', N'638051661601141982', N'1', N'6c35dc9bbea87c00a463c2f346f5fa0df192a8407d9e6d945198d0957bb7653e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (350, N'Start up', N'Low', N'638052768404011708', N'System', N'10aa115c88c4fc7ab780f25b65264a00da24fb1b2a24bf017b7797a31f61c759')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (364, N'Start up', N'Low', N'638053635111873101', N'System', N'248dd39e19c63273ba033c45fc53a7d2daa90f3932aec6ec358ddbda88b201b5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (369, N'Start up', N'Low', N'638053643029627122', N'System', N'c4c635901713b15d5a587db8f18e8cfa362090bd72027b3b27cd0bbfd055d850')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (377, N'Start up', N'Low', N'638053666520412523', N'System', N'6f3218e2a0bdebf6b5f3288ddc16b95cc7647e7ee1470a16bf565b93d70741da')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (378, N'Start up', N'Low', N'638053667017621393', N'System', N'7b2af65b78cd72263be517f2af9b70652166cad4c09ff51ec90a4224afc85e9d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (379, N'Start up', N'Low', N'638053669955460343', N'System', N'daeaabd717e363a8fc398f9db281e238164245a00b7c5a73dbac30880f792582')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (380, N'Start up', N'Low', N'638054075023723099', N'System', N'f8229f80d66b62d09e7d55753e8acde5ac5d1d046dc752e0c6a51f8e772cc959')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (381, N'Start up', N'Low', N'638054080357387768', N'System', N'95f465fc0fa44d455281f867155ebe6ce73796c192b4ab2e6ec50a513302110b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (382, N'Start up', N'Low', N'638054090467289648', N'System', N'7bf5349bd9daa01dad9fe8c50ffb6e65ff2debe46a71a1c695ec2f0a98b2e6dc')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (383, N'Se realizo un backup con exito', N'Medium', N'638054090585260457', N'System', N'c32264bc7cc645df44ad8cfc84f1dbf3e097b71ce778c853c41b4a6102a1c767')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (384, N'Start up', N'Low', N'638054095280723501', N'System', N'0ca81694902f29ed9b072e76380887f2701b78657b11c4e37c03a5e46c6f4a2c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (388, N'Start up', N'Low', N'638054133727649618', N'System', N'1de29c84f8e7711ea467958d9c1c6a697e97f67db09c059af7a6a9f5d8b7d4ca')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (389, N'Error alta cupon 10, descuento 1', N'High', N'638054134654246948', N'1', N'17591e2c9d451f7a00d7caabc36341fcd4cbc2bbe2d38407dbbbeab4f3bd9894')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (390, N'Start up', N'Low', N'638054135992846510', N'System', N'85c7882ece722b586931ba92c89e37e20612257944ea8f173404e0fc27b82d9a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (391, N'Error alta cupon 5, descuento 1', N'High', N'638054136049945393', N'1', N'667220f4286be2397de9e57216c8e1a4d8a762c4c39b8f4bde21d414fd9c8d62')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (404, N'Start up', N'Low', N'638054251923306571', N'System', N'990b9654e2108b83f06090bac41a696d6567a58f8a1d817de067375b386e3122')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (408, N'Start up', N'Low', N'638054294699882179', N'System', N'6f74f6639248e650b2adc84d1c0a94064334d37d19b101ab2850f970e7bbf319')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (409, N'Start up', N'Low', N'638054295982719766', N'System', N'3992192b162702ea7ae65565b56d244db7f8d8f0e073f10e54ac3b3921f3eb69')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (410, N'Start up', N'Low', N'638054298523589346', N'System', N'9592fb41c2902af120f4e64f30808a46f9552ce1128befcbbd5b1cec0a3cd851')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (344, N'Start up', N'Low', N'638051642216461458', N'System', N'155b3c92f8b280c5c3db14cf8d7398089e4587eb36ebc28f1fa0b7ec38129825')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (345, N'Start up', N'Low', N'638051642677115362', N'System', N'845b047ab8f113eab29ecf02e45e8195baaa7f91a6204c913f0906a9b9c0e40a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (352, N'Start up', N'Low', N'638053589998130493', N'System', N'57b23540b5cf0d1d8fef64b94aab48a446d5b551d37d1aaa34f31b4e0b30c4cd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (353, N'Start up', N'Low', N'638053615340193993', N'System', N'b9413b9be6049da456cd960c22d59bf61f5fd590a1b60001b277925026178250')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (354, N'Start up', N'Low', N'638053617376056376', N'System', N'b6410750006d82dc11fff0c7f169eea7bf1f5508992350560dca60e5c73e7df6')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (358, N'Start up', N'Low', N'638053621601843534', N'System', N'2e8b95f20d2ff49363c30ff5b98945f0a175531bb418ffb49dfd47f45004e675')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (365, N'Start up', N'Low', N'638053637286631248', N'System', N'c442e87b243b6205f629f5098300165115b4de2804ef810230abc3dcf7fe9395')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (366, N'Start up', N'Low', N'638053637746398927', N'System', N'a7a3f7f00791aa2333b5b9cca994a4230651bdefba63f1b484809613147df268')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (367, N'Start up', N'Low', N'638053638264287829', N'System', N'5674f16c8f09cde22c177d98a84ee8f45284ef831a695cdf8dcf602fd4b19033')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (370, N'Start up', N'Low', N'638053658026331453', N'System', N'21ae7c5dea971372c2c2556a370ae99dd0db519ac4488128d423f8920375efb5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (371, N'Start up', N'Low', N'638053658618782057', N'System', N'a75e7479a49c0a5a6dceff32c98967ad6fb531c4e1d6c4412dd22f18deb631b2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (387, N'Start up', N'Low', N'638054129991133898', N'System', N'646fe69ff2dfe32e0364c91cbb38e0da025c4ded38de1e9407b73df211ec386a')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (392, N'Start up', N'Low', N'638054136953624216', N'System', N'dcba33ffff5e4ea99d291c977e2433b813082d4ec224de6028e5c390175f0e72')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (393, N'Start up', N'Low', N'638054137999330566', N'System', N'bec723316f55124506683a968328314e875e869a74f6cfdc0e7fbb6d5ad818dd')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (394, N'Start up', N'Low', N'638054140527817201', N'System', N'a3707988a61875eed98075d50e0ad337800d5e2ec622e33a8a25abea8045c2f5')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (395, N'Start up', N'Low', N'638054142643406867', N'System', N'9cefa39d1f9a8bc324c59235be68675cbae657754a45ed67cd1085f8bc8c7dc6')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (396, N'Start up', N'Low', N'638054143597489543', N'System', N'5d50b58bf5a6aefd0f01beae9cef430423c2298f4f5c76ac95ccceef11a1ba48')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (397, N'Start up', N'Low', N'638054148186851216', N'System', N'91719e09a63b8c236dc4f19f6928d40e41235525f61bae8f19316fce5b5a51a2')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (398, N'Start up', N'Low', N'638054153002045261', N'System', N'a65d77fae19dea834c0ea8d37ff6663f13035a97618d01c3c9a6b4cd230e2ab8')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (399, N'Start up', N'Low', N'638054155419478972', N'System', N'425693f468a92d6abe80222946b08a3018296982ad020cd93c3bf6f00152d99c')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (400, N'Start up', N'Low', N'638054156712710494', N'System', N'dc2b1c12a64a32b72253ec08b621a6c16e119d60de51edd81f284b219432096d')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (401, N'Start up', N'Low', N'638054158201159876', N'System', N'b2f7e65a9db725f3bf32c242962762f9c40706f31453371f673cc17e80a4d86e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (403, N'Start up', N'Low', N'638054250434654979', N'System', N'7e050a0a5347d13a6dc985a1a9099b452844cd18c7f11547b6c247e43c4e5283')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (406, N'Start up', N'Low', N'638054287379335846', N'System', N'9592e1402cc455a2e50682db365b0008548b1bdf8b18d841c663088b2d377706')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (411, N'Start up', N'Low', N'638054302496911350', N'System', N'19141cd345b0902818e64274ba3f143775ad56773d49406c0e457a3c61db797f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (412, N'frmPatentesFamilias', N'High', N'638054302609521530', N'1', N'f7413632be50b0a3371df80656a506bca79cb7db1322aea065b1c70e514ab55f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (351, N'Start up', N'Low', N'638053189202252253', N'System', N'9fbf09b9f545d27f3d94030a1670911ffa95ebe485558265d68fb4510f019baa')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (355, N'Start up', N'Low', N'638053618089252795', N'System', N'87158b93ca352c69e6cbe781f8d836d80aebc1415685836d5446b3dec4accaa7')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (356, N'Error alta cupon 2000desc, descuento 2000', N'High', N'638053618392642482', N'1', N'1080f6506412644676733e2444d7b795eed2d52ba6eaabd24b247837da6d5130')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (357, N'Start up', N'Low', N'638053619007069199', N'System', N'cb786d1a773532ff7bddbbf7eef09e618df493c4f2ad04059e063b5f73710dba')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (359, N'Start up', N'Low', N'638053623735917307', N'System', N'e5580ec817a7b53f73dab24fb573ad8a8fb695899a4003f43bde6505eec3bc1e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (360, N'Start up', N'Low', N'638053626327784229', N'System', N'f48fb90f4532d8919685c9ffb176e210187e5242142cc21f62b1ffc318ca1126')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (361, N'Alta cupon 1233, descuento 1233', N'Low', N'638053627032107379', N'1', N'2b281b4100c7e41f046570a2b699571195e920bdb510dcb5cb2390594bd5708e')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (362, N'Alta cupon 1233, descuento 1233', N'Low', N'638053627207635446', N'1', N'af7e8b53ff543147aede56d5916860e7884c0a5420cf651a104c12e65ad1558f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (363, N'Alta cupon 50%, descuento 50', N'Low', N'638053628204744795', N'0', N'5a0eed6804e7e7f1b60a3f34175bca409c94449f07be2197e714c99fb66cc441')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (368, N'Start up', N'Low', N'638053639300578350', N'System', N'3b8ab7860c3d3d4229e688c02c7cf2cd622a1799f32e631d329c9ffe296a42a9')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (372, N'Start up', N'Low', N'638053663340989912', N'System', N'065c470a1bafd8381ea6e8cb7d277430c0e2e9da5449c53fe20a1f6f058ebc14')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (373, N'Start up', N'Low', N'638053664259865430', N'System', N'd9ed3eabddc22b5d7d998951938453eb7bf3ecfc6ad8056425d9f94583281281')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (374, N'Start up', N'Low', N'638053664681271615', N'System', N'1d5776faa66819344ca77d8b3cf8b23195d024c2d3d6bf02256b2a668e9de79b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (375, N'Start up', N'Low', N'638053665091395067', N'System', N'21c0f6e0f4466b20927a5eddb0f522e5e2aca22fcb9568ab7d3311206bd8e2ed')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (376, N'Start up', N'Low', N'638053665685713663', N'System', N'b5bf699c1cad3548eba3ba86783f8000edaa059fd7a21b5d8be1c8e5a0a4f56b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (385, N'Start up', N'Low', N'638054122617938958', N'System', N'ea56fbda385f17e3d88f9a75fc2d52ae7ff53f7a1d07c1be89a385ce520b7a41')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (386, N'Start up', N'Low', N'638054123647319997', N'System', N'943f95c9e8f54c12b637c72ed4e8c61a69cd37604bf4f6757fa8f54979b5fbb4')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (402, N'Start up', N'Low', N'638054160771485644', N'System', N'bf275862e6e06f4c0b7cee0273a1648e3a80accafa2ae93adc1371b36d85151b')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (405, N'Start up', N'Low', N'638054284929881781', N'System', N'f19f741a9109fb75bf71ab9b073bb364681f756267b8c90436f19cf0103c602f')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (407, N'Start up', N'Low', N'638054292983119871', N'System', N'67412dba7b307767421e8b3fa3545de079d9fe70f9042caee3e2c89959dcdcff')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (413, N'Start up', N'Low', N'638054303773479339', N'System', N'0ea82d3ee44832dba441648c96b1e46bbba1c09670c2db738b92f2f8a2ff9774')
GO
INSERT [dbo].[bitacora] ([id], [mensaje], [prioridad], [fecha], [usuario], [dvh]) VALUES (414, N'Start up', N'Low', N'638054303879899950', N'System', N'a129e30d7423c938b26016862f5f124ca96fc3726ba0c32b0a159af14a127478')
GO
SET IDENTITY_INSERT [dbo].[bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[cupon] ON 
GO
INSERT [dbo].[cupon] ([id], [discount], [type], [emmitDate], [expirationDate], [code], [dvh]) VALUES (3, 101, N'Amount', N'638053623896737722', N'638052800444657658', N'1001', N'3af0cc1e30ed0293720a8a5ae2434889c0980d00a5860c72081be22fc69d28c6')
GO
INSERT [dbo].[cupon] ([id], [discount], [type], [emmitDate], [expirationDate], [code], [dvh]) VALUES (1, 30, N'Percentage', N'638052908308342103', N'638052908308342103', N'10code', N'e1c46d6729c06a0fbfd1c69bf4b57c7e82e0075166ea73749bce033ff370a70c')
GO
INSERT [dbo].[cupon] ([id], [discount], [type], [emmitDate], [expirationDate], [code], [dvh]) VALUES (6, 50, N'Percentage', N'638053628169828539', N'638061403880000000', N'50%', N'9e4dd84025965687dd250839ff77e6459be9698d38e350253169ca397495a036')
GO
INSERT [dbo].[cupon] ([id], [discount], [type], [emmitDate], [expirationDate], [code], [dvh]) VALUES (2, 2000, N'Amount', N'638053621935963131', N'638063989620000000', N'2000p', N'8bc395deb95c85f1eeb5f17c6edc0086f0a1eaedb28bad48606b03ab0f03df59')
GO
INSERT [dbo].[cupon] ([id], [discount], [type], [emmitDate], [expirationDate], [code], [dvh]) VALUES (4, 1233, N'Amount', N'638053626581829709', N'638063994340000000', N'1233', N'fd6f027be5e56f1a39ffec282562f884182c8716b0fac680258cdad1583daa32')
GO
SET IDENTITY_INSERT [dbo].[cupon] OFF
GO
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'bitacora', N'c9bbe0cec5065eda39bd4a3da3fe9ba7009927398f440087271553e25e8c7771')
GO
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'usuarios', N'c11952813aafdaf1e5bbf8fc28605d2561354d7eface1558b88f8bef340b677d')
GO
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'producto', N'153d8fea668aeadac2eba1a2f83d318ff114bb9935f3b5b34864039db82ffba3')
GO
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'venta', N'dd82033ce28d9bca879d2763a30bf7424e3f97b861f0aadb144bf2ad967b74d3')
GO
INSERT [dbo].[dvv] ([tablename], [dvv]) VALUES (N'cupon', N'db34019ab29592a89f470f221a74190f16a288d00c5ca1d0ed2bf3d95ecb9655')
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (2, 1, 1, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (2, 3, 1, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (21, 1, 1, CAST(0.75 AS Decimal(5, 2)))
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (23, 2, 1, CAST(1.75 AS Decimal(5, 2)))
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (23, 4, 1, CAST(1.75 AS Decimal(5, 2)))
GO
INSERT [dbo].[ejercicios_usuario] ([id_usuario], [id_grupo_muscular], [repeticiones], [peso]) VALUES (23, 5, 1, CAST(1.75 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[grupo_muscular_maquina] ON 
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (23, 1, 1, N'esta es una descripcion estandar')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (2, 1, 2, N'descripcion del ejercicio 1-2')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (3, 1, 3, N'descripcion del ejercicio  1-3')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (4, 1, 4, N'descripcion del ejercicio  1-4')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (5, 1, 5, N'1-5')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (6, 1, 6, N'1-6')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (7, 2, 2, N'2-2')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (8, 3, 3, N'3-3')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (9, 4, 4, N'4-4')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (20, 5, 1, N'1234567890')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (10, 5, 5, N'5-5')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (12, 7, 1, N'7-1')
GO
INSERT [dbo].[grupo_muscular_maquina] ([id], [id_tipo_maquina], [id_tipo_grupo_muscular], [descripcion]) VALUES (13, 8, 2, N'8-2')
GO
SET IDENTITY_INSERT [dbo].[grupo_muscular_maquina] OFF
GO
SET IDENTITY_INSERT [dbo].[idioma] ON 
GO
INSERT [dbo].[idioma] ([id], [name]) VALUES (1, N'Español')
GO
INSERT [dbo].[idioma] ([id], [name]) VALUES (2, N'English')
GO
SET IDENTITY_INSERT [dbo].[idioma] OFF
GO
SET IDENTITY_INSERT [dbo].[permiso] ON 
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (16, N'AsignarEjercicios', N'AsignarEjercicios', N'Asignacion de ejercicios a los usuarios')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (17, N'Backup', N'Backup', N'Realizar Backup de la BD')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (21, N'Bitacora', N'Bitacora', N'Pantalla de visualizacion de Bitacora')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (20, N'ChangesControl', N'ChangesControl', N'Pantalla de control de cambios')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (14, N'ConfigIdioma', N'ConfigIdioma', N'Pantalla de configuracion de tags e diomas')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (15, N'ConfigurarEjercicios', N'ConfigurarEjercicios', N'Configuracion de ejercicios , aparatos y grupos musculares')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (24, N'Coupons', N'Coupons', N'pantalla para generar cupones')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (3, N'Default', N'Default', N'Este permiso lo tienen todos los usuarios')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (13, N'domenech', NULL, NULL)
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (19, N'DVRecalc', N'DVRecalc', N'Realizar el recalculo de digitos verificadores')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (22, N'familiatest', NULL, NULL)
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (4, N'PatentesFamilias', N'PatentesFamilias', N'Menu Patentes y familias')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (5, N'PatentesUsuarios', N'PatentesUsuarios', N'Menu Patentes de Usuarios')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (25, N'Reports', N'Reports', N'Menu para acceder a los reportes')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (18, N'Restore', N'Restore', N'Realizar Restore de la BD')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (11, N'Super User', NULL, NULL)
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (1, N'UsuarioDefault', NULL, NULL)
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (2, N'UsuarioEmpleado', NULL, NULL)
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (8, N'UsuarioGerente', NULL, NULL)
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (7, N'Usuarios', N'Usuarios', N'Menu Usuarios')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (23, N'Venta', N'Venta', N'Pantalla para generar ventas')
GO
INSERT [dbo].[permiso] ([id], [nombre], [permiso], [descripcion]) VALUES (12, N'VerRutina', N'VerRutina', N'Pantalla de rutinas')
GO
SET IDENTITY_INSERT [dbo].[permiso] OFF
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 3)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (2, 7)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 5)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 4)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (2, 16)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 17)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 21)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (1, 12)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (13, 11)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (13, 12)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 14)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 7)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (8, 15)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 20)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (22, 16)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 14)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 19)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 4)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 5)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 18)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 7)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 23)
GO
INSERT [dbo].[permiso_permiso] ([id_permiso_padre], [id_permiso_hijo]) VALUES (11, 24)
GO
SET IDENTITY_INSERT [dbo].[producto] ON 
GO
INSERT [dbo].[producto] ([id], [code], [name], [description], [price], [dvh]) VALUES (1, 1, N'mes', N'suscripcion un mes', CAST(1000.0000 AS Decimal(15, 4)), N'3a8855745626b395a4b9f82213b82412bc811679f4021bf122bc819a3fbf9a69')
GO
INSERT [dbo].[producto] ([id], [code], [name], [description], [price], [dvh]) VALUES (2, 2, N'semestre', N'suscripcion 6 meses', CAST(5500.0000 AS Decimal(15, 4)), N'5663e7cb3f41cb34f62196e78f1e0f40feb9b6c920b8d84394d3c44737d915c8')
GO
INSERT [dbo].[producto] ([id], [code], [name], [description], [price], [dvh]) VALUES (3, 3, N'año', N'suscripcion 1 año', CAST(10000.0000 AS Decimal(15, 4)), N'e304288d4e5acf979b9744176248df2ca358bd57dedded5d15803fa10010e525')
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_grupo_muscular] ON 
GO
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (1, N'Bíceps')
GO
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (2, N'Tríceps')
GO
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (3, N'Hombros')
GO
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (4, N'Isquios')
GO
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (5, N'Glúteos')
GO
INSERT [dbo].[tipo_grupo_muscular] ([id], [nombre]) VALUES (6, N'Abdominales')
GO
SET IDENTITY_INSERT [dbo].[tipo_grupo_muscular] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_maquina] ON 
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (1, N'Suelo')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (2, N'Cinta de Correr
')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (3, N'Bicicleta Vertical
')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (4, N'Elíptica')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (5, N'Escaladora')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (6, N'Remo')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (7, N'Banco Olímpico
')
GO
INSERT [dbo].[tipo_maquina] ([id], [nombre]) VALUES (8, N'Máquina de Poleas
')
GO
SET IDENTITY_INSERT [dbo].[tipo_maquina] OFF
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'aceptar', N'Aceptar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'actualizarTraduccion', N'Actualizar Traduccion')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'agregar', N'Agregar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'alta', N'Alta')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'apellido', N'Apellido')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'asd', N'test')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'bitacora', N'Bitacora')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'borrar', N'Borrar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'cancelar', N'Cancelar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configuracion', N'Configuración')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configurar', N'Configurar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'configurarFamilia', N'Configurar Familia')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'contraseña', N'Contraseña')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'controldecambios', N'Control de cambios')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'crear', N'Crear')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'crearIdioma', N'Crear Idioma')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'crearTraduccion', N'Crear Traduccion')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'descripcion', N'Descripción')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'direccion', N'Dirección')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'dni', N'DNI')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'eliminar', N'Eliminar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'familia', N'Familia')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'familias', N'Familias')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'guardar', N'Guardar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'idioma', N'Idioma')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'inicio', N'Inicio')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'lista', N'Lista')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'logOut', N'Cerrar sesion')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'mail', N'Email')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'main', N'Main')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'modificar', N'Modificar')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nic', N'NIC')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nombre', N'Nombre')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nuevaContraseña', N'Nueva Contraseña')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'nuevaFamilia', N'Nueva Familia')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'patentes', N'Patentes')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'patentesyfamilias', N'Patentes y Familias')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'permisos', N'Permisos')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'resetPssword', N'Cambiar Password')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'rutinas', N'Rutinas')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'seleccionarIdioma', N'Seleccionar Idioma')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'selectLanguage', N'Seleccionar Idioma')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tableadress', N'Dirección')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tableblocked', N'Bloqueado')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tablelastname', N'Apellido')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tablename', N'Nombre')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'tablephone', N'Teléfono')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'telefono', N'Telefono')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'todasLasFamilias', N'Todas las Familias')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'todasLasPatentes', N'Todas las patentes')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'traducciones', N'Traducciones')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'usuario', N'Usuario')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (1, N'usuarios', N'Usuarios')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'aceptar', N'Accept')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'actualizarTraduccion', N'Update Translation')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'agregar', N'Add')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'alta', N'Create')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'apellido', N'Last Name')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'asd', N'testEnglish')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'bitacora', N'Logbook')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'borrar', N'Delete')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'cancelar', N'Cancel')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configuracion', N'Configuration')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configurar', N'Config')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'configurarFamilia', N'Config Family')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'contraseña', N'Password')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'controldecambios', N'Changes Control')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'crear', N'Create')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'crearIdioma', N'Create Language')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'crearTraduccion', N'Create Translation')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'descripcion', N'Description')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'direccion', N'Adress')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'dni', N'DNI')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'eliminar', N'Remove')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'familia', N'Family')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'familias', N'Families')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'guardar', N'Save')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'idioma', N'Language')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'inicio', N'Home')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'lista', N'List')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'logOut', N'LogOut')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'mail', N'Mail')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'main', N'Main')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'modificar', N'Modify')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nic', N'NIC')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nombre', N'Name')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nuevaContraseña', N'New Password')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'nuevaFamilia', N'New Family')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'patentes', N'Patents')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'patentesyfamilias', N'Patents and Families')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'permisos', N'Permissions')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'resetPssword', N'Change Password')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'rutinas', N'Rutines')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'seleccionarIdioma', N'Select Language')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'selectLanguage', N'Select Language')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tableadress', N'Adress')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tableblocked', N'Blocked')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablelastname', N'Last Name')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablename', N'Name')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'tablephone', N'Phone')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'telefono', N'Phone')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'todasLasFamilias', N'All Families')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'todasLasPatentes', N'All Patents')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'traducciones', N'Translations')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'usuario', N'User')
GO
INSERT [dbo].[traduccion] ([id_idioma], [key], [traduccion]) VALUES (2, N'usuarios', N'Users')
GO
SET IDENTITY_INSERT [dbo].[user_changes_control] ON 
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (332, 22, N'tito', N'dsdasd@asdasd', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638051662683433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (333, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'wertyu', N'345345345', N'asdfadvd', N'345345345', N'638051662843300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (492, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052758425733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (493, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052758425733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (494, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052758425800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (495, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052758425800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (496, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052758425833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (497, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052758425833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (498, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052758425900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (499, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052758425900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (500, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052758425966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (501, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052758425966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (502, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052759941333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (503, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052759941333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (504, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052759941400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (505, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052759941400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (506, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052759941433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (507, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052759941433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (508, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052759941500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (509, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052759941500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (510, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052759941533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (511, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052759941533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (512, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052759941600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (513, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052759941600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (514, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052760624966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (515, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052760624966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (516, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052760625000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (517, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052760625000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (518, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052760625066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (519, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052760625066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (520, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052760625100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (521, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052760625100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (522, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052760625166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (523, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052760625166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (524, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052760625200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (525, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052760625200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (526, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052761344200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (527, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052761344200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (528, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052761344266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (529, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052761344266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (530, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052761344300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (531, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052761344300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (532, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052761344366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (533, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052761344366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (534, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052761344400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (535, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052761344400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (536, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052761344466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (537, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052761344466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (550, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052768403900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (551, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052768403900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (554, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053550180666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (555, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053550180666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (556, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053550180733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (557, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053550180733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (558, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053550180800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (559, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053550180800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (560, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053550180866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (561, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053550180866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (562, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053550180900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (563, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053550180933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (564, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053550180966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (565, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053550180966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (566, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053589998033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (567, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053589998033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (568, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053615340033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (569, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053615340066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (570, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053617375966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (571, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053617375966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (576, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053621601766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (577, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053621601766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (578, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053623624000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (579, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053623624033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (580, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053623624066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (572, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053618089133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (573, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053618089133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (574, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053619006966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (575, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053619006966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (581, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053623624066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (582, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053623624133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (583, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053623624133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (584, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053623624166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (585, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053623624166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (586, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053623624233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (587, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053623624233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (588, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053623624300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (589, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053623624300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (590, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053623735800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (591, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053623735800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (604, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053626327666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (605, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053626327666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (606, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053630520733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (607, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053630520733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (608, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053630520800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (609, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053630520800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (610, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053630520833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (611, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053630520833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (612, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053630520900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (613, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053630520900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (614, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053630520933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (615, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053630520933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (616, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053630521000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (617, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053630521000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (632, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053637286533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (633, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053637286533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (634, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053637746266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (635, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053637746266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (636, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053638264166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (637, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053638264166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (638, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053639300466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (639, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053639300466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (640, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053643029466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (641, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053643029466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (642, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053658026166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (643, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053658026200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (644, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053658618566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (645, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053658618600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (646, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053663340833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (647, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053663340833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (648, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053664259766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (649, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053664259766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (650, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053664681166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (651, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053664681166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (652, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053665091200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (653, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053665091233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (654, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053665685600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (655, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053665685600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (664, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054079724133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (665, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054079724133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (666, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054079724200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (667, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054079724200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (668, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054079724233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (669, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054079724233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (670, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054079724300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (671, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054079724300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (672, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054079724333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (673, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054079724366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (674, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054079724400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (675, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054079724400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (706, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054122617833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (707, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054122617833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (708, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054123647233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (709, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054123647233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (710, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054129991033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (711, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054129991033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (712, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054133727533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (713, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054133727533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (716, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054136953500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (717, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054136953533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (718, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054137999200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (719, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054137999200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (720, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054140527700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (721, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054140527700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (722, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054142643300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (723, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054142643300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (724, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054143597400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (725, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054143597400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (726, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054148186666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (727, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054148186700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (728, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054153001866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (729, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054153001900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (730, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054155419366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (731, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054155419366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (732, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054156712600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (733, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054156712600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (734, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054158201066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (735, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054158201066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (750, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054250434566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (751, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054250434566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (814, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054284435800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (815, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054284435800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (816, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054284435933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (817, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054284435933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (818, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054284436066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (819, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054284436066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (820, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054284436133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (821, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054284436133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (822, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054284436166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (823, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054284436166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (824, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054284436266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (825, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054284436266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (826, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054284929700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (827, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054284929700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (828, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054287379200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (829, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054287379200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (830, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054287438766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (831, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054287438800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (832, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054287438900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (833, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054287438900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (834, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054287438933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (835, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054287438966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (836, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054287439066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (837, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054287439066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (838, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054287439200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (839, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054287439200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (840, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054287439266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (841, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054287439266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (842, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054290978366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (843, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054290978366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (844, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054290978433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (845, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054290978433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (846, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054290978500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (847, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054290978500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (848, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054290978533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (849, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054290978533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (850, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054290978600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (851, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054290978600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (852, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054290978633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (853, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054290978633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (854, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054292982966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (855, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054292982966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (856, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054294606000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (857, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054294606000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (858, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054294606066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (859, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054294606066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (860, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054294606100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (861, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054294606100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (862, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054294606166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (552, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053189202100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (553, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053189202100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (736, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054160771366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (737, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054160771366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (874, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054302229400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (875, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054302229400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (876, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054302229466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (877, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054302229466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (878, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054302229500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (879, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054302229533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (880, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054302229566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (881, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054302229566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (882, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054302229633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (883, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054302229633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (884, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054302229666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (885, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054302229666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (886, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054302496800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (887, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054302496833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (888, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054303773400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (889, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054303773400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (890, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054303879800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (891, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054303879800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (334, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052751872500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (335, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052751872500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (336, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052751872566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (337, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052751872566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (338, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052751872633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (339, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052751872633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (340, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052751872700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (341, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052751872700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (342, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052751872766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (343, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052751872800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (344, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052751872833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (345, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052751872866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (346, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052751903933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (347, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052751903933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (348, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052751903966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (349, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052751903966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (350, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052751904033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (351, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052751904033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (352, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052751904066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (353, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052751904066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (354, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052751904100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (355, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052751904100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (356, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052751904166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (357, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052751904166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (358, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752913300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (359, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752913300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (360, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752913366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (361, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752913366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (362, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752913400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (363, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752913400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (364, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752913466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (365, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752913466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (366, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752913500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (367, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752913500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (368, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752913566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (369, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752913566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (370, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752942066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (371, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752942066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (372, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752942100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (373, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752942100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (374, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752942166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (375, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752942166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (376, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752942200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (377, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752942200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (378, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752942266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (379, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752942266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (380, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752942300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (381, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752942300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (382, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752956133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (383, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752956133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (384, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752956166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (385, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752956200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (386, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752956233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (387, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752956233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (388, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752956266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (389, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752956300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (390, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752956333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (391, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752956333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (392, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752956366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (393, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752956366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (394, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752970400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (395, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052752970400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (396, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752970433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (397, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052752970433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (398, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752970500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (399, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052752970500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (400, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752970533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (401, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052752970533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (402, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752970600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (403, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052752970600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (404, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752970633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (405, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052752970633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (406, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052753028200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (407, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052753028200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (418, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052754150066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (419, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052754150100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (420, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052754150133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (421, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052754150133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (422, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052754150200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (423, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052754150200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (424, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052754150233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (425, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052754150233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (426, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052754150300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (427, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052754150300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (428, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052754150333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (429, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052754150333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (430, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052754938333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (431, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052754938333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (432, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052754938400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (433, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052754938400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (434, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052754938433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (435, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052754938466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (436, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052754938500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (437, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052754938500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (438, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052754938566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (439, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052754938566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (440, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052754938600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (441, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052754938600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (442, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052755957800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (443, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052755957833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (444, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052755957866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (445, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052755957866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (446, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052755957933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (447, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052755957933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (448, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052755957966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (449, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052755957966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (450, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052755958033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (451, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052755958033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (452, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052755958066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (453, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052755958066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (454, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052756835633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (455, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052756835666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (456, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052756835700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (457, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052756835700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (458, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052756835766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (459, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052756835766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (460, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052756835833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (461, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052756835833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (462, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052756835866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (463, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052756835866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (464, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052756835933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (465, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052756835933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (466, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052757410466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (467, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052757410500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (468, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052757410533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (469, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052757410533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (470, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052757410600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (471, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052757410600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (472, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052757410633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (473, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052757410633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (474, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052757410700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (475, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052757410700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (476, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052757410733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (477, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052757410733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (478, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052757974433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (479, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052757974433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (480, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052757974500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (481, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052757974500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (482, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052757974566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (483, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052757974566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (484, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052757974600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (485, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052757974600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (486, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052757974666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (487, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052757974666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (488, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052757974733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (489, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052757974733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (490, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052758425700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (491, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052758425700000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (408, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052753028233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (409, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052753028233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (410, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052753028300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (411, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052753028300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (412, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052753028333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (413, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052753028333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (414, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052753028400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (415, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052753028400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (416, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052753028433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (417, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052753028433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (538, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052767371233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (539, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638052767371233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (540, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052767371266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (541, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638052767371266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (542, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052767371333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (543, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638052767371333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (544, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052767371366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (545, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638052767371366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (546, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052767371433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (547, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638052767371433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (548, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052767371466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (549, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638052767371466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (656, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053666520300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (657, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053666520300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (658, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053667017533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (659, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053667017533333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (662, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054075023566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (663, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054075023600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (676, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054080221800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (677, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054080221800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (678, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054080221866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (679, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054080221866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (680, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054080221900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (681, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054080221900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (682, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054080222000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (683, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054080222000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (684, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054080222066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (685, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054080222066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (686, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054080222100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (687, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054080222100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (688, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054080357266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (689, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054080357266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (704, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054095280600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (705, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054095280600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (752, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054251923200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (753, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054251923200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (592, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053626157200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (593, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053626157200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (594, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053626157233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (595, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053626157233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (596, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053626157300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (597, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053626157300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (598, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053626157366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (599, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053626157366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (600, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053626157400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (601, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053626157400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (602, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053626157433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (603, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053626157433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (618, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053633773900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (619, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638053633773933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (620, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053633773966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (621, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638053633773966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (622, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053633774033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (623, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053633774033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (624, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053633774066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (625, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638053633774066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (626, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053633774133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (627, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638053633774133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (628, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053633774200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (629, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638053633774233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (630, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053635111766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (631, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053635111766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (660, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053669955333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (661, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638053669955366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (690, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054090345800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (691, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054090345800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (692, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054090345833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (693, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054090345833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (694, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054090345900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (695, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054090345900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (696, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054090345933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (697, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054090345933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (698, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054090346000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (699, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054090346000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (700, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054090346033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (701, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054090346033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (702, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054090467166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (703, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054090467166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (754, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273396300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (755, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273396300000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (756, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273396366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (757, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273396366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (758, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273396433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (759, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273396433333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (760, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273396500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (761, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273396500000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (762, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273396566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (763, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273396566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (764, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273396600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (765, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273396600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (766, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273419866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (767, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273419866666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (768, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273419933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (769, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273419933333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (770, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273420000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (771, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273420000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (772, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273420066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (773, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273420066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (774, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273420166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (775, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273420166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (776, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273420200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (777, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273420200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (778, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273443900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (779, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273443900000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (780, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273444000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (781, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273444000000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (782, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273444066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (783, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273444066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (784, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273444166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (785, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273444200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (714, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054135992733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (715, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054135992733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (738, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054250256566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (739, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054250256566666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (740, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054250256600000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (741, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054250256633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (742, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054250256666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (743, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054250256666666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (744, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054250256733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (745, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054250256733333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (746, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054250256766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (747, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054250256766666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (748, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054250256833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (749, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054250256833333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (786, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273444233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (787, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273444233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (788, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273444333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (789, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273444333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (790, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273469066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (791, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054273469066666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (792, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273469166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (793, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054273469166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (794, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273469233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (795, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054273469233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (796, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273469266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (797, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054273469266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (798, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273469366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (799, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054273469366666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (800, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273469400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (801, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054273469400000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (802, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054278776966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (803, 21, N'asdf', N'asdasd@sdasd', 1, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'638054278776966666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (804, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054278777033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (805, 18, N'carlos', N'wqwewq@asd', 1, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'638054278777033333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (806, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054278777100000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (807, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054278777133333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (808, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054278777200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (809, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054278777200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (810, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054278777266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (811, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054278777266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (812, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054278777333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (813, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054278777333333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (872, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054298523466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (873, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054298523466666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (863, 2, N'martin', N'martin@mail.com', 2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'638054294606166666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (864, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054294606200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (865, 23, N'qwertjq', N'8897979', 2, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'638054294606200000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (866, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054294606233333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (867, 22, N'tito', N'a@a', 1, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'638054294606266666')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (868, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054294699800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (869, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054294699800000')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (870, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054295982633333')
GO
INSERT [dbo].[user_changes_control] ([id], [id_usuario], [nic], [mail], [key_idioma], [nombre], [apellido], [telefono], [direccion], [dni], [fecha]) VALUES (871, 1, N'juan', N'juan@mail.com', 2, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'638054295982633333')
GO
SET IDENTITY_INSERT [dbo].[user_changes_control] OFF
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (1, N'juanC', N'castelli', N'1145285750', N'mi direccion', N'1', N'a7c33381185a04f1ea69d658adcecd789498bb84ef7395feb769fbad17ad33ab')
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (2, N'martin', N'rrrr', N'12345678', N'adress', N'12', N'6eb657082206807f666008ec8373691aaa508663c81ef6cec872d2f584dd6bcb')
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (18, N'carlos', N'asdasd', N'12312', N'qweqw1', N'12312', N'3fa1c5df4a87f3b3aa5d68fad67451dd93e23b015465506e4a26b39177943f20')
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (21, N'asd', N'sdqwe', N'11', N'dasdasd', N'123', N'f996c606751741cbc9cc387793aee50c47e89e5d4d499ec668ccfe53bbdbea66')
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (22, N'qweqwe', N'qweqweqwe', N'1231231211', N'sdasdasdasd', N'123123', N'dd5d4fc3e03179ae9dc794f03a3728f51bd4a41778d037d9722022d8eb362dfc')
GO
INSERT [dbo].[usuario_data] ([id_usuario], [nombre], [apellido], [telefono], [direccion], [dni], [dvh]) VALUES (23, N'qwertyu', N'asd', N'345345345', N'asdfadvd', N'345345345', N'20dbf6268eea433df53e37a5e58a7253e97fe0b95e33f43790750970d4b8880e')
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 
GO
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (21, N'asdf', N'7c13c90fc7bca100f46b7fe3024974274e018949f7b820eef83254db9648b36a', N'asdasd@sdasd', 1, 0, 0, N'f996c606751741cbc9cc387793aee50c47e89e5d4d499ec668ccfe53bbdbea66')
GO
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (18, N'carlos', N'e1df45ab86870fb474c9d6fa5999ef72b4711806cc157f37cfe67a512dce79b4', N'wqwewq@asd', 1, 0, 0, N'3fa1c5df4a87f3b3aa5d68fad67451dd93e23b015465506e4a26b39177943f20')
GO
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (1, N'juan', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'juan@mail.com', 2, 0, 0, N'a7c33381185a04f1ea69d658adcecd789498bb84ef7395feb769fbad17ad33ab')
GO
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (2, N'martin', N'f1e200e2e30e9562a580ef850792b8c664ce89593276c3e93fbe3e9a4c2cb9e9', N'martin@mail.com', 2, 0, 0, N'6eb657082206807f666008ec8373691aaa508663c81ef6cec872d2f584dd6bcb')
GO
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (23, N'qwertjq', N'214b3a71c51f19de7642180d0125b97d68ecb641d33173f0639469eee65aaac4', N'8897979', 2, 0, 0, N'20dbf6268eea433df53e37a5e58a7253e97fe0b95e33f43790750970d4b8880e')
GO
INSERT [dbo].[usuarios] ([id_usuario], [nic], [password], [mail], [key_idioma], [intentos], [bloqueado], [dvh]) VALUES (22, N'tito', N'57c12086feb49c1bee19debf7cdd9066bab6e2c5c0fba2e295fbbd828b53d770', N'a@a', 1, 0, 0, N'dd5d4fc3e03179ae9dc794f03a3728f51bd4a41778d037d9722022d8eb362dfc')
GO
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 11)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (2, 1)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (13, 3)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (11, 3)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (12, 3)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (8, 3)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (1, 3)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (18, 3)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (18, 12)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 4)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 5)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 12)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (22, 10)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (23, 12)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (17, 12)
GO
INSERT [dbo].[usuarios_permisos] ([id_usuario], [id_permiso]) VALUES (21, 12)
GO
SET IDENTITY_INSERT [dbo].[venta] ON 
GO
INSERT [dbo].[venta] ([id], [fecha], [idUsuario], [idCupon], [dvh], [subTotal], [total]) VALUES (1, N'638052908308342103', 1, NULL, N'523f15c60a1e3adab8594b29f08822efcba404248d8e4585dd93fd5d7968f2ee', N'10', N'10')
GO
INSERT [dbo].[venta] ([id], [fecha], [idUsuario], [idCupon], [dvh], [subTotal], [total]) VALUES (12, N'638054298575506918', 1, NULL, N'd6765b1595e51821350701ac9a045fb5b02a80d58df5d61d143c4e4049ebe03a', N'1000.0000', N'1000.0000')
GO
SET IDENTITY_INSERT [dbo].[venta] OFF
GO
INSERT [dbo].[venta_producto] ([idVenta], [idProducto]) VALUES (1, 1)
GO
INSERT [dbo].[venta_producto] ([idVenta], [idProducto]) VALUES (1, 2)
GO
INSERT [dbo].[venta_producto] ([idVenta], [idProducto]) VALUES (12, 1)
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
