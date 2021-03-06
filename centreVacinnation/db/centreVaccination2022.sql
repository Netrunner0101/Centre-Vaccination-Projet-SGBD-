USE [master]
GO
/****** Object:  Database [centreVaccination]    Script Date: 29/01/2022 00:28:08 ******/
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
/****** Object:  Table [dbo].[centreVaccination]    Script Date: 29/01/2022 00:28:08 ******/
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
/****** Object:  Table [dbo].[horaire]    Script Date: 29/01/2022 00:28:08 ******/
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
/****** Object:  Table [dbo].[patient]    Script Date: 29/01/2022 00:28:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[idPatient] [bigint] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NULL,
	[prenom] [varchar](50) NULL,
	[numeroNational] [varchar](50) NULL,
	[dateNaissance] [date] NULL,
	[adresse] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[idSiege] [bigint] NULL,
	[idCentre] [bigint] NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[idPatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personnel]    Script Date: 29/01/2022 00:28:08 ******/
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
/****** Object:  Table [dbo].[reservation]    Script Date: 29/01/2022 00:28:08 ******/
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
/****** Object:  Table [dbo].[siegeCentre]    Script Date: 29/01/2022 00:28:08 ******/
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
/****** Object:  Table [dbo].[vaccin]    Script Date: 29/01/2022 00:28:08 ******/
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
