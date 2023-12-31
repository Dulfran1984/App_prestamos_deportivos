USE [master]
GO
/****** Object:  Database [dbs_prestamos_deportivos]    Script Date: 8/11/2023 5:14:59 p. m. ******/
CREATE DATABASE [dbs_prestamos_deportivos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbs_prestamos_deportivos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\dbs_prestamos_deportivos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbs_prestamos_deportivos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\dbs_prestamos_deportivos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbs_prestamos_deportivos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET  MULTI_USER 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET QUERY_STORE = OFF
GO
USE [dbs_prestamos_deportivos]
GO
/****** Object:  Table [dbo].[tbl_det_prestamos]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_det_prestamos](
	[PKItem] [bigint] IDENTITY(1,1) NOT NULL,
	[FKNumero_tbl_prestamos] [bigint] NOT NULL,
	[FKCodigo_tbl_implementos] [varchar](10) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha_devolucion] [date] NULL,
	[Hora_devolucion] [time](7) NULL,
	[Observaciones] [varchar](5000) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estado]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estado](
	[PKCodigo] [char](1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Nomenclatura] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_implementos]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_implementos](
	[PKCodigo] [varchar](10) NOT NULL,
	[Nombre] [varchar](80) NOT NULL,
	[Especificaciones] [varchar](5000) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Valor] [float] NOT NULL,
	[Fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_personas]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_personas](
	[PKId] [varchar](10) NOT NULL,
	[P_nombre] [varchar](40) NOT NULL,
	[S_nombre] [varchar](40) NULL,
	[P_apellido] [varchar](40) NOT NULL,
	[S_apellido] [varchar](40) NULL,
	[Contacto] [varchar](10) NOT NULL,
	[Correo] [varchar](80) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[FKId_tbl_sexo] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_prestamos]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_prestamos](
	[PKNumero] [bigint] IDENTITY(1,1) NOT NULL,
	[FKId_tbl_personas] [varchar](10) NOT NULL,
	[FKUsuario_tbl_usuarios] [varchar](100) NOT NULL,
	[Fecha_registro] [date] NULL,
	[Hora_registro] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKNumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rol]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rol](
	[PKCodigo] [char](1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Nomenclatura] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sexo]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sexo](
	[PKId] [char](1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Nomenclatura] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[PKUsuario] [varchar](100) NOT NULL,
	[Contraseña] [varchar](10) NOT NULL,
	[FKId_tbl_personas] [varchar](10) NOT NULL,
	[Fecha] [date] NULL,
	[FKCodigo_tbl_estado] [char](1) NULL,
	[FKCodigo_tbl_rol] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_det_prestamos] ON 

INSERT [dbo].[tbl_det_prestamos] ([PKItem], [FKNumero_tbl_prestamos], [FKCodigo_tbl_implementos], [Cantidad], [Fecha_devolucion], [Hora_devolucion], [Observaciones]) VALUES (1, 1, N'001', 5, NULL, NULL, NULL)
INSERT [dbo].[tbl_det_prestamos] ([PKItem], [FKNumero_tbl_prestamos], [FKCodigo_tbl_implementos], [Cantidad], [Fecha_devolucion], [Hora_devolucion], [Observaciones]) VALUES (2, 1, N'001', 5, NULL, NULL, NULL)
INSERT [dbo].[tbl_det_prestamos] ([PKItem], [FKNumero_tbl_prestamos], [FKCodigo_tbl_implementos], [Cantidad], [Fecha_devolucion], [Hora_devolucion], [Observaciones]) VALUES (3, 2, N'001', 2, NULL, NULL, NULL)
INSERT [dbo].[tbl_det_prestamos] ([PKItem], [FKNumero_tbl_prestamos], [FKCodigo_tbl_implementos], [Cantidad], [Fecha_devolucion], [Hora_devolucion], [Observaciones]) VALUES (4, 2, N'002', 2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_det_prestamos] OFF
GO
INSERT [dbo].[tbl_estado] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'1', N'Activo', N'A')
INSERT [dbo].[tbl_estado] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'2', N'Inactivo', N'I')
GO
INSERT [dbo].[tbl_implementos] ([PKCodigo], [Nombre], [Especificaciones], [Cantidad], [Valor], [Fecha]) VALUES (N'001', N'Balón', N'Futbol profesional No. 5', 28, 200000, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[tbl_implementos] ([PKCodigo], [Nombre], [Especificaciones], [Cantidad], [Valor], [Fecha]) VALUES (N'002', N'Balón', N'VoleiBol', 8, 150000, CAST(N'2023-11-02' AS Date))
GO
INSERT [dbo].[tbl_personas] ([PKId], [P_nombre], [S_nombre], [P_apellido], [S_apellido], [Contacto], [Correo], [Direccion], [FKId_tbl_sexo]) VALUES (N'123', N'DULFRAN', N'ANTONIO', N'MONTAÑO', N'MONTAÑO', N'3004640398', N'dulfranelinge@gmail.com', N'La navarra', N'1')
GO
SET IDENTITY_INSERT [dbo].[tbl_prestamos] ON 

INSERT [dbo].[tbl_prestamos] ([PKNumero], [FKId_tbl_personas], [FKUsuario_tbl_usuarios], [Fecha_registro], [Hora_registro]) VALUES (1, N'123', N'123.DULFRANMONTAÑO', CAST(N'2023-11-02' AS Date), CAST(N'20:23:27' AS Time))
INSERT [dbo].[tbl_prestamos] ([PKNumero], [FKId_tbl_personas], [FKUsuario_tbl_usuarios], [Fecha_registro], [Hora_registro]) VALUES (2, N'123', N'123.DULFRANMONTAÑO', CAST(N'2023-11-02' AS Date), CAST(N'20:29:34' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_prestamos] OFF
GO
INSERT [dbo].[tbl_rol] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'1', N'Administrador', N'A')
INSERT [dbo].[tbl_rol] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'2', N'Entrenador', N'E')
INSERT [dbo].[tbl_rol] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'3', N'Prestador', N'P')
INSERT [dbo].[tbl_rol] ([PKCodigo], [Nombre], [Nomenclatura]) VALUES (N'4', N'Sin asignar', N'S')
GO
INSERT [dbo].[tbl_sexo] ([PKId], [Nombre], [Nomenclatura]) VALUES (N'1', N'Masculino', N'M')
INSERT [dbo].[tbl_sexo] ([PKId], [Nombre], [Nomenclatura]) VALUES (N'2', N'Femenino', N'F')
INSERT [dbo].[tbl_sexo] ([PKId], [Nombre], [Nomenclatura]) VALUES (N'3', N'Prefiero no decirlo', N'P')
GO
INSERT [dbo].[tbl_usuarios] ([PKUsuario], [Contraseña], [FKId_tbl_personas], [Fecha], [FKCodigo_tbl_estado], [FKCodigo_tbl_rol]) VALUES (N'123.DULFRANMONTAÑO', N'123', N'123', CAST(N'2023-10-31' AS Date), N'1', N'4')
GO
ALTER TABLE [dbo].[tbl_det_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_prestamos_tbl_implementos] FOREIGN KEY([FKCodigo_tbl_implementos])
REFERENCES [dbo].[tbl_implementos] ([PKCodigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tbl_det_prestamos] CHECK CONSTRAINT [FK_tbl_det_prestamos_tbl_implementos]
GO
ALTER TABLE [dbo].[tbl_det_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_det_prestamos_tbl_prestamos] FOREIGN KEY([FKNumero_tbl_prestamos])
REFERENCES [dbo].[tbl_prestamos] ([PKNumero])
GO
ALTER TABLE [dbo].[tbl_det_prestamos] CHECK CONSTRAINT [FK_tbl_det_prestamos_tbl_prestamos]
GO
ALTER TABLE [dbo].[tbl_personas]  WITH CHECK ADD  CONSTRAINT [FK_tbl_personas_tbl_sexo] FOREIGN KEY([FKId_tbl_sexo])
REFERENCES [dbo].[tbl_sexo] ([PKId])
GO
ALTER TABLE [dbo].[tbl_personas] CHECK CONSTRAINT [FK_tbl_personas_tbl_sexo]
GO
ALTER TABLE [dbo].[tbl_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_prestamos_tbl_personas] FOREIGN KEY([FKId_tbl_personas])
REFERENCES [dbo].[tbl_personas] ([PKId])
GO
ALTER TABLE [dbo].[tbl_prestamos] CHECK CONSTRAINT [FK_tbl_prestamos_tbl_personas]
GO
ALTER TABLE [dbo].[tbl_prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_prestamos_tbl_usuarios] FOREIGN KEY([FKUsuario_tbl_usuarios])
REFERENCES [dbo].[tbl_usuarios] ([PKUsuario])
GO
ALTER TABLE [dbo].[tbl_prestamos] CHECK CONSTRAINT [FK_tbl_prestamos_tbl_usuarios]
GO
ALTER TABLE [dbo].[tbl_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_usuarios_tbl_estado] FOREIGN KEY([FKCodigo_tbl_estado])
REFERENCES [dbo].[tbl_estado] ([PKCodigo])
GO
ALTER TABLE [dbo].[tbl_usuarios] CHECK CONSTRAINT [FK_tbl_usuarios_tbl_estado]
GO
ALTER TABLE [dbo].[tbl_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_usuarios_tbl_personas] FOREIGN KEY([FKId_tbl_personas])
REFERENCES [dbo].[tbl_personas] ([PKId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tbl_usuarios] CHECK CONSTRAINT [FK_tbl_usuarios_tbl_personas]
GO
ALTER TABLE [dbo].[tbl_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_usuarios_tbl_rol] FOREIGN KEY([FKCodigo_tbl_rol])
REFERENCES [dbo].[tbl_rol] ([PKCodigo])
GO
ALTER TABLE [dbo].[tbl_usuarios] CHECK CONSTRAINT [FK_tbl_usuarios_tbl_rol]
GO
/****** Object:  StoredProcedure [dbo].[SP_Actualizar_implemento]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date,,31 de octubre del 2023>
-- Description:	<Description,,Actualizar implemento>
-- =============================================
create procedure [dbo].[SP_Actualizar_implemento]
@codigo varchar(10),@nombre varchar(80),@especificaciones varchar(5000),
@cantidad int, @valor float
as begin
	update tbl_implementos
	set
	Nombre = @nombre,
	Especificaciones = @especificaciones,
	Cantidad = @cantidad,
	Valor = @valor
	where
	PKCodigo = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarImplemento]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date, 26 de octubre del 2023>
-- Description:	<Description,,Agregar implementos>
-- =============================================
CREATE procedure [dbo].[SP_AgregarImplemento]
@codigo varchar(10),@nombre varchar(80),@especificaciones varchar(5000),
@cantidad int, @valor float
as begin
	insert into tbl_implementos
	(PKCodigo,Nombre,Especificaciones,Cantidad,Valor,Fecha)
	values
	(@codigo,@nombre,@especificaciones,@cantidad,@valor,GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarImplemento]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date,,26 de octubre del 2023>
-- Description:	<Description, Consultar implemento>
-- =============================================
create procedure [dbo].[SP_ConsultarImplemento]
@codigo varchar(10)
as begin
	select
	Nombre,
	Especificaciones,
	Cantidad,
	Valor
	from tbl_implementos
	where
	PKCodigo = @codigo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_consultarpersona]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date,,31 de octubre del 2023>
-- Description:	<Description,,Consultar persona>
-- =============================================
create procedure [dbo].[SP_consultarpersona]
@id varchar(10)
as begin
	declare @completo varchar(100)
	select 
	P_nombre + ' '+ S_nombre + ' ' + P_apellido + ' ' + S_apellido 
	from
	tbl_personas
	where
	PKId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPrestamos]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date,,07 de noviembre del 2023>
-- Description:	<Description,,Consultar prestamos>
-- =============================================
CREATE procedure [dbo].[SP_ConsultarPrestamos]
@id_persona varchar(10)
as begin
	select 
	tbl_det_prestamos.FKNumero_tbl_prestamos as 'Prestamo No.',
	tbl_implementos.Nombre + ' ' + tbl_implementos.Especificaciones as 'Implemento',
	tbl_det_prestamos.Cantidad as 'Cantidad',
	tbl_prestamos.Fecha_registro as 'Fecha de prestamo',
	tbl_det_prestamos.Fecha_devolucion as 'Fecha devolución',
	tbl_det_prestamos.Hora_devolucion as 'Hora devolución',
	tbl_det_prestamos.Observaciones as 'Observaciones'
	from
	tbl_det_prestamos,tbl_prestamos,tbl_personas,tbl_implementos
	where
	tbl_prestamos.PKNumero = tbl_det_prestamos.FKNumero_tbl_prestamos and
	tbl_personas.PKId = tbl_prestamos.FKId_tbl_personas and
	tbl_personas.PKId = @id_persona and 
	tbl_implementos.PKCodigo = tbl_det_prestamos.FKCodigo_tbl_implementos
end
GO
/****** Object:  StoredProcedure [dbo].[SP_Generardetprestamo]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date,,02 de noviembre del 2023>
-- Description:	<Description,,Generar det prestamo>
-- =============================================
CREATE procedure [dbo].[SP_Generardetprestamo]
@cod_implemento varchar(10),@cantidad int
as begin
	declare @existencias_imp int
	declare @numero_prestamo bigint
	select @numero_prestamo = (select max(PKNumero) from tbl_prestamos)
	select @existencias_imp = (select Cantidad from tbl_implementos where PKCodigo = @cod_implemento)
	insert into tbl_det_prestamos
	(FKNumero_tbl_prestamos,FKCodigo_tbl_implementos,Cantidad)
	values
	(@numero_prestamo,@cod_implemento,@cantidad)

	update tbl_implementos
	set Cantidad = (@existencias_imp - @cantidad) where PKCodigo = @cod_implemento
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GenerarPrestamo]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dulfran Montaño>
-- Create date: <Create Date,,02 de noviembre del 2023>
-- Description:	<Description,,Generar prestamo>
-- =============================================
create procedure [dbo].[SP_GenerarPrestamo]
@id_persona varchar(10), @user varchar(100)
as begin
	insert into tbl_prestamos
	(FKId_tbl_personas,FKUsuario_tbl_usuarios,Fecha_registro,Hora_registro)
	values
	(@id_persona,@user,GETDATE(),CURRENT_TIMESTAMP)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarPersonas]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dulfran Montaño>
-- Create date: <Create Date, 12 de octubre del 2023>
-- Description:	<Description, Registrar personas>
-- =============================================
create procedure [dbo].[SP_RegistrarPersonas]
@id varchar(10),@p_nombre varchar(40),@s_nombre varchar(40),@p_apellido varchar(40),
@s_apellido varchar(40),@contacto varchar(10),@correo varchar(80),
@direccion varchar(100),@sexo char
as begin
	insert into tbl_personas
	(PKId,P_nombre,S_nombre,P_apellido,S_apellido,Contacto,Correo,Direccion,FKId_tbl_sexo)
	values
	(@id,@p_nombre,@s_nombre,@p_apellido,@s_apellido,@contacto,@correo,@direccion,@sexo)
end
GO
/****** Object:  Trigger [dbo].[TRG_RegistrarUsuario]    Script Date: 8/11/2023 5:15:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Dulfran Montaño>
-- Create date: <Create Date, 12 de octubre del 2023>
-- Description:	<Description,Registro Usuario>
-- =============================================
CREATE TRIGGER [dbo].[TRG_RegistrarUsuario] 
   ON  [dbo].[tbl_personas] 
   AFTER INSERT
AS 
BEGIN
	declare @id varchar(10)
	declare @p_nombre varchar(40)
	declare @p_apellido varchar(40)
	declare @user varchar(100)

	SET NOCOUNT ON;
	select @id = (select PKId from inserted)
	select @p_nombre = (select P_nombre from inserted)
	select @p_apellido = (select P_apellido from inserted)
    select @user = @id + '.' + @p_nombre + @p_apellido
	insert into tbl_usuarios
	(PKUsuario,Contraseña,FKId_tbl_personas,Fecha,FKCodigo_tbl_estado,FKCodigo_tbl_rol)
	values
	(@user,@id,@id,GETDATE(),1,4)

END
GO
ALTER TABLE [dbo].[tbl_personas] ENABLE TRIGGER [TRG_RegistrarUsuario]
GO
USE [master]
GO
ALTER DATABASE [dbs_prestamos_deportivos] SET  READ_WRITE 
GO
