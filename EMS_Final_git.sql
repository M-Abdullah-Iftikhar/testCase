USE [master]
GO
/****** Object:  Database [EMS__Final]    Script Date: 14/07/2024 10:08:07 am ******/
CREATE DATABASE [EMS__Final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EMS__Final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EMS__Final.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EMS__Final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EMS__Final_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EMS__Final] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMS__Final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMS__Final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMS__Final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMS__Final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMS__Final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMS__Final] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMS__Final] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMS__Final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMS__Final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMS__Final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMS__Final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMS__Final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMS__Final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMS__Final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMS__Final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMS__Final] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMS__Final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMS__Final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMS__Final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMS__Final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMS__Final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMS__Final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMS__Final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMS__Final] SET RECOVERY FULL 
GO
ALTER DATABASE [EMS__Final] SET  MULTI_USER 
GO
ALTER DATABASE [EMS__Final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMS__Final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EMS__Final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EMS__Final] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EMS__Final] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EMS__Final] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EMS__Final', N'ON'
GO
ALTER DATABASE [EMS__Final] SET QUERY_STORE = ON
GO
ALTER DATABASE [EMS__Final] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EMS__Final]
GO
/****** Object:  Table [dbo].[Lookup]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lookup](
	[Id] [int] NOT NULL,
	[value] [nchar](20) NULL,
	[descryption] [nchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [int] NULL,
	[Address] [varchar](255) NULL,
	[Nationality] [varchar](100) NULL,
 CONSTRAINT [PK__Person__3214EC07BEB02AA8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[Id] [int] NOT NULL,
	[RegistrationDate] [datetime] NULL,
	[Fee] [int] NULL,
	[isActive] [bit] NOT NULL,
	[EventId] [int] NULL,
	[OrganizerID] [int] NULL,
	[VendorType] [int] NULL,
 CONSTRAINT [PK__Vendors__3214EC079FA024AF] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_VendorDetails]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_VendorDetails] AS
SELECT
    p.FirstName,
    p.LastName,
    p.Phone,
    p.Email,
    v.VendorType,
    v.Fee,
    (SELECT Value FROM Lookup WHERE Id = v.VendorType) AS [Vendor Type],
    p.DateOfBirth,
    (SELECT Value FROM Lookup WHERE Id = p.Gender) AS Gender,
    p.Address,
    p.Nationality
FROM
    Vendors v
JOIN
    Person p ON v.Id = p.Id;
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NOT NULL,
	[Deadline] [datetime] NULL,
	[AssignedTo] [int] NOT NULL,
	[Done] [bit] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__Tasks__7C6949D1830E66FB] PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizers]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizers](
	[Id] [int] NOT NULL,
	[Password] [nchar](30) NULL,
	[RegistrationDate] [datetime] NULL,
	[Fee] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ClientID] [int] NULL,
	[Description] [text] NULL,
	[Date] [datetime] NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NULL,
	[OrganizerID] [int] NULL,
	[VenueID] [int] NULL,
	[Status] [int] NULL,
	[EventType] [int] NULL,
 CONSTRAINT [PK__Events__3214EC073EEE073F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_TasksDetails]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[view_TasksDetails] AS
SELECT
    t.Name,
    t.Description,
    t.DeadLine,
    (SELECT e.Name + '-' + CAST(e.Id AS NVARCHAR(50)) FROM Events e WHERE e.Id = t.EventId) AS EventName,
    (SELECT p.Email FROM Person p JOIN Organizers o ON p.Id = o.Id WHERE o.Id = t.AssignedTo) AS AssignedToEmail
FROM
    Tasks t;
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[OrganizerID] [int] NULL,
	[EventID] [int] NULL,
	[ContractAmount] [decimal](10, 2) NULL,
	[StartDate] [date] NULL,
	[Payed] [bit] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK__Contract__C90D3409359316AB] PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_ContractDetails]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_ContractDetails] AS
SELECT
    e.Name + '-' + CAST(e.ID AS VARCHAR) AS [Event Name],
    (SELECT Email FROM Person WHERE ID = e.ClientID) AS [Client],
    ContractAmount,
    StartDate,
    EndDate,
    Payed
FROM
    Contracts c
JOIN
    Events e ON c.EventID = e.ID;
GO
/****** Object:  View [dbo].[view_OrganizerVendors]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_OrganizerVendors] AS
SELECT
    p.FirstName + ' ' + p.LastName AS Name,
    p.Phone,
    p.Email,
    o.Fee,
    (SELECT Value FROM Lookup WHERE Id = o.VendorType) AS [Vendor Type],
    p.DateOfBirth,
    (SELECT Value FROM Lookup WHERE Id = p.Gender) AS Gender,
    p.Address,
    p.Nationality
FROM
    Vendors o
JOIN
    Person p ON o.Id = p.Id
WHERE
    o.isActive = 1;
GO
/****** Object:  View [dbo].[view_Organizers]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_Organizers] AS
SELECT Email
FROM Organizers o
JOIN Person p ON o.Id = p.Id;
GO
/****** Object:  View [dbo].[view_Vendors]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_Vendors] AS
SELECT Email
FROM Vendors o
JOIN Person p ON o.Id = p.Id;
GO
/****** Object:  View [dbo].[view_EventSTaff]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_EventSTaff] AS
SELECT
    e.Id AS [Event ID],
    p.Email AS [Organizer Email],
    p1.Email AS [Musician Email],
    p2.Email AS [Catering Email],
    p3.Email AS [Decore Email]
FROM
    dbo.Events e
JOIN
    dbo.Organizers o ON e.OrganizerID = o.Id
LEFT JOIN
    dbo.Vendors v1 ON e.Id = v1.EventId AND v1.VendorType = (SELECT Id FROM dbo.Lookup WHERE value = 'Musician')
LEFT JOIN
    dbo.Vendors v2 ON e.Id = v2.EventId AND v2.VendorType = (SELECT Id FROM dbo.Lookup WHERE value = 'Catering')
LEFT JOIN
    dbo.Vendors v3 ON e.Id = v3.EventId AND v3.VendorType = (SELECT Id FROM dbo.Lookup WHERE value = 'Decore')
JOIN
	dbo.Person p ON p.Id = o.Id
JOIN
    dbo.Person p1 ON v1.Id = p1.Id
JOIN
    dbo.Person p2 ON v2.Id = p2.Id
JOIN
    dbo.Person p3 ON v3.Id = p3.Id
WHERE
    e.Status = 7 -- Assuming 1 is the status for active events
GO
/****** Object:  View [dbo].[view_EventSTaff2]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_EventSTaff2] AS  
SELECT  
    e.Name + Cast(e.Id as varchar)  AS [Event],  
    p.Email AS [Organizer Email],  
    p1.Email AS [Musician Email],  
    p2.Email AS [Catering Email],  
    p3.Email AS [Decore Email]  
FROM  
    Events e  
JOIN  
    Organizers o ON e.OrganizerID = o.Id  
LEFT JOIN  
    Vendors v1 ON e.Id = v1.EventId AND v1.VendorType = (SELECT Id FROM dbo.Lookup WHERE value = 'Musician')  
LEFT JOIN  
    Vendors v2 ON e.Id = v2.EventId AND v2.VendorType = (SELECT Id FROM dbo.Lookup WHERE value = 'Catering')  
LEFT JOIN  
    Vendors v3 ON e.Id = v3.EventId AND v3.VendorType = (SELECT Id FROM dbo.Lookup WHERE value = 'Decore')  
JOIN  
    Person p ON p.Id = o.Id  
JOIN  
    Person p1 ON v1.Id = p1.Id  
JOIN  
    Person p2 ON v2.Id = p2.Id  
JOIN  
    Person p3 ON v3.Id = p3.Id  
WHERE  
    e.Status = 7 -- Assuming 1 is the status for active events  
GO
/****** Object:  Table [dbo].[Attendees]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendees](
	[Id] [int] NOT NULL,
	[EventId] [int] NULL,
	[ArrivalTime] [datetime] NULL,
	[Attended] [bit] NULL,
 CONSTRAINT [PK__Attendee__3214EC072FA06371] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] NOT NULL,
	[CreditCardNo] [nchar](16) NULL,
	[Password] [nchar](30) NOT NULL,
	[RegistrationDate] [datetime] NULL,
 CONSTRAINT [PK__Client__3214EC0714AC0DDD] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientHistory](
	[Id] [int] NULL,
	[Password] [nchar](30) NULL,
	[EventId] [int] NULL,
	[CreditCardNo] [nchar](16) NULL,
	[RegistrationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[ClientId] [int] NULL,
	[Rating] [int] NULL,
	[Description] [text] NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](255) NOT NULL,
	[Province] [nchar](10) NULL,
	[City] [varchar](100) NULL,
	[PostalCode] [nchar](10) NULL,
	[Country] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Location__3214EC073F473049] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ID] [int] NOT NULL,
	[Password] [nchar](30) NULL,
	[RegistrationDate] [datetime] NULL,
	[AdminCode] [nchar](30) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerHistory](
	[ID] [int] NOT NULL,
	[Password] [nchar](10) NULL,
	[RegistrationDate] [datetime] NULL,
	[AdminCode] [nchar](10) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ManagerID] [int] NOT NULL,
	[Description] [nchar](100) NULL,
	[EventID] [int] NULL,
	[SuggestedTime] [datetime] NULL,
	[ClientID] [int] NULL,
	[DateTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizersHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizersHistory](
	[Id] [int] NULL,
	[Password] [nchar](30) NULL,
	[RegistrationDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Fee] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonHistory](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [int] NULL,
	[Address] [varchar](255) NULL,
	[Nationality] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[OrganizerID] [int] NOT NULL,
	[TaskID] [int] NOT NULL,
	[RequestDate] [datetime] NULL,
	[Description] [text] NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TasksHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasksHistory](
	[TaskID] [int] NULL,
	[EventID] [int] NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](max) NOT NULL,
	[Deadline] [datetime] NULL,
	[AssignedTo] [int] NOT NULL,
	[Done] [bit] NULL,
	[UpdateDate] [datetime] NULL,
	[Status] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NULL,
	[AttendeeID] [int] NULL,
	[ClientID] [int] NULL,
	[status] [bit] NOT NULL,
	[FIllFormDate] [datetime] NULL,
	[Attended] [bit] NULL,
 CONSTRAINT [PK__Tickets__712CC627947277BC] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorsHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorsHistory](
	[Id] [int] NULL,
	[RegistrationDate] [datetime] NULL,
	[Password] [nchar](30) NULL,
	[Fee] [int] NULL,
	[EventId] [int] NOT NULL,
	[OrganizerID] [int] NULL,
	[VenderType] [int] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Status] [bit] NULL,
	[LocationId] [int] NULL,
	[PricePerPerson] [decimal](10, 2) NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK__Venue__3214EC075808A7D8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VenueHistory]    Script Date: 14/07/2024 10:08:08 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VenueHistory](
	[Id] [int] NULL,
	[Name] [varchar](100) NOT NULL,
	[PricePerPerson] [decimal](10, 2) NULL,
	[Capacity] [int] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Attendees] ([Id], [EventId], [ArrivalTime], [Attended]) VALUES (38, 4, CAST(N'2024-05-08T22:01:08.737' AS DateTime), 1)
INSERT [dbo].[Attendees] ([Id], [EventId], [ArrivalTime], [Attended]) VALUES (39, 6, CAST(N'2024-05-08T22:01:44.163' AS DateTime), 1)
INSERT [dbo].[Attendees] ([Id], [EventId], [ArrivalTime], [Attended]) VALUES (40, 4, CAST(N'2024-05-08T22:19:08.660' AS DateTime), 1)
INSERT [dbo].[Attendees] ([Id], [EventId], [ArrivalTime], [Attended]) VALUES (41, 4, CAST(N'2024-05-08T22:19:40.090' AS DateTime), 1)
GO
INSERT [dbo].[Client] ([Id], [CreditCardNo], [Password], [RegistrationDate]) VALUES (9, N'1234123412341234', N'IsaacEinstein3#               ', CAST(N'2024-04-27T16:49:12.533' AS DateTime))
INSERT [dbo].[Client] ([Id], [CreditCardNo], [Password], [RegistrationDate]) VALUES (11, N'1234123412341234', N'12341234                      ', CAST(N'2024-05-01T13:02:39.883' AS DateTime))
INSERT [dbo].[Client] ([Id], [CreditCardNo], [Password], [RegistrationDate]) VALUES (36, N'1234123412341234', N'12341234                      ', CAST(N'2024-05-06T00:24:04.060' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ContractID], [OrganizerID], [EventID], [ContractAmount], [StartDate], [Payed], [EndDate]) VALUES (1, 20, 4, CAST(301284.00 AS Decimal(10, 2)), CAST(N'2024-05-08' AS Date), 1, CAST(N'2024-08-11' AS Date))
INSERT [dbo].[Contracts] ([ContractID], [OrganizerID], [EventID], [ContractAmount], [StartDate], [Payed], [EndDate]) VALUES (2, 20, 7, NULL, CAST(N'2024-06-15' AS Date), 0, CAST(N'2024-04-27' AS Date))
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [ClientID], [Description], [Date], [StartTime], [EndTime], [OrganizerID], [VenueID], [Status], [EventType]) VALUES (2, N'jjn', 11, N'jkwnq', CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'13:25:46.6866667' AS Time), CAST(N'17:25:46' AS Time), 27, 2, 7, 10)
INSERT [dbo].[Events] ([Id], [Name], [ClientID], [Description], [Date], [StartTime], [EndTime], [OrganizerID], [VenueID], [Status], [EventType]) VALUES (3, N'Event1', 36, N'i want to submit a request for event', CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'13:25:46.6866667' AS Time), CAST(N'17:25:46' AS Time), 42, 1, 7, 10)
INSERT [dbo].[Events] ([Id], [Name], [ClientID], [Description], [Date], [StartTime], [EndTime], [OrganizerID], [VenueID], [Status], [EventType]) VALUES (4, N'Event2', 9, N'HGHFJHGALDGCLASDJVH KULG', CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(N'13:25:46.6866667' AS Time), CAST(N'16:25:46' AS Time), 20, 2, 7, 12)
INSERT [dbo].[Events] ([Id], [Name], [ClientID], [Description], [Date], [StartTime], [EndTime], [OrganizerID], [VenueID], [Status], [EventType]) VALUES (5, N'event3', 36, N'', CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'13:25:46.6866667' AS Time), CAST(N'17:25:46' AS Time), NULL, 4, 8, 11)
INSERT [dbo].[Events] ([Id], [Name], [ClientID], [Description], [Date], [StartTime], [EndTime], [OrganizerID], [VenueID], [Status], [EventType]) VALUES (6, N'event46', 11, N'iuigoigoi', CAST(N'2024-05-21T00:00:00.000' AS DateTime), CAST(N'10:25:31.6866667' AS Time), CAST(N'14:25:31' AS Time), NULL, 4, 8, 11)
INSERT [dbo].[Events] ([Id], [Name], [ClientID], [Description], [Date], [StartTime], [EndTime], [OrganizerID], [VenueID], [Status], [EventType]) VALUES (7, N'event 54', 9, N'', CAST(N'2024-04-27T00:00:00.000' AS DateTime), CAST(N'13:25:46.6866667' AS Time), CAST(N'17:25:46' AS Time), NULL, 4, 7, 11)
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([Id], [EventID], [ClientId], [Rating], [Description], [DateTime]) VALUES (1, 4, 9, 5, N'it was good', CAST(N'2024-05-07T06:29:40.470' AS DateTime))
INSERT [dbo].[Feedback] ([Id], [EventID], [ClientId], [Rating], [Description], [DateTime]) VALUES (2, 2, 11, 8, N'jnlknlkn', CAST(N'2024-06-15T07:11:37.403' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (2, N'1', N'5', N'34        ', N'42', N'23        ', N'Pakistan')
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (3, N'Maqam e Hayat', N'Silanwali road', N'Punjab    ', N'Sargodha', N'1234324   ', N'Pakistan')
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (4, N'Town', N'old bridge', N'shou shou ', N'Sargodha', N'12341234  ', N'China')
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (5, N'jkadgf', N'kjsgdfk', N'ggsd      ', N'karachi', N'8539845   ', N'Iran')
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (6, N'iba', N'kbsdv', N'skdvb     ', N'ksbdv', N'skvb      ', N'Pakistan')
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (7, N'bui', N'iubo', N'ioub      ', N'iiuo', N'oiub      ', N'Pakistan')
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Province], [City], [PostalCode], [Country]) VALUES (9, N'asf', N'gasd', N'punjab    ', N'asf', N'14312e12  ', N'Pakistan')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (1, N'Male                ', N'Gender                        ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (2, N'Female              ', N'Gender                        ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (3, N'Catering            ', N'VendorType                    ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (4, N'Musician            ', N'VendorType                    ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (5, N'Decore              ', N'VendorType                    ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (6, N'N/A                 ', N'Status                        ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (7, N'Approved            ', N'Status                        ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (8, N'Rejected            ', N'Status                        ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (9, N'Requested           ', N'Status                        ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (10, N'Sports              ', N'EventType                     ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (11, N'Birthday            ', N'EventType                     ')
INSERT [dbo].[Lookup] ([Id], [value], [descryption]) VALUES (12, N'Social              ', N'EventType                     ')
GO
INSERT [dbo].[Manager] ([ID], [Password], [RegistrationDate], [AdminCode]) VALUES (10, N'12341234                      ', CAST(N'2024-05-01T09:23:43.923' AS DateTime), N'123                           ')
INSERT [dbo].[Manager] ([ID], [Password], [RegistrationDate], [AdminCode]) VALUES (19, N'12341234                      ', CAST(N'2024-05-02T22:30:46.717' AS DateTime), N'1234123412341234              ')
INSERT [dbo].[Manager] ([ID], [Password], [RegistrationDate], [AdminCode]) VALUES (43, N'12341234                      ', CAST(N'2024-05-09T19:51:25.620' AS DateTime), N'maryam123                     ')
GO
INSERT [dbo].[ManagerHistory] ([ID], [Password], [RegistrationDate], [AdminCode], [UpdateDate]) VALUES (43, N'12341234  ', CAST(N'2024-05-09T19:51:25.620' AS DateTime), NULL, CAST(N'2024-05-09T19:51:25.640' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ManagerID], [Description], [EventID], [SuggestedTime], [ClientID], [DateTime]) VALUES (19, N'trjrtyjrty                                                                                          ', 6, CAST(N'2024-04-27T00:00:00.000' AS DateTime), 11, CAST(N'2024-05-06T01:42:28.020' AS DateTime))
INSERT [dbo].[Notifications] ([ManagerID], [Description], [EventID], [SuggestedTime], [ClientID], [DateTime]) VALUES (19, N'hello world                                                                                         ', 5, CAST(N'2024-04-30T00:00:00.000' AS DateTime), 36, CAST(N'2024-05-06T20:30:03.470' AS DateTime))
INSERT [dbo].[Notifications] ([ManagerID], [Description], [EventID], [SuggestedTime], [ClientID], [DateTime]) VALUES (19, N'ojqdvlabsuvhalb;n                                                                                   ', 3, CAST(N'2024-04-27T00:00:00.000' AS DateTime), 36, CAST(N'2024-05-06T21:01:47.177' AS DateTime))
INSERT [dbo].[Notifications] ([ManagerID], [Description], [EventID], [SuggestedTime], [ClientID], [DateTime]) VALUES (19, N'ytcfyvbhnjjsihuyftdxytcfu                                                                           ', 4, CAST(N'2024-04-27T00:00:00.000' AS DateTime), 9, CAST(N'2024-05-06T21:01:59.367' AS DateTime))
GO
INSERT [dbo].[Organizers] ([Id], [Password], [RegistrationDate], [Fee]) VALUES (20, N'12341234                      ', CAST(N'2024-05-02T22:34:33.810' AS DateTime), 50)
INSERT [dbo].[Organizers] ([Id], [Password], [RegistrationDate], [Fee]) VALUES (26, N'12341234                      ', CAST(N'2024-05-05T09:40:32.817' AS DateTime), 12344)
INSERT [dbo].[Organizers] ([Id], [Password], [RegistrationDate], [Fee]) VALUES (27, N'12341234                      ', CAST(N'2024-05-05T09:40:57.983' AS DateTime), 12344)
INSERT [dbo].[Organizers] ([Id], [Password], [RegistrationDate], [Fee]) VALUES (42, N'12341234                      ', CAST(N'2024-05-09T18:19:13.963' AS DateTime), 90000)
GO
INSERT [dbo].[OrganizersHistory] ([Id], [Password], [RegistrationDate], [UpdateDate], [Fee]) VALUES (42, N'12341234                      ', CAST(N'2024-05-09T18:19:13.963' AS DateTime), CAST(N'2024-05-09T18:19:51.887' AS DateTime), 20000)
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (9, NULL, NULL, NULL, N'abdullah@gmail.com', NULL, NULL, NULL, NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (10, N'Abdullah', N'Iftikhar', N'12344321123', N'AbdullahAdmin@gmail.com', CAST(N'2003-01-04T00:00:00.000' AS DateTime), 1, N'p-607 Maqam e ehayat sargodha', N'China')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (11, N'Hamza', N'Butt', N'123341234123', N'hamza@gmail.com', CAST(N'2024-06-05T00:00:00.000' AS DateTime), 1, N'sialkot', N'Iran')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (19, N'Bial', N'Chootiya', N'12341234123', N'Bilal@gmail.com', CAST(N'2024-04-09T00:00:00.000' AS DateTime), 1, N'kahore', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (20, N'Ali', N'Gujjar', N'12341234213', N'ali@gmail.com', CAST(N'2024-04-08T00:00:00.000' AS DateTime), 2, N'apne ghar', N'Iran')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (22, N'v1', N'v1', N'12341234123', N'v1@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 2, N'1v12', N'Iran')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (23, N'v2', N'v2', N'12341234123', N'v2@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'1234', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (24, N'v34', N'v3', N'12341234123', N'v3@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 2, N'Female', N'Female')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (25, N'danish', N'Bilal', N'12351234123', N'danishBilal@gmail.com', CAST(N'2024-04-01T00:00:00.000' AS DateTime), 2, N'haweli', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (26, N'Hamza', N'Ameer', N'12341234432', N'hamzaameer@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'sialkot', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (27, N'ameer', N'hamza', N'12341234432', N'ameer@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'sialkot', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (28, N'mudassir', N'ahmad', N'12341234123', N'mudassir@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (29, N'mudam', N'ahmad', N'12341234123', N'mudam@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (30, N'sir', N'ahmad', N'12341234123', N'sir@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (31, N'name1', N'ahmad', N'12341234123', N'name1@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (32, N'name1', N'headname', N'12341234123', N'headname1@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (33, N'decoName', N'headname', N'12341234123', N'deco1Name1@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (34, N'deco2Name', N'headname', N'12341234123', N'deco2Name2@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (35, N'deco3Name', N'headname3', N'12341234123', N'deco3Name3@gmail.com', CAST(N'2024-05-05T00:00:00.000' AS DateTime), 1, N'gfsjhgd', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (36, N'Hamza', N'ameerre', N'12341234123', N'hamza17@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'1234qaf', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (37, N'1', N'3', NULL, N'No Person', NULL, NULL, NULL, NULL)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (38, N'ghhgvj', N'jvkjhvlk', N'12341234123', N'hvh@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'dcwege', N'Iran')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (39, N'vugv', N'jhvkj', N'12341234123', N'yfcufyfc@gmail.com', CAST(N'2024-05-08T00:00:00.000' AS DateTime), 1, N'dcwege', N'Iran')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (40, N'hjbkb', N'lkjbkljb', N'12341234123', N'jhvkjkb@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'hb ,jnkm,', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (41, N'hjbkb', N'nicee', N'12341234123', N'jhvkjkjhkb@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'hb ,jnkm,', N'Pakistan')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (42, N'Talha', N'Khalid Malak', N'03124879563', N'talha@gmail.com', CAST(N'2024-05-09T00:00:00.000' AS DateTime), 1, N'Male', N'Male')
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality]) VALUES (43, N'Maryam', N'Mueen', N'03425364785', N'MaryamMueen@gmail.com', CAST(N'2003-02-05T00:00:00.000' AS DateTime), 2, N'Model Town Lahore', N'Pakistan')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
INSERT [dbo].[PersonHistory] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality], [UpdateDate]) VALUES (42, N'Talha', N'Khalid', N'03124879563', N'talha@gmail.com', CAST(N'2024-04-02T00:00:00.000' AS DateTime), 1, N'muhammadi colony sargodha', N'Iran', CAST(N'2024-05-09T18:19:51.870' AS DateTime))
INSERT [dbo].[PersonHistory] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality], [UpdateDate]) VALUES (43, NULL, NULL, NULL, N'MaryamMueen@gmail.com', NULL, NULL, NULL, NULL, CAST(N'2024-05-09T19:51:25.627' AS DateTime))
INSERT [dbo].[PersonHistory] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality], [UpdateDate]) VALUES (41, N'hjbkb', N'lkjbkljb', N'12341234123', N'jhvkjkjhkb@gmail.com', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 1, N'hb ,jnkm,', N'Pakistan', CAST(N'2024-05-22T10:02:35.443' AS DateTime))
INSERT [dbo].[PersonHistory] ([Id], [FirstName], [LastName], [Phone], [Email], [DateOfBirth], [Gender], [Address], [Nationality], [UpdateDate]) VALUES (42, N'Talha', N'Khalid', N'03124879563', N'talha@gmail.com', CAST(N'2024-05-09T00:00:00.000' AS DateTime), 1, N'Male', N'Male', CAST(N'2024-05-22T10:03:04.283' AS DateTime))
GO
INSERT [dbo].[Requests] ([OrganizerID], [TaskID], [RequestDate], [Description], [Status]) VALUES (20, 2, CAST(N'2024-05-06T00:23:20.137' AS DateTime), N'hvlAKVBLKaggf', 7)
INSERT [dbo].[Requests] ([OrganizerID], [TaskID], [RequestDate], [Description], [Status]) VALUES (20, 2, CAST(N'2024-06-15T07:04:52.043' AS DateTime), N'please delay the dead line', 9)
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 

INSERT [dbo].[Tasks] ([TaskID], [EventID], [Name], [Description], [Deadline], [AssignedTo], [Done], [Status]) VALUES (1, 4, N'task1', N'complete task 1, huurryy nn', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 20, 0, 1)
INSERT [dbo].[Tasks] ([TaskID], [EventID], [Name], [Description], [Deadline], [AssignedTo], [Done], [Status]) VALUES (2, 4, N'task2', N'complete task2', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 20, 0, 1)
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
INSERT [dbo].[TasksHistory] ([TaskID], [EventID], [Name], [Description], [Deadline], [AssignedTo], [Done], [UpdateDate], [Status]) VALUES (1, 4, N'task1', N'complete task 1, huurryy', CAST(N'2024-04-27T00:00:00.000' AS DateTime), 20, 0, CAST(N'2024-06-15T07:03:13.250' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1890, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1891, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1892, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1893, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1894, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1895, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1896, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1897, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1898, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1899, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1900, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1901, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1902, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1903, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1904, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1905, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1906, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1907, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1908, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1909, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1910, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1911, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1912, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1913, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1914, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1915, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1916, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1917, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1918, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1919, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1920, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1921, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1922, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1923, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1924, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1925, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1926, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1927, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1928, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1929, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1930, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1931, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1932, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1933, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1934, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1935, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1936, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1937, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1938, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1939, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1940, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1941, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1942, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1943, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1944, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1945, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1946, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1947, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1948, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1949, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1950, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1951, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1952, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1953, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1954, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1955, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1956, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1957, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1958, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1959, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1960, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1961, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1962, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1963, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1964, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1965, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1966, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1967, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1968, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1969, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1970, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1971, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1972, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1973, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1974, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1975, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1976, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1977, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1978, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1979, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1980, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1981, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1982, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1983, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1984, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1985, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1986, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1987, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1988, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
GO
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1989, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1990, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1991, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1992, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1993, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1994, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1995, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1996, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1997, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1998, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (1999, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2000, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2001, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2002, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2003, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2004, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2005, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2006, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2007, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2008, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2009, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2010, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2011, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2012, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2013, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2014, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2015, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2016, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2017, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2018, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2019, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2020, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2021, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2022, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2023, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2024, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2025, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2026, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2027, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2028, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2029, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2030, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2031, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2032, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2033, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2034, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2035, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2036, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2037, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2038, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2039, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2040, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2041, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2042, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2043, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2044, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2045, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2046, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2047, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2048, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2049, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2050, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2051, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2052, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2053, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2054, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2055, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2056, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2057, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2058, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2059, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2060, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2061, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2062, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2063, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2064, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2065, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2066, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2067, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2068, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2069, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2070, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2071, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2072, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2073, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2074, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2075, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2076, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2077, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2078, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2079, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2080, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2081, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2082, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2083, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2084, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2085, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2086, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2087, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2088, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
GO
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2089, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2090, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2091, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2092, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2093, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2094, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2095, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2096, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2097, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2098, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2099, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2100, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2101, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2102, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2103, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2104, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2105, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2106, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2107, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2108, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2109, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2110, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2111, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2112, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2113, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2114, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2115, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2116, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2117, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2118, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2119, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2120, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2121, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2122, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2123, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2124, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2125, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2126, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2127, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2128, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2129, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2130, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2131, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2132, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2133, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2134, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2135, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2136, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2137, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2138, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2139, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2140, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2141, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2142, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2143, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2144, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2145, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2146, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2147, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2148, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2149, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2150, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2151, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2152, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2153, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2154, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2155, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2156, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2157, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2158, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2159, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2160, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2161, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2162, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2163, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2164, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2165, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2166, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2167, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2168, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2169, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2170, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2171, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2172, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2173, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2174, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2175, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2176, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2177, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2178, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2179, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2180, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2181, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2182, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2183, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2184, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2185, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2186, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2187, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2188, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
GO
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2189, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2190, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2191, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2192, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2193, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2194, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2195, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2196, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2197, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2198, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2199, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2200, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2201, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2202, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2203, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2204, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2205, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2206, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2207, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2208, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2209, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2210, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2211, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2212, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2213, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2214, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2215, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2216, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2217, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2218, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2219, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2220, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2221, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2222, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2223, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2224, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2225, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2226, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2227, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2228, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2229, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2230, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2231, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2232, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2233, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2234, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2235, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2236, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2237, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2238, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2239, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2240, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2241, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2242, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2243, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2244, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2245, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2246, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2247, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2248, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2249, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2250, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2251, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2252, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2253, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2254, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2255, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2256, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2257, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2258, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2259, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2260, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2261, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2262, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2263, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2264, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2265, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2266, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2267, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2268, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2269, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2270, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2271, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2272, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2273, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2274, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2275, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2276, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2277, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2278, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2279, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2280, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2281, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2282, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2283, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2284, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2285, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2286, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2287, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2288, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
GO
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2289, 4, NULL, 9, 1, CAST(N'2024-05-09T09:06:36.360' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2290, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2291, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2292, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2293, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2294, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2295, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2296, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2297, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2298, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2299, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2300, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2301, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2302, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2303, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2304, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2305, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2306, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2307, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2308, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2309, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2310, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2311, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2312, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2313, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2314, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2315, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2316, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2317, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2318, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2319, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2320, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2321, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2322, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2323, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2324, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2325, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2326, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2327, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.400' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2328, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2329, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2330, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2331, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2332, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2333, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2334, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2335, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2336, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2337, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2338, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2339, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2340, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2341, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2342, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2343, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2344, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2345, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2346, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2347, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2348, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2349, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2350, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2351, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2352, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2353, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2354, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2355, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2356, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2357, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2358, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2359, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2360, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2361, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2362, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2363, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2364, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2365, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2366, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2367, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2368, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2369, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2370, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2371, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2372, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2373, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2374, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2375, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2376, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2377, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2378, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2379, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2380, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2381, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2382, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2383, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2384, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2385, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2386, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.403' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2387, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2388, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
GO
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2389, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2390, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2391, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2392, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2393, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2394, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2395, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2396, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2397, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2398, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2399, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2400, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2401, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2402, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2403, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2404, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2405, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2406, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2407, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2408, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2409, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2410, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2411, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
INSERT [dbo].[Tickets] ([TicketID], [EventID], [AttendeeID], [ClientID], [status], [FIllFormDate], [Attended]) VALUES (2412, 7, NULL, 9, 1, CAST(N'2024-06-15T07:05:52.407' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (25, CAST(N'2024-05-03T01:37:06.830' AS DateTime), 1234, 0, 4, 20, 3)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (28, CAST(N'2024-05-05T09:41:42.593' AS DateTime), 758864, 0, 3, 20, 4)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (29, CAST(N'2024-05-05T09:42:02.107' AS DateTime), 758864, 1, 2, 27, 4)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (30, CAST(N'2024-05-05T09:42:18.397' AS DateTime), 758864, 1, 3, 42, 4)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (31, CAST(N'2024-05-05T09:42:36.987' AS DateTime), 758864, 1, 3, 42, 3)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (32, CAST(N'2024-05-05T09:42:51.830' AS DateTime), 758864, 1, 2, 27, 3)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (33, CAST(N'2024-05-05T09:43:29.033' AS DateTime), 758864, 1, 4, 20, 5)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (34, CAST(N'2024-05-05T09:43:39.363' AS DateTime), 758864, 1, 2, 27, 5)
INSERT [dbo].[Vendors] ([Id], [RegistrationDate], [Fee], [isActive], [EventId], [OrganizerID], [VendorType]) VALUES (35, CAST(N'2024-05-05T09:43:51.747' AS DateTime), 758864, 1, 3, 42, 5)
GO
SET IDENTITY_INSERT [dbo].[Venue] ON 

INSERT [dbo].[Venue] ([Id], [Name], [Status], [LocationId], [PricePerPerson], [Capacity]) VALUES (1, N'venuee1', 1, 2, CAST(122.00 AS Decimal(10, 2)), 1200)
INSERT [dbo].[Venue] ([Id], [Name], [Status], [LocationId], [PricePerPerson], [Capacity]) VALUES (2, N'CrownPalace', 1, 3, CAST(750.00 AS Decimal(10, 2)), 400)
INSERT [dbo].[Venue] ([Id], [Name], [Status], [LocationId], [PricePerPerson], [Capacity]) VALUES (3, N'Grace II Hall', 1, 4, CAST(700.00 AS Decimal(10, 2)), 400)
INSERT [dbo].[Venue] ([Id], [Name], [Status], [LocationId], [PricePerPerson], [Capacity]) VALUES (4, N'venue2', 1, 5, CAST(8656.00 AS Decimal(10, 2)), 689)
INSERT [dbo].[Venue] ([Id], [Name], [Status], [LocationId], [PricePerPerson], [Capacity]) VALUES (5, N'venue6', 1, 6, CAST(778.00 AS Decimal(10, 2)), 777)
SET IDENTITY_INSERT [dbo].[Venue] OFF
GO
INSERT [dbo].[VenueHistory] ([Id], [Name], [PricePerPerson], [Capacity], [UpdateDate]) VALUES (1, N'v1', CAST(122.00 AS Decimal(10, 2)), 1200, CAST(N'2024-05-09T19:30:01.123' AS DateTime))
INSERT [dbo].[VenueHistory] ([Id], [Name], [PricePerPerson], [Capacity], [UpdateDate]) VALUES (5, N'venue3', CAST(778.00 AS Decimal(10, 2)), 898, CAST(N'2024-06-15T07:02:00.900' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Events]    Script Date: 14/07/2024 10:08:08 am ******/
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [IX_Events] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Feedback_Client_Key]    Script Date: 14/07/2024 10:08:08 am ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [Feedback_Client_Key] UNIQUE NONCLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Feedback]    Script Date: 14/07/2024 10:08:08 am ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Feedback] ON [dbo].[Feedback]
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ManagerHistory]    Script Date: 14/07/2024 10:08:09 am ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ManagerHistory] ON [dbo].[ManagerHistory]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [email_PersonKey]    Script Date: 14/07/2024 10:08:09 am ******/
CREATE NONCLUSTERED INDEX [email_PersonKey] ON [dbo].[Person]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [venuueLocationID]    Script Date: 14/07/2024 10:08:09 am ******/
ALTER TABLE [dbo].[Venue] ADD  CONSTRAINT [venuueLocationID] UNIQUE NONCLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendees] ADD  CONSTRAINT [DF_Attendees_ArrivalTime]  DEFAULT (getdate()) FOR [ArrivalTime]
GO
ALTER TABLE [dbo].[Attendees] ADD  CONSTRAINT [DF_Attendees_Attended]  DEFAULT ((0)) FOR [Attended]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF__Client__Registra__4F7CD00D]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[ClientHistory] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Contracts] ADD  CONSTRAINT [DF_Contracts_Payed]  DEFAULT ((0)) FOR [Payed]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_Events_Status]  DEFAULT ((6)) FOR [Status]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Manager] ADD  CONSTRAINT [DF_Manager_RegistratioDate]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Notifications_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[Organizers] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[OrganizersHistory] ADD  CONSTRAINT [DF_OrganizersHistory_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Email]  DEFAULT ('Attendee') FOR [Email]
GO
ALTER TABLE [dbo].[PersonHistory] ADD  CONSTRAINT [DF__PersonHis__Updat__22751F6C]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Requests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Requests] ADD  CONSTRAINT [DF_Requests_Status]  DEFAULT ((6)) FOR [Status]
GO
ALTER TABLE [dbo].[Tasks] ADD  CONSTRAINT [DF_Tasks_Done]  DEFAULT ((0)) FOR [Done]
GO
ALTER TABLE [dbo].[TasksHistory] ADD  CONSTRAINT [DF_TasksHistory_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_FIllFormDate]  DEFAULT (getdate()) FOR [FIllFormDate]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_Attended]  DEFAULT ((0)) FOR [Attended]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF__Vendors__Registr__5441852A]  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[VendorsHistory] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Venue] ADD  CONSTRAINT [DF_Venue_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[VenueHistory] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Attendees]  WITH CHECK ADD  CONSTRAINT [FK_EventId_Attendee] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Attendees] CHECK CONSTRAINT [FK_EventId_Attendee]
GO
ALTER TABLE [dbo].[Attendees]  WITH CHECK ADD  CONSTRAINT [FK_Id_Attendee] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Attendees] CHECK CONSTRAINT [FK_Id_Attendee]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Id_Client] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Id_Client]
GO
ALTER TABLE [dbo].[ClientHistory]  WITH CHECK ADD  CONSTRAINT [fk_Client_History] FOREIGN KEY([Id])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ClientHistory] CHECK CONSTRAINT [fk_Client_History]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [fk_EventID_contracts] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [fk_EventID_contracts]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [fk_OrganizerID_contracts] FOREIGN KEY([OrganizerID])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [fk_OrganizerID_contracts]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Client]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Lookup] FOREIGN KEY([Status])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Lookup]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [fk_OrganizerID] FOREIGN KEY([OrganizerID])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [fk_OrganizerID]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [fk_Type_Vendors] FOREIGN KEY([EventType])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [fk_Type_Vendors]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [fk_VenueID] FOREIGN KEY([VenueID])
REFERENCES [dbo].[Venue] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [fk_VenueID]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [fk_EventID_feedback] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [fk_EventID_feedback]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Client]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_Person] FOREIGN KEY([ID])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_Person]
GO
ALTER TABLE [dbo].[ManagerHistory]  WITH CHECK ADD  CONSTRAINT [FK_ManagerHistory_Manager] FOREIGN KEY([ID])
REFERENCES [dbo].[Manager] ([ID])
GO
ALTER TABLE [dbo].[ManagerHistory] CHECK CONSTRAINT [FK_ManagerHistory_Manager]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Client]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Events] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Events]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ID])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Manager]
GO
ALTER TABLE [dbo].[Organizers]  WITH CHECK ADD  CONSTRAINT [FK_Organizers_Person] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Organizers] CHECK CONSTRAINT [FK_Organizers_Person]
GO
ALTER TABLE [dbo].[OrganizersHistory]  WITH CHECK ADD  CONSTRAINT [fk_Organizers_History] FOREIGN KEY([Id])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[OrganizersHistory] CHECK CONSTRAINT [fk_Organizers_History]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Gender]
GO
ALTER TABLE [dbo].[PersonHistory]  WITH CHECK ADD  CONSTRAINT [fk_Person_History] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[PersonHistory] CHECK CONSTRAINT [fk_Person_History]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [fk_Lookup_Request] FOREIGN KEY([Status])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [fk_Lookup_Request]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [fk_Organizer_Request] FOREIGN KEY([OrganizerID])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [fk_Organizer_Request]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [fk_Task_Request] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [fk_Task_Request]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [fk_AssignedTo] FOREIGN KEY([AssignedTo])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [fk_AssignedTo]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [fk_EventID_task] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [fk_EventID_task]
GO
ALTER TABLE [dbo].[TasksHistory]  WITH CHECK ADD  CONSTRAINT [fk_Tasks_History] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Tasks] ([TaskID])
GO
ALTER TABLE [dbo].[TasksHistory] CHECK CONSTRAINT [fk_Tasks_History]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_AttendeeID_ticket] FOREIGN KEY([AttendeeID])
REFERENCES [dbo].[Attendees] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_AttendeeID_ticket]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_EventID_ticket] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_EventID_ticket]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Client]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_EventIdVendors] FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([Id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_EventIdVendors]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [fk_TypeVendors] FOREIGN KEY([VendorType])
REFERENCES [dbo].[Lookup] ([Id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [fk_TypeVendors]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [fk_VendorId] FOREIGN KEY([Id])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [fk_VendorId]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [fk_VendorOrganizerId] FOREIGN KEY([OrganizerID])
REFERENCES [dbo].[Organizers] ([Id])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [fk_VendorOrganizerId]
GO
ALTER TABLE [dbo].[VendorsHistory]  WITH CHECK ADD  CONSTRAINT [fk_Vendors_History] FOREIGN KEY([Id])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[VendorsHistory] CHECK CONSTRAINT [fk_Vendors_History]
GO
ALTER TABLE [dbo].[Venue]  WITH CHECK ADD  CONSTRAINT [FK_Venue_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[Venue] CHECK CONSTRAINT [FK_Venue_Locations]
GO
ALTER TABLE [dbo].[VenueHistory]  WITH CHECK ADD  CONSTRAINT [fk_Venue_History] FOREIGN KEY([Id])
REFERENCES [dbo].[Venue] ([Id])
GO
ALTER TABLE [dbo].[VenueHistory] CHECK CONSTRAINT [fk_Venue_History]
GO
/****** Object:  StoredProcedure [dbo].[AddAttendee]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddAttendee]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Contact NVARCHAR(50),
    @Email NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NVARCHAR(50),
    @Address NVARCHAR(100),
    @Nationality NVARCHAR(50),
    @eID INT,
    @tID INT
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Person table
        INSERT INTO Person (FirstName, LastName, Phone, Email, DateOfBirth, Gender, Address, Nationality) 
        VALUES (@FirstName, @LastName, @Contact, @Email, @DateOfBirth, 
                (SELECT Lookup.Id FROM Lookup WHERE Value = @Gender), @Address, @Nationality);

        -- Insert into Attendees table
        INSERT INTO Attendees (Id, EventID, Attended) 
        VALUES ((SELECT Id FROM Person WHERE Email = @Email), @eID, 1);

        -- Update Tickets table
        UPDATE Tickets 
        SET AttendeeID = (SELECT Id FROM Person WHERE Email = @Email), Attended = 1 
        WHERE TicketID = @tID;

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddManager]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddManager]
    @email NVARCHAR(100),
    @pass NVARCHAR(100),
    @fName NVARCHAR(100),
    @lName NVARCHAR(100),
    @phone NVARCHAR(20),
    @DoB DATE,
    @Gender NVARCHAR(50),
    @address NVARCHAR(100),
    @nationality NVARCHAR(100),
    @adminCode NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Person table
        INSERT INTO Person (Email) 
        VALUES (@email);

        -- Insert into Manager table
        INSERT INTO Manager (Id, Password) 
        VALUES ((SELECT Id FROM Person WHERE Email = @email), @pass);

        -- Update Person table
        UPDATE Person 
        SET FirstName = @fName, 
            LastName = @lName, 
            Phone = @phone, 
            DateOfBirth = @DoB, 
            Gender = (SELECT Lookup.Id FROM Lookup WHERE Value = @Gender), 
            Address = @address, 
            Nationality = @nationality 
        WHERE Email = @email;

        -- Update Manager table
        UPDATE Manager 
        SET AdminCode = @adminCode 
        WHERE Id = (SELECT Id FROM Person WHERE Email = @email);

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[AddOrganizer]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOrganizer]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Contact NVARCHAR(50),
    @Email NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NVARCHAR(50),
    @Address NVARCHAR(100),
    @Country NVARCHAR(50),
    @Pass NVARCHAR(50),
    @Fee DECIMAL
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Person table
        INSERT INTO Person 
        VALUES (@FirstName, @LastName, @Contact, @Email, @DateOfBirth, 
                (SELECT Id FROM Lookup WHERE Value = @Gender), @Address, @Country);
        
        -- Insert into Organizers table
        INSERT INTO Organizers (Id, Password, Fee) 
        VALUES ((SELECT Id FROM Person WHERE Email = @Email), @Pass, @Fee);
        
        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddVendor]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddVendor]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Contact NVARCHAR(50),
    @Email NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NVARCHAR(50),
    @Address NVARCHAR(100),
    @Country NVARCHAR(50),
    @Fee DECIMAL,
    @Type NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Person table
        INSERT INTO Person (FirstName, LastName, Phone, Email, DateOfBirth, Gender, Address, Nationality) 
        VALUES (@FirstName, @LastName, @Contact, @Email, @DateOfBirth, 
                (SELECT Lookup.Id FROM Lookup WHERE Value = @Gender), @Address, @Country);

        -- Insert into Vendors table
        INSERT INTO Vendors (Id, Fee, VendorType, isActive) 
        VALUES ((SELECT Id FROM Person WHERE Email = @Email), 
                @Fee, 
                (SELECT Lookup.Id FROM Lookup WHERE Value = @Type), 
                1);

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddVenue]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddVenue]
    @lName NVARCHAR(100),
    @address NVARCHAR(100),
    @province NVARCHAR(100),
    @city NVARCHAR(100),
    @postal NVARCHAR(20),
    @country NVARCHAR(100),
    @vName NVARCHAR(100),
    @price DECIMAL,
    @capacity INT
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Locations table
        INSERT INTO Locations (Name, Address, Province, City, PostalCode, Country) 
        VALUES (@lName, @address, @province, @city, @postal, @country);

        -- Insert into Venue table
        INSERT INTO Venue (Name, Status, LocationId, PricePerPerson, Capacity) 
        VALUES (@vName, 1, (SELECT MAX(Id) FROM Locations), @price, @capacity);

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[str_AddClient]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[str_AddClient]
    @email NVARCHAR(100),
    @pass NVARCHAR(100),
    @fName NVARCHAR(100),
    @lName NVARCHAR(100),
    @phone NVARCHAR(20),
    @DoB DATE,
    @Gender NVARCHAR(50),
    @address NVARCHAR(100),
    @nationality NVARCHAR(100),
    @credit NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Person table
        INSERT INTO Person (Email) 
        VALUES (@email);

        -- Insert into Client table
        INSERT INTO Client (Id, Password) 
        VALUES ((SELECT Id FROM Person WHERE Email = @email), @pass);

        -- Update Person table
        UPDATE Person 
        SET FirstName = @fName, 
            LastName = @lName, 
            Phone = @phone, 
            DateOfBirth = @DoB, 
            Gender = (SELECT Lookup.Id FROM Lookup WHERE Value = @Gender), 
            Address = @address, 
            Nationality = @nationality 
        WHERE Email = @email;

        -- Update Client table
        UPDATE Client 
        SET CreditCardNo = @credit 
        WHERE Id = (SELECT Id FROM Person WHERE Email = @email);

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[str_BookEvent]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[str_BookEvent]
    @name NVARCHAR(100),
    @clientID INT,
    @description NVARCHAR(MAX),
    @date DATE,
    @StartTime TIME,
    @EndTime TIME,
    @vName NVARCHAR(100),
    @city NVARCHAR(100),
    @country NVARCHAR(100),
    @postalCode NVARCHAR(20),
    @eventType NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Insert into Events table
        INSERT INTO Events (Name, ClientID, Description, Date, StartTime, EndTime, VenueID, Status, EventType) 
        VALUES (@name, @clientID, @description, @date, @StartTime, @EndTime, 
                (SELECT v.Id 
                 FROM Venue v 
                 JOIN Locations l ON v.LocationId = l.Id 
                 WHERE v.Name = @vName AND l.City = @city AND l.Country = @country AND l.PostalCode = @postalCode), 
                (SELECT Id FROM Lookup WHERE Value = 'Requested'), 
                (SELECT Id FROM Lookup WHERE Value = @eventType));

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[str_GenerateTickets]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[str_GenerateTickets]
    @count INT,
    @EventID INT,
    @cName NVARCHAR(100),
    @oID INT
AS
BEGIN
    BEGIN TRANSACTION;
    
    DECLARE @counter INT = 1;

    BEGIN TRY
        WHILE @counter <= @count
        BEGIN
            -- Insert into Tickets table
            INSERT INTO Tickets (EventID, ClientID) 
            VALUES (@EventID, (SELECT ID FROM Person WHERE Email = @cName));

            SET @counter = @counter + 1;
        END;

        -- Insert into Contracts table
        INSERT INTO Contracts (OrganizerID, EventID, ContractAmount, EndDate) 
        VALUES (@oID, @eventID, 
                ((SELECT PricePerPerson FROM Events e JOIN Venue v ON e.VenueID = v.ID WHERE e.ID = @eventID) * @count) + 
                (SELECT Fee FROM Organizers WHERE Id = @oID) + 
                (SELECT SUM(v.Fee) FROM Vendors v JOIN Organizers o ON v.OrganizerID = o.ID WHERE v.EventID = @EventID), 
                (SELECT Date FROM Events WHERE Id = @eventID));

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[str_Organizers]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[str_Organizers]
AS
BEGIN
    SELECT *
    FROM Organizers o
    JOIN Person p ON o.Id = p.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[str_Vendors]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[str_Vendors]
AS
BEGIN
    SELECT *
    FROM Vendors o
    JOIN Person p ON o.Id = p.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganizer]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrganizer]
    @Id INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Contact NVARCHAR(50),
    @Email NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NVARCHAR(50),
    @Address NVARCHAR(100),
    @Country NVARCHAR(50),
    @Pass NVARCHAR(50),
    @Fee DECIMAL
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Update Person table
        UPDATE Person 
        SET FirstName = @FirstName, 
            LastName = @LastName, 
            Phone = @Contact, 
            Email = @Email, 
            DateOfBirth = @DateOfBirth, 
            Gender = (SELECT Id FROM Lookup WHERE Value = @Gender), 
            Address = @Address, 
            Nationality = @Country 
        WHERE Id = @Id;

        -- Update Organizers table
        UPDATE Organizers 
        SET Password = @Pass, 
            Fee = @Fee 
        WHERE Id = @Id;

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateVendor]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateVendor]
    @Id INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Contact NVARCHAR(50),
    @Email NVARCHAR(100),
    @DateOfBirth DATE,
    @Gender NVARCHAR(50),
    @Address NVARCHAR(100),
    @Country NVARCHAR(50),
    @Fee DECIMAL,
    @Type NVARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Update Person table
        UPDATE Person 
        SET FirstName = @FirstName, 
            LastName = @LastName, 
            Phone = @Contact, 
            Email = @Email, 
            DateOfBirth = @DateOfBirth, 
            Gender = (SELECT Id FROM Lookup WHERE Value = @Gender), 
            Address = @Address, 
            Nationality = @Country 
        WHERE Id = @Id;

        -- Update Vendors table
        UPDATE Vendors 
        SET Fee = @Fee, 
            VendorType = (SELECT Id FROM Lookup WHERE Value = @Type) 
        WHERE Id = @Id;

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateVenue]    Script Date: 14/07/2024 10:08:09 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateVenue]
    @Id INT,
    @vName NVARCHAR(100),
    @capacity INT,
    @price DECIMAL
AS
BEGIN
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Update Venue table
        UPDATE Venue 
        SET Name = @vName, 
            Capacity = @capacity, 
            PricePerPerson = @price 
        WHERE Id = @Id;

        -- Commit the transaction if everything went well
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction if an error occurred
        ROLLBACK TRANSACTION;
        -- Optionally, you can handle or log the error here
    END CATCH;
END;
GO
USE [master]
GO
ALTER DATABASE [EMS__Final] SET  READ_WRITE 
GO
