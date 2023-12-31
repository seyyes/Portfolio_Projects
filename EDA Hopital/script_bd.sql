USE [master]
GO
/****** Object:  Database [Hopital]    Script Date: 01/07/2023 14:31:10 ******/
CREATE DATABASE [Hopital]
 GO
ALTER DATABASE [Hopital] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hopital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hopital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hopital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hopital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hopital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hopital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hopital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hopital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hopital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hopital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hopital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hopital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hopital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hopital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hopital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hopital] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hopital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hopital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hopital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hopital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hopital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hopital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hopital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hopital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hopital] SET  MULTI_USER 
GO
ALTER DATABASE [Hopital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hopital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hopital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hopital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hopital]
GO
/****** Object:  User [m1si-MEDE]    Script Date: 01/07/2023 14:31:10 ******/
CREATE USER [m1si-MEDE] FOR LOGIN [m1si-MEDE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [m1si-MEDE]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [m1si-MEDE]
GO
/****** Object:  Table [dbo].[Actes]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actes](
	[NumActe] [int] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Rapport] [varchar](25) NOT NULL,
	[NumMed] [int] NOT NULL,
	[NumDossier] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalisation]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalisation](
	[NumDossier] [int] IDENTITY(1,5) NOT NULL,
	[idPatient] [int] NOT NULL,
	[Date_Ent] [date] NOT NULL,
	[Date_Sort] [date] NOT NULL,
	[Pathologie] [varchar](20) NOT NULL,
	[NumLit] [int] NULL,
	[Medecin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumDossier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LitService]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LitService](
	[NumLit] [int] NOT NULL,
	[numserv] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumLit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medecin]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medecin](
	[NumMed] [int] IDENTITY(11,10) NOT NULL,
	[Nom] [varchar](30) NOT NULL,
	[Prénom] [varchar](30) NULL,
	[numserv] [tinyint] NOT NULL,
	[specialite] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumMed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicament]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicament](
	[Designation] [varchar](20) NOT NULL,
	[Numautorisation] [varchar](5) NOT NULL,
	[Indication] [varchar](30) NOT NULL,
	[Tableau] [varchar](1) NOT NULL,
	[Prix_dose] [float] NULL,
	[PosoMax_jour] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Designation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[idPatient] [int] IDENTITY(1000,1) NOT NULL,
	[NumSecu] [varchar](15) NOT NULL,
	[Nom] [varchar](20) NOT NULL,
	[Prénom] [varchar](20) NOT NULL,
	[DateNaiss] [date] NOT NULL,
	[LieuNaiss] [varchar](20) NULL,
	[Sexe] [varchar](1) NOT NULL,
	[Adresse] [varchar](50) NULL,
	[AllergiesCI] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[Numpres] [int] NOT NULL,
	[Datepres] [datetime] NOT NULL,
	[Duree] [tinyint] NOT NULL,
	[NumMed] [int] NOT NULL,
	[NumDossier] [int] NOT NULL,
	[Designation] [varchar](20) NOT NULL,
	[Posologie] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Numpres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[numserv] [tinyint] NOT NULL,
	[Nomserv] [varchar](20) NULL,
	[Localisation] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numserv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifs]    Script Date: 01/07/2023 14:31:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifs](
	[Type] [varchar](10) NOT NULL,
	[Prix] [numeric](5, 2) NOT NULL,
 CONSTRAINT [pkT] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (1, N'radio', CAST(N'2017-12-07T00:00:00.000' AS DateTime), N'radio du bras gauche, OK', 91, 6)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (2, N'operation', CAST(N'2017-11-16T00:00:00.000' AS DateTime), N'cataracte', 61, 11)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (3, N'examens', CAST(N'2017-12-18T00:00:00.000' AS DateTime), N'radiothérapie à régler', 51, 1)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (4, N'examens', CAST(N'2017-11-11T00:00:00.000' AS DateTime), N'tests réactions', 51, 16)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (5, N'radio', CAST(N'2017-11-25T10:00:00.000' AS DateTime), N'radio du bassin', 91, 21)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (6, N'accouchemt', CAST(N'2017-11-25T13:00:00.000' AS DateTime), N'accouchement VB, OK', 41, 21)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (7, N'accouchemt', CAST(N'2017-12-06T00:00:00.000' AS DateTime), N'accouchement VB', 41, 56)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (347, N'examens', CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'ok', 121, 191)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (9, N'examens', CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'tout va bien', 101, 186)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (10, N'consult', CAST(N'2017-12-05T00:00:00.000' AS DateTime), N'Decès', 131, 121)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (18998, N'accouchemt', CAST(N'2018-01-01T00:00:00.000' AS DateTime), N'le bébé est une fille', 91, 266)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (45, N'radio', CAST(N'2018-02-15T00:00:00.000' AS DateTime), N'TEST', 31, 396)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (666, N'radio', CAST(N'2004-11-11T00:00:00.000' AS DateTime), N'cassé', 91, 346)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (111, N'consult', CAST(N'2018-02-15T00:00:00.000' AS DateTime), N'lol', 71, 406)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (222, N'consult', CAST(N'2017-11-22T00:00:00.000' AS DateTime), N'pré natal vérifier bassin', 41, 21)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (223, N'examens', CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'post partum épisio', 41, 21)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (224, N'operation', CAST(N'2017-11-26T00:00:00.000' AS DateTime), N'épisio', 41, 21)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (225, N'péridurale', CAST(N'2017-11-25T00:00:00.000' AS DateTime), N'aide au bébé', 151, 21)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (13666, N'consult', CAST(N'2019-02-03T00:00:00.000' AS DateTime), N'Le Cerveauuuuuuu!', 31, 856)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (1453, N'operation', CAST(N'2002-01-01T00:00:00.000' AS DateTime), N'RAS', 81, 886)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (148965, N'radio', CAST(N'2019-01-02T00:00:00.000' AS DateTime), N'Garçon', 131, 881)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (547, N'examens', CAST(N'2019-01-31T00:00:00.000' AS DateTime), N'la plus intelligente', 11, 1111)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (51, N'radio', CAST(N'2020-01-24T11:00:00.000' AS DateTime), N'légère fracture', 91, 1351)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (8, N'examens', CAST(N'2017-11-24T00:00:00.000' AS DateTime), N'Tout est OK ! :) ', 71, 91)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (42, N'examens', CAST(N'2017-12-10T00:00:00.000' AS DateTime), N'Toujours immortel', 131, 101)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (10230, N'accouchemt', CAST(N'2017-11-02T00:00:00.000' AS DateTime), N'yolo', 61, 181)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (54, N'examens', CAST(N'2017-11-06T00:00:00.000' AS DateTime), N'Pas bon', 61, 96)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (142, N'consult', CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'Manque de motivation', 81, 231)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (11, N'operation', CAST(N'2017-12-06T00:00:00.000' AS DateTime), N'ablation appendice', 81, 41)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (12, N'radio', CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'stabilisation tumeur', 91, 1)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (1, N'radio', CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'bras droit', 91, 11)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (213, N'operation', CAST(N'2018-04-10T00:00:00.000' AS DateTime), N'RIP LE FOOT :(', 61, 916)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (124897, N'péridurale', CAST(N'1905-06-24T00:00:00.000' AS DateTime), N'évacuation tacos', 131, 1176)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (4697, N'consult', CAST(N'2019-01-02T00:00:00.000' AS DateTime), N'Intubation', 101, 901)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (2189, N'operation', CAST(N'2018-10-01T12:12:00.000' AS DateTime), N'Impeccable', 111, 891)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (20, N'consult', CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'ça fait mal', 101, 866)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (154861, N'radio', CAST(N'9000-09-12T00:00:00.000' AS DateTime), N'AmourEauFraiche', 131, 996)
INSERT [dbo].[Actes] ([NumActe], [Type], [Date], [Rapport], [NumMed], [NumDossier]) VALUES (9, N'examens', CAST(N'2019-01-30T00:00:00.000' AS DateTime), N'ça va mal', 111, 991)
GO
SET IDENTITY_INSERT [dbo].[Hospitalisation] ON 

INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1, 1000, CAST(N'2017-12-02' AS Date), CAST(N'2017-12-05' AS Date), N'cancer', 214, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (6, 1001, CAST(N'2017-12-07' AS Date), CAST(N'2017-12-11' AS Date), N'fracture', 142, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (11, 1002, CAST(N'2017-11-23' AS Date), CAST(N'2017-11-24' AS Date), N'cataracte', 123, 11)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (16, 1003, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-18' AS Date), N'allergie', 315, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (21, 1004, CAST(N'2017-11-25' AS Date), CAST(N'2017-12-08' AS Date), N'accouchement', 237, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (26, 1005, CAST(N'2017-11-25' AS Date), CAST(N'2017-12-12' AS Date), N'prema', 115, 141)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (31, 1006, CAST(N'2017-12-05' AS Date), CAST(N'2017-12-07' AS Date), N'kyste', 239, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (36, 1007, CAST(N'2017-11-27' AS Date), CAST(N'2017-12-08' AS Date), N'accident circulation', 125, 81)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (41, 1008, CAST(N'2017-12-06' AS Date), CAST(N'2017-12-08' AS Date), N'appendicite', 275, 111)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (56, 1009, CAST(N'2017-12-06' AS Date), CAST(N'2017-12-08' AS Date), N'accouchement', 235, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (61, 1000, CAST(N'2017-12-06' AS Date), CAST(N'2017-12-09' AS Date), N'cancer', 214, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (86, 1014, CAST(N'2017-11-25' AS Date), CAST(N'2017-11-25' AS Date), N'Morte', 214, 111)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (91, 1011, CAST(N'2016-11-24' AS Date), CAST(N'2017-11-24' AS Date), N'Rhume', NULL, 71)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (96, 1020, CAST(N'2017-11-03' AS Date), CAST(N'2017-11-06' AS Date), N'péritonite', 237, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (101, 1015, CAST(N'2017-12-09' AS Date), CAST(N'2017-12-10' AS Date), N'Immortalité', 142, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (121, 1019, CAST(N'2017-12-02' AS Date), CAST(N'2017-12-06' AS Date), N'Rhume des foins', 411, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (181, 1017, CAST(N'2017-11-29' AS Date), CAST(N'2017-12-01' AS Date), N'LUPUS', 115, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (186, 1029, CAST(N'2017-12-10' AS Date), CAST(N'2017-12-10' AS Date), N'appendicite', 115, 101)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (191, 1021, CAST(N'2017-12-10' AS Date), CAST(N'2017-12-10' AS Date), N'Grippe', 214, 121)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (231, 1041, CAST(N'2017-11-06' AS Date), CAST(N'2017-11-11' AS Date), N'Déchirure musculaire', 142, 81)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (236, 1008, CAST(N'2017-12-03' AS Date), CAST(N'2017-12-10' AS Date), N'fracture', 275, 101)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (266, 1036, CAST(N'2017-12-08' AS Date), CAST(N'2017-12-10' AS Date), N'chico pourries', 214, 91)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (281, 1012, CAST(N'2017-12-10' AS Date), CAST(N'2017-12-10' AS Date), N'inconnu', 115, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (291, 1008, CAST(N'2017-12-03' AS Date), CAST(N'2017-12-10' AS Date), N'tumeur', 275, 101)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (331, 1039, CAST(N'2017-12-15' AS Date), CAST(N'2017-12-15' AS Date), N'Grippe', 115, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (346, 1061, CAST(N'2002-11-11' AS Date), CAST(N'2004-11-11' AS Date), N'fracture', 115, 91)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (396, 1064, CAST(N'2018-02-15' AS Date), CAST(N'2018-02-16' AS Date), N'JavaError', 352, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (406, 1067, CAST(N'2018-02-10' AS Date), CAST(N'2018-02-14' AS Date), N'diabete', NULL, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (431, 1062, CAST(N'2019-01-02' AS Date), CAST(N'2019-01-05' AS Date), N'hémoragie', NULL, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (451, 1094, CAST(N'2018-01-31' AS Date), CAST(N'2018-02-01' AS Date), N'allergie', 214, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (461, 1077, CAST(N'2018-02-15' AS Date), CAST(N'2018-02-25' AS Date), N'psychopathie', 315, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (486, 1085, CAST(N'2018-02-15' AS Date), CAST(N'2018-09-15' AS Date), N'coeur de foudre', 115, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (601, 1105, CAST(N'2019-03-12' AS Date), CAST(N'2019-08-13' AS Date), N'Blessures morales', NULL, 41)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (631, 1113, CAST(N'2018-06-01' AS Date), CAST(N'2018-06-03' AS Date), N'Jambe cassée', 123, 71)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (641, 1117, CAST(N'2018-02-01' AS Date), CAST(N'2018-02-03' AS Date), N'Capitalisme', 117, 151)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (646, 1128, CAST(N'1997-12-01' AS Date), CAST(N'2018-05-14' AS Date), N'fuin jutsu', 115, 11)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (651, 1108, CAST(N'2019-02-01' AS Date), CAST(N'2019-02-03' AS Date), N'coeur brisé', 115, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (671, 1103, CAST(N'2019-01-21' AS Date), CAST(N'2019-01-25' AS Date), N'Grippe', 115, 11)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (696, 1106, CAST(N'2019-01-01' AS Date), CAST(N'2019-02-02' AS Date), N'fracture', 123, 11)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (711, 1105, CAST(N'2018-12-05' AS Date), CAST(N'2018-12-12' AS Date), N'Blessures morales', 237, 41)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (731, 1107, CAST(N'2018-05-11' AS Date), CAST(N'2018-05-12' AS Date), N'Chirurgie', 115, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (736, 1104, CAST(N'2019-01-15' AS Date), CAST(N'2019-02-01' AS Date), N'Fracture nez', 119, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (781, 1130, CAST(N'2019-01-12' AS Date), CAST(N'2019-01-15' AS Date), N'Fracture', 117, NULL)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (791, 1123, CAST(N'2016-11-25' AS Date), CAST(N'2016-11-27' AS Date), N'grammaire douteuse', 117, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (816, 1116, CAST(N'2012-12-12' AS Date), CAST(N'2012-12-13' AS Date), N'tumeur', 214, 121)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (831, 1121, CAST(N'2019-01-06' AS Date), CAST(N'2019-01-20' AS Date), N'jambe cassée', 352, 111)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (836, 1125, CAST(N'2019-01-12' AS Date), CAST(N'2019-01-16' AS Date), N'grippe', 115, 41)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (851, 1114, CAST(N'2007-01-30' AS Date), CAST(N'2007-01-31' AS Date), N'grippe', 115, 41)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (856, 1140, CAST(N'2019-02-01' AS Date), CAST(N'2019-02-01' AS Date), N'LaFlemme', 816, 31)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (866, 1139, CAST(N'2018-12-31' AS Date), CAST(N'2019-01-01' AS Date), N'accident', 123, 101)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (881, 1148, CAST(N'2019-01-15' AS Date), CAST(N'2019-02-01' AS Date), N'Accouchement', 115, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (886, 1138, CAST(N'2002-01-01' AS Date), CAST(N'2009-01-01' AS Date), N'Rhume', 444, 81)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (891, 1153, CAST(N'2018-01-10' AS Date), CAST(N'2018-01-11' AS Date), N'ligaments croisés', 142, 111)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (901, 1144, CAST(N'2018-01-01' AS Date), CAST(N'2019-01-09' AS Date), N'allergie', 214, 101)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (916, 1143, CAST(N'2018-10-04' AS Date), CAST(N'2019-04-04' AS Date), N'Ligament croisés', 214, 61)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (991, 1155, CAST(N'2019-01-30' AS Date), CAST(N'2019-01-31' AS Date), N'Transaminases', 217, 111)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (996, 1149, CAST(N'0001-01-04' AS Date), CAST(N'9000-12-09' AS Date), N'Bycéphalie', 235, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1096, 1158, CAST(N'2018-12-31' AS Date), CAST(N'2019-01-12' AS Date), N'accouchement', 214, 141)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1111, 1156, CAST(N'2018-12-31' AS Date), CAST(N'2019-01-31' AS Date), N'varicelle', 115, 11)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1146, 1159, CAST(N'2017-10-24' AS Date), CAST(N'2017-11-02' AS Date), N'Grippe', 411, 71)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1176, 1173, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-22' AS Date), N'Indigestion de ouf', 235, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1181, 1167, CAST(N'1998-02-05' AS Date), CAST(N'2014-01-10' AS Date), N'besoin dattention', 123, 21)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1216, 1163, CAST(N'2012-01-02' AS Date), CAST(N'2666-12-31' AS Date), N'tropbeau', 1, 131)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1306, 1177, CAST(N'2019-01-02' AS Date), CAST(N'2019-01-04' AS Date), N'Grippe', 1, 71)
INSERT [dbo].[Hospitalisation] ([NumDossier], [idPatient], [Date_Ent], [Date_Sort], [Pathologie], [NumLit], [Medecin]) VALUES (1351, 1179, CAST(N'2020-01-24' AS Date), CAST(N'2020-01-24' AS Date), N'Examens', 411, 121)
SET IDENTITY_INSERT [dbo].[Hospitalisation] OFF
GO
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (1, 2)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (115, 11)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (117, 11)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (119, 10)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (123, 1)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (125, 10)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (142, 2)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (145, 2)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (168, 11)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (214, 5)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (217, 2)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (235, 4)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (237, 4)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (239, 4)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (241, 4)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (275, 3)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (315, 7)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (352, 6)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (411, 8)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (414, 3)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (420, 4)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (444, 4)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (512, 5)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (518, 5)
INSERT [dbo].[LitService] ([NumLit], [numserv]) VALUES (816, 8)
GO
SET IDENTITY_INSERT [dbo].[Medecin] ON 

INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (11, N'King', N'Coralie', 1, N'ophtalmologiste')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (21, N'Knock', NULL, 10, N'généraliste')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (31, N'Diafoirus', N'Thomas', 5, N'cancérologue')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (41, N'Duberstein', N'Paul', 4, N'obstétricien')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (51, N'Capoulosse', N'Georges', 5, N'généraliste')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (61, N'House', N'Gregory', 10, N'généraliste')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (71, N'Grey', N'Meredith', 3, N'pédiatre')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (81, N'Ross', N'Doug', 8, N'chirurgien')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (91, N'March', N'Jean', 9, N'radiologue')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (101, N'Sloan', N'Mark', 8, N'gastro-entérologue')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (111, N'Shepperd', N'Derek', 2, N'chirurgien')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (121, N'Bailey', N'Miranda', 10, N'généraliste')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (131, N'Weber', N'Richard', 4, N'gynécolologue')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (141, N'Robins', N'Arizona', 11, N'pédiatre')
INSERT [dbo].[Medecin] ([NumMed], [Nom], [Prénom], [numserv], [specialite]) VALUES (151, N'Denis', N'Marc', 10, N'anesthésiste')
SET IDENTITY_INSERT [dbo].[Medecin] OFF
GO
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'berocca', N'GC753', N'asthenie', N'D', 0.44, 6)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'collyre A', N'OC123', N'brulure ophtalmique', N'C', 1.28, 3)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'collyre B', N'OC654', N'conjonctivite', N'C', 0.98, 3)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'doliprane', N'KD387', N'antalgique', N'D', 0.28, 12)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'dramamine', N'DH791', N'nausees', N'B', 0.23, 4)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'ergix', N'GC159', N'antalgique', N'D', 0.28, 4)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'guronsan', N'GC426', N'asthenie', N'D', 0.65, 3)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'imodium', N'DA003', N'diarrhée', N'A', 0.06, 3)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'kendix', N'DC357', N'herpes', N'B', 0.8, 3)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'lamaline', N'MP934', N'antalgique', N'B', 0.28, 6)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'lamisilate', N'DC951', N'antifongique', N'A', 8.94, 3)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'spasfon', N'AS759', N'antispasmodique', N'A', 0.05, 6)
INSERT [dbo].[Medicament] ([Designation], [Numautorisation], [Indication], [Tableau], [Prix_dose], [PosoMax_jour]) VALUES (N'vogalib', N'CL654', N'nausees', N'B', 0.24, 3)
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1000, N'148067534265122', N'Renoir', N'Jacques', CAST(N'1948-06-21' AS Date), N'Paris', N'M', N'Rue Massena', N'arachide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1001, N'1520954237986', N'Bosch', N'Joseph', CAST(N'1952-09-13' AS Date), N'Nancy', N'M', NULL, NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1002, N'158116942365798', N'Halambique', N'Nestor', CAST(N'1958-11-24' AS Date), N'Lyon', N'M', NULL, N'lait vache')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1003, N'1680433984236', N'Zola', N'Gaston', CAST(N'1968-04-06' AS Date), N'Bordeaux', N'M', NULL, N'noix')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1004, N'282095423798621', N'Marat', N'Lucrèce', CAST(N'1989-08-12' AS Date), N'Toul', N'F', NULL, NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1005, N'117026991295467', N'Martin', N'Victor', CAST(N'2017-02-25' AS Date), N'Lyon', N'M', NULL, NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1006, N'267050162428132', N'Dormant', N'Belle', CAST(N'1967-05-13' AS Date), N'Nantua', N'F', NULL, N'lait vache')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1007, N'291117404312675', N'Neige', N'Blanche', CAST(N'1991-11-21' AS Date), N'Annecy', N'F', NULL, N'crustacés')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1008, N'178063506424722', N'DUPONT', N'Irène', CAST(N'2001-05-22' AS Date), N'Rennes', N'F', NULL, N'arachide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1009, N'201031445935795', N'Grazzi', N'Ornella', CAST(N'2001-03-07' AS Date), N'Caen', N'F', N'Rome', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1010, N'185075984294382', N'Bloche', N'Jérome', CAST(N'1985-07-21' AS Date), N'Dunkerque', N'M', N'Paris', N'noix')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1011, N'2154876520369', N'Godzilla', N'Laetitia', CAST(N'1993-12-05' AS Date), N'Lyon 9', N'M', N'Chasselay', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1012, N'425874', N'him', N'soph', CAST(N'1995-11-24' AS Date), N'Lyon', N'F', N'Seattle', N'BS')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1014, N'26925246424324', N'Khemir', N'Ferda', CAST(N'1999-05-29' AS Date), N'lyon', N'F', N'54 fggqfgsdfgfd', N'opium')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1015, N'555', N'WADE', N'Wilson', CAST(N'1990-01-01' AS Date), N'Arizona', N'M', N'New York', N'Agent Mutagène X')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1017, N'1111111111', N'Godet', N'Mäel', CAST(N'1992-08-11' AS Date), N'quelquepart', N'M', N'quelquepart', N'bêtise')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1018, N'199455887845', N'le croquant', N'Jacquou', CAST(N'1994-04-20' AS Date), N'le bronx', N'M', N'la duchère', N'noisettes')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1019, N'2452545125125', N'Jacques', N'Jean', CAST(N'1999-04-04' AS Date), N'Bulgarie', N'M', N'55 rue després', N'banane')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1020, N'1780356000136', N'RORO', N'Dan', CAST(N'1978-01-06' AS Date), N'Toulouse', N'M', N'23 rue', N'crustacés')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1021, N'012654879854', N'Delobel', N'Maxime', CAST(N'1995-07-07' AS Date), N'Montelimar', N'M', N' Rien', N'Rien')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1029, N'295079137721301', N'Labasque', N'Caroline', CAST(N'1995-07-01' AS Date), N'Massy', N'F', N'6 petite rue de Monplaisir 69008 Lyon', N'Fraise')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1035, N'314', N'DARK', N'VADOR', CAST(N'2200-10-10' AS Date), N'etoile Noir', N'M', N'32 rue toatoine', N' jedi')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1036, N'199455887845', N'la fripouille', N'Jacquouille', CAST(N'1994-04-20' AS Date), N'93 sisi', N'M', N'le tiéquart ', N'sarrazin')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1039, N'209054958815780', N'Norris', N'Chuck', CAST(N'1990-01-17' AS Date), N'Lyon', N'M', N'Paris', N'Chocolat blanc')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1041, N'2900500547875', N'Des Montagnes', N'George', CAST(N'1990-05-04' AS Date), N'Au bout du monde', N'F', N'3069 Piton des Neiges', N'Moustiques et à tout ce qui pique')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1061, N'211111111111111', N'legendre', N'katia', CAST(N'1995-11-28' AS Date), N'Saint_doul', N'f', N'8765745', N'')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1062, N'87647476456', N'Pierre', N'Paul', CAST(N'1980-01-02' AS Date), N'Paris', N'M', N'Rue université', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1063, N'22333579551', N'LOVELACE', N'ada', CAST(N'1800-02-13' AS Date), N'londinuim', N'f', N'23 rue de britannia', N'cancer du sein')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1064, N'123456', N'DUFNERR', N'Thibault', CAST(N'1996-06-01' AS Date), N'Lille', N'M', N'25 rue de lyon,69630 CHAPONOST', N'ASSE')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1066, N'1233', N'Batman', N'bruce', CAST(N'1973-02-13' AS Date), N'gotham', N'm', N'23 rue de britannia', N'le joker')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1067, N'555', N'Prebet', N'Marine', CAST(N'2010-02-15' AS Date), N'Lyon', N'F', NULL, NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1070, N'2942526355', N'BEAUNE', N'JONATHAN', CAST(N'1996-01-01' AS Date), N'PARIS', N'm', N'LYON', N'Aurélien Cheyrou-Lagrèze')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1075, N'123', N'DHOUIB', N'Fatma', CAST(N'1993-07-16' AS Date), N'Tunis', N'F', N'4 Ruelle Du Grand Casernement 69007', N'Fraise')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1077, N'1564541', N'HUMBERT', N'Hippolyte', CAST(N'1996-03-20' AS Date), N'Rillieux', N'M', N'Quelquepart', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1080, N'127960001', N'Schellen', N'Alexis', CAST(N'1996-01-27' AS Date), N'Vénissieux', N'M', N'Route du bois', N'')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1085, N'1233', N'yoda', N'green', CAST(N'8000-02-13' AS Date), N'tatouine', N'm', N'23 rue des jedi', N'le coté obscure')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1086, N'1233', N'pikachu', N'pika', CAST(N'1996-02-13' AS Date), N'tokyo', N'm', N'23 rue de nintendo', N'la team rocket')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1094, N'1026002000', N'KOCHARYAN', N'Davit', CAST(N'1995-10-22' AS Date), N'Lyon', N'M', N'57 Rue Longefer', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1096, N'123456789', N'SCHMIDT', N'Angèle', CAST(N'1996-10-22' AS Date), N'lyon', N'F', N'4 rue audibert et lavirotte', N'noisettes')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1097, N'1233', N'super', N'man', CAST(N'8000-02-13' AS Date), N'tatouine', N'm', N'23 rue des jedi', N'kriptonite')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1098, N'1233', N'PROPRE', N'monsieur', CAST(N'2000-02-13' AS Date), N'tokyo', N'm', N'23 rue de nintendo', N'noix')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1102, N'111111111', N'GVJJ', N'dfghjk', CAST(N'1995-11-28' AS Date), NULL, N'm', NULL, NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1103, N'29751455452', N'TAHRI', N'Loubna', CAST(N'1997-10-24' AS Date), N'Lyon', N'F', N'2 rue de la république', N'vide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1104, N'194126945645622', N'JEDUSOR', N'Tom', CAST(N'1994-12-29' AS Date), N'Londres', N'M', N'12 Allée des embrumes', N'VIDE')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1105, N'3652554', N'LALANE', N'Francis', CAST(N'1997-08-15' AS Date), N'Los Angeles', N'M', N'8 Rue du bonheur', N'Amour')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1106, N'12234211236', N'AKHI', N'Potter', CAST(N'1996-06-07' AS Date), N'Londres', N'M', N'359 Champagne', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1107, N'2981287456251', N'GRANGER', N'Hermione', CAST(N'1998-12-22' AS Date), N'Londres', N'F', N'Allée des Ambrumes', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1108, N'456465', N'DESCHAMPS', N'DIDIER', CAST(N'1997-02-21' AS Date), N'Tataouin', N'F', N'3 rue de la coupe du monde', N'acariens')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1113, N'444444444', N'ROSENBERG', N'Francis', CAST(N'1997-01-04' AS Date), N'Lyon', N'F', N'26 boulevard Bertillon', N'Chat')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1114, N'356354621654', N'PIERRE', N'Pierre', CAST(N'2000-02-01' AS Date), N'Lyon', N'M', N'rue Blandan', N'vide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1116, N'123456789101112', N'MANSIER', N'Elise', CAST(N'1996-12-04' AS Date), N'Lyon', N'F', N'Lyon', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1117, N'1234567890', N'STALINE', N'Joseph', CAST(N'1901-01-01' AS Date), N'Moscou', N'M', N'7 rue du Communisme Victorieux', N'non')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1119, N'012345678912345', N'OVÉ', N'Garance', CAST(N'1995-02-03' AS Date), N'Lyon 2eme', N'F', N'Lyon', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1121, N'012345678912345', N'MUSELLI', N'Manon', CAST(N'1996-10-09' AS Date), N'Ajaccio', N'F', N'Lyon 3', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1123, N'1940750158987', N'RYBÉRY', N'Frank', CAST(N'1994-08-25' AS Date), N'Poudlard', N'M', N'34 Rue de la magie', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1125, N'4561234', N'MARO', N'Alice', CAST(N'1998-05-12' AS Date), N'Lyon', N'F', N'3 rue Santy', N'vide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1128, N'12121212125', N'TUCHE', N'Michalac', CAST(N'1998-02-17' AS Date), N'stade de france', N'M', N' 8 rue de la coupe dhu monde', N'souris')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1129, N'17181512136', N'MOUTON', N'Lola', CAST(N'2019-12-12' AS Date), N'Paris', N'F', N'18, rue de la République', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1130, N'2971069125612', N'WISLEY', N'Ron', CAST(N'1995-02-12' AS Date), N'Ecosse', N'M', N'20 chemin de Poudlard', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1135, N'1111121111111', N'LILY', N'Tchintchin', CAST(N'1948-06-21' AS Date), N'IAE Lyon', N'M', N'6 cours tohmas albert', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1136, N'1234246246272', N'LE FRANÇAIS', N'François', CAST(N'1995-10-24' AS Date), N'Lyon', N'M', N'8 rue de la france', N'ibu')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1138, N'123456789', N'KUTAY', N'ilkay', CAST(N'1997-01-14' AS Date), N'Viriat', N'M', N'Akatsuki', N'pomme')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1139, N'123456', N'BONNIN', N'Lison', CAST(N'1998-03-31' AS Date), N'Lyon', N'F', N'montée de la boucle', N'graminés')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1140, N'19695666666666', N'ALEXANDRE', N'Tristan', CAST(N'1996-04-30' AS Date), N'Quelquespart', N'M', N'vtff', N'pleindetrucs')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1143, N'1971201154896', N'UCHIHA', N'Itachi', CAST(N'1997-12-24' AS Date), N'Dans ma baignoire', N'M', N'Konoha', N'Fruits et légumes')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1144, N'1234567896', N'FOURNIER', N'Clémence', CAST(N'1997-06-04' AS Date), N'Annecy', N'F', N'7 rue des Marronniers', N' ')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1148, N'145698264', N'BERNARD', N'Thomas', CAST(N'1997-07-19' AS Date), N'Macon', N'M', N'St-Cyr', N'')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1149, N'666', N'AFEU', N'PIERRE', CAST(N'0002-01-05' AS Date), N'Mesopôtamie', N'M', N'Croissant Fertile', N'Dindon')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1153, N'19673264875', N'VAN DAMME', N'Jean-Claude', CAST(N'1960-10-18' AS Date), N'Berchem', N'M', N'45 rue castagne', N'poire')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1155, N'556564557', N'BAKIR', N'Lilia', CAST(N'1997-12-24' AS Date), N'Lyon', N'F', N'Rue des poilus', N'Légumes')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1156, N'514751904123', N'BOUTAHRA', N'Yasmine', CAST(N'1997-06-11' AS Date), N'st etienne', N'F', N'rue Victor Hugo', N'aucune')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1158, N'292036548521', N'SAUCISSE', N'Hotdog', CAST(N'1985-01-01' AS Date), N'Paris', N'F', N'8 rue Musset 97200', N'néant')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1159, N'2970374549851', N'PICOLLET', N'Sharon', CAST(N'1997-03-30' AS Date), N'Lyon', N'F', N'2 rue de la fac', N'aucune')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1160, N'29548761986374', N'WONDER', N'Woman', CAST(N'1995-08-23' AS Date), N'Corse', N'F', N'7 rue DuJamaisVu', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1163, N'1120197661214', N'BADIN', N'Louis', CAST(N'1997-01-12' AS Date), N'paradis', N'M', N'99rue paradis', N'arachide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1164, N'12546859758457', N'BOUZIDI', N'Manel', CAST(N'1997-07-17' AS Date), N'Lyon', N'F', N'21 Baker Street', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1165, N'15525632145632', N'EL MADDARSI', N'Halima', CAST(N'1997-11-22' AS Date), N'Casablanca', N'F', N'2 rue du diapason', NULL)
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1167, N'069120925641997', N'HERNANDEZ', N'Joaquim', CAST(N'1997-12-09' AS Date), N'Medellin', N'M', N'11 rue abysses', N'arachide')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1170, N'12345', N'BENNAI', N'farid', CAST(N'1989-06-06' AS Date), N'lyon', N'M', N'rue v', N'aucune')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1173, N'19706457898', N'CORDONBLEU', N'Tacos', CAST(N'1995-08-17' AS Date), N'Lyon', N'M', N'Rue des kebabs', N'Andalouse')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1176, N'2947400200000', N'FAUCK', N'Adeline', CAST(N'1994-03-28' AS Date), N'GVA', N'F', NULL, N'aucune')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1177, N'296119935065', N'LAKHIRY', N'Ghita', CAST(N'1996-11-01' AS Date), N'Casablanca', N'F', N'Rue Guilloud', N'AINS')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1178, N'2581473690123', N'MC', N'Solaar', CAST(N'1996-07-11' AS Date), N'Lyon', N'M', N'101 rue Solaar', N'bonbon')
INSERT [dbo].[Patient] ([idPatient], [NumSecu], [Nom], [Prénom], [DateNaiss], [LieuNaiss], [Sexe], [Adresse], [AllergiesCI]) VALUES (1179, N'2480137125423', N'GRANDJEAN', N'Josette', CAST(N'1948-01-27' AS Date), N'Tours', N'F', N'85 avenue Berthelot Lyon', NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (1, CAST(N'2017-11-14T00:00:00.000' AS DateTime), 6, 51, 11, N'collyre A', 3)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (2, CAST(N'2017-11-26T00:00:00.000' AS DateTime), 8, 41, 26, N'ergix', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (3, CAST(N'2017-11-12T00:00:00.000' AS DateTime), 5, 51, 16, N'vogalib', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (4, CAST(N'2017-12-06T00:00:00.000' AS DateTime), 6, 11, 31, N'collyre A', 3)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (5, CAST(N'2017-11-26T00:00:00.000' AS DateTime), 14, 11, 21, N'lamaline', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (6, CAST(N'2017-11-12T00:00:00.000' AS DateTime), 5, 51, 16, N'vogalib', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (7, CAST(N'2017-12-09T00:00:00.000' AS DateTime), 8, 31, 6, N'ergix', 6)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (8, CAST(N'2017-11-26T00:00:00.000' AS DateTime), 15, 61, 26, N'lamisilate', 3)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (9, CAST(N'2017-12-06T00:00:00.000' AS DateTime), 10, 21, 61, N'lamaline', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (10, CAST(N'2017-12-09T00:00:00.000' AS DateTime), 5, 31, 6, N'dramamine', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (11, CAST(N'2017-12-09T00:00:00.000' AS DateTime), 15, 121, 61, N'guronsan', 1)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (12, CAST(N'2017-12-05T00:00:00.000' AS DateTime), 6, 61, 236, N'lamaline', 4)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (13, CAST(N'2019-01-07T00:00:00.000' AS DateTime), 6, 101, 901, N'collyre A', 2)
INSERT [dbo].[Prescription] ([Numpres], [Datepres], [Duree], [NumMed], [NumDossier], [Designation], [Posologie]) VALUES (14, CAST(N'2020-01-24T00:00:00.000' AS DateTime), 8, 11, 1351, N'collyre B', 3)
GO
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (1, N'ophtalmologie', N'Batiment G')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (2, N'chirurgie', N'Batiment B')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (3, N'pédiatrie', N'Batiment E')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (4, N'gynecologie', N'Batiment E')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (5, N'cancerologie', N'Batiment B')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (6, N'ORL', N'Batiment G')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (7, N'dermatologie', N'Batiment A')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (8, N'gastro-entérologie', N'Batiment C')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (9, N'radiologie', N'Batiment D')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (10, N'urgences', N'Batiment A')
INSERT [dbo].[Service] ([numserv], [Nomserv], [Localisation]) VALUES (11, N'néonatologie', N'Batiment E')
GO
INSERT [dbo].[Tarifs] ([Type], [Prix]) VALUES (N'accouchemt', CAST(456.00 AS Numeric(5, 2)))
INSERT [dbo].[Tarifs] ([Type], [Prix]) VALUES (N'consult', CAST(17.10 AS Numeric(5, 2)))
INSERT [dbo].[Tarifs] ([Type], [Prix]) VALUES (N'examens', CAST(90.25 AS Numeric(5, 2)))
INSERT [dbo].[Tarifs] ([Type], [Prix]) VALUES (N'operation', CAST(522.50 AS Numeric(5, 2)))
INSERT [dbo].[Tarifs] ([Type], [Prix]) VALUES (N'péridurale', CAST(75.00 AS Numeric(5, 2)))
INSERT [dbo].[Tarifs] ([Type], [Prix]) VALUES (N'radio', CAST(42.75 AS Numeric(5, 2)))
GO
ALTER TABLE [dbo].[Actes]  WITH CHECK ADD FOREIGN KEY([NumDossier])
REFERENCES [dbo].[Hospitalisation] ([NumDossier])
GO
ALTER TABLE [dbo].[Actes]  WITH CHECK ADD FOREIGN KEY([NumMed])
REFERENCES [dbo].[Medecin] ([NumMed])
GO
ALTER TABLE [dbo].[Actes]  WITH CHECK ADD  CONSTRAINT [fkAT] FOREIGN KEY([Type])
REFERENCES [dbo].[Tarifs] ([Type])
GO
ALTER TABLE [dbo].[Actes] CHECK CONSTRAINT [fkAT]
GO
ALTER TABLE [dbo].[Hospitalisation]  WITH CHECK ADD FOREIGN KEY([idPatient])
REFERENCES [dbo].[Patient] ([idPatient])
GO
ALTER TABLE [dbo].[Hospitalisation]  WITH CHECK ADD FOREIGN KEY([Medecin])
REFERENCES [dbo].[Medecin] ([NumMed])
GO
ALTER TABLE [dbo].[Hospitalisation]  WITH CHECK ADD FOREIGN KEY([NumLit])
REFERENCES [dbo].[LitService] ([NumLit])
GO
ALTER TABLE [dbo].[LitService]  WITH CHECK ADD FOREIGN KEY([numserv])
REFERENCES [dbo].[Service] ([numserv])
GO
ALTER TABLE [dbo].[Medecin]  WITH CHECK ADD FOREIGN KEY([numserv])
REFERENCES [dbo].[Service] ([numserv])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([Designation])
REFERENCES [dbo].[Medicament] ([Designation])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([NumDossier])
REFERENCES [dbo].[Hospitalisation] ([NumDossier])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD FOREIGN KEY([NumMed])
REFERENCES [dbo].[Medecin] ([NumMed])
GO
USE [master]
GO
ALTER DATABASE [Hopital] SET  READ_WRITE 
GO
