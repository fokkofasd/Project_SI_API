USE [master]
GO
/****** Object:  Database [SIDB]    Script Date: 04/05/2018 10:10:42 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 04/05/2018 10:10:42 ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[AnswerChoice]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[Checklist]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[ChecklistProgress]    Script Date: 04/05/2018 10:10:43 ******/
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
/****** Object:  Table [dbo].[Choice]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[Circle]    Script Date: 04/05/2018 10:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Circle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[circleName] [varchar](60) NOT NULL,
	[status] [int] NOT NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[year] [int] NOT NULL,
	[semester] [int] NOT NULL,
 CONSTRAINT [PK_Circle_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentFeedback]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[CommentGoal]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[Goal]    Script Date: 04/05/2018 10:10:44 ******/
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
	[circleType] [int] NOT NULL,
	[flag] [int] NOT NULL,
 CONSTRAINT [PK_Goal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoalHandler]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[ReviewPerformance]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[ReviewPerformanceHandler]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[TitleName]    Script Date: 04/05/2018 10:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleName](
	[titleNameID] [int] NOT NULL,
	[titleName] [varchar](20) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_TitleName] PRIMARY KEY CLUSTERED 
(
	[titleNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/05/2018 10:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[personalID] [varchar](10) NULL,
	[titleNameID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[UserType]    Script Date: 04/05/2018 10:10:44 ******/
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
/****** Object:  Table [dbo].[UserTypeInEvaluation]    Script Date: 04/05/2018 10:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeInEvaluation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeid] [int] NOT NULL,
	[evaluationid] [int] NOT NULL,
 CONSTRAINT [PK_UserTypeInEvaluation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'116486a5-60d6-4bc1-86ce-95e3ef9f09e0', N'Nattanan@wu.ac.th', 0, N'AC/IiiMzRQRnzCtc26mEiNEHz33leMVJYA3gCYMNOmKAwqq8711GhcJBOnVTkIWgzQ==', N'eda8e258-720d-4b52-89cc-dff68b8a722b', NULL, 0, 0, NULL, 0, 0, N'Nattanan@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3a0618dd-2940-46ea-a792-abb1b4ef7c52', N'Rujipat@wu.ac.th', 0, N'AP5f88zk5v337d6Rvkt9V6BRvC3w28Rek7Fh7gu0nDgIqebrSLSSaT+LBDeMrJcCEg==', N'44b7b108-1984-416b-a135-b22d78e81e4f', NULL, 0, 0, NULL, 0, 0, N'Rujipat@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'458032be-43a8-42c4-8c47-b7218b56c7e3', N'pthimapo@wu.ac.th', 0, N'AOEsBkaEkL/anafTFmTnR/mGrGb2grkKQZQiPSOAg4MUBc2AHfYJiMfwUllJndFMsQ==', N'e5cd3412-4c2e-4e0f-bd2e-b49f670f9883', NULL, 0, 0, NULL, 0, 0, N'pthimapo@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6d398ddc-c707-4dc2-83a6-300dc154e4d5', N'syaowara@wu.ac.th', 0, N'AIGBeHS+Py7yPIlK1tLf58G+ziWeq0N5w9rRme/B1P2CmMBUL2F2RTeV+cUBKYEcng==', N'0a92332c-1b3b-430d-a323-3c4a6d148b82', NULL, 0, 0, NULL, 0, 0, N'syaowara@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'75c35747-1972-4c65-a1eb-a3eca2ccc748', N'putthiporn.th@wu.ac.th', 0, N'AA6Hg1KBtwgCLvHWUhIBh243eHTfW6aaAf71uv6CbD4Ua/Tp+OEk5EWpbUkWS32WvA==', N'7598e469-da24-4ece-a28b-b2a3a7912516', NULL, 0, 0, NULL, 0, 0, N'putthiporn.th@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7719c91a-e178-4f58-b79d-06f908015371', N'Kanchit@wu.ac.th', 0, N'ANBuE4rMe3BRkUsJlJNmTkUJooGSfdub0MH2CE+qALXTWgdm0h3zHLiaqHP0A5Wt1Q==', N'd8d60307-c5e1-4ef6-939e-c7e2564e957e', NULL, 0, 0, NULL, 0, 0, N'Kanchit@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7be50024-9fb0-4de7-969e-912e27f93760', N'muhamard@wu.ac.th', 0, N'AK37mfIuh2BxjH7yTfL75/Yj5T6EW1uix6HHVVJRLD4dEfUfe3RyqfB6P4zmK4uzgg==', N'1e3183b3-4a4d-462e-8ae8-dbafc341fceb', NULL, 0, 0, NULL, 0, 0, N'muhamard@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ab897a4a-f5a8-499b-9616-5208f67ae2f8', N'Kittipong@wu.ac.th', 0, N'AIPNBVsjDtBi7GVkyZqQoDTGRwpp7iDock4IwE6bAnHVrEItEsnxBR6Tq0Rb2hMrog==', N'18e7cb0b-eca0-4187-9785-42cc25dc05d7', NULL, 0, 0, NULL, 0, 0, N'Kittipong@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df6c3e6e-50e7-4bdb-a6db-00e43ac37f1a', N'Kanokwan@wu.ac.th', 0, N'ACVF8JML2H3w76mDF+eVlTUC0258Mqtmsbz4DxxoI3TglFL2KINYzawlU821yYw5gw==', N'4b1f0d34-151c-4235-aaaa-91693a59ab52', NULL, 0, 0, NULL, 0, 0, N'Kanokwan@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e721119b-55a6-40e3-a558-a52211e7f0cc', N'kanchan.th@wu.ac.th', 0, N'AOOuUY+wvxZRXlfU2J/RSBzCIhZe5RYv2hrkMYQN3XXy7eJqH4pdW2yqMdLOGKOJmQ==', N'3f52d800-da7f-4ac0-8e88-06cb8140e227', NULL, 0, 0, NULL, 0, 0, N'kanchan.th@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ff8ab294-22b5-43d8-8e7d-1369e1564206', N'admin@admin', 0, N'ALDQxGoVNvAfZWWQ2L9d8iXwbYXs9EXLbQbRpFeAddAHIsC7PLLBIyv8mT9j4SO0CQ==', N'704b7ec0-2e79-4365-ba78-edfa98bd3b8a', NULL, 0, 0, NULL, 0, 0, N'admin@admin')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (16, N'การอบรม (Workshop)', 1)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (17, N'ผลการเรียน', 1)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (18, N'งานส่วนตัว', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Checklist] ON 

INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (499, N'ออกกำลังการวันละ 30 นาที', 160)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (500, N'กินผลไม้ทุกวัน', 160)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (501, N'วิ่งวันละ 1 กิโลเมตร', 160)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (502, N'อ่านจบ 1 เล่ม', 161)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (503, N'อ่านจบ 3 เล่่ม', 161)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (504, N'ควบคุมน้ำหนัก 50', 162)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (505, N'ควบคุมน้ำหนัก 45', 162)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (506, N'อ่านหนังสือ 5 เล่ม', 163)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (507, N'อ่านหนังสือ 7 เล่ม', 163)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (510, N'ฝึก', 165)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (511, N'อบ', 165)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (512, N'ขาย', 165)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (513, N'ใบแสดงผลการศึกษา', 166)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (516, N'เอกสารผู้ใช้', 168)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (517, N'ER-diagram', 168)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (518, N'Class-diagram', 168)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (519, N'ได้วันละ 20 นาที', 167)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (520, N'สรุปได้', 167)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (521, N'อ่านหนังสือ 5 เล่ม', 163)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (522, N'อ่านหนังสือ 7 เล่ม', 163)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (523, N'เค้าโคร่ง', 169)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (524, N'เนื้อหา', 169)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (525, N'แนวเรื่อง', 169)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (526, N'จดสูตร', 170)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (527, N'ทดลองทำ', 170)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (528, N'ส่งผลงาน', 170)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (529, N'SWE-254', 171)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (530, N'SWE- 235', 171)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (531, N'SWE- 246', 171)
SET IDENTITY_INSERT [dbo].[Checklist] OFF
SET IDENTITY_INSERT [dbo].[ChecklistProgress] ON 

INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (708, 1, CAST(N'2018-05-04T01:53:51.290' AS DateTime), 499, 126)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (709, 2, CAST(N'2018-05-04T01:53:51.293' AS DateTime), 500, 126)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (710, 2, CAST(N'2018-05-04T01:53:51.297' AS DateTime), 501, 126)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (711, 1, CAST(N'2018-05-04T01:53:30.607' AS DateTime), 502, 127)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (712, 2, CAST(N'2018-05-04T01:53:30.610' AS DateTime), 503, 127)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (713, 2, CAST(N'2018-05-04T02:00:05.687' AS DateTime), 504, 128)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (714, 1, CAST(N'2018-05-04T02:00:05.690' AS DateTime), 505, 128)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (715, 2, CAST(N'2018-05-04T09:14:40.343' AS DateTime), 506, 129)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (716, 1, CAST(N'2018-05-04T09:14:40.353' AS DateTime), 507, 129)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (721, 1, CAST(N'2018-05-04T09:14:06.190' AS DateTime), 510, 132)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (722, 2, CAST(N'2018-05-04T09:14:06.190' AS DateTime), 511, 132)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (723, 1, CAST(N'2018-05-04T09:14:06.193' AS DateTime), 512, 132)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (724, 1, CAST(N'2018-05-04T03:01:52.703' AS DateTime), 513, 133)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (725, 1, CAST(N'2018-05-04T03:01:52.710' AS DateTime), 513, 134)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (726, 1, CAST(N'2018-05-04T03:01:52.717' AS DateTime), 513, 135)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (730, 1, CAST(N'2018-05-04T08:32:04.457' AS DateTime), 516, 139)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (731, 1, CAST(N'2018-05-04T08:32:04.457' AS DateTime), 517, 139)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (732, 1, CAST(N'2018-05-04T08:32:04.457' AS DateTime), 518, 139)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (733, 2, CAST(N'2018-05-04T08:34:33.643' AS DateTime), 519, 140)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (734, 2, CAST(N'2018-05-04T08:34:33.643' AS DateTime), 520, 140)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (735, 1, CAST(N'2018-05-04T09:31:30.867' AS DateTime), 506, 141)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (736, 1, CAST(N'2018-05-04T09:31:30.913' AS DateTime), 507, 141)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (737, 1, CAST(N'2018-05-04T09:31:30.950' AS DateTime), 521, 141)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (738, 1, CAST(N'2018-05-04T09:31:30.960' AS DateTime), 522, 141)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (739, 2, CAST(N'2018-05-04T09:32:36.210' AS DateTime), 523, 142)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (740, 1, CAST(N'2018-05-04T09:32:36.217' AS DateTime), 524, 142)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (741, 1, CAST(N'2018-05-04T09:32:36.227' AS DateTime), 525, 142)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (742, 2, CAST(N'2018-05-04T09:50:45.337' AS DateTime), 526, 143)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (743, 1, CAST(N'2018-05-04T09:50:45.340' AS DateTime), 527, 143)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (744, 1, CAST(N'2018-05-04T09:50:45.343' AS DateTime), 528, 143)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (745, 2, CAST(N'2018-05-04T10:01:09.890' AS DateTime), 529, 144)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (746, 1, CAST(N'2018-05-04T10:01:09.893' AS DateTime), 530, 144)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (747, 1, CAST(N'2018-05-04T10:01:09.897' AS DateTime), 531, 144)
SET IDENTITY_INSERT [dbo].[ChecklistProgress] OFF
SET IDENTITY_INSERT [dbo].[Circle] ON 

INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate], [year], [semester]) VALUES (17, N'ภาคการศึกษาที่ 1/2017', 1, CAST(N'2017-07-03' AS Date), CAST(N'2017-10-02' AS Date), 2017, 1)
INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate], [year], [semester]) VALUES (1034, N'ภาคการศึกษาที่ 2/2017', 1, CAST(N'2017-10-16' AS Date), CAST(N'2018-01-15' AS Date), 2017, 2)
INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate], [year], [semester]) VALUES (1035, N'ภาคการศึกษาที่ 3/2017', 1, CAST(N'2018-01-29' AS Date), CAST(N'2018-04-26' AS Date), 2017, 3)
SET IDENTITY_INSERT [dbo].[Circle] OFF
SET IDENTITY_INSERT [dbo].[Evaluation] ON 

INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (57, N'แบบประเมินความต้องใจในการทำงาน', N'แบบประเมินความต้องใจในการทำงาน')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (58, N'แบบประเมินคุณภาพของงาน', N'แบบประเมินคุณภาพของงาน')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (59, N'แบบประเมินผลงาน', N'แบบประเมินผลงาน')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (60, N'ทดสอบ', N'ทดสอบ')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (61, N'ความพึงพอใจ', N'ความพึงพอใจ')
SET IDENTITY_INSERT [dbo].[Evaluation] OFF
SET IDENTITY_INSERT [dbo].[Goal] ON 

INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (160, N'ลดความอ้วน', N'การออกกกำลังกายคือวิธีการลดความอ้วนที่ดีที่สุด', CAST(N'2018-05-25' AS Date), CAST(N'2018-05-27' AS Date), 18, 17, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 2, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (161, N'ศึกษาชีวจิต', N'ศึกษาชีวจิต', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 17, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (162, N'ควบคุมน้ำหนัก', N'ควบคุมน้ำหนัก', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 17, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (163, N'อ่านหนังสือ', N'อ่านหนังสือ', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 1035, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (164, N'เข้าค่าย SWE ไหวป่ะ', N'เข้าค่าย SWE ไหวป่ะ', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 16, 17, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 2)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (165, N'เรียนอบขนมปัง', N'เรียนอบขนมปัง', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 17, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (166, N'ส่งผลการเรียน', N'ส่งผลการเรียน', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 17, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 3)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (167, N'อ่านหนังสือสุขภาพ', N'อ่านหนังสือ', CAST(N'2018-05-05' AS Date), CAST(N'2018-05-06' AS Date), 18, 17, N'75c35747-1972-4c65-a1eb-a3eca2ccc748', 2, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (168, N'ส่งการบ้าน SWE-234', N'ส่งการบ้าน SWE-234', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 17, 17, N'75c35747-1972-4c65-a1eb-a3eca2ccc748', 1, 2)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (169, N'เขียนนิยาย', N'เขียนนิยาย', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 1035, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (170, N'เรียนทำเบอร์เกอร์รี่', N'เรียนทำเบอร์เกอร์รี่', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 1034, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType], [flag]) VALUES (171, N'อ่านหนังสือสอบ', N'อ่านหนังสือสอบ', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 18, 17, N'116486a5-60d6-4bc1-86ce-95e3ef9f09e0', 1, 1)
SET IDENTITY_INSERT [dbo].[Goal] OFF
SET IDENTITY_INSERT [dbo].[GoalHandler] ON 

INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (126, 160, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (127, 161, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (128, 162, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (129, 163, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (132, 165, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (133, 166, N'458032be-43a8-42c4-8c47-b7218b56c7e3')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (134, 166, N'75c35747-1972-4c65-a1eb-a3eca2ccc748')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (135, 166, N'6d398ddc-c707-4dc2-83a6-300dc154e4d5')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (136, 166, N'7be50024-9fb0-4de7-969e-912e27f93760')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (139, 168, N'df6c3e6e-50e7-4bdb-a6db-00e43ac37f1a')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (140, 167, N'75c35747-1972-4c65-a1eb-a3eca2ccc748')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (141, 163, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (142, 169, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (143, 170, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (144, 171, N'116486a5-60d6-4bc1-86ce-95e3ef9f09e0')
SET IDENTITY_INSERT [dbo].[GoalHandler] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (194, N'แบบประเมินความต้องใจในการทำงาน1', 57)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (195, N'แบบประเมินความต้องใจในการทำงาน2', 57)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (196, N'แบบประเมินคุณภาพของงาน', 58)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (197, N'แบบประเมินผลงาน', 59)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (198, N'ทดสอบ1', 60)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (199, N'ทดสอบ2', 60)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (200, N'ทดสอบ3', 60)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (201, N'test1', 61)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (202, N'test2', 61)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (203, N'test3', 61)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (1, N'นาย', 2)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (2, N'นาง', 2)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (3, N'นางสาว', 2)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (4, N'ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (5, N'ศ.ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (6, N'ศ.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (7, N'ผศ.ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (8, N'ผศ.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (9, N'รศ.ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (10, N'รศ.', 1)
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57113631', 1, N'ณัฐนันท์', N'แซ่ฉั่ว', 1, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'116486a5-60d6-4bc1-86ce-95e3ef9f09e0')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57144032', 3, N'รุจิภาส', N'ปันทโมรา', 1, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'3a0618dd-2940-46ea-a792-abb1b4ef7c52')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (NULL, 7, N'ฐิมาพร', N'เพชรแก้ว', 2, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'458032be-43a8-42c4-8c47-b7218b56c7e3')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (NULL, 8, N'เยาวเรศ', N'ศิริสถิตย์กุล', 2, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'6d398ddc-c707-4dc2-83a6-300dc154e4d5')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (NULL, 4, N'พุทธิพร', N'ธนธรรมเมธี', 2, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'75c35747-1972-4c65-a1eb-a3eca2ccc748')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57111460', 1, N'ครรชิต', N'แก้วเนื้ออ่อน', 1, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'7719c91a-e178-4f58-b79d-06f908015371')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (NULL, 8, N'อุหมาด', N'หมัดอาด้ำ', 2, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'7be50024-9fb0-4de7-969e-912e27f93760')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57110967', 1, N'กิตติพงศ์ ', N'สงทอง', 1, N'e721119b-55a6-40e3-a558-a52211e7f0cc', 1, N'ab897a4a-f5a8-499b-9616-5208f67ae2f8')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57110181', 3, N'กนกวรรณ', N'มีแก้ว', 1, N'75c35747-1972-4c65-a1eb-a3eca2ccc748', 1, N'df6c3e6e-50e7-4bdb-a6db-00e43ac37f1a')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (NULL, 4, N'กรัณรัตน์', N'ธรรมรักษ์', 3, N'0', 1, N'e721119b-55a6-40e3-a558-a52211e7f0cc')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 3, N'admin', N'admin', 4, N'0', 1, N'ff8ab294-22b5-43d8-8e7d-1369e1564206')
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (1, N'นักศึกษา', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (2, N'อาจารย์', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (3, N'ประธานหลักสูตร', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (4, N'ผู้ดูแลระบบ', 1)
SET IDENTITY_INSERT [dbo].[UserType] OFF
SET IDENTITY_INSERT [dbo].[UserTypeInEvaluation] ON 

INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (16, 1, 61)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (17, 2, 61)
SET IDENTITY_INSERT [dbo].[UserTypeInEvaluation] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 04/05/2018 10:10:44 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 04/05/2018 10:10:44 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 04/05/2018 10:10:44 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 04/05/2018 10:10:44 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 04/05/2018 10:10:44 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 04/05/2018 10:10:44 ******/
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
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TitleName] FOREIGN KEY([titleNameID])
REFERENCES [dbo].[TitleName] ([titleNameID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TitleName]
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
ALTER TABLE [dbo].[UserTypeInEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeInEvaluation_Evaluation] FOREIGN KEY([evaluationid])
REFERENCES [dbo].[Evaluation] ([id])
GO
ALTER TABLE [dbo].[UserTypeInEvaluation] CHECK CONSTRAINT [FK_UserTypeInEvaluation_Evaluation]
GO
ALTER TABLE [dbo].[UserTypeInEvaluation]  WITH CHECK ADD  CONSTRAINT [FK_UserTypeInEvaluation_UserType] FOREIGN KEY([userTypeid])
REFERENCES [dbo].[UserType] ([UserTypeId])
GO
ALTER TABLE [dbo].[UserTypeInEvaluation] CHECK CONSTRAINT [FK_UserTypeInEvaluation_UserType]
GO
USE [master]
GO
ALTER DATABASE [SIDB] SET  READ_WRITE 
GO
