USE [master]
GO
/****** Object:  Database [centreVaccination]    Script Date: 27/01/2022 17:39:17 ******/
CREATE DATABASE [centreVaccination]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'centreVaccination', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\centreVaccination.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'centreVaccination_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\centreVaccination_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [centreVaccination] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [centreVaccination].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [centreVaccination] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [centreVaccination] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [centreVaccination] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [centreVaccination] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [centreVaccination] SET ARITHABORT OFF 
GO
ALTER DATABASE [centreVaccination] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [centreVaccination] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [centreVaccination] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [centreVaccination] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [centreVaccination] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [centreVaccination] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [centreVaccination] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [centreVaccination] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [centreVaccination] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [centreVaccination] SET  DISABLE_BROKER 
GO
ALTER DATABASE [centreVaccination] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [centreVaccination] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [centreVaccination] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [centreVaccination] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [centreVaccination] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [centreVaccination] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [centreVaccination] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [centreVaccination] SET RECOVERY FULL 
GO
ALTER DATABASE [centreVaccination] SET  MULTI_USER 
GO
ALTER DATABASE [centreVaccination] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [centreVaccination] SET DB_CHAINING OFF 
GO
ALTER DATABASE [centreVaccination] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [centreVaccination] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [centreVaccination] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [centreVaccination] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'centreVaccination', N'ON'
GO
ALTER DATABASE [centreVaccination] SET QUERY_STORE = OFF
GO
USE [centreVaccination]
GO
/****** Object:  Table [dbo].[centreVaccination]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[centreVaccination](
	[idCentre] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[adresse] [varchar](50) NULL,
	[idSiege] [bigint] NULL,
 CONSTRAINT [PK_centreVaccination] PRIMARY KEY CLUSTERED 
(
	[idCentre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horaire]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horaire](
	[idHoraire] [bigint] IDENTITY(1,1) NOT NULL,
	[idCentre] [bigint] NULL,
	[idPersonnel] [bigint] NULL,
	[dateHoraire] [date] NULL,
	[horaireDebut] [time](0) NULL,
	[horaireFin] [time](0) NULL,
 CONSTRAINT [PK_horaire] PRIMARY KEY CLUSTERED 
(
	[idHoraire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[idPatient] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[prenom] [varchar](50) NULL,
	[numeroNational] [bigint] NULL,
	[dateNaissance] [date] NULL,
	[adresse] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[age] [int] NULL,
	[idSiege] [bigint] NULL,
	[idCentre] [bigint] NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personnel]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personnel](
	[idPersonnel] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[prenom] [varchar](50) NULL,
	[occupation] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[idCentre] [bigint] NULL,
 CONSTRAINT [PK_personnel] PRIMARY KEY CLUSTERED 
(
	[idPersonnel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reservation]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reservation](
	[idReservation] [bigint] IDENTITY(1,1) NOT NULL,
	[idCentre] [bigint] NULL,
	[idPatient] [bigint] NULL,
	[idVaccin] [bigint] NULL,
	[DateReservation] [date] NULL,
	[TimeReservation] [time](0) NULL,
 CONSTRAINT [PK_reservation] PRIMARY KEY CLUSTERED 
(
	[idReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siegeCentre]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siegeCentre](
	[idSiege] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[adresse] [varchar](50) NULL,
 CONSTRAINT [PK_siegeCentre] PRIMARY KEY CLUSTERED 
(
	[idSiege] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vaccin]    Script Date: 27/01/2022 17:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vaccin](
	[idVaccin] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[duree] [int] NULL,
	[idCentre] [bigint] NULL,
 CONSTRAINT [PK_vaccin] PRIMARY KEY CLUSTERED 
(
	[idVaccin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[centreVaccination] ON 

INSERT [dbo].[centreVaccination] ([idCentre], [nom], [email], [adresse], [idSiege]) VALUES (1, N'Centre 1', N'centre@gmail.com', N'Rue de Anvers', 1)
INSERT [dbo].[centreVaccination] ([idCentre], [nom], [email], [adresse], [idSiege]) VALUES (2, N'Centre Binche', N'binche@centre.com', N'Rue des Carnavals', NULL)
SET IDENTITY_INSERT [dbo].[centreVaccination] OFF
GO
SET IDENTITY_INSERT [dbo].[horaire] ON 

INSERT [dbo].[horaire] ([idHoraire], [idCentre], [idPersonnel], [dateHoraire], [horaireDebut], [horaireFin]) VALUES (1, 2, 1, CAST(N'2020-07-10' AS Date), CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[horaire] ([idHoraire], [idCentre], [idPersonnel], [dateHoraire], [horaireDebut], [horaireFin]) VALUES (2, 1, 1, CAST(N'2021-02-19' AS Date), CAST(N'10:00:00' AS Time), CAST(N'20:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[horaire] OFF
GO
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([idPatient], [nom], [prenom], [numeroNational], [dateNaissance], [adresse], [email], [age], [idSiege], [idCentre]) VALUES (1, N'Jackouille', N'Paul', 54891729, CAST(N'1990-01-10' AS Date), N'Rue des Patates', N'paul@hotmail.com', 35, 1, 1)
INSERT [dbo].[patient] ([idPatient], [nom], [prenom], [numeroNational], [dateNaissance], [adresse], [email], [age], [idSiege], [idCentre]) VALUES (2, N'Obiwan', N'Kenobi', 456678823, CAST(N'2001-12-23' AS Date), N'Rue de Tournai', N'Obiwan@gmail.com', 20, 1, 2)
SET IDENTITY_INSERT [dbo].[patient] OFF
GO
SET IDENTITY_INSERT [dbo].[personnel] ON 

INSERT [dbo].[personnel] ([idPersonnel], [nom], [prenom], [occupation], [email], [idCentre]) VALUES (1, N'Tran', N'Jake', N'Médecin', N'tran@centre.com', 2)
INSERT [dbo].[personnel] ([idPersonnel], [nom], [prenom], [occupation], [email], [idCentre]) VALUES (2, N'Obiwan', N'Kenobi', NULL, N'Obiwan@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[personnel] OFF
GO
SET IDENTITY_INSERT [dbo].[reservation] ON 

INSERT [dbo].[reservation] ([idReservation], [idCentre], [idPatient], [idVaccin], [DateReservation], [TimeReservation]) VALUES (1, 1, 1, 1, CAST(N'2020-01-02' AS Date), CAST(N'18:00:00' AS Time))
INSERT [dbo].[reservation] ([idReservation], [idCentre], [idPatient], [idVaccin], [DateReservation], [TimeReservation]) VALUES (3, 1, 2, 1, CAST(N'2021-09-11' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[reservation] ([idReservation], [idCentre], [idPatient], [idVaccin], [DateReservation], [TimeReservation]) VALUES (4, NULL, 2, 2, CAST(N'2020-07-10' AS Date), CAST(N'17:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[siegeCentre] ON 

INSERT [dbo].[siegeCentre] ([idSiege], [nom], [adresse]) VALUES (1, N'Siege centre vaccination', N'Rue de Bruxelles')
SET IDENTITY_INSERT [dbo].[siegeCentre] OFF
GO
SET IDENTITY_INSERT [dbo].[vaccin] ON 

INSERT [dbo].[vaccin] ([idVaccin], [nom], [duree], [idCentre]) VALUES (1, N'Sputnik', 20, 2)
INSERT [dbo].[vaccin] ([idVaccin], [nom], [duree], [idCentre]) VALUES (2, N'Astrazeneca', 25, 1)
SET IDENTITY_INSERT [dbo].[vaccin] OFF
GO
ALTER TABLE [dbo].[centreVaccination]  WITH CHECK ADD  CONSTRAINT [FK_centreVaccination_siegeCentre] FOREIGN KEY([idSiege])
REFERENCES [dbo].[siegeCentre] ([idSiege])
GO
ALTER TABLE [dbo].[centreVaccination] CHECK CONSTRAINT [FK_centreVaccination_siegeCentre]
GO
ALTER TABLE [dbo].[horaire]  WITH CHECK ADD  CONSTRAINT [FK_horaire_centreVaccination] FOREIGN KEY([idCentre])
REFERENCES [dbo].[centreVaccination] ([idCentre])
GO
ALTER TABLE [dbo].[horaire] CHECK CONSTRAINT [FK_horaire_centreVaccination]
GO
ALTER TABLE [dbo].[horaire]  WITH CHECK ADD  CONSTRAINT [FK_horaire_personnel] FOREIGN KEY([idPersonnel])
REFERENCES [dbo].[personnel] ([idPersonnel])
GO
ALTER TABLE [dbo].[horaire] CHECK CONSTRAINT [FK_horaire_personnel]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_centreVaccination] FOREIGN KEY([idCentre])
REFERENCES [dbo].[centreVaccination] ([idCentre])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK_patient_centreVaccination]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_siegeCentre] FOREIGN KEY([idSiege])
REFERENCES [dbo].[siegeCentre] ([idSiege])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [FK_patient_siegeCentre]
GO
ALTER TABLE [dbo].[personnel]  WITH CHECK ADD  CONSTRAINT [FK_personnel_centreVaccination] FOREIGN KEY([idCentre])
REFERENCES [dbo].[centreVaccination] ([idCentre])
GO
ALTER TABLE [dbo].[personnel] CHECK CONSTRAINT [FK_personnel_centreVaccination]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_centreVaccination] FOREIGN KEY([idCentre])
REFERENCES [dbo].[centreVaccination] ([idCentre])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_centreVaccination]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_patient] FOREIGN KEY([idPatient])
REFERENCES [dbo].[patient] ([idPatient])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_patient]
GO
ALTER TABLE [dbo].[reservation]  WITH CHECK ADD  CONSTRAINT [FK_reservation_vaccin] FOREIGN KEY([idVaccin])
REFERENCES [dbo].[vaccin] ([idVaccin])
GO
ALTER TABLE [dbo].[reservation] CHECK CONSTRAINT [FK_reservation_vaccin]
GO
ALTER TABLE [dbo].[vaccin]  WITH CHECK ADD  CONSTRAINT [FK_vaccin_centreVaccination] FOREIGN KEY([idCentre])
REFERENCES [dbo].[centreVaccination] ([idCentre])
GO
ALTER TABLE [dbo].[vaccin] CHECK CONSTRAINT [FK_vaccin_centreVaccination]
GO
USE [master]
GO
ALTER DATABASE [centreVaccination] SET  READ_WRITE 
GO
