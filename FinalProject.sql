USE [master]
GO
/****** Object:  Database [FinalProject]    Script Date: 7/4/2023 2:52:41 PM ******/
CREATE DATABASE [FinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FinalProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FinalProject_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FinalProject.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FinalProject] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject] SET RECOVERY FULL 
GO
ALTER DATABASE [FinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FinalProject', N'ON'
GO
ALTER DATABASE [FinalProject] SET QUERY_STORE = OFF
GO
USE [FinalProject]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/4/2023 2:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/4/2023 2:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/4/2023 2:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/4/2023 2:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/4/2023 2:52:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[UserProfession] [int] NULL,
	[ImageURL] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Age] [tinyint] NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[EducationId] [int] NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [int] NULL,
	[UserPostJobId] [int] NULL,
	[PostJobId] [int] NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[DateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Icon] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Educations]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Educations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EducationName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Educations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTypes]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WorkType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_JobTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SenderName] [nvarchar](max) NOT NULL,
	[SenderEmail] [nvarchar](max) NOT NULL,
	[SenderPhone] [nvarchar](max) NULL,
	[ReceiverName] [nvarchar](max) NOT NULL,
	[ReceiverEmail] [nvarchar](max) NOT NULL,
	[ReceiverPhone] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Created] [datetime2](7) NULL,
	[SenderId] [int] NULL,
	[ReceiverId] [int] NULL,
	[CategoryId] [int] NULL,
	[PositionId] [int] NULL,
	[PostJobId] [int] NULL,
	[UserPostJobId] [int] NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](max) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostJobs]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostJobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[JobTypeId] [int] NOT NULL,
	[Experience] [int] NULL,
	[WorkExperienceId] [int] NULL,
	[Salary] [decimal](18, 2) NULL,
	[CityId] [int] NULL,
	[EducationId] [int] NULL,
	[LanguageId] [int] NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Website] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MinAge] [int] NOT NULL,
	[MaxAge] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[PositionId] [int] NULL,
 CONSTRAINT [PK_PostJobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPostJobs]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPostJobs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[JobTypeId] [int] NOT NULL,
	[Experience] [int] NULL,
	[WorkExperienceId] [int] NULL,
	[Salary] [decimal](18, 2) NULL,
	[CityId] [int] NULL,
	[EducationId] [int] NULL,
	[LanguageId] [int] NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[PositionId] [int] NULL,
 CONSTRAINT [PK_UserPostJobs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkExperiences]    Script Date: 7/4/2023 2:52:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkExperiences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Experience] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WorkExperiences] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617111510_create5thDatabase', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617113305_AddUserRole', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617114128_AddUserRole2', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617114607_AddUserRole3', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617155621_RemoveAppUserIdFromPostJob', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617155938_addOneToMant', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617160249_us', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230617160602_addRelationToNewDatavase', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230618144744_AddPostJobId', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230625103707_Basket', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230625111025_AddOtherPropertiesToAppUser', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626150451_AddMessage', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626163024_newMessage', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626163158_newMessage21', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626163526_Messag', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626163719_Message', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626163945_DeleteMessage', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626164102_AddAbuzar', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626164200_ChangeNameMessage', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626165109_NullItems', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626170258_DeleteMessageItems', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626174025_DeletePhoneNumberDataType', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626174237_addnewMessage', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626175022_NullablePhone', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626200242_positionAndControllerID', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230627093807_Add', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230627103210_AddPostJobToMessages', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230627123447_DeleteAppUser', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230627123817_deleteApp', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230627124035_deleteApp1', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230628192930_AddPositionToPostJob', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701201305_321', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230702170606_MakeBlogPropertiesNull', N'7.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230702171349_NullableUrl', N'7.0.7')
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'ADMIN', N'ADMIN', N'c4379549-befb-475c-b7ce-346ff6a6d4bd')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'MODERATOR', N'MODERATOR', N'22a682b0-5a1e-4649-88fa-6fd39bb9be53')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'EMPLOYEE', N'EMPLOYEE', N'94ad2ee0-a801-4d63-9983-39b5f417e16f')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (4, N'EMPLOYER', N'EMPLOYER', N'b5602148-f76e-4c12-8d52-73ca827c304a')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1029, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1031, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (21, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1016, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1018, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (18, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (19, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1015, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1017, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1023, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1027, 4)
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (18, N'Arif', N'Abdulla', 17, N'NoImage.png', CAST(N'2023-06-19T12:32:18.2921992' AS DateTime2), N'arif', N'ARIF', N'albertg@mail.ru', N'ALBERTG@MAIL.RU', 1, N'AQAAAAEAACcQAAAAELIhRtDiRBTuT5EqpnJjjHeQcUElTCfSdgHkbCw8gRhGy5vBRzzF5SRtYQFF3ZVmzA==', N'C6BD4VEDVCYGFG3ERJUVKHCR4CRTT5A3', N'2b81377c-a3aa-40c7-8e98-3e6e5978ad0f', NULL, 0, 0, NULL, 1, 0, NULL, 6, NULL, 2, N'+994111111')
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (19, N'Emil', N'Ismayilov', 0, N'3f978762-6ee6-4730-920c-368402e871a0freelance-is.jpg', CAST(N'2023-06-19T12:40:59.9964165' AS DateTime2), N'Emil', N'EMIL', N'albertg@mail.ru', N'ALBERTHACIVERDIYEV55@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAECbftip4K4fi3k8/0Djsp8K7+MBZmhgM3oVcHV7U3saqzOP6RUxqFUyzv1ogiEHh8Q==', N'DWH57EJFP5CZBQDOOTFHBGSISMINHZ2W', N'988cc933-ed54-4114-b174-430aa0366b7a', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (21, N'Ulvi', N'Asadov', 0, N'NoImage.png', CAST(N'2023-06-19T13:14:40.7242981' AS DateTime2), N'Ulvi', N'ULVI', N'f', N'ALBERTHACIVERDIYEV55@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEGQvJJa5YyvU/x+qGnhmM3DeChIaYKt6cXvbbJjfbA8rF3MW6CSIavk0Ze1eaMLsAg==', N'EQO7BRNPPQJLNK7LXS7EBZJL45CCO4XT', N'1acf1300-9d6b-4f7d-bf81-054f46db25d7', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1015, N'Albert', N'Haciverdiyev', 11, N'f6160da2-f387-4b79-a05d-9c12beb62a6eBig-Data-Analyticsq.jpg', CAST(N'2023-06-26T01:28:00.2924460' AS DateTime2), N'albert', N'ALBERT', N'a', N'ALBERTHACIVERDIYEV55@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEO1nJwHFQA5r8y6DcdijVmOssPXvwrTdcxEV2IzUGfKlSM6l0cN/tzk4pkPAB8TUvw==', N'67OYMJUJ4VIOOGKPRRWUW6CE4SF4R5HU', N'd9a92be0-816a-40b5-9664-064db01e0e92', NULL, 0, 0, NULL, 1, 0, 21, 6, N'Information About Albert // Information About Albert // Information About Albert // Information About Albert // Information About Albert // 
Information About Albert // Information About Albert // Information About Albert // Information About Albert // Information About Albert // 
Information About Albert // Information About Albert // Information About Albert // Information About Albert // Information About Albert // 
Information About Albert // Information About Albert // Information About Albert // Information About Albert // Information About Albert // 
Information About Albert // Information About Albert // Information About Albert // Information About Albert // Information About Albert // 
Information About Albert // Information About Albert // Information About Albert // Information About Albert // Information About Albert // 
as', 4, N'+994709990568')
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1016, N'Albert', N'Haciverdiyev', NULL, N'f920f2c8-65bb-47b7-ab18-76841ab83b24cv-hazirlamaq.jpg', CAST(N'2023-06-26T02:29:03.6256941' AS DateTime2), N'albertIs', N'ALBERTIS', N'alberthaciverdiyev55@gmail.com', N'ALBERTHACIVERDIYEV55@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEPBYArdjhDa1NJmI/5TwfPMfYrqnLa0C5OXOH5ZZpRyFgPgEsJqOehMdMaoQRcExIA==', N'MZAHBTAICKH3VC32KXQSQXXDH5EYQDY2', N'c4132ecf-bf5a-4b17-93fc-39428eced0f8', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, N'+994709990569')
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1017, N'Eltun', N'Code', 0, N'NoImage.png', CAST(N'2023-06-28T00:29:34.4654110' AS DateTime2), N'EltunIs', N'ELTUNIS', N'a', N'ALBERTHACIVERDIYEV55@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEL670VEAT7oEAoASM2fiVr/VX9+1oU72pmTEYHIoZh7MuVFaToW3qugBoH2M58FPhw==', N'UUI37FQTQEHIQEGWLIY6QWB4P64F4WLC', N'2f2e3334-b618-4ba7-bc1d-15ecc599421b', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1018, N'imran', N'Haciverdiyev', 0, N'NoImage.png', CAST(N'2023-06-29T22:59:11.1256925' AS DateTime2), N'imran', N'IMRAN', N'a', N'ALBERTHACIVERDIYEV55@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEGmvXpAijBtjs1MP9Opkdrmd71ZdSVabXi4bd6e3Bi3c5/BjiLRvkHWBh5YD1Yi+vw==', N'HWZCCLI3TOHDIMDWNBE25GIJ5O7VCPGX', N'f00ae1b2-db7d-4f0f-90e3-262744613d75', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1023, N'ilukj', N'kuyhjmn', 0, N'NoImage.png', CAST(N'2023-06-30T02:31:41.5572415' AS DateTime2), N'alberu76yhtIs', N'ALBERU76YHTIS', N'utyuhjopoficg@mail.ru', N'UTYUHJOPOFICG@MAIL.RU', 0, N'AQAAAAEAACcQAAAAEMD7d3erG6fC3E3hd0+qifpmTeC/ijc5c3S7E4ehLF6y2SrgFzzLlba+MBNWwcpJkA==', N'CCYEDMCWLCUCNFUIODVHHZNODVU6P2I6', N'3c53668f-dedb-4815-a41a-a1ebd3d327a3', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1027, N'Amil', N'Muslumov', 8, N'1c235379-aea4-4988-a05b-23d2defd4ebf360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg', CAST(N'2023-06-30T02:37:35.7332980' AS DateTime2), N'crazy_boy_777', N'CRAZY_BOY_777', N'albert.hcvr@gmail.com', N'ALBERT.HCVR@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEM5zojH1AvqSeocla4XTWQqU7LIpeDEUrKVSiEAHF4NDRMwQmmcb2ZQ4B1dd0EDB6w==', N'2P7FAYFHFF2YFWBSJ4VJFQSNNGVHM33H', N'915379ff-6053-4b34-8de9-58084963c7a5', NULL, 0, 0, NULL, 1, 0, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1029, N'Admin', N'Admin', 0, N'NoImage.png', CAST(N'2023-06-30T22:00:43.3894196' AS DateTime2), N'Admin', N'ADMIN', N'projectjobhunt1@gmail.com', N'PROJECTJOBHUNT1@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEFZlFcFC7+HZTUc0h7AMkYf6aQS+HGw4Kga3+I1a9e3SryLGcMVdxq9ukah0e0vaJg==', N'MEJSFQOQRKBYRA2YQ627NNTW3GGWOHKW', N'90b9e86a-cace-4182-8fc4-12156f427130', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [UserProfession], [ImageURL], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Age], [CategoryId], [Description], [EducationId], [Phone]) VALUES (1031, N'MODERATOR', N'MODERATOR', 0, N'NoImage.png', CAST(N'2023-07-01T13:16:58.7479648' AS DateTime2), N'MODERATOR', N'MODERATOR', N'oneminutealbert@gmail.com', N'ONEMINUTEALBERT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEK7BskQLfth+g2sATBxAOG6GpYCPl9VR1ey8U3w/XDJP34d3d00ulJvrlikMO3EPcg==', N'JQFTWYZXAOWL2HZBTAVZ7GCIYE7TMMVB', N'ce0623c2-c9ab-47fc-b1b8-8aa96fbd3eee', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
SET IDENTITY_INSERT [dbo].[BasketItems] ON 

INSERT [dbo].[BasketItems] ([id], [AppUserId], [UserPostJobId], [PostJobId]) VALUES (42, 1016, 1014, NULL)
INSERT [dbo].[BasketItems] ([id], [AppUserId], [UserPostJobId], [PostJobId]) VALUES (50, 1016, 1016, NULL)
INSERT [dbo].[BasketItems] ([id], [AppUserId], [UserPostJobId], [PostJobId]) VALUES (52, 1027, NULL, 1027)
INSERT [dbo].[BasketItems] ([id], [AppUserId], [UserPostJobId], [PostJobId]) VALUES (55, 1016, 1013, NULL)
SET IDENTITY_INSERT [dbo].[BasketItems] OFF
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (3, N'Freelance İş Nədir ?', N'Texnologiyanın sürətli inkişafı və rəqəmsallaşma həyatın bütün sahələrində olduğu kimi iş dünyasında da böyük dəyişikliklərə səbəb olub. Pandemiya ilə birlikdə ofisdən uzaqda işləmək vərdişinin yayılması bizim iş görmə tərzimizi tamamilə dəyişdi. Bu nöqtədə freelancing də çox populyarlaşdı. Saytımızda freelance iş elanları mövcuddur. Freelance işin nə olduğunu, onun hansı üstünlükləri və mənfi cəhətləri olduğuna birlikdə baxaq.  Freelance nə deməkdir? Freelance, ən sadə tərifi ilə “sərbəst iş” deməkdir. Freelance-istənilən qurumdan, ofis mühitindən və iş saatlarından asılı olmayaraq işləmək imkanı təqdim edir. Sərhədləri mümkün qədər geniş olan freelance işlər günümüzün şərtlərinə son dərəcə uyğundur. Freelance nədir sualına cavabın əhatə dairəsi son dərəcə genişdir. Demək olar ki, bütün sektorlarda frilanser kimi işləmək mümkündür. Freelancerlər öz bacarıq və təcrübələrinə uyğun olaraq dünyanın istənilən yerindən istədikləri işi davam etdirmək imkanı əldə edirlər.  Freelance işin üstünlükləri nələrdir? Populyarlığı və yayılması günü-gündən artan freelance müxtəlif üstünlüklər gətirir. Freelancingin əsas üstünlüklərini aşağıdakı kimi sadalamaq olar:  Zamandan və məkandan asılı olmayaraq işləmək: Freelancerlər iş saatlarına bağlı olmadan və ofisə getməyə ehtiyac olmadan işlərini yerinə yetirə bilirlər.  Sevdikləri işlə məşğul olmaq imkanı: Freelancerlər ofis işçiləri ilə müqayisədə bacarıq və təcrübələrinə uyğun olaraq sevdikləri işlərə daha asan diqqət yetirmək fürsəti əldə edə bilirlər.  İş yükünü tənzimləmək bacarığı: Freelancerlər iş yükünü özləri tənzimləyə bilirlər. Əgər frilansersinizsə, sizin üçün mənalı və əlavə dəyəri yüksək olan layihələri seçə, iş həyatının stresli şərtlərindən uzaq karyera qura bilərsiniz. Çoxlu gəlir mənbələri: Freelancerlər möhkəm peşəkar əlaqələr qurduqları və işlərini diqqətlə apardıqları müddətdə geniş müştəri portfeli yarada bilərlər. Bu yolla onlar tək bir gəlir mənbəyindən asılı olmadan qazanclarını artıra bilirlər. Freelance işin mənfi cəhətləri nələrdir? Onun təklif etdiyi üstünlüklər son dərəcə cəlbedici olsa da, eyni zamanda bəzi mənfi cəhətləri də var. Bu mənfi cəhətləri bunlardır:  ● Davamlılıq məsələsi: Freelance işlər layihə əsaslı ola bilər və ya işəgötürənin ehtiyacları ödənildikdə dayandırıla bilər. Buna görə də, frilanserlər yeni iş tapmaq üçün mübarizə aparmalı ola bilər.  ● Sabit gəlir yoxdur: Tam ştatlı işçilər müntəzəm olaraq aylıq maaş alırlar. Freelancerlər yerinə yetirdikləri  iş qədər qazanırlar. Üstəlik, ödənişlərdə gecikmələr ümumi problemdir.  ● Sığorta və digər hüquqların olmaması: Freelance iş şəraiti ilə müqayisədə tam ştatlı iş həyatının ən mühüm üstünlüklərindən biri sığorta və işçilərə təklif olunan güzəştlərdir. Freelancerlər gələcək risklər üçün öz ehtiyat tədbirlərini özləri görməlidirlər.  Ən çox işlərin mövcud olduğu freelance sahələri Texnologiyanın inkişafı iş həyatımız inkişaf edir və freelancer imkanları genişlənir. Freelance işləməyə imkan verən ən yaxşı sahələr bunlardır:  İT sahəsi: Veb saytlar, proqramlar və oyunlar hazırlayan proqram təminatı mütəxəssisləri freelancing üçün ən uyğun peşələr sırasındadır. Üstəlik, xaricdə proqram yönümlü bizneslərə böyük ehtiyac olduğu üçün qlobal iş görmək mümkündür. Dizayn: Freelance olaraq həyata keçirilə bilən işlərdən biri olan təsviri sənətin geniş spektri var. Qrafik dizayndan tutmuş video montajına qədər bir çox fərqli sahədə sərbəst işləmək mümkündür. Copywriting: SEO yönümlü yazıçılar və şirkətlərin marka dəyərlərini artıran keyfiyyətli rəqəmsal məzmun istehsalında ixtisaslaşan redaktorlar müstəqil işləmək imkanı əldə edirlər. Sosial media mütəxəssisi: Son illərin ən populyar biznes sahələrindən biri olan sosial media ekspertizası, freelancer olaraq həyata keçirilə bilən işlərdən biridir. 22.04.2023', N'2bc2742e-ad2e-4bf6-9e0b-d75e4e8f95d6freelance-is.jpg', CAST(N'2023-07-01T16:35:02.6707856' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (4, N'Networking nədir? Networking necə yaradılır?', N'İşgüzar dairənizi genişləndirmək və adınızı tanıtmaq üçün networking qurmaq çox vacibdir. Ona görə də öz sektorunuzdakı və ya müxtəlif sektorlardakı insanlarla yaxşı əlaqələr qurmaq lazımdır.  Networking nədir? Networking bir-birinə qarşılıqlı fayda gətirmək üçün qurulur. Bu, həm də peşəkarlar, işçilər və potensial müştərilərlə işgüzar və dostluq əlaqələrinin inkişafı kimi müəyyən edilir. Networking-in əsas məqsədi biznesdə özünüzü və biznesinizi başqalarına tanıtmaqdır. Bundan əlavə, bu insanları uzun müddətli müştərilərinizə çevirməkdir.  Networking’in üstünlükləri nələrdir? Networking’in iş həyatızda bir çox üstünlüklərə malikdir. Bu üstünlüklər aşağıdakı kimi sadalanır:  Yeni insanlarla tanış olmaq və referans almaq şansı Networking quraraq, sektor və ya sektordan kənar bir çox insanla tanış olmaq imkanınız olacaq. Beləliklə, potensial yeni müştərilərə çatmaq və onlara biznesiniz haqqında məlumat vermək şansınız var. Bu həm də onlardan istinad mənbəyi kimi istifadə etmək imkanı verir. Bunlara əlavə olaraq ortaqlıqlar, müxtəlif layihələr və işgüzar sövdələşmələr etmək imkanınız olacaq.  Özünüzü və brendinizi tanıtmaq şansı Network qurmaq  prosesi zamanı siz həm də tanış olduğunuz insanlara özünüz və brendiniz haqqında danışmaq şansı əldə edirsiniz. İş həyatında peşəkarlara işinizi və markanızı tanıtmaq fərqli qapılar açacaq.  Sektorda aktual problemləri izləyə bilmək Sektorunuza hakim olmaq və cari məsələlərdən xəbərdar olmaq üçün networking qurulmalıdır. Sizinlə eyni sektorda olan insanlarla təmasda olmaq mütləq faydalı olacaq. Beləliklə, bu, öz işinizi aktual saxlamağa imkan verir.  Problemləri həll etməyə kömək edir İşlə bağlı problemlərlə qarşılaşdığınız zaman onlar haqqında bilən insanlarla əlaqə saxlamalısınız. Networking qurduğunuz zaman bu fürsət qarşınıza çıxacaq. Bu proses zamanı qarşılaşdığınız insanlar qarşılaşdığınız problemləri həll etməyə kömək edəcəklər. Bundan əlavə, mövzu ilə bağlı fikirləri olmasa belə, sizi ətrafdakı müxtəlif insanlara yönləndirəcəklər.  Məlumat mübadiləsi imkanı Networking həm də yeni məlumatları öyrənmək və ya nəyisə öyrənmək üçün mühüm vasitədir. Tanış olduğunuz hər yeni insan sizə iş və ya həyat haqqında yeni bir şey öyrədir. Başqa sözlə, networking bilik, təcrübə mübadiləsi və ya başqalarının təcrübələrindən faydalanmaq üçün vacibdir.  Networking  necə yaradılır? Networking qurarkən xüsusi diqqət yetirməli olduğunuz bəzi məsələlər var. Bunlar nəzərə alındıqda daha möhkəm təməllərə malik biznes şəbəkəsi qurulacaq. Beləliklə, bu əlaqələr uzun müddət davam edəcək.     Düzgün tədbirlərə qoşulun Təbii ki, hər tədbirə qoşulmaq burada düzgün insanlarla tanış olacağınız anlamına gəlmir.Bundan əlavə, hər bir hadisə networking  üçün uyğun olmaya bilər. Bu səbəbdən tədbirlərə qatılmadan əvvəl fəaliyyətlər araşdırılmalıdır. Eyni zamanda, iştirakçıların və məruzəçilərin siyahısı yoxlanılmalıdır. Tədbirdə networking qurmaq üçün lazım olan boş vaxtın olub-olmaması araşdırılmalıdır. Networking qurmaq üçün düzgün fəaliyyət  istədiyiniz insanlarla görüşmək imkanını yaradacaq.  Geyiminizə diqqət edərək peşəkar görünün  Networking’də işlərində ilk təəssürat çox vacibdir. Bu səbəbdən paltar seçiminiz və necə geyindiyiniz bu prosesdə diqqət etməli olduğunuz məqamlardan biridir. Tədbirdə iştirak edərkən peşəkarcasına geyinmək və geyiminizi diqqətlə seçmək də vacibdir. Bu, görüşdüyünüz insanlarla ilk yaxşı təəssürat yaratmağa imkan verəcək.  Üzbəüz görüşlərə əhəmiyyət verin Bu gün sosial şəbəkələrdə networking fəaliyyətləri edilə bilir. Ancaq üzbəüz görüşü heç nə əvəz etmir. İnsanla bağ qurmaq və uzunmüddətli dostluq qurmaq üçün üz-üzə görüşməyə üstünlük verin. Sosial şəbəkələr vasitəsilə tanış olduğunuz insanları işgüzar nahara və ya qəhvəyə dəvət edərək üzbəüz görüşməyə cəhd edə bilərsiniz. Bu, onlara daha çox dəyər verdiyinizi göstərsə də, əlaqəni daha da gücləndirməyə kömək edəcək.  Hər iki tərəfin qazanc əldə etməsi çox vacibdir. Networking qurarkən sahibkarların ən çox yol verdiyi səhvlərdən biri networking işlərini yalnız birtərəfli şəkildə qurmaqdır. Ancaq insanlar bu birtərəfli münasibətlərə xoş yanaşmır və bu cür yanaşmalara malik olan insanları etibarlı hesab etmirlər. Bu səbəbdən də aralarındakı əlaqələr yaxşı qurulmaya bilir və bu cür yanaşma tərzində olan insanlar sektorda pis reputasiyaya malikdirlər. Network’ün məqsədi hər iki tərəf üçün faydalı ola biləcək işgüzar əlaqələri inkişaf etdirməkdir. Yalnız özünüzə diqqət yetirməklə deyil, qarşı tərəf üçün bir şey edəcəyinizi göstərmək vacibdir.  Sual verin və dinləyin İnsanlar başqalarının danışdıqlarını dinləməkdənsə, özləri danışmağı və insanların onlara qulaq asmasını istəyirlər. Qarşınızdakı insanları daha yaxından tanımaq və onların diqqətini çəkərək aranızdakı əlaqəni gücləndirmək üçün onlara çoxlu müxtəlif suallar verin və maraqla dinləyin. Marağınızı göstərmək və onlara qulaq asdığınızı göstərmək də daha yaxşı bağlanmağınıza kömək edəcək amillərdən biridir.  Hazır olun Bir tədbirə getdiyiniz zaman, xüsusən də networking üçün hazır olmaq  çox vacibdir. Orada yeni insanlarla tanış olduqda, işinizi və markanızı ən yaxşı şəkildə tanıtmaq üçün imkanlara sahib olmalısınız. Etdiyiniz işləri ilişib qalmadan özünə güvənərək izah edərək qarşınızdakı insanın diqqətini çəkəcək bir çıxış etməyi bacarmalısınız. Bu səbəbdən networking işlərini etməzdən əvvəl  nitqi məşq etdirməyə cəhd edə bilərsiniz.  Tanımadığınız insanların yanında oturun Networking qurmağın məqsədi tanımadığınız insanlarla görüşməkdir. Bu səbəbdən tədbirlərdə daha əvvəl tanımadığınız insanların yanında oturmağa cəhd edə bilərsiniz. Bu yolla siz bu prosesdə onlarla görüşə, özünüzü və biznesinizi onlara tanıda və bu insanları biznes şəbəkənizə əlavə edə bilərsiniz.  Tək duran insanlarla danışın Yuxarıda qeyd etdiyimiz kimi, yeni insanlarla tanış olmaq üçün tək dayanan insanlarla da danışmağa cəhd edə bilərsiniz. Networking tədbirlərində insanlar kiminləsə görüşməyə can atırlar və tək dayanan insanlarla danışmaq da sizə bu fürsəti verə bilər. Onlara yaxınlaşıb söhbətə başlamaqla onları tanıya bilərsiniz.  Nəzakətlə başqaları ilə danışmağa davam edin Bu tədbirlərdə yalnız bir nəfərlə söhbət etmək lazım deyil. Digər şəxslə əlaqə qurduqdan və onun əlaqə məlumatlarını əldə etdikdən sonra bu əlaqəni daha sonra davam etdirə bilərsiniz. Bu məlumatı aldıqdan sonra nəzakətlə icazə istəyərək fərqli insanlarla tanış olmağa çalışın.  Münasibətləri isti saxlayın Tədbirlərdə insanlarla görüşdükdən sonra münasibətləri isti saxlamağınız vacibdir. Bu səbəbdən də zaman-zaman bu insanlarla görüşməyə cəhd edə bilərsiniz. Bunun mümkün olmadığı hallarda bu insanlarla müntəzəm olaraq telefon və ya sosial şəbəkələr vasitəsilə əlaqə saxlamaq və ünsiyyət qurmaq da münasibətlərin isti qalmasını təmin edəcək.  Mövzu həmişə iş olmamalıdır. Görüşdüyünüz insanlarla ünsiyyət qurmaq üçün işlə bağlı bir mövzunun gündəmə gəlməsini gözləməməlisiniz. Bu vəziyyətdə, siz yalnız işiniz düşəndə ​​bu insanlarla əlaqə saxlamış olursunuz. Bunun əvəzinə daha səmimi bir ünsiyyət və dostluq qurmaq üçün bu insanlarla əlaqə saxlamalı və mövzu iş olmadığı zaman onlarla söhbət etməlisiniz. İşdən başqa mövzularda danışsanız və ya onların rifahını soruşsanız belə, gündəlik mövzularda danışmaq və dostluğu inkişaf etdirmək aranızdakı əlaqənin davamlılığı üçün vacibdir. Bundan əlavə, xüsusi günlərə (ad günləri, evlilik ildönümləri, promosyonlar və s.) gəlincə, bu insanlara çatmaq, onları təbrik etmək onların sizə olan baxışlarını daha müsbət istiqamətdə dəyişəcək.  Vizit kartlarınızı unutmayın Networking ilə bağlı tədbirlərə gedərkən vizit kartlarınızı unutmamalısınız. Rəqəmsal əsrdə yaşasaq da, vizit kartları əlaqə məlumatlarınızı tez bir zamanda paylaşmaq üçün hələ də çox təsirlidir. Bu səbəbdən hazırlıqlı getməyiniz vacibdir.  Müxtəlif sahələrdən olan insanlarla tanış olun Yeni imkanlardan istifadə etmək və çevrənizi genişləndirmək üçün başqa sahələrdən də insanlarla tanış olmalısınız. Fərqli sektorlardakı insanlar sizə yeni imkanları tapmağa kömək edə, eləcə də gözlənilməz məsələlərdə kömək edə bilirlər.     29.03.2023', N'59d30d40-8fa9-48ea-afcc-9ef932760768networking-nedir.jpg', CAST(N'2023-07-01T16:39:35.1680230' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (5, N'Effektiv CV hazırlanması necə olmalıdır?', N'Cv hazırlamaq üçün bir çox diqqət etməli olduğunuz qaydalar var. Bu yazıda sizlərə effektiv cv hazırlanması haqqında danışacayıq.   CV nədir? Ümumiyyətlə iş müraciətlərində istifadə edilən və insanların öz potensialını işəgötürənlərə tanıtmaq məqsədi ilə hazırlanan tərcümeyi-hal (CV-Curriculum Vitae) şəxsin bacarıqları, təcrübələri, təhsili, iş təcrübəsi və s. məlumatları ehtiva edən yazılı bir sənəddir.  Effektiv CV necə hazırlanmalıdır? Effektiv CV hazırlamaq üçün ilkin şərt karyera məqsədlərini real şəkildə təyin etməkdir. Müəyyən edilmiş karyera hədəfi, müraciət ediləcək vəzifəyə uyğun olan şəxsin şəxsi və peşəkar xüsusiyyətlərinin təqdim edilməsində və müraciət məqsədinin dəqiqləşdirilməsində kömək edəcək mühüm elementdir. CV-də şəxsi məlumatlar, təhsil məlumatları, iş və təcrübə təcrübələri, bacarıqlar, təhsil və sertifikatlar və arayışlar olmalıdır.  Şəxsi məlumat -Ad-soyad, tam ünvan, əlçatan telefon nömrəsi və e-poçt ünvanı CV-nin yuxarı hissəsində mərkəzləşdirilməlidir. Şəxsi məlumatlarınız, telefon nömrəniz və e-poçt ünvanınız olmalıdır. E-poçt ünvanınız adınız və soyadınızdan ibarət olmalı və rəsmi olmalıdır.  -Seçdiyiniz şəkil müraciət etdiyiniz vəzifəyə uyğun olmalıdır. Müsbət göründüyünüz bir fotoşəkilə üstünlük verilməlidir,  -Doğum tarixi, doğum yeri və ailə vəziyyəti də bu başlığa daxil edilməlidir.  -Sürücülük vəsiqəsi daxil edilməlidir. (Əgər bu, müraciət olunan vəzifə üçün tələbdirsə, daxil edilməlidir)  Təhsil məlumatları -Məzun olmuş məktəb və universitetlər ardıcıl olaraq göstərilməlidir. Yəni ki, ən son bitirilən təhsil müəssisəsi birinci yazılmalıdır.  - Təhsil məlumatlarına yer verilərkən qəbul ili və buraxılış ili yazılmalıdır. - Akademik həyat zamanı əldə edilən qiymətlər, nailiyyətlər və ümumi qiymət orta göstəriciləri çox aşağı deyilsə, daxil edilə də bilər.  İş və təcrübələr - İş və təcrübələr tərs xronoloji ardıcıllıqla yazılmalıdır.(Ən son işlədiyiniz yer birinci olmalıdır)  - İş yerində müvafiq vəzifənin adı və  vəzifəyə uyğun görülən işlər sadalanmalıdır.  - Üzərinə düşən vəzifələr baxımından əldə olunan nailiyyətləri vurğulamaq vacibdir.  Bacarıqlar -Bunları konkretləşdirərkən görülən işlər və üzərinə düşən vəzifələr baxımından əldə olunan nailiyyətləri vurğulamaq vacibdir.  -Maraqlı sahələr yazılmalıdır. Xüsusilə müraciət ediləcək vəzifə ilə əlaqəli ola biləcəklər əlavə edilməlidir.  Təlim və sertifikatlar Qatıldığınız təlimlərdən əldə etdiyiniz sertifikatlara CV-də yer verilməlidir Xronoloji ardıcıllıqla əlavə edilməli və təlimin mövzusu, alındığı müəssisə, təlimin başlama və bitmə tarixləri və təlimçinin adı kimi təfərrüatlar yazılmalıdır.  Refeanslar - Referanslar müraciət edilən vəzifə ilə əlaqəsi olan şəxslərdən seçilməlidir.  - Arayışlar əlçatan olmalı və arayış kimi əlavə edilmək üçün müvafiq şəxsdən və ya şəxslərdən icazə alınmalıdır.  - Əgər çoxlu istinad göstərilibsə, onu başlıqlara bölmək olar. Bu adları peşəkar, akademik və şəxsi istinadlara bölmək olar.  - Hər bir arayışın adı və soyadı, hazırkı vəzifəsi, iş yerindəki vəzifəsi və əlaqə məlumatları (e-mail və telefon) daxil edilməlidir  .- Əgər referans məlumatının paylaşılması istənilirsə, "İstəyə görə veriləcək" ifadəsi əlavə edilə bilər.  Xarici dil bilikləri -Xarici dil bilikləri oxuma, yazma, danışma və dinləmə bacarıqları kimi ayrıca qiymətləndirilməlidir.  - beynəlxalq imtahan nəticələri varsa əlavə edilə bilər. (IELTS, TOEFL və s.)  Maraqlar Sizi digər insanlardan fərqləndirən maraqlarınızı əlavə edə bilərsiniz. Ümumi ifadələrdən istifadə səmərəsiz olacaq. İncəsənət, idman və mədəni fəaliyyətləri qeyd etmək olar.   CV faylında cover letter necə hazırlanmalıdır? -Cover Letter CV-nin ön hissəsinə əlavə olunan və CV ilə yanaşı göndərilən bir yazıdır.  - Cover Letter giriş hissəsi , inkişaf  hissəsi və nəticə hissəsindən ibarət olmalıdır.  - Girişdə şəxs özünü təqdim etməlidir.  - İnkişaf bölməsində müraciət edilən vəzifə ilə niyə maraqlandığınız izah edilməlidir. Vəzifə ilə bağlı olan şəxsin xüsusiyyətləri izah edilməli və müraciət etdiyi işə uyğunluğu izah edilməlidir.  - Nəticə hissəsində təşəkkür cümləsi yazılmalı və növbəti prosesdə ünsiyyətin necə davam etdiriləcəyi barədə məlumat verilməlidir.  Effektiv cv  hazırlanmasında əsas nöqtələr - CV hazırlayarkən uzun, təkrar və şişirdilmiş ifadələrdən qaçınılmalıdır.  - Qısa və başa düşülən olmalıdır.  - Times New Roman, Arial, 11 və ya 12 ölçüdə kimi şriftlərə üstünlük verilə bilər.  - Orfoqrafiya və durğu işarələri qaydalarına riayət edilməlidir.  - Xüsusiyyətlər, nailiyyətlər və bu nailiyyətlərin işəgötürənə nə gətirdiyi vurğulanmalıdır.  - Müraciət olunan vəzifə üçün əhatə məktubu hazırlanmalı, CV ilə birlikdə təqdim edilməlidir.  - CV-yə şəkil əlavə edilməlidir. Əlavə ediləcək şəkil pasport ölçüsündə olmalıdır, şişirdilməməlidir. Qeyri-rəsmi, aydın olmayan və tammetrajlı fotoşəkillər daxil edilməməlidir.  - Qeyri-dəqiq məlumatlar daxil edilməməlidir.  - CV faylının adı “Ad Soyadı” kimi yadda saxlanılmalıdır. Qeyri-ciddi adla göndərilməməlidir.  - Şəxsi məlumat başlığı altındakı e-poçt ünvanı qeyri-rəsmi şəkildə olmamalıdır. Adı və soyadı olan e-poçt ünvanından istifadə edilməlidir.', N'97a71c69-ff5c-4c4d-8fbc-6d1549c7a725cv-hazirlamaq.jpg', CAST(N'2023-07-01T16:41:02.6812895' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (6, N'İş müsahibəsindən əvvəl nələri bilməliyik?', N'Bu yazımızda iş müsahibəsinə getməmişdən əvvəl nə etməli olduğumuzu , davranışlarımızı necə tənzimləyəcəyimidən danışacağıq.  İş müsahibəsindən əvvəl necə araşdırma edək? Müsahibə götürdüyünüz vəzifənin təfərrüatlarını araşdırmaq çox vacibdir. Şirkət araşdırmasına əlavə olaraq, müraciət etdiyiniz vəzifədən nə gözlənildiyini anlamaq faydalıdır. Misal üçün desək , namizəddə müsahibədən əvvəl müraciət  etdiyi iş elanını araşdırdınızmı deyə sual verilsə , namizəd də buna cavab olaraq, xeyr və yaxud mövzudan kənar şeylərdən danışsa bu işverənə sizə qarşı mənfi aura yaradacaqdır.  HR mütəxəssisi ilə görüşdə görüş zamanı nə demək lazımdır? Müsahibə verərkən, görüşünüz üçün bir neçə dəqiqə gözləməli ola bilərsiniz. Sonra sizi ya müsahibə otağına aparacaqlar, ya da işə qəbul üzrə menecer sizi qəbul zonasında qarşılamağa gələcək. Görüşünüz olsa da, özünüzü təqdim etmək üçün vaxt ayırın ki, HR mütəxəssis sizin kim olduğunuzu bilsin.  Əgər oturmusunuzsa, ayağa qalxın və ilk olaraq sizə əl sıxma təklif edilərsə, əl sıxın. Əks halda, əlinizi uzatmayın  Mühasibə zaman , gülümsəmək və göz təması qurmaq Müsbət bir hahldır. misal üçün ; Mən Sadiq Nəzərli. Sizinlə tanış olmaqdan şadam .  İş müsahibəsində Diqqətsiz olmaq , uyğunsuz geyinmək və ya müsahibəyə fokuslanmamaq kimi ümumi müsahibə səhvlərindən çəkinin. Stresslə müsahibə verməyə meylli olduğunuzu bilirsinizsə, şirkəti araşdıraraq, müsahibəyə hazırlaşaraq və müsbət düşünməklə bunun problem olma şansını minimuma endirin. Nə qədər çox hazırlasanız, müsahibə prosesi bir o qədər az stresli olacaq.  NOT: Ovuclarınıın tərləməməsi üçün müsahibədən əvvəl əllərinizi yuyun və qurudun. Əgər bu mümkün deyilsə, əllərinizi əvvəlcədən qurutmaq üçün salfetdən istifadə edin.  iş müsahibəsi  Özünüzü təqdim etmə mərhələsini qısa və öz edin Müsahibə zamanı özünüzü daha dolğun təqdim etmək imkanınız olacaq. Bir çox işə götürmə menecerləri müsahibəyə “Mənə özünüz haqqında danışın” kimi açıq sualla başlayacaqlar.  Cavabınızın əsası, müsahibə etdiyiniz işdə üstün olmanıza imkan verəcək fonunuzdakı əsas elementlərə diqqət yetirməlidir. Güclü tərəflərinizi, yaradıcılığınızı, liderlik və problem həll etmə bacarıqlarınızı və təşkilata verə biləcəyiniz töhfələri müzakirə etməyə hazır olun.  İş müsahibəsində görüş zamanı öz şəxsi keyfiyyətlərinizi HR mütəxəssisə bu yollarla deyə bilərsiniz :  iş görüməsindən əvvəl ayna qarşısında danışaraq özünüzü hazırlaya bilərsiniz və beləliklə əvvəlki kariyeranız , nailiyyətləriniz ,bacardığınz işlər haqqında qısa məlumat verərək hr mütəxəssisin beynində bacarıqlarınızı biraz daha artıra bilərsiniz. Müsahibədən əvvəl işi diqqətlə təhlil edin ki, siz iş və şirkətin tələblərinə cavab verməyə və ya onları aşmağa imkan verəcək maraqları, bacarıqları, təcrübələri və şəxsi keyfiyyətləri qeyd edəsiniz. Çox məlumat vermədən və ya çox müsahibə vaxtı almadan bacarıqlarınızı, təcrübənizi və şəxsi keyfiyyətlərinizi vurğulamaq üçün ən yaxşı yolları taparaq “mənə özünüz haqqında danışın” müsahibə sualının cavablarını nəzərdən keçirin. iş müsahibəsi  Əvvəlki iş yermizdən niyə ayrıldınız? İş müsahibəsi zamanı əvvəlki  iş yerinizdən ayrılma səbəblərini ardıcıl və məntiqli şəkildə izah etmək işə götürənin və ya menecerin beynində sual işarəsi yaratmamalıdır. İş tapmadan işi tərk etməyin səbəbinin kifayət qədər aydın olmasını və iş yerindəki narazılığınızın səbəblərinin ardıcıl olmasını təmin edən açıqlamalar verməlisiniz.  İngilis dili biliyinizi olduğu kimi qeyd edin İngilis dili bacarığı səviyyəniz barədə soruşduqda cavab ingilis dilində həqiqi biliklərinizi əks etdirməlidir. Bir çox namizəd öz cv-faylında yüksək səviyyəli ingilis dili yazsa da, müsahibə zamanı suallar verildikdə ingilis dilində danışa bilmirlər. Bunun əvəzinə müsahibədə ingilis dili biliklərinizin hansı səviyyədə olduğu sualı; Danışıq, yazı və anlama daxil olmaqla, səviyyələrinizi ayrıca təyin edə bilərsiniz. Bu sizin ingilis dili səviyyəniz super olmasa belə daha yaxşı bacarıq göstərməyinizə səbəb olacaqdır  HR mütəxəssis ilə artıq səmimiyyət ziyan ola bilər Qarşı tərəfi tanımadığınız üçün həddindən artıq mehriban rəftarın risk yaratdığını deyə bilərik. Yumorunuz və ya həddindən artıq rahat münasibətiniz, qarşı tərəfdə prosesi çox ciddi qəbul etmədiyiniz hissi yarada bilər. Sizə verilən suallara aydın və qısa cavab verməlisiniz. Bəzi hallarda işə alım mütəxəssisi test üçün səmimiyyət yarada bilər.  İş görüşməsi üçün qısa və vacib məlumatlar İş müsahibəsi başlamazdan 15 dəqiqə əvvəl təyin olunan ünvanda olmağa çalışın. Görüşmə zamanı əvvəlki iş yerinizdə olan mənfi stüasyaları,həmkarlarınızla qarşılaşdığınız problemlərdən danışmamağa çalışın əks halda bu işə götürən üçün sizin haqqınızda mənfi təsərruata səbəb ola bilər. Sizə verilən suallara rahat və özünüzdən əmin şəkildə cavab verin. Təcrübəniz və qabiliyyətiniz haqda yalan danışmaqdan çəkinin Verilən suallara tələsik cavab verməməyə diqqət edin. Özünüzü ifadə edə biləcəyiniz qədər düşünməyə və suallara cavab verməyə çalışın. İşgüzar görüşün nəticəsinin nə zaman bəlli olacağını soruşmaqdan çəkinməyin. Bu sizin işə daha həvəsli olduğunuzu göstərə bilər. Müsahibə zamanı tez tez soruşulan suallar (FAQ) İş müsahibəsinin sonunda nə demək lazımdır?  Müsahibənin sonunda iş üçün bacarıqlarınızı və ona olan marağınızı yenidən ifadə edin və vaxt ayırdığı üçün müsahibə verənə təşəkkür edin. Siz həmçinin şirkətin işə götürmə qərarını nə vaxt qəbul edəcəyini anlamaq üçün işə qəbul prosesində növbəti addımlar barədə soruşa bilərsiniz.  Müsahibə də şansımızı maksimum dərəcədə necə artırmalıyıq ?  Müsahibə prosesinin necə keçdiyi burada çox rol oynayır. Əgər HR mütəxəssisin gözündə müəyyən qədər yer almısınızsa , bizim sadaladıqlarım sizin şansınızı 90% qədər qaldıracaq. Unutmayın hər şeydən önəmli işə olan həvəsinizi HR mütəxəssisə bildirməkdir. Çünki hər bir mütəxəssis komandasına tam profesyonal olmasada , həvəsi olan şəxsləri qəbul etməyi üstün tutur.', N'0a210199-a23e-4c4e-8dfe-257e58fd9c2ais-musahibesinden-evvel.jpg', CAST(N'2023-07-01T17:02:36.5667107' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (7, N'Müsahibə sualları və cavabları 2023', N'Müsahibəyə hazırlaşarkən, işəgötürənin sizə hansı sualları verəcəyini düşünə bilərsiniz. Hansı mövzuların əhatə olunacağına əmin olmaq üçün heç bir yol olmasa da, soruşulacağını gözləyə biləcəyiniz bir neçə məşhur müsahibə sualları var. İşəgötürənlərin tez-tez verdiyi suallara effektiv cavab verməyə hazır olmaq həmişə vacibdir.  Hər müsahibə verən şəxs fərqlidir və uyğun olaraq suallar da fərqli ola bilər. Siz bu ümumi iş müsahibəsi suallarına cavab hazırlaya və növbəti iş müsahibənizdə  təəssürat yaratmaq üçün vacib danışıq nöqtələrini inkişaf etdirə bilərsiniz.  Müsahibə sualları haqqında danışmazdan əvvəl Müsahibənin məqsədi haqqında qısa məlumat əldə etmək faydalıdır.  Müsahibə Nədir? Müsahibə işə götürən tərəfindən sizin mövcud vakansiya ya nə dərəcədə uyğun olub olmamağınəzə yoxlamaq üçün təşkil olunan prosesdir. İşə götürən tərəf müsahibə yolu ilə sizin bacarıq, təcrübə və keyfiyyətləriniz haqda geniş məlumat əldə edir. Digər tərəfdəndə iş axtaran namizədin həmin vakansiyaya, şirkətə, onun məqsədlərinə, gələcək planlarına və maraqlarına nə qədər uyğun olub-olmamasını müəyyən edən bir prosesdir.   Müsahibə zamanı sizin savad və biliyinizə deyil, dünya görüşünüz və hazırlığınıza diqqət edilir. Ona görə də müsahibənin formatından və yerindən asılı olmayaraq müsahibəyə yaxşı hazırlaşmaq lazımdır.   Məsələn siz müəllim olmaq üçün müsahibə mərhələsindən keçirsinizsə, sizə müsahibədə ixtisasınız haqqında suallar verilməyəcək. Yalnız hər hansi bir mövzu üzrə sizin fikirlərinizə və sinifdə sagirdlə davranış qaydanıza psixologiyanıza diqqət ediləcək.  Siz əgər hansısa şirkət də işləmək üçün müsahibə verirsinizsə əvvəlcədən öyrənməyiniz gərəkən bəzi vacib məlumatlar var. Bunlar:  Şirkət haqda ətraflı məlumat toplamalısınız. Yəni nə vaxt yaranıb,?Hansı məqsədlə yaranıb? Dəyərləri nələrdir? Hansı istiqamətdə çalışır, əsas fəaliyyəti nələrdir? Ən böyük uğur və nailiyyətləri hansılardır?  Son fəaliyyətləri və gələcək planlar hansılardır?  Müsahibədə əsasən hansi suallar verilir.   Hər bir müəssisə müxtəlif vakansiya və müxtəlif ehtiyac səbəbiylə müsahibə keçirsədə işə götürənin məqsədi eynidi və eyni suallara cavab axtarır.   Bu namizəd bu işə uyğundumu? (bacarıq və bilikləri imkan verirmi)  Bu namizəd bizim şirkətə uyğundumu?(şəxsi keyfiyyətləri nələrdir?insan olaraq işləyə bilərikmi onunla?)  Yəni müsahibədə verilən suallar əslində bu suallara cavab tapmaq üçündür.  Bəs müsahibədə olarkən necə cavablar verməliyik? Biz verilən suala cavab verəndə öz fikrimizi, məqsədimizi deyil qarşımızdakı insanın eşitmək istədiyi cavablari verməliyik. Məsələn “Nə üçün bizimlə işləmək istəyirsiniz?” sualına sizdə maaş daha yüksəkdir, iş saati və ya şəraiti daha münasib idi və ya pul qazanmaq, iş tapmaq, inkişaf etmək istəyirəm kimi cavablar vermək qətiyyən doğru deyil. Bu cavablar sizə qarşı heçdə müsbət fikir yaratmaz. Bunun əvəzində “mənim üçün işlədiyim şirkətin, liderliyi, uğurlari, gələcək planları çox önəmlidi” deməyiniz sizə müsbət xal qazandırar.   Təbii ki hər bir şirkətin müsahibe suallari fərqli olur. Ama demək olarki hamısıda aşağıdakı suallar verir. Ona görədə bu suallara əvvəlcədən yaxşi hazirlaşmaq lazimdir.   Müsahibə sualları və cavablarına aid nümunələr Bəzi iş müsahibəçiləri müsahibə suallarına olduqca qeyri-ənənəvi yanaşsalar da, əksər iş müsahibələri ümumi müsahibə sualları və cavablar toplusunu əhatə edir. Ən çox yayılmış müsahibə sualları və effektiv cavablar bunlardır:  1. Özünüz haqqında bizə məlumat verə bilərsinizmi? Bu, yəqin ki, ən çox verilən müsahibə sualıdır. Bu, adətən verilən ilk sualdır və açıq sual olduğundan cavab vermək çətin sualdır. İşəgötürən sizin CV-nizdən uyğun təəssürat yaradacaq. Bu suala cavabınız onlara bu qeydin düzgünlüyünü tez müəyyən etməyə kömək edəcək. Bu, həmçinin onlara səsiniz və bədən diliniz vasitəsilə inam səviyyənizi müşahidə etmək imkanı verir.  Sualın cavabı belədir: “Bu suala vəzifə üçün tələb olunan bacarıq və təcrübə baxımından cavab verin. Karyera tarixçənizin qısa xülasəsi ilə başlayın. Sonra, karyeranızın necə inkişaf etdiyinə dair qısa məlumat verərək, öyrəndiyiniz və ya əldə etdiyiniz şeylərə daha çox diqqət yetirin.İşəgötürənə lazım olan bütün məlumatları verdiyinizə əmin olmaq üçün cavabınızı daha ətraflı izah etməyinizi istədikləri nəsə olub-olmadığını soruşmaqla bitirin.      2. Təşkilat/Şirkət haqqında nə bilirsiniz? Kənardan şirkət haqqında hər şeyi bilməyə bilərsiniz, lakin əsas məqamları bilmək vacibdir. Onlar bilmək istəyirlər ki, sizin onlar üçün işləmək həvəsiniz həqiqətəndə varmı? Cavabınızı həvəslə göstərdiyinizə əmin olun. Böyük cavabın açarı geniş araşdırmadır. Şirkəti, onun strukturunu, dəyərlərini və istəklərini araşdırmaq sizin araşdırma və işə həvəs bacarıqlarınızı göstərəcək.      3. Niyə bizim şirkətdə işləmək istəyirsiniz? İşəgötürən sizin iş üçün motivasiyanızı aşkar etmək istəyir. Bu suala müvəffəqiyyətlə cavab vermək üçün, sizin istəyinizdən çox, şirkətin ehtiyacını ön plana çəkin. Bu üsul daha uyğun hesab edilir.      4. Şirkətə necə dəyər qata bilərsiniz? İşəgötürən sizin bacarıqlarınızı vakansiya üçün tələb olunan bacarıqlarla müqayisə etmək istəyir. Bu, niyə sizi işə götürməli olduqlarını soruşmağın bir yoludur.. Hər bir bacarıq üçün bu bacarığı necə əldə etdiyinizi və ya inkişaf etdirdiyinizi və bu bacarığın hazırda işəgötürəninizə necə fayda verdiyini izah edən qısa bir nümunə yaradın.  Siz həmçinin müəyyən etməlisiniz:  -Necə işləyirsən?  -Peşəyə olan həvəsiniz?  -İşə yeni perspektiv gətirməyin yolları nələrdir?     5. Zəif cəhətləriniz nələrdir? İşəgötürən sizin zəif tərəflərinizdən xəbərdar olub-olmadığınızı və onların aradan qaldırılması üçün strategiyalarınızın olub-olmadığını öyrənmək istəyəcək. Bəzi işəgötürənlər də təzyiq altında necə davrandığınızı görmək üçün bu sualdan istifadə edirlər. İşi yerinə yetirmək qabiliyyətinizə birbaşa təsir edəcək zəif nöqtələri qeyd etməyin. Hal-hazırda üzərində işlədiyiniz zəif nöqtələriniz  haqqında özünüzü inkişaf etdirdiyiniz haqqında danışın.     Deyə biləcəyiniz bəzi şeylər:  “Əvvəllər eyni vaxtda bir neçə layihəni idarə edəndə vəzifələrimi xatırlaya və prioritetlərimi müəyyənləşdirə bilmirdim. Bunun qarşısını almaq üçün hər gün prioritet işlər siyahısı yaratdım. ”  “Mən ən yüksək prioritet olmayan işlərə çox vaxt sərf edirdim. İndi vaxtımı biznesə dəyər qatan şeylərə həsr etməyi daha yaxşı bacarıram. ”  “Əvvəllər gərgin təqdimatlar edirdim, ona görə də natiqliyimi təkmilləşdirmək üçün kursa yazıldım.”     6. Güclü tərəfləriniz hansılardır? İşəgötürənlər sizin bacarıqlarınızın, səriştələrinizin və təcrübənizin vakansiyadakı peşə üçün ehtiyac duyduqlarına necə uyğun gəldiyi ilə maraqlanırlar. Onlar sizin iş üçün müvafiq bacarıq və təcrübəniz olub olmadığını bilmək istəyirlər. İş elanını təhlil edin və bu vəzifə üçün tələb olunan əsas bacarıq və səriştələri  seçin. Xüsusilə, güclü tərəflərinizin sizi digər namizədlərdən necə fərqləndirə biləcəyini düşünün. Mövcud işəgötürəninizin güclü tərəflərinizdən necə istifadə etdiyini aydınlaşdırın. Müraciət etdiyiniz işə aidiyyatı olmayan güclü tərəfləri sadalamayın. Və nailiyyətlərinizi deməkdən utanmayın.     7. Qürur duyduğunuz nailiyyətlərinizi  səsləndirin. İşəgötürən nəyin vacib olduğunu və prioritetlərinizin nə olduğunu öyrənmək üçün bu sualı verir. Bunların sizə uyğun olub olmadığını düşünür və  bu nə qədər yaxşı çıxış etdiyinizi göstərir. İstəkləriniz və dəyərləriniz haqqında danışın.      8. Biz sizi niyə işə götürməliyik? Sizi biznes üçün dəyərli edən nədir? Bu sualın vacib hissəsi "sən"dir. İşəgötürənin maraqlandığı budur. Siz xüsusi alətdən, proqramdan və ya xidmətdən istifadə etmək üzrə təlim keçmisiniz. Siz sertifikatlısınız və ya tanınmış, biliyə sahib şəxssiniz. Bacarıqlarınızı sadalamaqdan kənara çıxmaq və şirkət və vəzifə tələbləri ilə bağlı apardığınız araşdırmaları həqiqətən nümayiş etdirmək üçün bu sual tam uyğundur. Xüsusi bacarıqlarınızın şirkətdə necə fərq yarada biləcəyi və qarşılaşdığınız çətinliklər haqqında danışın.     9. Xəyal etdiyiniz iş nədir? Bu cavab vermək üçün ən çətin müsahibə suallarından biridir. O, təkcə “Karyera yolunuz nədir?” sualına cavab vermir. İşəgötürənlər bu sualı sevirlər, çünki bu sualla namizədlərə təzyiq göstərərək onları sınaqdan keçirirlər.   Sahib olduğunuz bacarıqlar və onların şirkətin ehtiyaclarını necə qarşıladığı.  İnkişaf etdirmək istədiyiniz bacarıqlar və bu vəzifə onları inkişaf etdirməyə necə imkan verəcək.  Sizi motivasiya edən ideallar və ideyalar və şəxsin onlar üçün necə çalışacağı.  İstəklərinizin və ya maraqlarınız və bu rolun onlarla qarşılıqlı əlaqədə sizə necə kömək edəcəyi.  Onlar sizin dəyərlərinizə və işəgötürənin dəyərlərinə nə qədər uyğun gəlirlər.  Siz deyə bilərsiniz: “Hazırda müsahibədə olduğum  bu iş mənə karyera yolum üçün lazım olan bacarıq və təcrübəni təmin etmək baxımından tamamilə əladır.”      10. Sizi nə motivasiya edir? İşəgötürən sizin yaxşı bir iş ərsəyə gətirməyiniz üçün sizə nə lazım olduğunu bilməyə kömək edir. Bu mühüm sualdır, çünki o, potensial işəgötürənə sizi başa düşməyə və motivasiyalarınızın təşkilatın mədəniyyətinə uyğun olub-olmadığını ölçməyə imkan verir. Bacarıqlarınızın, təcrübənizin və şəxsiyyətinizin işə uyğun olması vacibdir.      11. Xarakterinizi 30-dan az kəlmə ilə təsvir edin İşəgötürən sizin özünüzdən xəbərdar olub olmadığınızı öyrənmək üçün bu sualdan istifadə edir. Özünü dərk etmək müsbət peşəkar xüsusiyyətdir. Özünü bilən insanlar adətən rəy və peşəkar inkişafa açıqdırlar. Sual həm də sizin çox məhdud miqdarda mürəkkəb məlumatı ümumiləşdirmək qabiliyyətinizi yoxlayır. Cavabınızda ən çox iki və ya üç xüsusiyyətə sadiq qalın. Cavabınızı etibarlı etmək üçün hər bir xüsusiyyəti nümunə göstərin.     12. Keçmiş işinizi niyə tərk etmisiniz? İşinizi tərk etməyin bir çox səbəbləri ola bilər. Müsahibinizi bu iş dəyişikliyinə əmin edəcək düşüncəli cavab hazırlayın. Hazırkı və ya əvvəlki rolunuzun mənfi tərəflərinə diqqət yetirmək əvəzinə, gələcəyə və növbəti vəzifənizdə nə qazanacağınıza diqqət yetirin.     Misal: “Mən müştərilərlə daha sıx və uzunmüddətli əlaqələr qurmaq imkanı verən fürsət axtarıram. Hazırkı vəzifəmdə satış dövrü o qədər qısadır ki, müştərilərimlə münasibət qurmaq üçün istədiyim qədər vaxtım yoxdur. Münasibətlərin qurulması satış sahəsində karyera qurmağımın səbəblərindən biridir və bunun əsas prioritet olduğu bir şirkətlə işləməyi səbirsizliklə gözləyirəm. ”     13. Gələcək üçün hədəfləriniz nədir? İşə götürmə menecerləri şirkətdə uzun müddət qalmaq istəyib-istəmədiyinizi müəyyən etmək üçün gələcək karyera hədəfləriniz haqqında suallar verirlər. Həmçinin, bu sual sizin ambisiyanızı, karyeranız üçün perspektivləri və qabaqcadan planlaşdırma qabiliyyətinizi ölçmək üçün istifadə olunur. Bu sualı həll etməyin ən yaxşı yolu cari karyera trayektoriyanızı və bu işin son məqsədlərinizə çatmağınıza necə kömək etdiyini müəyyən etməkdir.     Nümunə: “Mən növbəti illərdə olduğu kimi marketinq təcrübəmi inkişaf etdirməyə davam etmək istəyirəm. Sürətlə böyüyən bir startup layihələrində işləməkdə maraqlı olmağımın səbəblərindən biri də hər yoldan istifadə etmək və bu sahədə daha dolğun məlumat toplamaqdır. İnanıram ki, bu təcrübə bir gün marketinq şöbəsinə rəhbərlik etmək məqsədimə çatmağa kömək edəcək. ”     14. Çətin vəziyyətlərdən necə çıxdığınız barədə məlumat verə bilərsinizmi? Bu sual tez-tez təzyiq altında nə qədər yaxşı performans göstərdiyinizi  və problem həll etmə qabiliyyətlərinizi qiymətləndirmək üçün istifadə olunur. Unutmayın ki, hekayələr fakt və rəqəmlərdən daha yaddaqalan olur.     15. Maaş aralığınız nə qədərdir?(Maaş gözləntiniz nə qədərdir?) Müsahiblər bu sualı sizin gözləntilərinizin iş üçün büdcəyə uyğun olduğundan əmin olmaq üçün verirlər. Vəzifənin bazar dəyərindən çox aşağı və ya daha yüksək əmək haqqı diapazonu versəniz, öz dəyərinizi bilmədiyiniz təəssüratı yaradırsınız.      Misal: “Mənim maaş gözləntim XX, XXX və YY, YYY arasındadır. Bu, mənim kimi bir namizəd üçün orta əmək haqqıdır.”     16. Rəhbəriniz və ya iş yoldaşlarınız sizi necə təsvir edərdi?  Hər şeydən əvvəl dürüst olun. Sonra müsahibənin digər aspektlərində müzakirə etmədiyiniz gücü və xüsusiyyətləri, məsələn, güclü iş etikası və ya lazım olduqda digər layihələrdə iştirak etmək istəyinizi aşkar bildirməyə çalışın.   ', N'f8e0493a-4a3e-42d6-bfb5-6c0305206425is-musahibesinden-evvel.jpg', CAST(N'2023-07-01T17:04:52.6534590' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (8, N'Effektiv təşkilati dizayn üçün Michael Goold və Andrew Campbell’in 9 test metodu haqqında', N'Salam, dostlar.  Təşkilatınızı daha praktiki analiz edə bilmək və daha doğru dizayn etməyiniz üçün Sizə Michael Goold və Andrew Campbell’in hazırlamış olduqları 9 testi təqdim edirəm. Bu modelin əsas üstünlüyü əhatəli prinsiplərə söykənən və ən vacib məsələlələrin həlli üçün praktik yoxlama və yönləndirmə imkanı təmin edən infrastuktur formalaşdırmasıdır.  Testlər iki qrupa üzrə təqdim edilir. Təşkilati uyğunlaşdırma prinsipləri üzrə testlər və təkmilləşdirmə prinsipləri üzrə testlər.    İlk olaraq daha strateji olaraq göstərilən uyğunluq prinsipləri və onlara aid olan testlərdir.  Məhsul-bazar strategiyaları Korporativ strategiya İşçilər Məhdudiyyətlər Digərləri isə aşağıdakı təkmilləşdirmə prinsiplərinə aid olan testlərdir.  Peşəkarlıq Koordinasiya Bilik və səriştəlik Nəzarət və öhdəlik Yenilik və uyğunlaşma Prinsiplər geniş xarakter daşıyır və onları istiqamətləndirici təlimata çevirmək həmişə asan olmur. Onlar rəhbərlərin yönləndirilməsində daha qiymətlidirlər nəyinki təşkilati dilemmaların həll olunmasında. Bu prinsiplərlə işləyərək, araşdırmalar və mülahizələrlə onların əsasında praktiki testlər hazırlamaq mümkün olmuşdur.  İlk öncə UYĞUNLUQ TESTLƏRİ ilə tanış olaq.  1. Bazar üstünlüyü testi   Demək olar ki, hamılıqla qəbullanmış bir yanaşma budur ki, təşkilati dizayn təşkilat məqsədləri üçün uyğun olmalıdır. Buna görə də strategiya təşkilat dizaynının əsas aparıcı yol nişanı hesab olunur və məhsul-bazarı strategiyaları ilə korporativ strategiyanı ayıraraq testlərin həyata keçirilməsi daha faydalı olur. Ancaq strategiya təşkilati dizaynın formalaşdırılması üçün vahid kriteriya deyil. İşçilər ən azı strategiya qədər vacibdir. Lakin təşkilati dizaynın işçilərə görə qurulması məsləhət görülmür. O, strategiya ətrafında qurulmalı və lazım gələrsə işçiləri dəyişdirməyi üstün tutmalıdır. Ancaq işçiləri hər zaman dəyişdirmək mümkün olmur və lazımi tələblərə cavab verən yeni işçiləri tapmaq çətin ola bilir. Beləliklə təşkilati dizaynlar onlara rəhbərlik edəcək və onlarda işləyəcək mövcud olan işçiləri ilk olaraq nəzərə almalıdır.   Çox tez-tez təşkilatlar şirkətin strategiyası ilə kifayət qədər əlaqəli olmayan şəkildə inkişaf edir və ya əsas vəzifələri dolduracaq menecerlərin məhdudiyyətlərinə az əhəmiyyət verirlər. Beləliklə ilk olaraq təşkilati dizaynın uyğunluq prinsipləri ilə bağlı olan birinci bazar üstünlüyü testini nəzərdən keçirək.   Testə nəzər salmadan ilk əvvəl bu suala özümüzdə cavab axtaraq: Təşkilati dizaynınız idarəetmənin fokusunu hər bir bazarda rəqabət üstünlüyü mənbəyinizə kifayət qədər yönləndirə bilirmi?   Strategiya tərtib edərkən şirkət özünə iki əsas fundamental sualı verməlidir:   •       Hansı bazarlarda rəqabət aparmalıyıq? •       Bu bazarlarda rəqiblərdən necə üstün olacağıq?  Açıq görünür ki, bu suallar şirkətin təşkilat dizaynını da düşündürməlidir, lakin bir çox strukturlar bazar strategiyasını dəstəkləmək əvəzinə ona mane olur. Bəzi dizaynlar öhdəlikləri yüksək rəhbərliyin diqqətini hədəf müştərilərdən yayındıracaq şəkildə bölüşdürürlər. Digərləri, şirkətin rəqabət qabiliyyətini təmin edəcək şəkildə fəaliyyət göstərməsini çətinləşdirəcək funskiyalar yaradırlar. Bu cür uyğunsuzluqların zərəri çox böyük ola bilər.  Buna görə dizaynın ilk və ən əsas sınağı, şirkətinizin bazar strategiyasına uyğun olub-olmamasını müəyyən etməyinizdir. Prosesə hədəf bazar seqmentlərinizi təyin etməklə başlamalısınız.                                                                                   Sonra, dizaynın hər bir bazar seqmentinə kifayət qədər diqqət yönləndirdiyini müəyyənləşdirin. Qızıl qayda budur. Əgər bir funksiya konkret olaraq bir seqmentə ayrılırsa, seqmentə kifayət qədər diqqət yetirilir deməkki. Heç bir bölmə hər hansı seqment üçün məsuliyyət daşımırsa, dizaynda nöqsan var deməkki və yenidən işlənməlidir. Çox vaxt analiz o qədər də aydın olmur; bir bölmə bir neçə seqmentə cavabdeh ola bilər (Bu, tez-tez kiçik, lakin sürətlə böyüyən bazar seqmentlərinə aiddir). Bu cür halları diqqətlə qiymətləndirməlisiniz, məsuliyyət bölgüsünün bütün seqmentlərə prioritetləri üzrə kifayət qədər diqqət yönəldilməsinə imkan verib vermədiyi barədə nəticə çıxarmalısınız.  Dizaynın əsas üstünlük mənbələrinizə (məsələn, məhsulların sürətli satışı və ya istehsal xərcinin azaldılması) və əlaqəli əməliyyat təşəbbüslərinizə (məhsulun bazara çıxarılması, fabrikin avtomatlaşdırılması) necə təsir etdiyinidə müəyyən etmək vacibdir. Bu faktorları və təşəbbüsləri bir bir qeyd edin və dizaynın onlarla necə əlaqələndirildiyini yoxlayın. Mükəmməl bir mühitdə hər bir proses və təşəbbüsə görə cavabdeh olan vahid struktur bölməniz və ya şöbəniz olardı. Reallıqda isə, bazar şəraiti bölmələr arasında tez tez əlaqələndirmə aparmağı tələb edir. Məsələn, bir seqmentdəki bazar üstünlüyünüz digər bölmə üçün yeni məhsul inkişaf etdirmək üçün informasiya təmin etmiş olmalıdır. Bu məqsədə çatmaq üçün seqment üçün cavabdeh olan bölmənin mərkəzi tədqiqat funksiyası ilə əməkdaşlıq etməyə ehtiyacı yaranmış olur.   Əsas üstünlüyünüz çox sayda bölmələr arasında əlaqələndirilmiş işləyişi tələb edən proseslərdən faydalanmağınızdır.  Bölmələr arasındakı əməkdaşlığı bölmələr daxilindəki əməkdaşlıqdan fərqli olaraq idarə etmək həmişə daha çətin olduğuna görə xüsusi diqqət yetirilməlidir. Dizaynın bölmə rəhbərlərinə bölmələr arası əlaqələrin qorunmasına kifayət qədər imkan verəcəyinə əmin olmalısınız.', N'6db12685-4bc4-4064-a97b-82100d2f35951672846265.jpeg', CAST(N'2023-07-01T17:07:19.7095316' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (9, N'Fürsət yoxsa risk?', N'Gənc dostlar və karyera planları ilə bağlı əlavə mülahizə imkanları əldə etmək istəyənlər üçün təcrübələrimi bölüşəcəm.  Ola bilsin ki, indi və bundan sonra paylaşacağım təcrübələr kimlər üçünsə karyera fürsətlərini dəyərləndirmək üçün əhəmiyyətli məlumat olacaq.  2010-cu il işə qəbul olunmağımın belə xüsusi bir əhvalat olduğu Azersun Holdinqdə (ilk iş yerim) iş təcrübəmin 2-ci ili idi. Çalışdığım iş saatlarını diqqətdə aldıqda 3-cü il olduğuna inanıram )  Holdinqin şirkətlərindən birində pilot layihə ilə bağlı tez tez görüşlərdə olurdum. Bu dövrdə həmin təşkilatda çalışan peşəkar insanlardan biri olan Xəqani Ağasıyevlə yaxından tanımış oldum. Bir neçə həftədən sonra pilot layihəni bitirib mərkəzi ofisdəki işlərə fokuslandım.  Üzərindən günlər keçmişdi Xəqani bəydən zəng gəldi. Bir tanışı ölkədəki öz sektorunda lider olan şirkətlərin birinin sahibi idi və mənə iş təklifi etmək istədiyini bildirdi. Mənə maraqlı gəldi və hansı funksiya və nə iş olmasını soruşdum Xəqani bəydən. Şəxsin güvənilir bir insana ehtiyacı olduğu və rəhbərlik səriştəsi tələb etdiyini bildirdi. Mən isə Xəqani bəyə 2 il rəsmi iş təcrübəmin olduğu bildirdim. Xəqani bəy hər bir halda görüşməyin faydalı olduğunu əminliklə tövsiyyə etdi və mən görüş üçün razılaşdım.  Şirkət sahibindən zəng aldım. Görüşdük. Maraqlı idi ki, görüşü yürüş edərək keçirdik və çox faydalı müzakirələrimiz oldu. Bir neçə gün sonraya ofislərində görüş üçün razılaşdıq.  Görüş günü çox kritik işlər var idi öz şöbəmdə və Holdinqin aylıq 4 saat icazə məhdudiyyətini nəzərə alaraq hər yerə olduğu kimi yenə avtomobili Şumaxer kimi sürərək ofislərinə çatdım və dərhal müzakirələri maksimum sürətli aparmağı xahiş etdim.  İlk söz bu oldu; sənə indi aldığından 5 dəfə yüksək əmək haqqı və şəxsi sürücü və avtomobil veririk. Mən gənc təcrübəmlə indi həftə içi 8-9 saat, şənbə günləri 5-6 saat çalışıramsa, hər halda burda yaşamalı olacam düşünürdüm. Soruşdum iş nə olacaq?  Bildirdilər ki, “əsas problem komandanın idarə olunması ilə bağlıdır. 500 nəfər işçi var və proseslər xautikdir. Və əlavə olaraq bizə borclanmış müştəri sayı həddən artıq çoxdur. Bununla bağlıda işlər görülməlidir”. Mən isə sadə sual verdim. Nə üçün mən?  GÜVƏN səbəbi və nəticəyönümlüklə bağlıdır söylədilər. Bu zaman düşündüm demək Holdinqin mənə ödədiyi maaş mənim qabiliyyətlərim üçündür, burdakı 4 maaş artım isə güvənin qiyməti imiş. Bu halda deməkki güvən hər zaman düşündüyüm kimi çox əhəmiyyətdən ziyadə çoxda bahalı görülürmüş ). Bunun qiymətini bilməm və nəyin bahasına olur olsun qorumam lazımdır demək.  Soyuqqanlı şəkildə 3 gün vaxt istədim. Və həmin 3 gün ərzində düşündüm.  A) Bir tərəfə kifayət qədər böyük, uğurlu bir biznes va və oradan çox böyük səlahiyyət və gəlirləri yaxşılaşdırmaq imkanları var idi.  B) Digər tərəfdə ölkənin ən iri təşkilatlarından biri və hələ öyrənəcəyim çox şey var idi.  Mən -B- ni seçdim. Səbəbi sadə idi motivatorlarım azadlığı seçirdi. Azadlıq isə yalnız unikal bilik, bacarıq və səriştəliklər əldə etməkdən keçirdi. A) iş yeri davamlı olmadığı təqdirdə mənim yalnız şəxsi vəsaitlərimdə artım olacaqdı. Əldə etdiyim biliklər isə kiçik təşkilatların əməliyyatları müstəvisində olacaqdı.  Beləliklə bəzi təkmilləşdirmə təkliflərimlə 3 gün sonra görüşdüm və qərarımı açıqladım. Doğru qərar olduğunun fərqindəyəm.  Çıxardığım məntiqi nəticələri daha uzun uzadı yazmayacam. Fikirləri qarışdırmaq deyil məqsədim. Eyni durumda qərar vermək istəyində olanlar üçün daha “bir amili” düşünmələrində faydalı olmaqdı.  Hər bir vəziyyətə individual yanaşmaq, şərtlərə individual baxmaq lazımdır.  Məqalənin faydalı olduğunu düşünürsünüzsə ardı olacağına əmin ola bilərsiniz.  Uğurlu gün və davamlı nəticələr arzulayıram.     Müəllif: Rəşad Məhərrəmov, Azərbaycanda İnsan Resursları sahəsində peşəkar ekspert. HRM & Strategist | Strategy Management | Organizational Design & Development | Business Transformation', N'39895618-1e28-4e1d-9228-a65e4e2773df1672839192.jpeg', CAST(N'2023-07-01T17:17:39.4992686' AS DateTime2))
INSERT [dbo].[Blogs] ([id], [Title], [Description], [ImageURL], [DateTime]) VALUES (10, N'232', N'wew', N'680b8295-1dc7-455c-8e5c-23f471ea2590Monster.jpg', CAST(N'2023-07-02T00:27:22.2756408' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Blogs] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (5, N'<i class="fa-solid fa-bullhorn"></i>', N'Sale')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (6, N'<i class="fa-solid fa-laptop-code"></i>', N'Information technologies, telecom')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (8, N'<i class="fa-solid fa-coins"></i>', N'Finance')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (9, N'<i class="fa-sharp fa-solid fa-clipboard-user"></i>', N'Administrative staff')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (10, N'<i class="fa-solid fa-truck-fast"></i>', N'Transport, logistics, warehouse')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (11, N'<i class="fa-solid fa-staff-snake"></i>', N'Medicine and pharmacy')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (12, N'<i class="fa-sharp fa-solid fa-volleyball"></i>', N'Beauty, Fitness, Sports')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (13, N'<i class="fa-solid fa-utensils"></i>', N'Restaurant business and tourism')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (14, N'<i class="fa-solid fa-user-graduate"></i>', N'Education and science')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (15, N'<i class="fa-sharp fa-solid fa-chart-simple"></i>', N'Marketing, advertising, PR')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (16, N'<i class="fa-solid fa-industry"></i>', N'Industry and manufacturing')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (17, N'<i class="fa-solid fa-hand-sparkles"></i>', N'Housekeeping and cleaning')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (18, N'<i class="fa-solid fa-pen-nib"></i>', N'Design')
INSERT [dbo].[Categories] ([id], [Icon], [Name]) VALUES (19, N'<i class="fa-solid fa-shield"></i>', N'Security')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([id], [CityName]) VALUES (1, N'Baku')
INSERT [dbo].[Cities] ([id], [CityName]) VALUES (2, N'Gence')
INSERT [dbo].[Cities] ([id], [CityName]) VALUES (3, N'Qazax')
INSERT [dbo].[Cities] ([id], [CityName]) VALUES (4, N'Qusar')
INSERT [dbo].[Cities] ([id], [CityName]) VALUES (5, N'Xudat')
INSERT [dbo].[Cities] ([id], [CityName]) VALUES (6, N'Xachmaz')
INSERT [dbo].[Cities] ([id], [CityName]) VALUES (7, N'Nabran')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Educations] ON 

INSERT [dbo].[Educations] ([id], [EducationName]) VALUES (1, N'School')
INSERT [dbo].[Educations] ([id], [EducationName]) VALUES (2, N'Bakalavr')
INSERT [dbo].[Educations] ([id], [EducationName]) VALUES (3, N'Master')
INSERT [dbo].[Educations] ([id], [EducationName]) VALUES (4, N'PHD')
SET IDENTITY_INSERT [dbo].[Educations] OFF
SET IDENTITY_INSERT [dbo].[JobTypes] ON 

INSERT [dbo].[JobTypes] ([id], [WorkType]) VALUES (1, N'Internship')
INSERT [dbo].[JobTypes] ([id], [WorkType]) VALUES (2, N'Part Time')
INSERT [dbo].[JobTypes] ([id], [WorkType]) VALUES (3, N'Full Time')
INSERT [dbo].[JobTypes] ([id], [WorkType]) VALUES (4, N'Volunteer')
INSERT [dbo].[JobTypes] ([id], [WorkType]) VALUES (5, N'Freelance')
INSERT [dbo].[JobTypes] ([id], [WorkType]) VALUES (6, N'Temporary')
SET IDENTITY_INSERT [dbo].[JobTypes] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([id], [LanguageName]) VALUES (1, N'Aze')
INSERT [dbo].[Languages] ([id], [LanguageName]) VALUES (2, N'Ru')
INSERT [dbo].[Languages] ([id], [LanguageName]) VALUES (3, N'Tr')
INSERT [dbo].[Languages] ([id], [LanguageName]) VALUES (4, N'Fr')
INSERT [dbo].[Languages] ([id], [LanguageName]) VALUES (5, N'Eng')
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (24, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'Emil', N'alberthaciverdiyev55@gmail.com', NULL, N'Isteyirsen gel isle
', CAST(N'2023-06-28T16:07:39.0552251' AS DateTime2), 1016, 19, 6, 9, NULL, NULL)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (26, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'arif', N'albertg@mail.ru', NULL, N'gelirsen ?', CAST(N'2023-06-28T16:07:59.4938689' AS DateTime2), 1016, 18, 6, 10, NULL, 1013)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (29, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'albert', N'alberthaciverdiyev55@gmail.com', N'+994709990568', N'kqen,d', CAST(N'2023-06-29T22:47:40.1938705' AS DateTime2), 1016, 1015, 5, 7, NULL, 1014)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (30, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'albert', N'alberthaciverdiyev55@gmail.com', N'+994709990568', N'yuyuklio;', CAST(N'2023-06-29T22:48:17.6228934' AS DateTime2), 1016, 1015, 5, 7, NULL, 1014)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (31, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'albert', N'alberthaciverdiyev55@gmail.com', N'+994709990568', N'sa', CAST(N'2023-06-29T22:51:55.6024802' AS DateTime2), 1016, 1015, 5, 7, NULL, 1014)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (32, N'imran', N'alberthaciverdiyev55@gmail.com', NULL, N'Emil', N'alberthaciverdiyev55@gmail.com', NULL, N'sa qolaxa', CAST(N'2023-06-29T23:00:49.8979746' AS DateTime2), 1018, 19, 6, 9, NULL, NULL)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (37, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'Emil', N'a', NULL, N'gel isle', CAST(N'2023-07-01T03:13:32.7694122' AS DateTime2), 1016, 19, 6, 9, NULL, NULL)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (39, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'arif', N'albertg@mail.ru', N'+994111111', N'jytibkuymo', CAST(N'2023-07-01T03:32:25.2247942' AS DateTime2), 1016, 18, 6, 10, NULL, 1013)
INSERT [dbo].[Messages] ([id], [SenderName], [SenderEmail], [SenderPhone], [ReceiverName], [ReceiverEmail], [ReceiverPhone], [Description], [Created], [SenderId], [ReceiverId], [CategoryId], [PositionId], [PostJobId], [UserPostJobId]) VALUES (46, N'Emil', N'albertg@mail.ru', NULL, N'albertIs', N'alberthaciverdiyev55@gmail.com', N'+994709990569', N'I want work with you', CAST(N'2023-07-04T00:16:29.4003087' AS DateTime2), 19, 1016, 15, 91, 1027, NULL)
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (7, N'Cashier', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (8, N'SalesMan', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (9, N'Backend developer', 6)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (10, N'Frontend Developer', 6)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (11, N'FullStack Developer', 6)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (12, N'Financial analyst', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (13, N'Assistant Accountant', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (14, N'Accountant', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (15, N'Other', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (16, N'Loan officer', 5)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (17, N'System Administrator', 6)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (18, N'Service Engineer ', 6)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (19, N'Other', 6)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (20, N'Call center employee', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (21, N'Reception', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (22, N'Coordinator', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (23, N'Secretary', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (24, N'Office manager', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (25, N'Office cleaner', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (26, N'Other', 9)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (27, N'Warehouse operator', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (28, N'Forwarder', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (29, N'Driver', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (30, N'Taxi Driver', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (31, N'Warehouseman', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (32, N'Stacker-packer', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (33, N'Driver-forwarder', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (34, N'Special equipment driver', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (35, N'Warehouse Assistant', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (36, N'Foot Courier', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (37, N'Driver-courier', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (38, N'Dispatcher', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (39, N'Packer', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (40, N'Other', 10)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (41, N'Veterinarian', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (42, N'Doctor', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (43, N'Optics', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (44, N'Medical representative', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (45, N'Pharmacist', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (46, N'Speech therapist', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (47, N'Financial analyst', 8)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (48, N'Assistant Accountant', 8)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (49, N'Accountant', 8)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (50, N'Loan officer', 8)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (51, N'Other', 8)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (52, N'Administrator', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (53, N'Cosmetologist', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (54, N'Coach', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (55, N'Nail service', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (56, N'Masseur', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (57, N'Hair stylist-stylist', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (58, N'Other', 12)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (59, N'Administrator', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (60, N'Chef', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (61, N'Barista', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (62, N'Bartender', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (63, N'Guide', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (64, N'Bartender', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (65, N'Baker', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (66, N'Spinner', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (67, N'Hostess', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (68, N'Griller', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (69, N'Waitress', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (70, N'Dishwasher', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (71, N'Wardrobe', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (72, N'Restaurant cashier', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (73, N'Pastry Chef', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (74, N'Housekeeper', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (75, N'Other', 13)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (76, N'Preschool / Educator', 14)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (77, N'Tutor', 14)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (78, N'Special education / Trainings', 14)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (79, N'Teacher', 14)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (80, N'Other', 14)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (81, N'Brand manager', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (82, N'Content manager', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (83, N'Copywriter', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (84, N'Marketing Specialist', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (85, N'Marketer', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (86, N'Merchandiser', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (87, N'Consultant', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (88, N'PR manager', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (89, N'Promoter', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (90, N'Advertising Manager', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (91, N'SMM manager', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (92, N'Other', 15)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (93, N'Other', 11)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (94, N'Tailor', 16)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (95, N'Agriculture', 16)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (96, N' Technologist', 16)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (97, N'Geology and environment', 16)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (98, N'Engineer', 16)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (99, N'Other', 16)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (100, N'Nanny-educator', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (101, N'Family on condition of stay', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (102, N'Housekeeper', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (103, N'Gardener', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (104, N'Dishwasher', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (105, N'Farm Assistant', 17)
GO
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (106, N'Caretaker', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (107, N'Other', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (108, N'Watchman', 19)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (109, N'Guard', 17)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (110, N'Controller', 19)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (111, N'Other', 19)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (112, N'Clothing Designer', 18)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (113, N'Graphic designer', 18)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (114, N'Web Designer', 18)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (115, N'Artist', 18)
INSERT [dbo].[Positions] ([id], [PositionName], [CategoryId]) VALUES (116, N'Interior designer', 18)
SET IDENTITY_INSERT [dbo].[Positions] OFF
SET IDENTITY_INSERT [dbo].[PostJobs] ON 

INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1021, 6, 2, NULL, 2, CAST(200.00 AS Decimal(18, 2)), 3, NULL, 2, N'+994709990569', NULL, NULL, N'liuawrsfq3 we', -1, 2, CAST(N'2023-07-02T16:05:13.0198370' AS DateTime2), 1029, 9)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1022, 5, 2, 5, 3, CAST(535.00 AS Decimal(18, 2)), 1, 1, 3, N'+994709990569', NULL, NULL, N'wlu', 16, 95, CAST(N'2023-07-02T16:13:06.9349656' AS DateTime2), 1029, 8)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1023, 9, 3, NULL, 3, CAST(535.00 AS Decimal(18, 2)), 4, 1, 1, N'+994709990569', NULL, NULL, N'li 3uon2noe2', 16, 26, CAST(N'2023-07-02T16:18:35.8457804' AS DateTime2), 1029, 23)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1024, 6, 2, 8, 4, CAST(5355.00 AS Decimal(18, 2)), 2, 4, 3, N'+994709990569', NULL, NULL, N'kiuuew8cn289928ucnxq83xq87hi128x28', 16, 66666, CAST(N'2023-07-02T16:22:06.3191483' AS DateTime2), 1029, 18)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1025, 9, 3, 5, 3, CAST(100.00 AS Decimal(18, 2)), 3, 3, 1, N'+994709990569', N'alyonahaciverdiyeva@gmail.com', NULL, N'klwfkquwnfdkwndkwndkjs', 16, 202, CAST(N'2023-07-02T17:09:36.4177995' AS DateTime2), 1029, 24)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1027, 15, 3, 2, 3, CAST(500.00 AS Decimal(18, 2)), 1, NULL, 2, N'+994709990569', N'alberthaciverdiyev55@gmail.com', NULL, N'Обязанности:

Своевременный ответ на ежедневные комментарии и сообщения;
Организация прямых трансляций в филиалах компании
Обмен изображениями продуктов и страницами в разделе истории;
Осуществлять онлайн-продажи продукции магазина;
Требования к кандидату:

Высшее образование (бакалавр)
Знание иностранных языков: русский, английский (желательно)
Опыт работы в области маркетинга в социальных сетях (SMM) не менее 1 года.
Умение вести деловую переписку и устные переговоры
Компания предлагает:

Время работы: 6 дней в неделю
Заработная плата: 500 манат + премия
Документация согласно ТК
Заинтересованные кандидаты, желающие присоединиться к нашей команде, могут отправить свое резюме с пометкой «SMM-специалист» в теме письма.', 16, 30, CAST(N'2023-07-02T21:56:54.6841637' AS DateTime2), 1016, 91)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1028, 18, 3, 4, 4, CAST(1000.00 AS Decimal(18, 2)), 1, 2, 5, N'+994709990569', N'alberthaciverdiyev55@gmail.com', NULL, N'About the job:

Preparation of graphic designs for SMM posts;      Working days: Monday-Friday;
Working hours: 10:00-18:00;                                      Formalization with an employment contract;
Workplace: Azure Business Center                           Salary - 700-1000 AZN
Candidate requirements:

Working in Photoshop, Illustrator programs;
At least 1 year of work experience in an advertising agency.
We offer our employees:

Positive team environment;                                 Long-term employment contract;
The prospect of salary and experience growth        We are waiting for your CV and Portfolio with the title " Graphic Designer " to this address.

Application deadline: July 19', 20, 40, CAST(N'2023-07-02T21:59:19.5947133' AS DateTime2), 1016, 113)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1029, 15, 5, NULL, 4, CAST(700.00 AS Decimal(18, 2)), 2, 2, 5, N'+994709942256', NULL, NULL, N'Obligations:

Tidy up the windows at the points of sale regularly in accordance with the instructions;
Control the expiration dates of products and inform sales representatives about it;
Regularly check the warehouse at the points of sale and in the store regarding the adequacy of the product assortment;
To be aware of the company''s product range and properly promote them;
Performing other tasks determined by the management
Salary 500 AZN + 100 AZN check list
Work schedule: 5 days, from 09:00 to 18:00
Address: sales points in Baku and Sumgait city.
Candidate requirements:

1 to 3 years of work experience
22-35 years old
The Azerbaijani language is fluent.
Responsible, accurate, analytical minded
Ability to work in a team
Interested candidates are requested to send their CV to the e-mail with the title of the vacancy in the subject line " Merchandiser ".', 17, 33, CAST(N'2023-07-02T22:01:27.4658469' AS DateTime2), 1016, 86)
INSERT [dbo].[PostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Website], [Description], [MinAge], [MaxAge], [Created], [AppUserId], [PositionId]) VALUES (1030, 15, 2, NULL, 4, CAST(1200.00 AS Decimal(18, 2)), 5, 1, 3, N'+994709942256', NULL, NULL, N'Job information:

Headhunting (attracting the best personnel on the market)
Determining the company''s personnel requirements;
Publication of active vacancies and careful consideration of applications
Conducting interviews online and offline
Preparation and application of appropriate tests
Taking measures to protect the loyalty of the internal team
Organizing team building activities
Taking measures for employee branding
Management of internship programs
There is no need for this as the HR clerical and paperwork work is currently done by the company we outsource.
Working conditions:

Formalization under AR legislation
Sciences m. center with an innovative environment nearby
Provision of corporate number, phone, macbook
Working hours: 6 days a week, from 10:00 to 18:00 
A friendly and development-oriented team environment
Opportunity for career and job growth
Salary: 1000 AZN
Candidate requirements:

Minimum 2 years work experience in IR 
Those who want to build their career only in the field of IR
High IQ and logic
Fluent and fluent speech
high education
Knowledge of English 
To apply:

It is required to send a CV file with a photo with the subject line " HR manager ".', 24, 33, CAST(N'2023-07-02T22:03:41.7757893' AS DateTime2), 1016, 90)
SET IDENTITY_INSERT [dbo].[PostJobs] OFF
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (1, N'SignUpLogo', N'<i class="la la-key"></i>')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (2, N'LoginLogo', N'<i class="la la-external-link-square"></i>')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (3, N'Email', N'alberthaciverdiyev55@gmail.com')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (4, N'Phone', N'+994709990569')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (5, N'LogoFooter', N'logo.png')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (6, N'Logo', N'logo10.png')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (7, N'Adress', N'Narimanov dist. Jeyhun Hajibeyli 24')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (8, N'PlayStoreLogo', N'dw1.png')
INSERT [dbo].[Settings] ([id], [Key], [Value]) VALUES (9, N'AppStoreLogo', N'dw2.png')
SET IDENTITY_INSERT [dbo].[Settings] OFF
SET IDENTITY_INSERT [dbo].[UserPostJobs] ON 

INSERT [dbo].[UserPostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Description], [Age], [Created], [AppUserId], [PositionId]) VALUES (1013, 6, 3, 0, 2, CAST(2500.00 AS Decimal(18, 2)), 1, 1, 3, N'+994709990569', N'alberthaciverdiyev55@gmail.com', N'welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
welwkmdlwkmdlwkdmfwkjnwlkjnwlkfjnlwkfjnlwkfjnlwjnfljkfnlwfjnwljflwjnflkwnflkwlwekd;w
', 16, CAST(N'2023-06-26T04:17:35.7208268' AS DateTime2), 18, 10)
INSERT [dbo].[UserPostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Description], [Age], [Created], [AppUserId], [PositionId]) VALUES (1014, 5, 2, 5, 2, CAST(25.00 AS Decimal(18, 2)), 1, 2, 3, N'+994515025784', N'alberthaciverdiyev55@gmail.com', N'ksdiudakjkaw', 15, CAST(N'2023-06-29T00:10:05.1338944' AS DateTime2), 1015, 7)
INSERT [dbo].[UserPostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Description], [Age], [Created], [AppUserId], [PositionId]) VALUES (1016, 5, 2, 5, 3, CAST(785421.00 AS Decimal(18, 2)), 6, 2, 2, N'+994709990569', N'albertg@mail.ru', N'bgrfuhopk[''p[', 5, CAST(N'2023-07-01T14:03:41.9596528' AS DateTime2), 1027, 12)
INSERT [dbo].[UserPostJobs] ([id], [CategoryId], [JobTypeId], [Experience], [WorkExperienceId], [Salary], [CityId], [EducationId], [LanguageId], [PhoneNumber], [Email], [Description], [Age], [Created], [AppUserId], [PositionId]) VALUES (1017, 11, 4, 5, 3, CAST(1500.00 AS Decimal(18, 2)), 3, 3, 2, N'+994709990569', N'7cw5lnl@code.edu.az', N'jea iushndsiusahoismdisSalamDoctor', 45, CAST(N'2023-07-01T23:56:39.9281633' AS DateTime2), 1027, 42)
SET IDENTITY_INSERT [dbo].[UserPostJobs] OFF
SET IDENTITY_INSERT [dbo].[WorkExperiences] ON 

INSERT [dbo].[WorkExperiences] ([id], [Experience]) VALUES (1, N'Intern')
INSERT [dbo].[WorkExperiences] ([id], [Experience]) VALUES (2, N'Junior')
INSERT [dbo].[WorkExperiences] ([id], [Experience]) VALUES (3, N'Middle')
INSERT [dbo].[WorkExperiences] ([id], [Experience]) VALUES (4, N'Senior')
SET IDENTITY_INSERT [dbo].[WorkExperiences] OFF
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_CategoryId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_CategoryId] ON [dbo].[AspNetUsers]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_EducationId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_EducationId] ON [dbo].[AspNetUsers]
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_AppUserId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_AppUserId] ON [dbo].[BasketItems]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_PostJobId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_PostJobId] ON [dbo].[BasketItems]
(
	[PostJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_UserPostJobId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_UserPostJobId] ON [dbo].[BasketItems]
(
	[UserPostJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Messages_PostJobId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_PostJobId] ON [dbo].[Messages]
(
	[PostJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Messages_UserPostJobId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_UserPostJobId] ON [dbo].[Messages]
(
	[UserPostJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Positions_CategoryId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_Positions_CategoryId] ON [dbo].[Positions]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_AppUserId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_AppUserId] ON [dbo].[PostJobs]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_CategoryId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_CategoryId] ON [dbo].[PostJobs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_CityId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_CityId] ON [dbo].[PostJobs]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_EducationId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_EducationId] ON [dbo].[PostJobs]
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_JobTypeId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_JobTypeId] ON [dbo].[PostJobs]
(
	[JobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_LanguageId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_LanguageId] ON [dbo].[PostJobs]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_PositionId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_PositionId] ON [dbo].[PostJobs]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostJobs_WorkExperienceId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostJobs_WorkExperienceId] ON [dbo].[PostJobs]
(
	[WorkExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_AppUserId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_AppUserId] ON [dbo].[UserPostJobs]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_CategoryId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_CategoryId] ON [dbo].[UserPostJobs]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_CityId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_CityId] ON [dbo].[UserPostJobs]
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_EducationId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_EducationId] ON [dbo].[UserPostJobs]
(
	[EducationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_JobTypeId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_JobTypeId] ON [dbo].[UserPostJobs]
(
	[JobTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_LanguageId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_LanguageId] ON [dbo].[UserPostJobs]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_PositionId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_PositionId] ON [dbo].[UserPostJobs]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserPostJobs_WorkExperienceId]    Script Date: 7/4/2023 2:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserPostJobs_WorkExperienceId] ON [dbo].[UserPostJobs]
(
	[WorkExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PostJobs] ADD  DEFAULT ((0)) FOR [AppUserId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Categories_CategoryId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Educations_EducationId] FOREIGN KEY([EducationId])
REFERENCES [dbo].[Educations] ([id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Educations_EducationId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_PostJobs_PostJobId] FOREIGN KEY([PostJobId])
REFERENCES [dbo].[PostJobs] ([id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_PostJobs_PostJobId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_UserPostJobs_UserPostJobId] FOREIGN KEY([UserPostJobId])
REFERENCES [dbo].[UserPostJobs] ([id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_UserPostJobs_UserPostJobId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_PostJobs_PostJobId] FOREIGN KEY([PostJobId])
REFERENCES [dbo].[PostJobs] ([id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_PostJobs_PostJobId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_UserPostJobs_UserPostJobId] FOREIGN KEY([UserPostJobId])
REFERENCES [dbo].[UserPostJobs] ([id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_UserPostJobs_UserPostJobId]
GO
ALTER TABLE [dbo].[Positions]  WITH CHECK ADD  CONSTRAINT [FK_Positions_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Positions] CHECK CONSTRAINT [FK_Positions_Categories_CategoryId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([id])
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_Cities_CityId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_Educations_EducationId] FOREIGN KEY([EducationId])
REFERENCES [dbo].[Educations] ([id])
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_Educations_EducationId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_JobTypes_JobTypeId] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_JobTypes_JobTypeId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([id])
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_Languages_LanguageId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([id])
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_Positions_PositionId]
GO
ALTER TABLE [dbo].[PostJobs]  WITH CHECK ADD  CONSTRAINT [FK_PostJobs_WorkExperiences_WorkExperienceId] FOREIGN KEY([WorkExperienceId])
REFERENCES [dbo].[WorkExperiences] ([id])
GO
ALTER TABLE [dbo].[PostJobs] CHECK CONSTRAINT [FK_PostJobs_WorkExperiences_WorkExperienceId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_Categories_CategoryId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_Cities_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([id])
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_Cities_CityId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_Educations_EducationId] FOREIGN KEY([EducationId])
REFERENCES [dbo].[Educations] ([id])
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_Educations_EducationId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_JobTypes_JobTypeId] FOREIGN KEY([JobTypeId])
REFERENCES [dbo].[JobTypes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_JobTypes_JobTypeId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([id])
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_Languages_LanguageId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([id])
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_Positions_PositionId]
GO
ALTER TABLE [dbo].[UserPostJobs]  WITH CHECK ADD  CONSTRAINT [FK_UserPostJobs_WorkExperiences_WorkExperienceId] FOREIGN KEY([WorkExperienceId])
REFERENCES [dbo].[WorkExperiences] ([id])
GO
ALTER TABLE [dbo].[UserPostJobs] CHECK CONSTRAINT [FK_UserPostJobs_WorkExperiences_WorkExperienceId]
GO
USE [master]
GO
ALTER DATABASE [FinalProject] SET  READ_WRITE 
GO
