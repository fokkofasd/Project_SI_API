USE [master]
GO
/****** Object:  Database [SIDB]    Script Date: 25/04/2018 10:32:37 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 25/04/2018 10:32:38 ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 25/04/2018 10:32:38 ******/
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
/****** Object:  Table [dbo].[AnswerChoice]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Checklist]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[ChecklistProgress]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Choice]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Circle]    Script Date: 25/04/2018 10:32:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Circle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[circleName] [varchar](60) NOT NULL,
	[status] [int] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
 CONSTRAINT [PK_Circle_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentFeedback]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[CommentGoal]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Evaluation]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Goal]    Script Date: 25/04/2018 10:32:39 ******/
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
 CONSTRAINT [PK_Goal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoalHandler]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[ReviewPerformance]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[ReviewPerformanceHandler]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[TitleName]    Script Date: 25/04/2018 10:32:39 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 25/04/2018 10:32:40 ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 25/04/2018 10:32:40 ******/
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
/****** Object:  Table [dbo].[UserTypeInEvaluation]    Script Date: 25/04/2018 10:32:40 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1978eb01-41f0-4141-b23c-49292ced93a3', N'Jutmat@wu.ac.th', 0, N'AIs4SkKNqzjH8WB9i3J7YJ0tEJGxAgZRHCi/TY4mYwa+8yx5WAbnS+wivfGhnfceMw==', N'b147e17d-da2b-4115-8e92-d1011e100233', NULL, 0, 0, NULL, 0, 0, N'Jutmat@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1b468c25-544b-4f40-b0c7-98dbd2a2f27c', N'muhamard@wu.ac.th', 0, N'ACkecx7nTezBNZvyJHh2bIfG447bNo6/afQrgN0qh5gPvupPQ125nfWTXyRdTBm+PA==', N'6b2ceef3-cabe-45f7-85fc-5bde7e6c6793', NULL, 0, 0, NULL, 0, 0, N'muhamard@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'211342e5-bcbf-4b14-9331-762153f5e37d', N'putthiporn.th@wu.ac.th', 0, N'AA/0Y3hltMp2w8FQzp9IFL28Q8manbIxCdOI5etmxHbdkfH8o6CjnRREZahgeXbutg==', N'd66ac303-92f9-494d-8544-15ec8e0b89f4', NULL, 0, 0, NULL, 0, 0, N'putthiporn.th@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'527e2957-4179-4c6e-be0d-b3e3a3a780b8', N'Dictate@wu.ac.th', 0, N'AJSSx6NePrU29bkFfcIW6lcDNAIFMEsKdPsr9tBtAaOSAN1rqqikMKRYbd/9Ljei7g==', N'8ba94920-40e1-4ea5-929e-aed2f3447e8b', NULL, 0, 0, NULL, 0, 0, N'Dictate@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', N'admintest2@admin.com', 0, N'AKgCA1yGsUrlwYG1Mew0TZAoLQZeVDiI0kljopYiofKrfdgysDnIjoCJP2aJC1CW9g==', N'4d8b36c0-b0e7-4acf-a9ae-ec2de58f4532', NULL, 0, 0, NULL, 0, 0, N'admintest2@admin.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a8abafa7-226c-4a75-be7f-61e08184adae', N'Kanokwan@wu.ac.th', 0, N'AH61cPpLAJYN/mnTBLFf98k+EnQnBUUCYjaEEKTPa7QBD6xVACl57akUTQWclKc9cw==', N'687c79b3-9ff9-4581-9ece-a70bead020a8', NULL, 0, 0, NULL, 0, 0, N'Kanokwan@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ac710326-d0c8-4f13-9c25-3fffdbcd56a8', N'Nutthanun@wu.ac.th', 0, N'AM/wiPAfQqwb3J6biSFUq1MppMVuK1Vw2+Gk4WgSlapPVupJWvkzr1jfC0kqGJ4e3Q==', N'8028c1f1-bc69-4bf0-b8be-2f265c8a628e', NULL, 0, 0, NULL, 0, 0, N'Nutthanun@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c054064f-c4b3-4086-9f1f-b532f86e947e', N'sjidtima@wu.ac.th', 0, N'AK3QZfw3FPYQpQ+PUsznVH/kxbbV0m5A0qbriB+7ccHugtV2g7BGDyZCS+zppllmyg==', N'ebef83e1-e0e5-4757-a8d6-a26dddcb5213', NULL, 0, 0, NULL, 0, 0, N'sjidtima@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ce5e760d-6a3b-421a-b26e-31835dcdfdca', N'9966@bknj', 0, N'AAKYIJkYvv3dxvJa+WLrgv/+5hzdOSZGLiIQrm+QMmecZ9ZcG9CrLEeKBSIexqSC8w==', N'24686385-1152-4a8a-95bf-e88e296e2ac8', NULL, 0, 0, NULL, 0, 0, N'9966@bknj')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'debda04e-fb55-43f7-80df-e615ddcf4034', N'qwett@qwe.com', 0, N'ADUnCUEMaYXVwvrQLWgobIOimdpkRDUQJzAElmxziKkiMAim2L9c2TDQS13EjJ8+6A==', N'030d5575-0634-4c6b-ad96-8be4d5d9317f', NULL, 0, 0, NULL, 0, 0, N'qwett@qwe.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df6e02de-c1f5-4e76-aa41-fc3c6b4460d3', N'pthimapo@wu.ac.th', 0, N'ADAToNpm84eaSoKREO9BJfRPAwdI7gQEdezxRwLKld+OCTL/wSI5W0scBMwcqy51Cw==', N'173e33a4-5dfa-4e4c-b08d-751fc7c7a013', NULL, 0, 0, NULL, 0, 0, N'pthimapo@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'eed9da67-406c-4b21-be10-c0b2ecb6b923', N'ehrheh@ntr', 0, N'AO90WJM5v/71H6pwfSfBPMMtfWNeYS5nTZ4iFj7l221pn9co4y+v/oy3lw2y4qoGig==', N'c8615643-2182-4610-8361-dc219bb81286', NULL, 0, 0, NULL, 0, 0, N'ehrheh@ntr')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f70c7453-ac5c-48a5-b3e5-2592b1968cbb', N'syaowara@wu.ac.th', 0, N'APpeRchCIwy0ToGXmcX7IpIuioL4BfH8leRFZtzc0/l4uZqiYfv3UgCHFNHzl594zg==', N'5a2af8c1-0397-44c2-b10d-1838983eba19', NULL, 0, 0, NULL, 0, 0, N'syaowara@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f90ffbe2-dd21-4c9e-87de-c6f43040ca13', N'Thanyanson@wu.ac.th', 0, N'AJTCX3emIrP9nQZoIa86uv1KCqpBo9UUKC1sMS1QK3+8ZuyPf97P05ORsGWksMYvLw==', N'afe8ba52-0cde-43e3-b061-0175f57ca0a3', NULL, 0, 0, NULL, 0, 0, N'Thanyanson@wu.ac.th')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ff8ab294-22b5-43d8-8e7d-1369e1564206', N'admin@admin', 0, N'ALDQxGoVNvAfZWWQ2L9d8iXwbYXs9EXLbQbRpFeAddAHIsC7PLLBIyv8mT9j4SO0CQ==', N'704b7ec0-2e79-4365-ba78-edfa98bd3b8a', NULL, 0, 0, NULL, 0, 0, N'admin@admin')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (6, N'รายวิชาที่ลงทะเบียน', 2)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (8, N'งานส่วนตัว', 1)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (9, N'กิจกรรมหลักสูตร', 1)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (15, N'การเรียนการสอน', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Checklist] ON 

INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (370, N'ทดสอบสร้างรายการตรวจสอบ1', 138)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (371, N'ทดสอบสร้างรายการตรวจสอบ2', 138)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (378, N'ควบคุมน้ำหนัก1', 140)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (379, N'ควบคุมน้ำหนัก2', 140)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (380, N'ควบคุมน้ำหนัก3', 140)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (381, N'SWE-243 เกรด C+', 141)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (382, N'SWE-273 เกรด C', 141)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (383, N'SWE-243 เกรด B', 141)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (388, N'framwork', 146)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (389, N'api', 146)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (390, N'web', 146)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (391, N'app', 146)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (392, N'Frontend', 147)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (393, N'Backend', 147)
SET IDENTITY_INSERT [dbo].[Checklist] OFF
SET IDENTITY_INSERT [dbo].[ChecklistProgress] ON 

INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (521, 2, CAST(N'2018-04-24T19:34:42.040' AS DateTime), 370, 89)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (522, 2, CAST(N'2018-04-24T19:34:42.040' AS DateTime), 371, 89)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (529, 2, CAST(N'2018-04-24T19:53:19.347' AS DateTime), 378, 92)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (530, 2, CAST(N'2018-04-24T19:53:19.347' AS DateTime), 379, 92)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (531, 2, CAST(N'2018-04-24T19:53:19.347' AS DateTime), 380, 92)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (532, 1, CAST(N'2018-04-24T19:58:09.600' AS DateTime), 381, 93)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (533, 1, CAST(N'2018-04-24T19:58:09.600' AS DateTime), 382, 93)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (534, 1, CAST(N'2018-04-24T19:58:09.600' AS DateTime), 383, 93)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (535, 1, CAST(N'2018-04-24T19:58:09.613' AS DateTime), 381, 94)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (536, 1, CAST(N'2018-04-24T19:58:09.613' AS DateTime), 382, 94)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (537, 1, CAST(N'2018-04-24T19:58:09.613' AS DateTime), 383, 94)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (542, 2, CAST(N'2018-04-25T09:56:59.453' AS DateTime), 388, 96)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (543, 2, CAST(N'2018-04-25T09:56:59.453' AS DateTime), 389, 96)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (544, 2, CAST(N'2018-04-25T09:56:59.453' AS DateTime), 390, 96)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (545, 2, CAST(N'2018-04-25T09:56:59.453' AS DateTime), 391, 96)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (546, 1, CAST(N'2018-04-25T10:04:21.887' AS DateTime), 392, 97)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (547, 1, CAST(N'2018-04-25T10:04:21.887' AS DateTime), 393, 97)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (548, 1, CAST(N'2018-04-25T10:04:21.897' AS DateTime), 392, 98)
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [time], [checklistID], [goalHandlerID]) VALUES (549, 1, CAST(N'2018-04-25T10:04:21.897' AS DateTime), 393, 98)
SET IDENTITY_INSERT [dbo].[ChecklistProgress] OFF
SET IDENTITY_INSERT [dbo].[Circle] ON 

INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate]) VALUES (17, N'ปีการศึกษา 2561', 1, CAST(N'2018-10-24' AS Date), CAST(N'2018-10-25' AS Date))
INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate]) VALUES (18, N'ภาคการศึกษาที่1/2561', 1, CAST(N'2018-09-19' AS Date), CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate]) VALUES (19, N'ภาคการศึกษาที่2/2561', 1, CAST(N'2018-09-12' AS Date), CAST(N'2018-09-19' AS Date))
INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate]) VALUES (20, N'ภาคการศึกษาที่3/2561', 1, CAST(N'2018-09-27' AS Date), CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Circle] ([id], [circleName], [status], [startDate], [endDate]) VALUES (22, N'ภาคการศึกษาที่3/2562', 1, CAST(N'2018-04-25' AS Date), CAST(N'2018-06-28' AS Date))
SET IDENTITY_INSERT [dbo].[Circle] OFF
SET IDENTITY_INSERT [dbo].[Evaluation] ON 

INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (49, N'ทดสอบสร้างแบบประเมินผ่าน Postman', N'ทดสอบสร้างแบบประเมินผ่าน')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (51, N'แบบประเมินความพึงพอใจ', N'แบบประเมินความพึงพอใจ')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (52, N'1', N'1')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (53, N'2', N'2')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (54, N'แบบประเมินความพึงพอใจ222', N'2222222')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (55, N'ทดสอบ', N'ทดสอบสร้างแบบประเมิน ประสิทธิภาพการสร้าง')
INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (56, N'แบบประเมินความพึงพอใจในการทำงาน', N'แบบประเมินโครงการแข่งขันหุ่นยนต์เดินตามเส้น
(Line Following Robot Contest 1st)
ภาควิชาวิศวกรรมคอมพิวเตอร์  คณะวิศวกรรมศาสตร์  
มหาวิทยาลัยสงขลานครินคร์ วิทยาเขตหาดใหญ่
')
SET IDENTITY_INSERT [dbo].[Evaluation] OFF
SET IDENTITY_INSERT [dbo].[Goal] ON 

INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType]) VALUES (138, N'ทดสอบสร้าง', N'ทดสอบสร้าง', CAST(N'2018-03-14' AS Date), CAST(N'2018-03-21' AS Date), 8, 17, N'a8abafa7-226c-4a75-be7f-61e08184adae', 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType]) VALUES (140, N'ควบคุมน้ำหนัก', N'ควบคุมน้ำหนัก', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 8, 17, N'a8abafa7-226c-4a75-be7f-61e08184adae', 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType]) VALUES (141, N'ผลการเรียน', N'พัฒนาผลการเรียน', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 15, 17, N'a8abafa7-226c-4a75-be7f-61e08184adae', 1)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType]) VALUES (146, N'ฝึกเขียน C#', N'พัฒนาการฝึกเขียน C#', CAST(N'2018-05-01' AS Date), CAST(N'2018-05-30' AS Date), 15, 17, N'a8abafa7-226c-4a75-be7f-61e08184adae', 2)
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID], [circleType]) VALUES (147, N'พัฒนาเว็บ API', N'พัฒนา ', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), 15, 18, N'a8abafa7-226c-4a75-be7f-61e08184adae', 1)
SET IDENTITY_INSERT [dbo].[Goal] OFF
SET IDENTITY_INSERT [dbo].[GoalHandler] ON 

INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (89, 138, N'a8abafa7-226c-4a75-be7f-61e08184adae')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (92, 140, N'a8abafa7-226c-4a75-be7f-61e08184adae')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (93, 141, N'527e2957-4179-4c6e-be0d-b3e3a3a780b8')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (94, 141, N'ac710326-d0c8-4f13-9c25-3fffdbcd56a8')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (96, 146, N'a8abafa7-226c-4a75-be7f-61e08184adae')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (97, 147, N'527e2957-4179-4c6e-be0d-b3e3a3a780b8')
INSERT [dbo].[GoalHandler] ([id], [goalID], [userID]) VALUES (98, 147, N'ac710326-d0c8-4f13-9c25-3fffdbcd56a8')
SET IDENTITY_INSERT [dbo].[GoalHandler] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (181, N'ทดสอบสร้างแบบประเมินผ่าน Postm11', 49)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (182, N'ทดสอบสร้างแบบประเมินผ่าน Postm2', 49)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (183, N'แบบประเมินความพึงพอใจ', 51)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (184, N'1', 52)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (186, N'2', 53)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (187, N'222222222222', 54)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (188, N'ทดสอบ1', 55)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (189, N'ทดสอบ2', 55)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (190, N'ทดสอบ3', 55)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (191, N'การเตรียมตัวและความพร้อมของผู้สอน', 56)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (192, N'บุคลิกภาพของผู้สอน', 56)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (193, N'ความรอบรู้ในการถ่ายทอดความรู้และเทคโนโลยี', 56)
SET IDENTITY_INSERT [dbo].[Question] OFF
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (1, N'นาย', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (2, N'นาง', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (3, N'นางสาว', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (4, N'ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (5, N'ศ.ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (6, N'ศ.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (7, N'ผศ.ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (8, N'ผศ.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (9, N'รศ.ดร.', 1)
INSERT [dbo].[TitleName] ([titleNameID], [titleName], [status]) VALUES (10, N'รศ.', 1)
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57112195', 3, N'จุฑามาศ', N'คงมีผล', 1, N'c054064f-c4b3-4086-9f1f-b532f86e947e', 1, N'1978eb01-41f0-4141-b23c-49292ced93a3')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 8, N'อุหมาด', N'หมัดอาด้ำ', 2, N'0', 1, N'1b468c25-544b-4f40-b0c7-98dbd2a2f27c')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 4, N'พุทธิพร', N'ธนธรรมเมธี', 2, N'0', 2, N'211342e5-bcbf-4b14-9331-762153f5e37d')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57111460', 1, N'ครรชิต', N'แก้วเนื้ออ่อน', 1, N'a8abafa7-226c-4a75-be7f-61e08184adae', 1, N'527e2957-4179-4c6e-be0d-b3e3a3a780b8')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 4, N'กรัณรัตน์', N'ธรรมรักษ์', 3, N'0', 1, N'a8abafa7-226c-4a75-be7f-61e08184adae')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57113631', 1, N'ณัฐนันท์', N'แซ่ฉั่ว', 1, N'a8abafa7-226c-4a75-be7f-61e08184adae', 1, N'ac710326-d0c8-4f13-9c25-3fffdbcd56a8')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 4, N'จิตติมา', N'ศังขมณี', 2, N'211342e5-bcbf-4b14-9331-762153f5e37d', 1, N'c054064f-c4b3-4086-9f1f-b532f86e947e')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (NULL, 4, N'รุ่งเรือง', N'โชคดี', 2, N'0', 1, N'debda04e-fb55-43f7-80df-e615ddcf4034')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 7, N'ฐิมาพร', N'เพชรแก้ว', 2, N'0', 1, N'df6e02de-c1f5-4e76-aa41-fc3c6b4460d3')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 8, N'เยาวเรศ', N'ศิริสถิตย์กุล', 2, N'0', 1, N'f70c7453-ac5c-48a5-b3e5-2592b1968cbb')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'57114712', 1, N'ธัญญบุตร', N'จันทร์ประสิทธิ์', 1, N'f70c7453-ac5c-48a5-b3e5-2592b1968cbb', 2, N'f90ffbe2-dd21-4c9e-87de-c6f43040ca13')
INSERT [dbo].[User] ([personalID], [titleNameID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'', 1, N'admin', N'admin', 4, N'0', 1, N'ff8ab294-22b5-43d8-8e7d-1369e1564206')
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (1, N'นักศึกษา', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (2, N'อาจารย์', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (3, N'ประธานหลักสูตร', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (4, N'ผู้ดูแลระบบ', 1)
SET IDENTITY_INSERT [dbo].[UserType] OFF
SET IDENTITY_INSERT [dbo].[UserTypeInEvaluation] ON 

INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (1, 1, 49)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (2, 2, 49)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (3, 1, 51)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (4, 2, 51)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (5, 1, 52)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (6, 2, 52)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (7, 3, 52)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (8, 1, 53)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (9, 3, 53)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (10, 1, 54)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (11, 3, 54)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (12, 1, 55)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (13, 2, 55)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (14, 1, 56)
INSERT [dbo].[UserTypeInEvaluation] ([id], [userTypeid], [evaluationid]) VALUES (15, 2, 56)
SET IDENTITY_INSERT [dbo].[UserTypeInEvaluation] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 25/04/2018 10:32:40 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 25/04/2018 10:32:40 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 25/04/2018 10:32:40 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 25/04/2018 10:32:40 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 25/04/2018 10:32:40 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 25/04/2018 10:32:40 ******/
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
