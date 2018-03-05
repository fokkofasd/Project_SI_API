USE [master]
GO
/****** Object:  Database [SIDB]    Script Date: 3/5/2018 2:27:31 PM ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[Checklist]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[ChecklistProgress]    Script Date: 3/5/2018 2:27:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChecklistProgress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklistProgress] [int] NOT NULL,
	[checklistID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ChecklistProgress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Circle]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[CommentFeedback]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[CommentGoal]    Script Date: 3/5/2018 2:27:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentGoal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](200) NULL,
	[attachFile] [varchar](200) NULL,
	[goalID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_commentGoal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 3/5/2018 2:27:32 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/5/2018 2:27:33 PM ******/
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
/****** Object:  Table [dbo].[Goal]    Script Date: 3/5/2018 2:27:33 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 3/5/2018 2:27:33 PM ******/
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
/****** Object:  Table [dbo].[ReviewPerformance]    Script Date: 3/5/2018 2:27:33 PM ******/
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
/****** Object:  Table [dbo].[ReviewPerformanceHandler]    Script Date: 3/5/2018 2:27:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewPerformanceHandler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reviewPerformanceID] [int] NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_ReviewPerformanceHandler] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/5/2018 2:27:33 PM ******/
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
/****** Object:  Table [dbo].[UserType]    Script Date: 3/5/2018 2:27:33 PM ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', N'admintest2@admin.com', 0, N'AKgCA1yGsUrlwYG1Mew0TZAoLQZeVDiI0kljopYiofKrfdgysDnIjoCJP2aJC1CW9g==', N'4d8b36c0-b0e7-4acf-a9ae-ec2de58f4532', NULL, 0, 0, NULL, 0, 0, N'admintest2@admin.com')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (1, N'Web Application', 1)
INSERT [dbo].[Category] ([id], [categoryName], [status]) VALUES (2, N'Web Api', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Checklist] ON 

INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (1, N'testcreatechecklist1', 1)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (2, N'testcreatechecklist2', 1)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (3, N'testcreatechecklist3', 1)
INSERT [dbo].[Checklist] ([id], [checklistName], [goalID]) VALUES (4, N'testcreatechecklist4', 1)
SET IDENTITY_INSERT [dbo].[Checklist] OFF
SET IDENTITY_INSERT [dbo].[ChecklistProgress] ON 

INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [checklistID], [userID]) VALUES (7, 2, 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [checklistID], [userID]) VALUES (8, 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [checklistID], [userID]) VALUES (9, 2, 3, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[ChecklistProgress] ([id], [checklistProgress], [checklistID], [userID]) VALUES (10, 2, 4, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[ChecklistProgress] OFF
SET IDENTITY_INSERT [dbo].[Circle] ON 

INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (2, N'?????', 365, 1)
INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (3, N'????????', 30, 1)
INSERT [dbo].[Circle] ([id], [circleName], [circleTime], [status]) VALUES (4, N'??????????', 7, 1)
SET IDENTITY_INSERT [dbo].[Circle] OFF
SET IDENTITY_INSERT [dbo].[CommentFeedback] ON 

INSERT [dbo].[CommentFeedback] ([id], [comment], [feedbackID], [commentatorID]) VALUES (1, N'?????????????????', 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[CommentFeedback] OFF
SET IDENTITY_INSERT [dbo].[CommentGoal] ON 

INSERT [dbo].[CommentGoal] ([id], [comment], [attachFile], [goalID], [userID]) VALUES (1, N'?????api ?????', N'????????????????????', 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[CommentGoal] OFF
SET IDENTITY_INSERT [dbo].[Evaluation] ON 

INSERT [dbo].[Evaluation] ([id], [evaluationName], [description]) VALUES (1, N'???????????????????', N'???????????????????????????????????')
SET IDENTITY_INSERT [dbo].[Evaluation] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [feedback], [providerID], [receiverID]) VALUES (1, N'???????????????????????? UI', N'911cbe47-fab7-466e-8b40-eeac5cbd9f96', N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Goal] ON 

INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (1, N'????????? Api', N'?????????Api ?????????', CAST(N'2018-02-10' AS Date), CAST(N'2018-02-17' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (4, N'testupdategoalname', N'testupdategoadesl', CAST(N'2018-03-03' AS Date), CAST(N'2018-03-09' AS Date), 1, 3, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
INSERT [dbo].[Goal] ([id], [goalName], [description], [startDate], [endDate], [categoryID], [circleID], [userID]) VALUES (5, N'testcreategoalname2', N'testcreategoaldes2', CAST(N'2018-03-04' AS Date), CAST(N'2018-03-10' AS Date), 2, 2, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[Goal] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (2, N'Testquestion1', 1)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (3, N'Testquestion2', 1)
INSERT [dbo].[Question] ([id], [question], [evaluationID]) VALUES (4, N'Testquestion3', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[ReviewPerformance] ON 

INSERT [dbo].[ReviewPerformance] ([id], [reviewPerformanceName], [description], [evaluationID], [userID]) VALUES (1, N'????????????? 1', N'??????????????????????????', 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[ReviewPerformance] OFF
SET IDENTITY_INSERT [dbo].[ReviewPerformanceHandler] ON 

INSERT [dbo].[ReviewPerformanceHandler] ([id], [reviewPerformanceID], [userID]) VALUES (1, 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[ReviewPerformanceHandler] OFF
INSERT [dbo].[User] ([personalID], [firstname], [lastname], [userTypeID], [commanderID], [status], [userID]) VALUES (N'12345694', N'adminstestcreate2', N'adminstestcreate2', 2, NULL, 1, N'911cbe47-fab7-466e-8b40-eeac5cbd9f96')
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (1, N'???????????', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (2, N'??????????????', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (3, N'???????', 1)
INSERT [dbo].[UserType] ([UserTypeId], [UserTypeName], [status]) VALUES (4, N'????????', 1)
SET IDENTITY_INSERT [dbo].[UserType] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/5/2018 2:27:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/5/2018 2:27:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/5/2018 2:27:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 3/5/2018 2:27:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 3/5/2018 2:27:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/5/2018 2:27:33 PM ******/
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
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_ReviewPerformanceHandler] FOREIGN KEY([reviewPerformanceHandlerID])
REFERENCES [dbo].[ReviewPerformanceHandler] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_ReviewPerformanceHandler]
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
ALTER TABLE [dbo].[ChecklistProgress]  WITH CHECK ADD  CONSTRAINT [FK_ChecklistProgress_Checklist1] FOREIGN KEY([checklistID])
REFERENCES [dbo].[Checklist] ([id])
GO
ALTER TABLE [dbo].[ChecklistProgress] CHECK CONSTRAINT [FK_ChecklistProgress_Checklist1]
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
ALTER TABLE [dbo].[ReviewPerformanceHandler]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformanceHandler_ReviewPerformance] FOREIGN KEY([reviewPerformanceID])
REFERENCES [dbo].[ReviewPerformance] ([id])
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler] CHECK CONSTRAINT [FK_ReviewPerformanceHandler_ReviewPerformance]
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler]  WITH CHECK ADD  CONSTRAINT [FK_ReviewPerformanceHandler_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([userID])
GO
ALTER TABLE [dbo].[ReviewPerformanceHandler] CHECK CONSTRAINT [FK_ReviewPerformanceHandler_User]
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
