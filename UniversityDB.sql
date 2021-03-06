USE [master]
GO
/****** Object:  Database [UniversityDb]    Script Date: 17/08/2020 04:35:19 PM ******/
CREATE DATABASE [UniversityDb] ON  PRIMARY 
( NAME = N'UniversityDb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\UniversityDb.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDb_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\UniversityDb_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDb] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UniversityDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UniversityDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UniversityDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDb] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDb] SET DB_CHAINING OFF 
GO
USE [UniversityDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17/08/2020 04:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 17/08/2020 04:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [varchar](50) NOT NULL,
	[CoursName] [varchar](50) NOT NULL,
	[CourseCredit] [real] NOT NULL,
	[CourseDescription] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[Student_StudentId] [int] NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 17/08/2020 04:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Departmentid] [int] IDENTITY(1,1) NOT NULL,
	[DepartmementCode] [varchar](7) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Departments] PRIMARY KEY CLUSTERED 
(
	[Departmentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 17/08/2020 04:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[SemesterId] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Semesters] PRIMARY KEY CLUSTERED 
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 17/08/2020 04:35:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 17/08/2020 04:35:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[Courses]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SemesterId]    Script Date: 17/08/2020 04:35:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_SemesterId] ON [dbo].[Courses]
(
	[SemesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_StudentId]    Script Date: 17/08/2020 04:35:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_StudentId] ON [dbo].[Courses]
(
	[Student_StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DepartmentId]    Script Date: 17/08/2020 04:35:20 PM ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentId] ON [dbo].[Students]
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Courses_dbo.Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Departmentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_dbo.Courses_dbo.Departments_DepartmentId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Courses_dbo.Semesters_SemesterId] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semesters] ([SemesterId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_dbo.Courses_dbo.Semesters_SemesterId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Courses_dbo.Students_Student_StudentId] FOREIGN KEY([Student_StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_dbo.Courses_dbo.Students_Student_StudentId]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Students_dbo.Departments_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Departmentid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_dbo.Students_dbo.Departments_DepartmentId]
GO
USE [master]
GO
ALTER DATABASE [UniversityDb] SET  READ_WRITE 
GO
