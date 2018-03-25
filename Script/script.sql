USE [master]
GO
/****** Object:  Database [SIDB]    Script Date: 3/25/2018 2:36:56 PM ******/
CREATE DATABASE [SIDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SIDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SIDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SIDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SIDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SIDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SIDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SIDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SIDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SIDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SIDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SIDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SIDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SIDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SIDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SIDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SIDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SIDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SIDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SIDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SIDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SIDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SIDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SIDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SIDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SIDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SIDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SIDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SIDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SIDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SIDB] SET  MULTI_USER 
GO
ALTER DATABASE [SIDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SIDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SIDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SIDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SIDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SIDB', N'ON'
GO
ALTER DATABASE [SIDB] SET QUERY_STORE = OFF
GO
USE [SIDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SIDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/25/2018 2:36:56 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[answer] [varchar](200) NOT NULL,
	[questionID] [int] NOT NULL,
	[reviewPerformanceHandlerID] [int] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerChoice]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerChoice](
	[id] [int] NOT NULL,
	[answerChoice] [int] NOT NULL,
	[choiceID] [int] NOT NULL,
	[reviewPerformanceID] [int] NOT NULL,
 CONSTRAINT [PK_AnswerChoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](45) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Checklist]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Checklist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklistName] [varchar](50) NOT NULL,
	[goalID] [int] NOT NULL,
 CONSTRAINT [PK_Checklist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChecklistProgress]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChecklistProgress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklistProgress] [int] NOT NULL,
	[time] [datetime] NULL,
	[checklistID] [int] NOT NULL,
	[goalHandlerID] [int] NOT NULL,
 CONSTRAINT [PK_ChecklistProgress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[choiceName] [varchar](100) NOT NULL,
	[questionID] [int] NOT NULL,
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Circle]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Circle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[circleName] [varchar](60) NOT NULL,
	[circleTime] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Circle_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentFeedback]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentFeedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](200) NOT NULL,
	[feedbackID] [int] NOT NULL,
	[commentatorID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_commentFeedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentGoal]    Script Date: 3/25/2018 2:36:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentGoal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](200) NULL,
	[attachFile] [varchar](200) NULL,
	[time] [datetime] NULL,
	[goalID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
	[goalHandler] [int] NOT NULL,
 CONSTRAINT [PK_commentGoal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[evaluationName] [varchar](100) NOT NULL,
	[description] [varchar](200) NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[feedback] [varchar](50) NOT NULL,
	[providerID] [nvarchar](128) NOT NULL,
	[receiverID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goal]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[goalName] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[categoryID] [int] NOT NULL,
	[circleID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Goal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoalHandler]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoalHandler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[goalID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_GoalHandler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](100) NOT NULL,
	[evaluationID] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewPerformance]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewPerformance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reviewPerformanceName] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[evaluationID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ReviewPerformance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewPerformanceHandler]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewPerformanceHandler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reviewPerformanceID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
	[userID_commander] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ReviewPerformanceHandler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[personalID] [varchar](10) NOT NULL,
	[firstname] [varchar](45) NOT NULL,
	[lastname] [varchar](45) NOT NULL,
	[userTypeID] [int] NOT NULL,
	[commanderID] [nvarchar](128) NULL,
	[status] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 3/25/2018 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](40) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'259cb923-faf2-42d0-b2aa-99d97df8da12', N'sad@gmail.com', 0, N'ANnbnfUwejUFDQyWVf7alCLLDHbcD9bRo2dS6ZV/hmOOuTUjtTZNmkdeE1SgKMs9aA==', N'df8f5bcf-d7a8-4beb-a9a2-f6b47c81be32', NULL, 0, 0, NULL, 0, 0, N'sad@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'28b72ff4-75da-4bce-92da-55702cdecf56', N'v@gmail.com', 0, N'AGT0yntgbVlhIM62hY3njeBlW8nj3xofGUvljYbsSd7e77BbcOBNL1w/fg9/b2TqIA==', N'77bd7e9d-60f1-4c4a-8759-408544b8bf41', NULL, 0, 0, NULL, 0, 0, N'v@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3247649d-e739-42ab-85bd-3d0a83c42d9a', N'qwe@qwe.com', 0, N'AOCT6Rmxae5j/VQIG9rSBRURw53vql7ybIlEnYi/7c0MPZM8oYl9bqK2RjP5IsW8ww==', N'69f72734-1c8c-4527-9687-570b0f3a90b1', NULL, 0, 0, NULL, 0, 0, N'qwe@qwe.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'35ad333a-517b-4b95-b023-660c5f51f970', N'5@5.com', 0, N'AOCcCYL497kpRm3lAJfgZImooDtlrTW6KogsisnqF/VRVTRQatYM7uqhEcRBffhnoQ==', N'26a8718f-a3e0-46d5-862b-eaf44f666b9a', NULL, 0, 0, NULL, 0, 0, N'5@5.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4d3324ff-5197-4c47-a450-b0bd74b7bc00', N'sad6@gmail.com', 0, N'AO6xGOgsCW4OQk8LYl/7uyWJodVyXjE9yOWi7QeMd/Ln/OVczKFcaX8txlLgreTlKg==', N'7d1b77db-a539-434c-99a4-990adc0b4bd6', NULL, 0, 0, NULL, 0, 0, N'sad6@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6f3a32ed-9f5d-4595-bd40-79e7d5654c25', N'sad3@gmail.com', 0, N'AObqnIUNXtkklxxH88shyE6A9bo42P1umyk+GrzT+YahNKsTelUz3thUTmpEtQrDhw==', N'aa0c3a5e-ba0a-4d7d-a2e7-f4187b88f024', NULL, 0, 0, NULL, 0, 0, N'sad3@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'895400c3-8fd9-40ea-9105-f1525c82641a', N'visitsak_99@hotmail.com', 0, N'AG8MhkwqYRA5cqmetMadRyb+CNsL9XppnkGvYWmkqlTJ+LmPuBgbXMTmlZhTubOgkg==', N'0ee19ced-e37a-415a-805d-2ee7ae1d9861', NULL, 0, 0, NULL, 0, 0, N'visitsak_99@hotmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8e856a31-db7f-4efe-bc59-2623b795b3a8', N'5@55.com', 0, N'AAKB5Zq/vj0oQ0O4WA1/O0FmT3zWS97TMeuFiOyj6CeqJ0Jg2XKcGxPZ6gWpiL+0xw==', N'd685f16c-ed9c-4e3a-b02e-b3261f3a2f12', NULL, 0, 0, NULL, 0, 0, N'5@55.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', N'admintest2@admin.com', 0, N'AKgCA1yGsUrlwYG1Mew0TZAoLQZeVDiI0kljopYiofKrfdgysDnIjoCJP2aJC1CW9g==', N'4d8b36c0-b0e7-4acf-a9ae-ec2de58f4532', NULL, 0, 0, NULL, 0, 0, N'admintest2@admin.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'eb2d2867-f344-43a2-9134-5c1831d2fa90', N'sad4@gmail.com', 0, N'AE5VWk9JYrlNOw5lU4ad5S9VRx/5RmxNBf16w9vQg+LFl69P4FIK582EFyRTvk455g==', N'f0213736-1ae6-4c15-a363-4d158f73ccd1', NULL, 0, 0, NULL, 0, 0, N'sad4@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f04fb14e-572e-4f74-91ed-933102af2871', N'sad2@gmail.com', 0, N'AJtppL7re+HmOaaBFsr2pX2AOPcuMcPEiefsVhC2GJ2Q+y2BnCDr3Z9nQuFjMM+j9Q==', N'aa9e793a-a360-4817-bc57-a5d5ea11cb79', NULL, 0, 0, NULL, 0, 0, N'sad2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f2ae6dbf-4f35-4476-bcea-0fa57a03e8a5', N'v@gmv.com', 0, N'AB+aFb8tIibBFsptzKhxnlz0/JD1e5xz/NrVEyvk+bUmrhvj8R5s+WC26FpHtOws0g==', N'96618e49-a1a7-4660-9c71-c7d6afdd168e', NULL, 0, 0, NULL, 0, 0, N'v@gmv.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f2e68856-7b29-497d-bcd4-7351b6908598', N'v@v.com', 0, N'AEpShKFIBvCGPZtpnCb/KB21ILDJ+jRBp5snC9ueAvvIdCxK5ajtBXtyzHLORcnIPQ==', N'f10b8af5-4ca5-400f-b5d9-a4b89c27c3d2', NULL, 0, 0, NULL, 0, 0, N'v@v.com')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (1, N'wpp application', 2)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (2, N'web test', 1)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (3, N'web insert test', 2)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (4, N'weqweqwe', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Checklist] ON 

INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (41, N'testcreatechecklist1', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (42, N'testcreatechecklist2', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (43, N'testcreatechecklist3', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (44, N'testcreatechecklist4', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (210, N'testcreate123a1', 70)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (211, N'testcreate123a2', 70)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (212, N'testcreate123a3', 70)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (213, N'testcreatechecklist1', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (214, N'testcreatechecklist2', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (215, N'testcreatechecklist3', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (216, N'testcreatechecklist4', 9)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (217, N'testcreatechecklist1', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (218, N'testcreatechecklist2', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (219, N'testcreatechecklist3', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (220, N'testcreatechecklist4', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (221, N'testcreatechecklist1', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (222, N'testcreatechecklist2', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (223, N'testcreatechecklist3', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (224, N'testcreatechecklist4', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (225, N'testcreatechecklist1', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (226, N'testcreatechecklist2', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (227, N'testcreatechecklist3', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (228, N'testcreatechecklist4', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (229, N'testcreate123a1', 70)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (230, N'testcreate123a2', 70)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (231, N'testcreate123a3', 70)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (232, N'q', 76)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (233, N'w', 76)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (234, N'e', 76)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (235, N'testcreatechecklist1', 77)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (236, N'testcreatechecklist2', 77)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (237, N'testcreatechecklist3', 77)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (238, N'testcreatechecklist1', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (239, N'testcreatechecklist2', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (240, N'testcreatechecklist3', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (241, N'testcreatechecklist4', 72)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (242, N'testcreatechecklist11', 79)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (243, N'testcreatechecklist12', 79)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (244, N'testcreatechecklist13', 79)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (245, N'testcreatechecklist14', 79)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (246, N'testlong1', 80)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (247, N'testlong2', 80)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (248, N'testlong3', 80)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (249, N'testlong4', 80)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (250, N'testlong5', 80)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (251, N'testlong21', 81)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (252, N'testlong22', 81)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (253, N'testlong23', 81)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (254, N'testlong24', 81)
SET IDENTITY_INSERT [dbo].[Checklist] OFF
SET IDENTITY_INSERT [dbo].[ChecklistProgress] ON 

INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (209, 2, CAST(N'2018-03-13T13:31:14.660' AS DateTime), 41, 13)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (210, 2, CAST(N'2018-03-13T13:31:14.660' AS DateTime), 42, 13)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (211, 2, CAST(N'2018-03-13T13:31:14.660' AS DateTime), 43, 13)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (212, 2, CAST(N'2018-03-13T13:31:14.660' AS DateTime), 44, 13)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (213, 2, CAST(N'2018-03-13T13:31:14.687' AS DateTime), 41, 14)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (214, 2, CAST(N'2018-03-13T13:31:14.687' AS DateTime), 42, 14)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (215, 2, CAST(N'2018-03-13T13:31:14.687' AS DateTime), 43, 14)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (216, 2, CAST(N'2018-03-13T13:31:14.687' AS DateTime), 44, 14)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (217, 2, CAST(N'2018-03-13T13:31:14.697' AS DateTime), 41, 15)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (218, 2, CAST(N'2018-03-13T13:31:14.697' AS DateTime), 42, 15)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (219, 2, CAST(N'2018-03-13T13:31:14.697' AS DateTime), 43, 15)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (220, 2, CAST(N'2018-03-13T13:31:14.697' AS DateTime), 44, 15)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (221, 2, CAST(N'2018-03-13T13:31:14.710' AS DateTime), 41, 16)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (222, 2, CAST(N'2018-03-13T13:31:14.710' AS DateTime), 42, 16)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (223, 2, CAST(N'2018-03-13T13:31:14.710' AS DateTime), 43, 16)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (224, 2, CAST(N'2018-03-13T13:31:14.710' AS DateTime), 44, 16)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (225, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 41, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (226, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 42, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (227, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 43, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (228, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 44, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (229, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 213, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (230, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 214, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (231, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 215, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (232, 2, CAST(N'2018-03-14T16:08:10.793' AS DateTime), 216, 17)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (233, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 41, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (234, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 42, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (235, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 43, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (236, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 44, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (237, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 213, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (238, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 214, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (239, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 215, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (240, 2, CAST(N'2018-03-14T16:08:10.820' AS DateTime), 216, 18)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (241, 2, CAST(N'2018-03-14T16:08:10.833' AS DateTime), 41, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (242, 2, CAST(N'2018-03-14T16:08:10.833' AS DateTime), 42, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (243, 2, CAST(N'2018-03-14T16:08:10.833' AS DateTime), 43, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (244, 2, CAST(N'2018-03-14T16:08:10.833' AS DateTime), 44, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (245, 2, CAST(N'2018-03-14T16:08:10.833' AS DateTime), 213, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (246, 2, CAST(N'2018-03-19T11:21:03.170' AS DateTime), 214, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (247, 1, CAST(N'2018-03-19T11:21:03.190' AS DateTime), 215, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (248, 1, CAST(N'2018-03-19T11:21:03.193' AS DateTime), 216, 19)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (249, 1, CAST(N'2018-03-19T11:21:03.197' AS DateTime), 41, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (250, 1, CAST(N'2018-03-19T11:21:03.200' AS DateTime), 42, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (251, 2, CAST(N'2018-03-14T16:08:10.850' AS DateTime), 43, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (252, 2, CAST(N'2018-03-14T16:08:10.850' AS DateTime), 44, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (253, 2, CAST(N'2018-03-14T16:08:10.850' AS DateTime), 213, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (254, 2, CAST(N'2018-03-14T16:08:10.850' AS DateTime), 214, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (255, 2, CAST(N'2018-03-14T16:08:10.850' AS DateTime), 215, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (256, 2, CAST(N'2018-03-14T16:08:10.850' AS DateTime), 216, 20)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (257, 2, CAST(N'2018-03-14T16:08:45.997' AS DateTime), 217, 21)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (258, 2, CAST(N'2018-03-14T16:08:45.997' AS DateTime), 218, 21)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (259, 2, CAST(N'2018-03-14T16:08:45.997' AS DateTime), 219, 21)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (260, 2, CAST(N'2018-03-14T16:08:45.997' AS DateTime), 220, 21)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (261, 2, CAST(N'2018-03-14T16:08:46.010' AS DateTime), 217, 22)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (262, 2, CAST(N'2018-03-14T16:08:46.010' AS DateTime), 218, 22)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (263, 2, CAST(N'2018-03-14T16:08:46.010' AS DateTime), 219, 22)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (264, 2, CAST(N'2018-03-14T16:08:46.010' AS DateTime), 220, 22)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (265, 2, CAST(N'2018-03-14T16:08:46.020' AS DateTime), 217, 23)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (266, 2, CAST(N'2018-03-14T16:08:46.020' AS DateTime), 218, 23)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (267, 2, CAST(N'2018-03-14T16:08:46.020' AS DateTime), 219, 23)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (268, 2, CAST(N'2018-03-14T16:08:46.020' AS DateTime), 220, 23)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (269, 2, CAST(N'2018-03-14T16:08:46.030' AS DateTime), 217, 24)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (270, 2, CAST(N'2018-03-14T16:08:46.030' AS DateTime), 218, 24)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (271, 2, CAST(N'2018-03-14T16:08:46.030' AS DateTime), 219, 24)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (272, 2, CAST(N'2018-03-14T16:08:46.030' AS DateTime), 220, 24)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (273, 2, CAST(N'2018-03-14T18:18:45.430' AS DateTime), 210, 25)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (274, 2, CAST(N'2018-03-14T18:18:45.430' AS DateTime), 211, 25)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (275, 2, CAST(N'2018-03-14T18:18:45.430' AS DateTime), 212, 25)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (276, 2, CAST(N'2018-03-14T18:18:45.430' AS DateTime), 229, 25)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (277, 2, CAST(N'2018-03-14T18:18:45.430' AS DateTime), 230, 25)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (278, 2, CAST(N'2018-03-14T18:18:45.430' AS DateTime), 231, 25)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (279, 2, CAST(N'2018-03-14T18:19:35.640' AS DateTime), 232, 26)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (280, 2, CAST(N'2018-03-14T18:19:35.640' AS DateTime), 233, 26)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (281, 2, CAST(N'2018-03-14T18:19:35.640' AS DateTime), 234, 26)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (282, 2, CAST(N'2018-03-15T10:07:31.667' AS DateTime), 235, 27)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (283, 2, CAST(N'2018-03-15T10:07:31.667' AS DateTime), 236, 27)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (284, 2, CAST(N'2018-03-15T10:07:31.667' AS DateTime), 237, 27)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (285, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 217, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (286, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 218, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (287, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 219, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (288, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 220, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (289, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 221, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (290, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 222, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (291, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 223, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (292, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 224, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (293, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 225, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (294, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 226, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (295, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 227, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (296, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 228, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (297, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 238, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (298, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 239, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (299, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 240, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (300, 2, CAST(N'2018-03-15T10:28:38.650' AS DateTime), 241, 28)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (301, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 217, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (302, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 218, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (303, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 219, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (304, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 220, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (305, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 221, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (306, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 222, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (307, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 223, 29)
GO
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (308, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 224, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (309, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 225, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (310, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 226, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (311, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 227, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (312, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 228, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (313, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 238, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (314, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 239, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (315, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 240, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (316, 2, CAST(N'2018-03-15T10:28:38.687' AS DateTime), 241, 29)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (317, 2, CAST(N'2018-03-15T10:33:01.350' AS DateTime), 242, 30)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (318, 2, CAST(N'2018-03-15T10:33:01.350' AS DateTime), 243, 30)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (319, 2, CAST(N'2018-03-15T10:33:01.350' AS DateTime), 244, 30)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (320, 2, CAST(N'2018-03-15T10:33:01.350' AS DateTime), 245, 30)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (321, 1, CAST(N'2018-03-15T10:33:01.397' AS DateTime), 242, 31)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (322, 2, CAST(N'2018-03-15T10:33:01.397' AS DateTime), 243, 31)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (323, 1, CAST(N'2018-03-15T10:33:01.397' AS DateTime), 244, 31)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (324, 1, CAST(N'2018-03-15T10:33:01.397' AS DateTime), 245, 31)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (325, 2, CAST(N'2018-03-15T14:05:30.263' AS DateTime), 246, 32)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (326, 1, CAST(N'2018-03-15T14:05:30.263' AS DateTime), 247, 32)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (327, 2, CAST(N'2018-03-15T14:05:30.263' AS DateTime), 248, 32)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (328, 1, CAST(N'2018-03-15T14:05:30.263' AS DateTime), 249, 32)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (329, 2, CAST(N'2018-03-15T14:05:30.263' AS DateTime), 250, 32)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (330, 2, CAST(N'2018-03-15T15:00:27.827' AS DateTime), 251, 33)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (331, 2, CAST(N'2018-03-15T15:00:27.827' AS DateTime), 252, 33)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (332, 2, CAST(N'2018-03-15T15:00:27.827' AS DateTime), 253, 33)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (333, 2, CAST(N'2018-03-15T15:00:27.827' AS DateTime), 254, 33)
SET IDENTITY_INSERT [dbo].[ChecklistProgress] OFF
SET IDENTITY_INSERT [dbo].[Choice] ON 

INSERT [dbo].[Choice] ([id], [choiceName], [questionID]) VALUES (51, N'testcreChoice11', 78)
INSERT [dbo].[Choice] ([id], [choiceName], [questionID]) VALUES (52, N'testcreChoice12', 78)
INSERT [dbo].[Choice] ([id], [choiceName], [questionID]) VALUES (53, N'testcreChoice13', 78)
INSERT [dbo].[Choice] ([id], [choiceName], [questionID]) VALUES (54, N'testcreChoice21', 80)
INSERT [dbo].[Choice] ([id], [choiceName], [questionID]) VALUES (55, N'testcreChoice22', 80)
SET IDENTITY_INSERT [dbo].[Choice] OFF
SET IDENTITY_INSERT [dbo].[Circle] ON 

INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (2, N'?????', 365, 1)
INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (3, N'????????', 30, 1)
INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (4, N'??????????', 7, 1)
INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (5, N'4?????', 120, 1)
INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (6, N'qwe', 15, 1)
SET IDENTITY_INSERT [dbo].[Circle] OFF
SET IDENTITY_INSERT [dbo].[CommentFeedback] ON 

INSERT [dbo].[CommentFeedback] ([id], [comment], [feedbackID], [commentatorID]) VALUES (1, N'?????????????????', 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[CommentFeedback] OFF
SET IDENTITY_INSERT [dbo].[Evaluation] ON 

INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (1, N'???????????????????', N'???????????????????????????????????')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (22, N'testCreEvaluaname556', N'testCreEvaluaname556')
SET IDENTITY_INSERT [dbo].[Evaluation] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [feedback], [providerID], [receiverID]) VALUES (1, N'???????????????????????? UI', N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Goal] ON 

INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (9, N'testcreategoalname3', N'testcreategoaldes3', CAST(N'0001-01-01' AS Date), CAST(N'2018-03-21' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (70, N'testcreate123a', N'testcreate123adetail', CAST(N'2561-02-02' AS Date), CAST(N'2016-02-10' AS Date), 2, 6, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (71, N'testcreategoalname3', N'testcreategoaldes3', CAST(N'0001-01-01' AS Date), CAST(N'2018-03-21' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (72, N'testcreategoalname4', N'testcreategoaldes3', CAST(N'0001-01-01' AS Date), CAST(N'2018-03-21' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (73, N'testcreategoalname4', N'testcreategoaldes3', CAST(N'0001-01-01' AS Date), CAST(N'2018-03-21' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (74, N'testcreategoalname4', N'testcreategoaldes3', CAST(N'0001-01-01' AS Date), CAST(N'2018-03-21' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (75, N'testcreate123a', N'testcreate123adetail', CAST(N'0001-01-01' AS Date), CAST(N'2016-02-10' AS Date), 2, 6, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (76, N'qweasd', N'dsaqwe', CAST(N'0001-01-01' AS Date), CAST(N'2016-02-10' AS Date), 2, 5, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (77, N'testAgaiancreateGoal', N'testAgaiancreateGoal', CAST(N'0001-01-01' AS Date), CAST(N'2016-02-10' AS Date), 2, 6, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (79, N'testAgaiancreateGoal3', N'testAgaiancreateGoal3', CAST(N'0001-01-01' AS Date), CAST(N'2018-03-21' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (80, N'testlong', N'testlong', CAST(N'0001-01-01' AS Date), CAST(N'2016-02-10' AS Date), 2, 6, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (81, N'testlong2', N'testlong2', CAST(N'0001-01-01' AS Date), CAST(N'2016-02-10' AS Date), 4, 5, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[Goal] OFF
SET IDENTITY_INSERT [dbo].[GoalHandler] ON 

INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (13, 9, N'28b72ff4-75da-4bce-92da-55702cdecf56')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (14, 9, N'3247649d-e739-42ab-85bd-3d0a83c42d9a')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (15, 9, N'35ad333a-517b-4b95-b023-660c5f51f970')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (16, 9, N'4d3324ff-5197-4c47-a450-b0bd74b7bc00')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (17, 9, N'28b72ff4-75da-4bce-92da-55702cdecf56')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (18, 9, N'3247649d-e739-42ab-85bd-3d0a83c42d9a')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (19, 9, N'35ad333a-517b-4b95-b023-660c5f51f970')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (20, 9, N'4d3324ff-5197-4c47-a450-b0bd74b7bc00')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (21, 72, N'28b72ff4-75da-4bce-92da-55702cdecf56')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (22, 72, N'3247649d-e739-42ab-85bd-3d0a83c42d9a')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (23, 72, N'35ad333a-517b-4b95-b023-660c5f51f970')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (24, 72, N'4d3324ff-5197-4c47-a450-b0bd74b7bc00')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (25, 70, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (26, 76, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (27, 77, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (28, 72, N'f2ae6dbf-4f35-4476-bcea-0fa57a03e8a5')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (29, 72, N'f2e68856-7b29-497d-bcd4-7351b6908598')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (30, 79, N'f2ae6dbf-4f35-4476-bcea-0fa57a03e8a5')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (31, 79, N'f2e68856-7b29-497d-bcd4-7351b6908598')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (32, 80, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (33, 81, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[GoalHandler] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (78, N'testCreque1', 22)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (79, N'testCreque2', 22)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (80, N'testCreque3', 22)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (81, N'testCreque4', 22)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[ReviewPerformance] ON 

INSERT [dbo].[ReviewPerformance] ([id], [reviewPerformanceName], [description], [evaluationID], [userID]) VALUES (1, N'????????????? 1', N'??????????????????????????', 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[ReviewPerformance] OFF
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'12315648', N'qwde', N'qweq', 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', 1, N'28b72ff4-75da-4bce-92da-55702cdecf56')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'asdww', N'qwewq', N'qweqwe', 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', 1, N'3247649d-e739-42ab-85bd-3d0a83c42d9a')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'552255', N'555', N'555', 3, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', 1, N'35ad333a-517b-4b95-b023-660c5f51f970')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'5711446552', N'asdsad', N'123456', 1, NULL, 1, N'4d3324ff-5197-4c47-a450-b0bd74b7bc00')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'654654', N'564654', N'4564564', 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', 1, N'8e856a31-db7f-4efe-bc59-2623b795b3a8')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'12345694', N'adminstestcreate2', N'adminstestcreate2', 4, NULL, 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'5564654', N'asdssw', N'aasdsa', 3, N'3', 1, N'f2ae6dbf-4f35-4476-bcea-0fa57a03e8a5')
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'456134', N'asdwqd', N'axcdef', 1, N'0', 1, N'f2e68856-7b29-497d-bcd4-7351b6908598')
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (1, N'???????????', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (2, N'??????????????', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (3, N'???????', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (4, N'????????', 1)
SET IDENTITY_INSERT [dbo].[UserType] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/25/2018 2:36:57 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/25/2018 2:36:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/25/2018 2:36:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/25/2018 2:36:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/25/2018 2:36:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/25/2018 2:36:57 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[AnswerChoice]  WITH CHECK ADD  CONSTRAINT [FK_AnswerChoice_Choice] FOREIGN KEY([choiceID])
REFERENCES [dbo].[Choice] ([id])
GO
ALTER TABLE [dbo].[AnswerChoice] CHECK CONSTRAINT [FK_AnswerChoice_Choice]
GO
ALTER TABLE [dbo].[AnswerChoice]  WITH CHECK ADD  CONSTRAINT [FK_AnswerChoice_reviewPerformance] FOREIGN KEY([reviewPerformanceID])
REFERENCES [dbo].[ReviewPerformance] ([id])
GO
ALTER TABLE [dbo].[AnswerChoice] CHECK CONSTRAINT [FK_AnswerChoice_reviewPerformance]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Checklist]  WITH CHECK ADD  CONSTRAINT [FK_Goal] FOREIGN KEY([goalID])
REFERENCES [dbo].[Goal] ([id])
GO
ALTER TABLE [dbo].[Checklist] CHECK CONSTRAINT [FK_Goal]
GO
ALTER TABLE [dbo].[ChecklistProgress]  WITH CHECK ADD  CONSTRAINT [FK_ChecklistProgress_Checklist] FOREIGN KEY([checklistID])
REFERENCES [dbo].[Checklist] ([id])
GO
ALTER TABLE [dbo].[ChecklistProgress] CHECK CONSTRAINT [FK_ChecklistProgress_Checklist]
GO
ALTER TABLE [dbo].[ChecklistProgress]  WITH CHECK ADD  CONSTRAINT [FK_ChecklistProgress_GoalHandler1] FOREIGN KEY([goalHandlerID])
REFERENCES [dbo].[GoalHandler] ([id])
GO
ALTER TABLE [dbo].[ChecklistProgress] CHECK CONSTRAINT [FK_ChecklistProgress_GoalHandler1]
GO
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([id])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[CommentFeedback]  WITH CHECK ADD  CONSTRAINT [FK_commentator_User] FOREIGN KEY([commentatorID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[CommentFeedback] CHECK CONSTRAINT [FK_commentator_User]
GO
ALTER TABLE [dbo].[CommentFeedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback] FOREIGN KEY([feedbackID])
REFERENCES [dbo].[Feedback] ([id])
GO
ALTER TABLE [dbo].[CommentFeedback] CHECK CONSTRAINT [FK_Feedback]
GO
ALTER TABLE [dbo].[CommentGoal]  WITH CHECK ADD  CONSTRAINT [FK_CommentGoal_Goal] FOREIGN KEY([goalID])
REFERENCES [dbo].[Goal] ([id])
GO
ALTER TABLE [dbo].[CommentGoal] CHECK CONSTRAINT [FK_CommentGoal_Goal]
GO
ALTER TABLE [dbo].[CommentGoal]  WITH CHECK ADD  CONSTRAINT [FK_CommentGoal_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[CommentGoal] CHECK CONSTRAINT [FK_CommentGoal_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_provider_User] FOREIGN KEY([providerID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_provider_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_receiver_User] FOREIGN KEY([receiverID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_receiver_User]
GO
ALTER TABLE [dbo].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Goal] CHECK CONSTRAINT [FK_Category]
GO
ALTER TABLE [dbo].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_Circle] FOREIGN KEY([circleID])
REFERENCES [dbo].[Circle] ([id])
GO
ALTER TABLE [dbo].[Goal] CHECK CONSTRAINT [FK_Circle]
GO
ALTER TABLE [dbo].[Goal]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[Goal] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[GoalHandler]  WITH CHECK ADD  CONSTRAINT [FK_GoalHandler_Goal] FOREIGN KEY([goalID])
REFERENCES [dbo].[Goal] ([id])
GO
ALTER TABLE [dbo].[GoalHandler] CHECK CONSTRAINT [FK_GoalHandler_Goal]
GO
ALTER TABLE [dbo].[GoalHandler]  WITH CHECK ADD  CONSTRAINT [FK_GoalHandler_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[GoalHandler] CHECK CONSTRAINT [FK_GoalHandler_User]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation] FOREIGN KEY([evaluationID])
REFERENCES [dbo].[Evaluation] ([id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Evaluation]
GO
ALTER TABLE [dbo].[ReviewPerformance]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformance_Evaluation] FOREIGN KEY([evaluationID])
REFERENCES [dbo].[Evaluation] ([id])
GO
ALTER TABLE [dbo].[ReviewPerformance] CHECK CONSTRAINT [FK_ReviewPerformance_Evaluation]
GO
ALTER TABLE [dbo].[ReviewPerformance]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformance_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[ReviewPerformance] CHECK CONSTRAINT [FK_ReviewPerformance_User]
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformanceHandler_ReviewPerformance1] FOREIGN KEY([reviewPerformanceID])
REFERENCES [dbo].[ReviewPerformance] ([id])
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler] CHECK CONSTRAINT [FK_ReviewPerformanceHandler_ReviewPerformance1]
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformanceHandler_User_commander] FOREIGN KEY([userID_commander])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler] CHECK CONSTRAINT [FK_ReviewPerformanceHandler_User_commander]
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformanceHandler_User1] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler] CHECK CONSTRAINT [FK_ReviewPerformanceHandler_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Users]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([userTypeID])
REFERENCES [dbo].[UserType] ([UserTypeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
USE [master]
GO
ALTER DATABASE [SIDB] SET  READ_WRITE 
GO
