USE [UserAppManagement_Test]
GO
/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Membership_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Membership_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Membership_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Personalization_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Personalization_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Personalization_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Profile_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Profile_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Profile_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Roles_BasicAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Roles_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_Roles_ReportingAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE ROLE [aspnet_WebEvent_FullAccess] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [aspnet_Membership_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Membership_BasicAccess] AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
/****** Object:  Schema [aspnet_Membership_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Membership_FullAccess] AUTHORIZATION [aspnet_Membership_FullAccess]
GO
/****** Object:  Schema [aspnet_Membership_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Membership_ReportingAccess] AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Personalization_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Personalization_BasicAccess] AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
/****** Object:  Schema [aspnet_Personalization_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Personalization_FullAccess] AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
/****** Object:  Schema [aspnet_Personalization_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Personalization_ReportingAccess] AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Profile_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Profile_BasicAccess] AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
/****** Object:  Schema [aspnet_Profile_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Profile_FullAccess] AUTHORIZATION [aspnet_Profile_FullAccess]
GO
/****** Object:  Schema [aspnet_Profile_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Profile_ReportingAccess] AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
/****** Object:  Schema [aspnet_Roles_BasicAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Roles_BasicAccess] AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
/****** Object:  Schema [aspnet_Roles_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Roles_FullAccess] AUTHORIZATION [aspnet_Roles_FullAccess]
GO
/****** Object:  Schema [aspnet_Roles_ReportingAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_Roles_ReportingAccess] AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
/****** Object:  Schema [aspnet_WebEvent_FullAccess]    Script Date: 08/30/2019 11:09:57 ******/
CREATE SCHEMA [aspnet_WebEvent_FullAccess] AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_A__C93A4C98014935CB] PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__aspnet_A__17477DE40425A276] UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__aspnet_A__3091033107020F21] UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCAppUserManagement', N'bidcappusermanagement', N'54784671-01fa-4d6e-946a-8853644cc611', N'BIDC Application User Management System')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCAutoFT', N'bidcautoft', N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'BIDC Auto Funds Transfer System')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCCreditContract', N'bidccreditcontract', N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'Bidc credit contract')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCDocument', N'bidcdocument', N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'bidc document')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCPOSSettlement', N'bidcpossettlement', N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'BIDC POS Settlement')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCReportCenter', N'BIDCReportCenter', N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'BIDCReportCenter')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCVisaRefund', N'bidcvisarefund', N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'BIDC Visa Refund')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'BIDCVisaSettlement', N'bidcvisasettlement', N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'BIDC process Settlement file from VISA')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'FTPApplication', N'ftpapplication', N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'FTP Application')
INSERT [dbo].[aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'SwtBinMaintenance', N'swtbinmaintenance', N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'Switch Bin Maintenance')
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
/****** Object:  Table [dbo].[Departments]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [varchar](50) NOT NULL,
	[DepartmentName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'AD', N'Administration')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'BD', N'Bad Debit Solving')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'CD', N'Card Department')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'CM', N'Credit Management')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'CR', N'Customer Relation')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'CRI', N'Individual Customer Relation')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'CS', N'Customer Services')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'FA', N'Finance & Accounting')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'GP', N'General President')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'HR', N'Human Resource')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'IA', N'Internal Audit')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'IP', N'International Payment')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'IT', N'Information Technology')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'PL', N'Planning')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'RM', N'Risk Management')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (N'SS', N'Securities Services')
/****** Object:  Table [dbo].[Branches]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchId] [varchar](15) NOT NULL,
	[BranchName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'VN0010801', N'Ho Chi Minh')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'VN0010802', N'Ha Noi')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010001', N'Head Office')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010901', N'PhnomPenh')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010902', N'Siem Riep')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010903', N'KampongCham')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010904', N'Daun Penh')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010905', N'Mean Chey')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010906', N'Steung Mean Chey')
INSERT [dbo].[Branches] ([BranchId], [BranchName]) VALUES (N'KH0010907', N'Toul Kork')
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
GO
/****** Object:  StoredProcedure [dbo].[my_Applications_CreateApplication]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[my_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @Description		  nvarchar(1000),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName, [Description])
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName), @Description)
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK__aspnet_U__1788CC4D0BC6C43E] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'4971e39d-5b8d-4a13-ab55-e30b633ad121', N'anh.bn', N'anh.bn', NULL, 0, CAST(0x0000A63200F7CE33 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'67f8e0c4-5288-4067-869a-e3bd2aa07af5', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A62D006A59DB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'1688b8d3-6c13-4ce7-8e97-a0e17ab7bb8f', N'bopha.l', N'bopha.l', NULL, 0, CAST(0x0000A63201026565 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'3aa43fe4-51fb-490c-bb5e-08e6ee299b20', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009CA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'96033a3e-da39-4211-b142-fb4cc29f47d6', N'chien.nx', N'chien.nx', NULL, 0, CAST(0x0000A63200F88AD1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'026e5ff4-a0ba-4845-9440-388b3603bf14', N'co.dv', N'co.dv', NULL, 0, CAST(0x0000A642001C8B3D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'62c46077-f89f-494c-af8e-3c80b1ea0eea', N'cuong.nm', N'cuong.nm', NULL, 0, CAST(0x0000A632010304FD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'44498a54-bac7-4291-aa4e-d6ca442ce649', N'dung.nh', N'dung.nh', NULL, 0, CAST(0x0000A63200FB5313 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'8ca4291d-29ca-4aac-bfa9-6a79469e0b2b', N'dung.nx', N'dung.nx', NULL, 0, CAST(0x0000A63200F9DFCA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'66973730-a7e5-4d16-8b4f-1b22e8a2c845', N'dung.p', N'dung.p', NULL, 0, CAST(0x0000A63200F8BF92 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'91b8b6c1-09c2-4f88-89c5-4471bc881aed', N'giang.tl', N'giang.tl', NULL, 0, CAST(0x0000A6010035C0DF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'9db4e92a-5a8c-4c25-8c1e-af60eed30ad8', N'hai.lv', N'hai.lv', NULL, 0, CAST(0x0000A63200FDA74F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'f53e65e0-c370-43a5-a9ee-ed8835fbfd40', N'hai.vn', N'hai.vn', NULL, 0, CAST(0x0000A63200FE1EE2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'4b5c24d7-e6b3-47ba-819b-5a8edcecccc6', N'hamtn', N'hamtn', NULL, 0, CAST(0x0000A6410096F011 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'4531cbbd-97ea-4885-90f0-b36ee4780e8f', N'hanh.ttm', N'hanh.ttm', NULL, 0, CAST(0x0000A5F00045AA51 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'a90d59dd-a6cf-48df-8ea9-65d878262ac9', N'hieu.bn', N'hieu.bn', NULL, 0, CAST(0x0000A63201021634 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'b7922c03-2a07-4914-9e76-4c603feeb099', N'hieu.tb', N'hieu.tb', NULL, 0, CAST(0x0000A64100972C97 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'f4c46a56-9028-43c3-836b-53a3e902ce2e', N'hong.km', N'hong.km', NULL, 0, CAST(0x0000A6320104970F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'c13e58e7-3bb4-405d-bbb6-f899ad4bf9a6', N'hung.nq', N'hung.nq', NULL, 0, CAST(0x0000A6010034E1FB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'aad8abd9-94f3-45f0-972c-24be811a8035', N'hungdv', N'hungdv', NULL, 0, CAST(0x0000A64100978D0A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'6cd920f4-c856-46ec-a650-667c513b6f45', N'huy.lq', N'huy.lq', NULL, 0, CAST(0x0000A63201050485 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'3fda72f0-694a-46ca-ae4d-9200ec17d979', N'kien.lh', N'kien.lh', NULL, 0, CAST(0x0000A63200FA30CB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'2ebdc96d-aa72-45e5-bd4c-39b8504d4fe3', N'kimhouy.c', N'kimhouy.c', NULL, 0, CAST(0x0000A7AF008E6111 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'3eed512f-9047-4087-b000-d1e1fa33584c', N'phong.ch', N'phong.ch', NULL, 0, CAST(0x0000A6320103BDCF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'1a0d89e6-7b57-4248-a455-aa43c4076998', N'phuong.th', N'phuong.th', NULL, 0, CAST(0x0000A63200FAC55C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'4f44e635-5c74-4818-ba63-361660d4c47b', N'tai.pm', N'tai.pm', NULL, 0, CAST(0x0000A63200FCD8F5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'126bf670-b2ae-4bb0-9e1f-98d9629d3a9f', N'tan.tm', N'tan.tm', NULL, 0, CAST(0x0000A63200FD0E6E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'a88dcb46-b2e0-48d3-9a78-885b7f9e92e0', N'thanh.nt', N'thanh.nt', NULL, 0, CAST(0x0000A63200FE6F4E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'ea37f96e-2666-4193-94d7-32b5ad7665c0', N'THEAN.PM', N'thean.pm', NULL, 0, CAST(0x0000A64A00723564 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'a25f62cb-b313-47ec-b736-b03e22372793', N'trung.ln', N'trung.ln', NULL, 0, CAST(0x0000A641009818B6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'7bf9ef7a-8988-4e52-836e-9355e0a388e2', N'tuan.pd', N'tuan.pd', NULL, 0, CAST(0x0000A6320105701F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'e3e6f021-49dd-4b88-b7bd-5aeb65a5c0d2', N'tuannq', N'tuannq', NULL, 0, CAST(0x0000A64200176291 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'44e44377-e30a-4488-9ad0-adc0d318eced', N'an.ts', N'an.ts', NULL, 0, CAST(0x0000A77D0090E58C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'1ee99abb-4244-4b6e-ac69-b8ac3ba6a9fe', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A43C002DBB4A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'adc470a1-c84b-46f6-aaaa-b69935a2520c', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000A906007E8512 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'c4d7a4f0-5adb-43b9-ad10-0bf2cb4bc520', N'binh.lx01', N'binh.lx01', NULL, 0, CAST(0x0000A92200893987 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'b3c2e2c8-34a0-4b15-8108-a5c22470f2e1', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009D5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'bb262e8e-0609-49a2-bd05-dfa84a2ce2f4', N'cuong.tq', N'cuong.tq', NULL, 0, CAST(0x0000A6E2008237F0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'501799e5-5503-485c-8b3a-be9ce8c47850', N'dung.p', N'dung.p', NULL, 0, CAST(0x0000A5B000717350 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'ad557f56-902e-4371-b4ac-d530e992b5e5', N'inpay01', N'inpay01', NULL, 0, CAST(0x0000A2AE00C95848 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'4fc84c54-f882-449e-90fa-3aaf3e1bc36b', N'keochenda.l', N'keochenda.l', NULL, 0, CAST(0x0000A36A00436DA8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'e7e64b62-9a90-4a56-9822-95809717e720', N'lequocanh', N'lequocanh', NULL, 0, CAST(0x0000A36A00440F74 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'6d878e31-c789-41df-a712-5dee246b768b', N'lyvisal.a', N'lyvisal.a', NULL, 0, CAST(0x0000A5FD0020DA46 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'3dc7c4c4-4de1-4b8e-95f2-20badd9dbc9b', N'quocdp', N'quocdp', NULL, 0, CAST(0x0000A2BC0021C67A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'e289b450-1641-4422-893d-966fbb68e9a7', N'rath.st', N'rath.st', NULL, 0, CAST(0x0000A77D00919CBE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'18f34105-6e91-4c1e-9fc8-895de9c1c241', N'RATPHEA.P', N'ratphea.p', NULL, 0, CAST(0x0000A2DF008787CB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'a62f3a41-d9b8-4cb9-97db-9d2411144383', N'sarak.h', N'sarak.h', NULL, 0, CAST(0x0000A906003CD382 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'77b57597-5192-4096-88d2-8c2f390dfa7d', N'Seavlang.l', N'seavlang.l', NULL, 0, CAST(0x0000A5620015B358 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'5177ec72-b4ee-4161-a0ca-4f6c55b6731f', N'sidona.n', N'sidona.n', NULL, 0, CAST(0x0000A86A002DD64F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'cc36635f-b66c-47ef-9a08-07d9f3f3a2a5', N'Test1', N'test1', NULL, 0, CAST(0x0000AA5D0080C24A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'be74f38d-ab67-495b-b50d-b576245fb6ef', N'Test2', N'test2', NULL, 0, CAST(0x0000AA5D0080CBA4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'bf7b4003-db30-47ac-998e-4e7808ea718b', N'testkh', N'testkh', NULL, 0, CAST(0x0000A2A900DE5431 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'25688a09-31c9-454a-9d7f-f56c86b314a0', N'testkh1', N'testkh1', NULL, 0, CAST(0x0000A3EE0024AD55 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'125f007a-6836-4ebe-94b3-f47803eb8fd9', N'VANNAK.P', N'vannak.p', NULL, 0, CAST(0x0000A2DF0088076D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'5e5b029f-73f3-46b7-8a06-0efb1be88ecb', N'an.ts', N'an.ts', NULL, 0, CAST(0x0000A77D0090E56C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'5db49cbd-3d94-4fae-b80c-8c46349465a7', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A5BA002BB362 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'e5c2498b-baa9-4d55-92bb-b7d709a25448', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000A906007E850E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'06c7822f-90ba-4e11-803c-cccc7e6dff35', N'binh.lx01', N'binh.lx01', NULL, 0, CAST(0x0000A92200893980 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'731d733b-7f65-4b54-b867-e26e0fe90f39', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009CF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'8c3dbe26-385c-4939-8ea9-8c0f99d96d6b', N'cuong.tq', N'cuong.tq', NULL, 0, CAST(0x0000A6E2008237D6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'558b43f7-bb69-48b4-b2b3-e6548fc203a5', N'dung.p', N'dung.p', NULL, 0, CAST(0x0000A5BA002BCCDD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'16b461b5-5abc-4704-81e8-e52501f6ee21', N'keochenda.l', N'keochenda.l', NULL, 0, CAST(0x0000A5DF006D52DD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'd584b0fb-b265-4fe2-a79d-a55f87e09d57', N'lequocanh', N'lequocanh', NULL, 0, CAST(0x0000A5BA002CDB45 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'd26c5d36-e47c-4b9f-884f-664fd83e3309', N'lyvisal.a', N'lyvisal.a', NULL, 0, CAST(0x0000A5FD0020DA28 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'622efecc-9a72-4216-97e1-c314fadf1e60', N'rath.st', N'rath.st', NULL, 0, CAST(0x0000A77D00919CBB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'35266aca-eee5-4934-8f96-a52e5c8ef37c', N'sarak.h', N'sarak.h', NULL, 0, CAST(0x0000A929003536D7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'8dbc90a0-0e64-4d14-9025-f7e142a21ce7', N'Seavlang.l', N'seavlang.l', NULL, 0, CAST(0x0000A5BA002BFBB0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'b449c4e5-66af-4d12-938e-bb9da4f9fcfb', N'sidona.n', N'sidona.n', NULL, 0, CAST(0x0000A86A002DD63D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'8b06572f-99fe-42c8-acaa-8fdfd8862ede', N'Test1', N'test1', NULL, 0, CAST(0x0000AA5D007ED060 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'9460b02e-20bf-4ad0-a381-f3138622a40d', N'Test2', N'test2', NULL, 0, CAST(0x0000AA5D007F1506 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'68d53fec-be15-4c0d-b3d8-333ca583627a', N'VANNAK.P', N'vannak.p', NULL, 0, CAST(0x0000A5BA002C1528 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'88a49e65-ede7-4404-8300-d5a87ef59ad7', N'an.vth', N'an.vth', NULL, 0, CAST(0x0000A865003B4F22 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'31513e38-27c0-41df-ba53-3a0125597dba', N'anh.bn', N'anh.bn', NULL, 0, CAST(0x0000A85D0037EF4D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'8cad1ec2-fcb6-4cf5-8d8e-69845004eb99', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A85E006EF490 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'01970c6a-710a-40c5-81ce-2ec99791618a', N'anna.n', N'anna.n', NULL, 0, CAST(0x0000A89C006E7189 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'87089158-f899-4cf7-99a1-a3f8fad53a0f', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000A906007E850D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'10a1b372-73fb-4cec-9726-13e7eaa7d7e9', N'bonin.m', N'bonin.m', NULL, 0, CAST(0x0000A8A20077371B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'6b3dd5da-174c-4c32-80e0-0edc3d6601fd', N'bopha.s', N'bopha.s', NULL, 0, CAST(0x0000A865003A75C0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'7f2a0667-2482-4c99-9160-025477645d48', N'bunrith.k', N'bunrith.k', NULL, 0, CAST(0x0000A8970069D21D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'3e0081ba-98a0-48c1-900b-942b35b5880f', N'chandavy.k', N'chandavy.k', NULL, 0, CAST(0x0000A8A100122052 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'b366768c-55dd-417d-bd20-d443b5a3ae7d', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009C7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'3ba1cb42-fe3b-4e8f-9eb9-e61cd2e5a43e', N'channa.k', N'channa.k', NULL, 0, CAST(0x0000A8A20076431A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e798bde2-a586-4caf-a3d1-89a0def3af31', N'channry.c', N'channry.c', NULL, 0, CAST(0x0000A8A500220FE7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'0c2cd4bc-40ac-46f2-8edc-1c64079be64e', N'chariya.p', N'chariya.p', NULL, 0, CAST(0x0000A89B00A638A8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'd05ae2de-0daf-4831-9520-e11aa9dd8f2b', N'chheut.h', N'chheut.h', NULL, 0, CAST(0x0000A8A1001551F5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'25130689-bf6d-4cc1-be85-aea0b0767024', N'chien.nx', N'chien.nx', NULL, 0, CAST(0x0000A89C004B17F7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'88e65316-3c5b-42db-8f08-c6fb7a602464', N'dina.r', N'dina.r', NULL, 0, CAST(0x0000A8A20028AA8C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'adf78a46-315b-43bc-9607-ce2b15befa83', N'duong.bt', N'duong.bt', NULL, 0, CAST(0x0000A89B00A5E230 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'958ba221-a094-4868-86dd-49ce2778cc3d', N'hai.lv', N'hai.lv', NULL, 0, CAST(0x0000A8A200755E8E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'dc99c038-b698-4ac2-afbf-ececa0bb918a', N'hung.hv', N'hung.hv', NULL, 0, CAST(0x0000A89C004B5811 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'1964ef48-9fe3-4045-99bf-90847aafea3a', N'kimhong.s', N'kimhong.s', NULL, 0, CAST(0x0000A8A20078D0FE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'b29b9c9e-a617-420d-9a15-6cb8b1f5bf16', N'kimsophea.l', N'kimsophea.l', NULL, 0, CAST(0x0000A8A10015E630 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'921fac6e-1d60-4461-b1a5-6ea577ba16e1', N'kin.hv', N'kin.hv', NULL, 0, CAST(0x0000A8A10012EB73 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'eeef0e7e-45bc-4d6d-94ee-13b1affc6d2e', N'lay.h', N'lay.h', NULL, 0, CAST(0x0000A8A20076D542 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'612fe107-69a9-427d-9004-2bfd1ec1cfd9', N'lieu.vt', N'lieu.vt', NULL, 0, CAST(0x0000A865003B1B0C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'3a200a3c-373e-46ec-8d2b-96b601782d81', N'limsron.n', N'limsron.n', NULL, 0, CAST(0x0000A89B00A607B5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'014e584f-05b7-4491-8cc1-5313529eeb56', N'linhour.k', N'linhour.k', NULL, 0, CAST(0x0000A89C006F7FB5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e017e500-b156-47b6-816c-fbbf0a31bcb5', N'manorith.m', N'manorith.m', NULL, 0, CAST(0x0000A8A200790D9F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'ad7e2fe4-2426-4af0-809b-e9b40fb39b72', N'mardy.l', N'mardy.l', NULL, 0, CAST(0x0000A8A10012631D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'a8c694ca-0607-4d3e-8f64-017e65c6d58b', N'measmony.s', N'measmony.s', NULL, 0, CAST(0x0000A8A50020FF16 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'6d8edd9c-81c0-4860-858f-d28308db297e', N'minh.nd', N'minh.nd', NULL, 0, CAST(0x0000A85D0038EB4A AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'c84add95-e688-4283-8f5b-1ae1359f07c2', N'molika.c', N'molika.c', NULL, 0, CAST(0x0000A85D0039A03F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'633df39e-5f5c-407a-b1cd-5b0b0eed55c6', N'munynimeth.s', N'munynimeth.s', NULL, 0, CAST(0x0000A8A200789979 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'468d7168-523f-448c-bc31-55a8c77f5f7e', N'nearyrath.s', N'nearyrath.s', NULL, 0, CAST(0x0000A865003AE491 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'a194ca79-50ec-4de1-bc35-f1d3adcbf174', N'nghia.lq', N'nghia.lq', NULL, 0, CAST(0x0000A89C004B2E40 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'f436c731-5dfe-4293-b408-0db44d8b3bf9', N'oly.dt', N'oly.dt', NULL, 0, CAST(0x0000A8A100120977 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'040dc0bb-89f9-4814-ab6b-fd219f0891c0', N'phearom.p', N'phearom.p', NULL, 0, CAST(0x0000A89B00A7FDAF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'f3c7f6f5-4be6-4053-816d-daaffb489073', N'phuong.nn', N'phuong.nn', NULL, 0, CAST(0x0000A85D00386537 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'f38cce45-d835-4bae-b671-05839f03f47c', N'phuong.nv', N'phuong.nv', NULL, 0, CAST(0x0000A8A20075B704 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'54c0723a-4e0c-4687-8e3d-53e98a13e52a', N'pisey.h', N'pisey.h', NULL, 0, CAST(0x0000A8A1001134E1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'd971f98f-5074-4273-b192-2d46fe5fbf5a', N'ratha.c', N'ratha.c', NULL, 0, CAST(0x0000A897006A5E30 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'5d05e18c-9a93-432d-a629-58d63282ed50', N'rothmony.t', N'rothmony.t', NULL, 0, CAST(0x0000A8A200290B01 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'40fb5932-88a9-4a93-ad0d-7fa7e0c5335a', N'samnang.h', N'samnang.h', NULL, 0, CAST(0x0000A8A20027712F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'27735f90-0154-4efc-8543-7262d465b7b4', N'samnang.k', N'samnang.k', NULL, 0, CAST(0x0000A8A200285358 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'c750e73c-c100-4ca2-aa74-6d4ff21553a8', N'sarak.h', N'sarak.h', NULL, 0, CAST(0x0000A921006B1DD7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'77eaede9-8ae6-4c93-babb-b42068553fd6', N'sarak01.h', N'sarak01.h', NULL, 0, CAST(0x0000A90A007D64D0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'dc4cdb12-2941-46e1-aaeb-ff42dae1389b', N'sarak02.h', N'sarak02.h', NULL, 0, CAST(0x0000A90A007ED72B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e6825471-3b36-4152-8ff2-25ff2255ca2d', N'sarak03.h', N'sarak03.h', NULL, 0, CAST(0x0000A90A007F2D58 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'7c516368-449d-488e-9672-8016c8b95fff', N'sarak04.h', N'sarak04.h', NULL, 0, CAST(0x0000A90A007F8B3D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e1fd802c-cf45-4c1a-8e24-3822cb2720af', N'savtey.k', N'savtey.k', NULL, 0, CAST(0x0000A897006CA95D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'6e13705a-6e3d-43bc-9baa-9e21aa51a5ef', N'seila.k', N'seila.k', NULL, 0, CAST(0x0000A86500392A83 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'd800e6ae-abfb-4689-b892-c58cb6b03919', N'sengthai.h', N'sengthai.h', NULL, 0, CAST(0x0000A8A100159A8E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'a4edb4b4-2aae-4106-a64e-24f295589a28', N'seyma.m', N'seyma.m', NULL, 0, CAST(0x0000A89C006EF589 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'994125b4-381d-4f80-b9d1-19f480de1288', N'sith.m', N'sith.m', NULL, 0, CAST(0x0000A89C006EA77C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'fb790c92-cf0d-4e4f-b6c5-ea9bd35820e6', N'sivlang.m', N'sivlang.m', NULL, 0, CAST(0x0000A8A2007828CD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'787036bf-9c71-412b-ba82-46bd2de8469f', N'sodalin.v', N'sodalin.v', NULL, 0, CAST(0x0000A89B00A70B86 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'ae908eb4-adbd-4cd6-9adb-1a57a4239ef4', N'sokanha.s', N'sokanha.s', NULL, 0, CAST(0x0000A8A200794935 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'85e2dee1-0d1a-4005-8864-cc650ab61bfd', N'sokea.y', N'sokea.y', NULL, 0, CAST(0x0000A8A20077822E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'1c3aa8b3-114b-44bf-b142-1df8d4cb8ab9', N'sokhemera', N'sokhemera', NULL, 0, CAST(0x0000A8A10011F1B8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'b46a20db-5bd4-48db-85b9-73f974c2fd4d', N'somanith.l', N'somanith.l', NULL, 0, CAST(0x0000A89C006F388E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'0d39d04d-7892-4edd-a51d-f9fc0ccdcdb9', N'sopanha.s', N'sopanha.s', NULL, 0, CAST(0x0000A86B002BC8E0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'5c42df66-f7af-40cd-b3c3-4b0149da9607', N'sophanna.p', N'sophanna.p', NULL, 0, CAST(0x0000A89C004C2447 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'a0b1f824-9648-4b86-88fb-2c4bb26d1746', N'sopheak.h', N'sopheak.h', NULL, 0, CAST(0x0000A8A500224C20 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e09f4566-de12-42e7-a766-fe9af9609c32', N'sopheap.s', N'sopheap.s', NULL, 0, CAST(0x0000A865003B99EA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'a39b6ec5-1317-402c-ae5a-a02acf98888d', N'sophearin.v', N'sophearin.v', NULL, 0, CAST(0x0000A89B00A79A3D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'4a184235-9999-42e9-a64b-337a1e10c98e', N'sovannroth.c', N'sovannroth.c', NULL, 0, CAST(0x0000A8A20076A1C5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'd62145a4-db27-4d88-9d98-887831e129f5', N'sovanthida.n', N'sovanthida.n', NULL, 0, CAST(0x0000A8A50021C172 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'1b9059b9-693d-4e9f-a050-7dce399285d7', N'sreynuth.v', N'sreynuth.v', NULL, 0, CAST(0x0000A89B00A6AF6D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e444fb58-37be-40cd-9162-6e6b9660434a', N'tivea.h', N'tivea.h', NULL, 0, CAST(0x0000A865003BD844 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'9a4f0863-ce60-49a4-ba80-bdf0707858ad', N'truong.nv', N'truong.nv', NULL, 0, CAST(0x0000A89B00A68583 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'465b6457-9d0e-4297-8e58-05a7dcebfea6', N'vicheth.c', N'vicheth.c', NULL, 0, CAST(0x0000A86500398631 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'0f089d0b-8865-4978-a382-6deccca9f21d', N'vu.dd', N'vu.dd', NULL, 0, CAST(0x0000A8A20027D14A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'8aee2ebf-06d5-4e10-994b-919be4700a8b', N'anh.bn', N'anh.bn', NULL, 0, CAST(0x0000A5DA006F4A22 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'dda1867e-e841-43ce-abfb-77a84fe7842e', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009D8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'd854004d-7819-4145-aa20-7cef096fd40f', N'CHARIYA.C', N'chariya.c', NULL, 0, CAST(0x0000A5C4008E47D4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'911d2105-9c21-4a7b-b4d8-7e0bdc030539', N'daya.y', N'daya.y', NULL, 0, CAST(0x0000A5D8002C2DF2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'76f4ca9b-0b9e-438d-b546-6eae6e2ea4a7', N'duong.tt', N'duong.tt', NULL, 0, CAST(0x0000A5C5003650EB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'94372f09-95f4-4e8c-bc95-1903315a26e7', N'hung.hv', N'hung.hv', NULL, 0, CAST(0x0000A5DA006FD708 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'9c0c1253-3ea6-4a39-8584-f63b0dfa63d1', N'kien.lh', N'kien.lh', NULL, 0, CAST(0x0000A5C600352FBE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'1b0d5092-5dee-49f3-8f26-23f28510d4c3', N'kim.s', N'kim.s', NULL, 0, CAST(0x0000A5C4008F4794 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'd2c54652-51ab-4c27-9614-8ed35109e345', N'laline.l', N'laline.l', NULL, 0, CAST(0x0000A5C50035DD1B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'9fa4fd7b-ae9a-4a96-8bf3-d8ee1ab1ba27', N'measmony.s', N'measmony.s', NULL, 0, CAST(0x0000A5DA00705912 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'70d8dda1-3267-4f9f-8cd3-eae292420636', N'monika.k', N'monika.k', NULL, 0, CAST(0x0000A5C4003DAA6E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'ca3263c4-8a1a-4371-a66b-03180e56eb70', N'oly.dt', N'oly.dt', NULL, 0, CAST(0x0000A5D8002FC34A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'e4a31e37-3ccf-41d9-8221-b59f231e910d', N'phanratana.b', N'phanratana.b', NULL, 0, CAST(0x0000A5D800300EFD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'd445323d-aafe-4988-a6cf-5e74e7b5dff8', N'phuong.dth', N'phuong.dth', NULL, 0, CAST(0x0000A5C5009C467B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'e75472c4-13e4-4ccf-8410-e5ba53c6fba3', N'pisith.k', N'pisith.k', NULL, 0, CAST(0x0000A5C60095C3A8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'2a92893f-34c9-4b8e-bbf3-c1776ba1d61b', N'quy.hv', N'quy.hv', NULL, 0, CAST(0x0000A5BE0081318A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'fb1b2127-08f3-430b-8c1e-396f69b03111', N'rachna.k', N'rachna.k', NULL, 0, CAST(0x0000A5E000766EF8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'19b3ca16-ffa6-4b92-a162-9f2ea811a6cc', N'rady.v', N'rady.v', NULL, 0, CAST(0x0000A5DA006EBCDC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'6e778441-2bf7-4886-b59d-dd6da5d4625c', N'saman.t', N'saman.t', NULL, 0, CAST(0x0000A5C600328F5A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'9c9d8b6a-bfcb-4a27-8bde-aaa69b0b1aec', N'samath.l', N'samath.l', NULL, 0, CAST(0x0000A5C4008C611F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'2e094b6e-c61a-47c3-b60e-a877064b7ccc', N'samnang.c', N'samnang.c', NULL, 0, CAST(0x0000A5C6003327A3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'd197c066-d466-414b-974b-15dbbbea80c3', N'sithik.i', N'sithik.i', NULL, 0, CAST(0x0000A5C5009CD004 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'607ffad3-f6ab-4686-b505-cb62e1bbcb9b', N'SOPHY.M', N'sophy.m', NULL, 0, CAST(0x0000A5D8002D4D79 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'01a82fc2-ddb6-40fd-bee4-a8558aeccf23', N'sovanna.s', N'sovanna.s', NULL, 0, CAST(0x0000A5DA006E1734 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'27287d4f-aede-40ac-a5e7-ea62ab67d8c5', N'sovannaroth.m', N'sovannaroth.m', NULL, 0, CAST(0x0000A5C500355DA2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'77afb800-cb11-4897-b50a-a93e48eec7f1', N'tan.tm', N'tan.tm', NULL, 0, CAST(0x0000A5C50034C524 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'e73558eb-4812-45d5-8ec5-b629047984a3', N'thien.nt', N'thien.nt', NULL, 0, CAST(0x0000A5C4003CF05C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'026c0cbd-9269-4faf-8ecd-7f5a34a34049', N'admin', N'admin', NULL, 0, CAST(0x0000AA9A003FB981 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'24f19be8-6d69-4ee0-ad04-27b78b26cbad', N'an.ts', N'an.ts', NULL, 0, CAST(0x0000AA9A003FB983 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'04445800-0119-43ed-990e-2a97134dd0b6', N'an.vth', N'an.vth', NULL, 0, CAST(0x0000AA9A003FB985 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b748af7a-e5cd-4669-ac2e-b14d03866c40', N'anh.bn', N'anh.bn', NULL, 0, CAST(0x0000AA9A003FB987 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'84e4f419-1d31-4902-a11e-3d63035f4cde', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000AA9A003FB989 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c78e5191-1904-4ff8-8c79-66319554faac', N'ANH.ND', N'anh.nd', NULL, 0, CAST(0x0000AA9A003FB98B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'99db782e-965c-49d9-af37-a5008b159536', N'anna.n', N'anna.n', NULL, 0, CAST(0x0000AA9A003FB98D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'37055e14-390f-443b-982b-559be7f50a6b', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000AA9A003FB98E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5ea6c033-37db-47f4-a1f1-5d282bf4e739', N'binh.lx01', N'binh.lx01', NULL, 0, CAST(0x0000AA9A003FB990 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b65e779c-32c6-4b20-af64-d5d06ace60c9', N'bonin.m', N'bonin.m', NULL, 0, CAST(0x0000AA9A003FB993 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'21a472ce-7889-491a-ba77-a370353fe81f', N'bonis.m', N'bonis.m', NULL, 0, CAST(0x0000AA9A003FB995 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'88955760-45fe-41a6-b4f0-c5e1f1fda70e', N'bopha.l', N'bopha.l', NULL, 0, CAST(0x0000AA9A003FB997 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6e0bc385-fe9b-49b5-a091-1fefe21b7ee5', N'bopha.s', N'bopha.s', NULL, 0, CAST(0x0000AA9A003FB9A8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f3269ff4-5278-4837-a6a4-e912da408daa', N'Boren.m', N'boren.m', NULL, 0, CAST(0x0000AA9A003FB9AB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a6a4cf1d-32fe-45f7-85ea-e68022a0f073', N'BORITHY.K', N'borithy.k', NULL, 0, CAST(0x0000AA9A003FB9AE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9d2ce3ba-3b56-457d-a596-4e58e4dbfcef', N'bunrith.k', N'bunrith.k', NULL, 0, CAST(0x0000AA9A003FB9B1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f0a70c15-3362-49b8-adb1-357661c692e1', N'chandavy.k', N'chandavy.k', NULL, 0, CAST(0x0000AA9A003FB9C2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cdbe6087-d37d-44d2-b004-dcd7909c4d4e', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000AA9A003FB9C6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'48429338-448d-4715-b1a5-f4f5ef3736d7', N'CHANDY.T', N'chandy.t', NULL, 0, CAST(0x0000AA9A003FB9CA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1d9de33d-48b9-4271-a93b-db38c676f79c', N'CHANMOLEKA.S', N'chanmoleka.s', NULL, 0, CAST(0x0000AA9A003FB9D2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'dcba3ead-4cd4-48a3-bdc4-a57b96622110', N'channa.c', N'channa.c', NULL, 0, CAST(0x0000AA9A003FB9D7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd48eb814-c202-4b7e-bbc9-4805090a7f24', N'channa.k', N'channa.k', NULL, 0, CAST(0x0000AA9A003FB9DA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'beae2c9b-7c72-471f-8ecb-5dcf0987bad5', N'CHANNARY.K', N'channary.k', NULL, 0, CAST(0x0000AA9A003FB9F4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f067ff32-d8e6-4dfa-b5fe-59f3dc7ebc6c', N'CHANNARY.P', N'channary.p', NULL, 0, CAST(0x0000AA9A003FB9FA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0c87f728-411b-4b38-9b87-096be7b3cb62', N'channry.c', N'channry.c', NULL, 0, CAST(0x0000AA9A003FBA06 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'809f522c-4601-43c7-a547-42ef91a6d353', N'chantha.k', N'chantha.k', NULL, 0, CAST(0x0000AA9A003FBA0F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9185e417-b520-4c8a-8c6c-5de4eeef23bb', N'CHARIYA.C', N'chariya.c', NULL, 0, CAST(0x0000AA9A003FBA11 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e1a7b9ef-dff7-4b46-856d-b7a61d8fa91b', N'Chariya.p', N'chariya.p', NULL, 0, CAST(0x0000AA9A003FBA13 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7ac65a29-b033-4387-81bd-84198744986c', N'chheut.h', N'chheut.h', NULL, 0, CAST(0x0000AA9A003FBA16 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2c54b878-1ffe-4db0-862c-27d035c4382c', N'chhorika.s', N'chhorika.s', NULL, 0, CAST(0x0000AA9A003FBA1B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c9125646-4429-40ae-8197-e71d9c28543b', N'Chhorveanratana.c', N'chhorveanratana.c', NULL, 0, CAST(0x0000AA9A003FBA3F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3ceba9ed-d7c0-4ae3-99a6-c54d243ab1f4', N'CHHOUKSOR.M', N'chhouksor.m', NULL, 0, CAST(0x0000AA9A003FBA42 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2cb35afd-958d-4546-bc43-8c7c6e2e2d09', N'chien.nx', N'chien.nx', NULL, 0, CAST(0x0000AA9A003FBA45 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'37b54223-91b3-43d2-92c3-6457dc9371f7', N'co.dv', N'co.dv', NULL, 0, CAST(0x0000AA9A003FBA47 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'31a70f9c-b298-4b72-a25f-102583eda12a', N'cuong.nm', N'cuong.nm', NULL, 0, CAST(0x0000AA9A003FBA49 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'af30936f-6a4c-4977-b3fc-9a31fa222abb', N'cuong.tq', N'cuong.tq', NULL, 0, CAST(0x0000AA9A003FBA4B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'79f3540a-1050-43c1-89b9-448914838ae4', N'Danet.h', N'danet.h', NULL, 0, CAST(0x0000AA9A003FBA4D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b0967d86-e0f5-47c8-871d-70c669fd77ab', N'DARANITA.Y', N'daranita.y', NULL, 0, CAST(0x0000AA9A003FBA4E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ef6e23e3-ef96-466d-8c38-3c4695f07f9a', N'DAT.LV', N'dat.lv', NULL, 0, CAST(0x0000AA9A003FBA50 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'63b6c79b-9370-43f3-aa29-45525ee0c126', N'Davin.i', N'davin.i', NULL, 0, CAST(0x0000AA9A003FBA52 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'56940e2a-1e0b-4336-80c1-42b3c20340f7', N'daya.y', N'daya.y', NULL, 0, CAST(0x0000AA9A003FBA54 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'777dd426-7403-4d30-84d3-087b21f3f490', N'dina.r', N'dina.r', NULL, 0, CAST(0x0000AA9A003FBA56 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e92a4bca-1456-42d5-ab8b-35651065e67f', N'dung.nh', N'dung.nh', NULL, 0, CAST(0x0000AA9A003FBA57 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ace4b264-5d47-41d7-94d3-4116743b120e', N'dung.nx', N'dung.nx', NULL, 0, CAST(0x0000AA9A003FBA59 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd8db8593-a1c6-4d6e-87c9-5e71f44bb4f6', N'dung.p', N'dung.p', NULL, 0, CAST(0x0000AA9A003FBA5B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'98551562-b532-4c29-91cd-57e4c1904671', N'duong.bt', N'duong.bt', NULL, 0, CAST(0x0000AA9A003FBA5C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd345cb4a-b561-4aa5-b995-1cb55b5fb97c', N'duong.tt', N'duong.tt', NULL, 0, CAST(0x0000AA9A003FBA5E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'435928e0-f480-4427-8de2-29cb6f2356ee', N'eefa.p', N'eefa.p', NULL, 0, CAST(0x0000AA9A003FBA60 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3f8d89a7-92bb-4d00-8a67-e7e14053300b', N'englang.c', N'englang.c', NULL, 0, CAST(0x0000AA9A003FBA62 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4d94afda-5947-4827-8bcf-f090a3577764', N'giang.tl', N'giang.tl', NULL, 0, CAST(0x0000AA9A003FBA64 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1cf81118-a629-4ff7-a1d0-89fa31cc8cc1', N'Ha.dh', N'ha.dh', NULL, 0, CAST(0x0000AA9A003FBA65 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4f44a336-576e-4b3a-85b0-1c380dfee904', N'hai.lv', N'hai.lv', NULL, 0, CAST(0x0000AA9A003FBA67 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'52bbcb57-6a67-4c1a-ac33-70ac757a2b1c', N'hai.vn', N'hai.vn', NULL, 0, CAST(0x0000AA9A003FBA69 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'8c840a95-9827-45e9-8d3b-c4622d2033fb', N'hamtn', N'hamtn', NULL, 0, CAST(0x0000AA9A003FBA6B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'57dcd054-799e-4c8e-99ea-182b355ddced', N'hanh.ttm', N'hanh.ttm', NULL, 0, CAST(0x0000AA9A003FBA6C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'65396bd6-7c69-48ba-b870-a0eb612cec49', N'HENG.K', N'heng.k', NULL, 0, CAST(0x0000AA9A003FBA6E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'756e51a0-3944-4ed6-881e-26616c8c610e', N'hengk', N'hengk', NULL, 0, CAST(0x0000AA9A003FBA70 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'82e5b85c-c6fb-4d31-97dd-fa18bfa4e8cc', N'hieu.bn', N'hieu.bn', NULL, 0, CAST(0x0000AA9A003FBA73 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a4918866-825b-479b-9ab0-6239b5b7a476', N'hieu.tb', N'hieu.tb', NULL, 0, CAST(0x0000AA9A003FBA74 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9b9b708c-bdea-49a5-86a8-5957d518484b', N'hong.km', N'hong.km', NULL, 0, CAST(0x0000AA9A003FBA76 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ce3bdcbf-933a-4280-84b5-2cef12282abf', N'hongmeng.c', N'hongmeng.c', NULL, 0, CAST(0x0000AAAF007CA20C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f1035db7-08ec-4ee5-9511-5173d8a5ef72', N'Houyly.s', N'houyly.s', NULL, 0, CAST(0x0000AA9A003FBA7B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7f354e21-ebeb-47eb-ae68-79a44684d4a5', N'HUN.P', N'hun.p', NULL, 0, CAST(0x0000AA9A003FBA7D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd49f074b-07e6-4cd9-924a-7faf3c0da791', N'hung.hv', N'hung.hv', NULL, 0, CAST(0x0000AA9A003FBA7E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'34ae60ba-3301-40f5-9668-87e166b169de', N'hung.nq', N'hung.nq', NULL, 0, CAST(0x0000AA9A003FBA80 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1068d9ad-690a-4a88-a0b7-1bc31104f645', N'hungdv', N'hungdv', NULL, 0, CAST(0x0000AA9A003FBA82 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0e5f6a86-cc83-474b-8d52-a817153dcd6d', N'huy.lq', N'huy.lq', NULL, 0, CAST(0x0000AA9A003FBA84 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2cc9be95-70fc-4a36-8ae7-2274aabad8fc', N'inpay01', N'inpay01', NULL, 0, CAST(0x0000AA9A003FBA86 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a6242b41-bf83-4728-89dc-845e9c0c4ace', N'KACHANA.E', N'kachana.e', NULL, 0, CAST(0x0000AA9A003FBA87 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'30657f2e-ea37-4b03-acac-054f03bbb52e', N'KANHAWAT.S', N'kanhawat.s', NULL, 0, CAST(0x0000AA9A003FBA89 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e17991ed-d277-4b6c-b1e3-de7bd2eb8ea6', N'keochenda.l', N'keochenda.l', NULL, 0, CAST(0x0000AA9A003FBA8B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0d0af9b4-5b07-408e-af07-98a1e0fae271', N'KEOSORITA.D', N'keosorita.d', NULL, 0, CAST(0x0000AA9A003FBA8D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'209ac89e-95c3-4135-81b0-bd4c389d3744', N'KHANH.L', N'khanh.l', NULL, 0, CAST(0x0000AA9A003FBA8F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'8596ea3f-41e9-473b-a928-32a658256879', N'KHANPISEY.S', N'khanpisey.s', NULL, 0, CAST(0x0000AA9A003FBA90 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2b5ea8a7-8f6d-4018-9655-4bfe9f09663d', N'kien.lh', N'kien.lh', NULL, 0, CAST(0x0000AA9A003FBA92 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e24a41b8-4ebc-4ab0-95ee-51d7024598fa', N'kim.s', N'kim.s', NULL, 0, CAST(0x0000AA9A003FBA94 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c7902f19-c1ac-4a20-a988-6ac42cacdeec', N'kimhong.s', N'kimhong.s', NULL, 0, CAST(0x0000AA9A003FBA96 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'293e0888-50c2-47fb-bf81-516f46227f0c', N'kimhouy.c', N'kimhouy.c', NULL, 0, CAST(0x0000AA9A003FBA98 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd3776a3f-dc90-4f18-a321-5e6feba5aa2e', N'KIMLENG.S', N'kimleng.s', NULL, 0, CAST(0x0000AA9A003FBA99 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'89fbf379-fbee-477d-8877-5591b5ffdaef', N'kimlis', N'kimlis', NULL, 0, CAST(0x0000AA9A003FBA9B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9909b226-9dff-45d5-8560-637d1d3602c0', N'kimsophea.l', N'kimsophea.l', NULL, 0, CAST(0x0000AA9A003FBA9D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e0ff0d6b-d20c-480d-8ec9-2102ee9e6815', N'kimsoung.c', N'kimsoung.c', NULL, 0, CAST(0x0000AA9A003FBA9F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'06a5421f-dba0-4da8-a612-41d55b2284f0', N'kin.hv', N'kin.hv', NULL, 0, CAST(0x0000AA9A003FBAA1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'43ea7390-a040-4e71-92a0-bb9865061d7e', N'Komoth.y', N'komoth.y', NULL, 0, CAST(0x0000AA9A003FBAA3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b0a64ba3-541b-4422-844a-17b0db169df9', N'kongkea.p', N'kongkea.p', NULL, 0, CAST(0x0000AA9A003FBAA4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'bea95a00-9571-46d6-a37e-3ad8b32e2650', N'KOSAL.E', N'kosal.e', NULL, 0, CAST(0x0000AA9A003FBAA6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1aebc802-4c81-42ec-a4dd-d9c25dedcb99', N'kunthea.ms', N'kunthea.ms', NULL, 0, CAST(0x0000AA9A003FBAA9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e01a7869-195f-427b-8330-f824a24c1964', N'laline.l', N'laline.l', NULL, 0, CAST(0x0000AA9A003FBAAC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e717afec-4814-4343-bb76-ed52b33b90d7', N'lay.h', N'lay.h', NULL, 0, CAST(0x0000AA9A003FBAAE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7bc5f431-10b6-430a-b2ff-66243bde8311', N'lequocanh', N'lequocanh', NULL, 0, CAST(0x0000AA9A003FBAB0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7ffcb00a-1dbd-4e18-80ff-1172a8216db0', N'lieu.vt', N'lieu.vt', NULL, 0, CAST(0x0000AA9A003FBAB2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cfc0a3d2-41ff-4683-bb5c-313d285b5a93', N'limsron.n', N'limsron.n', NULL, 0, CAST(0x0000AA9A003FBAB4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'813d6494-6edf-4303-817d-a01d93e8d5a5', N'LIN.R', N'lin.r', NULL, 0, CAST(0x0000AA9A003FBABA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'077e1f5b-cbf9-4c0d-a144-f2401b53a3b5', N'lina.s', N'lina.s', NULL, 0, CAST(0x0000AA9A003FBABC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'93ff3b39-8740-4e27-a0e1-6897bfefec68', N'linhour.k', N'linhour.k', NULL, 0, CAST(0x0000AA9A003FBABF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c6e22b06-8656-4b2f-a9cb-56e284f8ae76', N'ly.nk', N'ly.nk', NULL, 0, CAST(0x0000AA9A003FBAC1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'711dab45-4d26-4913-9eb7-2de558b24782', N'LYHOUNG.K', N'lyhoung.k', NULL, 0, CAST(0x0000AA9A003FBAC3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ffcef8a7-8b13-4dc5-97ea-b3dc0f183daa', N'lyvisal.a', N'lyvisal.a', NULL, 0, CAST(0x0000AA9A003FBAC5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b7f38b6c-37aa-4320-983d-12d5e9f79b20', N'malay.k', N'malay.k', NULL, 0, CAST(0x0000AA9A003FBACA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'69eec27e-11a2-4e20-bff0-1892965d4ace', N'manorith.m', N'manorith.m', NULL, 0, CAST(0x0000AA9A003FBACE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e9117246-3f84-42d5-a7ed-66b542cc7d55', N'mapheap.c', N'mapheap.c', NULL, 0, CAST(0x0000AA9A003FBAD0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ce23ed2d-14bc-4062-9892-2ab6fe50b280', N'mardy.l', N'mardy.l', NULL, 0, CAST(0x0000AA9A003FBAD2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0671de15-55ed-4818-a515-06a2b0006e4d', N'MEACH SOPHEAP', N'meach sopheap', NULL, 0, CAST(0x0000AA9A003FBAD3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f55a6f22-cc45-4678-a91a-0bfe43fa5a6e', N'measmony.s', N'measmony.s', NULL, 0, CAST(0x0000AA9A003FBAD5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'eb98f3d1-d967-450e-ad2f-db075b4a2e00', N'minh.nd', N'minh.nd', NULL, 0, CAST(0x0000AA9A003FBAD7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cd942187-031c-450d-afb4-c5896911584d', N'MINH.TC', N'minh.tc', NULL, 0, CAST(0x0000AA9A003FBADC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fac23cce-edc3-42b6-92a9-c127d4ccf39d', N'minh.tv', N'minh.tv', NULL, 0, CAST(0x0000AA9A003FBAE8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'bdba508c-2822-4379-bd51-06fdd0006a64', N'MOLIKA.C', N'molika.c', NULL, 0, CAST(0x0000AA9A003FBAF7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e8933eba-e1f9-47a3-beed-497c50d653dd', N'monika.k', N'monika.k', NULL, 0, CAST(0x0000AA9A003FBAFF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'46bef49d-16f5-42f3-af42-d12d2f33d58b', N'MONIRORT.LS', N'monirort.ls', NULL, 0, CAST(0x0000AA9A003FBB0E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'85c7b5a6-bd9f-444e-9e6e-644d9727645a', N'munynimeth.s', N'munynimeth.s', NULL, 0, CAST(0x0000AA9A003FBB11 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5abdb16c-c370-4a1b-a195-b58a683747a7', N'nearyrath.s', N'nearyrath.s', NULL, 0, CAST(0x0000AA9A003FBB14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6d4bbd12-2f72-4533-9f76-bb016297b7a3', N'nghia.lq', N'nghia.lq', NULL, 0, CAST(0x0000AA9A003FBB16 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b47caf78-cc79-49a6-90a9-e3e648ab2e68', N'nika.k', N'nika.k', NULL, 0, CAST(0x0000AA9A003FBB1B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd6100367-ab21-4946-9d2f-d6201a6962a0', N'nit.ld', N'nit.ld', NULL, 0, CAST(0x0000AA9A003FBB1D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'736fd79a-c166-4ee6-af9b-3867cd99fe49', N'oly.dt', N'oly.dt', NULL, 0, CAST(0x0000AA9A003FBB1F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f24285eb-126f-4cb8-90e9-59f1af60e4d8', N'phallyda.m', N'phallyda.m', NULL, 0, CAST(0x0000AA9A003FBB21 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'798b9c28-5b8d-4d1a-bf35-55b61ce59aac', N'phanratana.b', N'phanratana.b', NULL, 0, CAST(0x0000AA9A003FBB23 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'604301d3-86b9-4047-8945-39d94c74eaf5', N'pharin.n', N'pharin.n', NULL, 0, CAST(0x0000AA9A003FBB25 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4c81cfcd-b1be-4ec4-90a2-3ce7b87ddda3', N'phearom.p', N'phearom.p', NULL, 0, CAST(0x0000AA9A003FBB29 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'13afc92b-5490-47f1-92ec-dbe63ab31c60', N'phong.ch', N'phong.ch', NULL, 0, CAST(0x0000AA9A003FBB2D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'95c72a77-5e6e-4c16-9768-9ad13840606c', N'phuong.dth', N'phuong.dth', NULL, 0, CAST(0x0000AA9A003FBB30 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'24f68d34-4bfd-4656-a485-8a11da01cbf3', N'phuong.nn', N'phuong.nn', NULL, 0, CAST(0x0000AA9A003FBB32 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a7e77bd5-0f93-4406-b734-286d29367717', N'phuong.nv', N'phuong.nv', NULL, 0, CAST(0x0000AA9A003FBB38 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2511862f-d732-4cda-8299-796a25ab1b82', N'phuong.th', N'phuong.th', NULL, 0, CAST(0x0000AA9A003FBB3C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4928a98e-575d-42c4-988a-dd286eaabe9a', N'PISEY.H', N'pisey.h', NULL, 0, CAST(0x0000AA9A003FBB3E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'460ce37b-0ec3-4575-8dd8-ac6069e2b1cf', N'pisey.m', N'pisey.m', NULL, 0, CAST(0x0000AA9A003FBB40 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b31c8339-4132-49a5-ae56-a6e90331eb5a', N'pisey.ong', N'pisey.ong', NULL, 0, CAST(0x0000AA9A003FBB42 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e6a168cf-efb4-449a-a2d0-88f5ddc135a2', N'pisith.k', N'pisith.k', NULL, 0, CAST(0x0000AA9A003FBB43 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cab2232f-cb57-402c-bc35-5080c7e4b9b6', N'quocdp', N'quocdp', NULL, 0, CAST(0x0000AA9A003FBB45 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'8986d3cd-a751-4bd3-bcd9-9b93f9fac163', N'quy.hv', N'quy.hv', NULL, 0, CAST(0x0000AA9A003FBB47 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b03d7fd9-e21d-40d0-b072-60cd76f372dc', N'Rachana.k', N'rachana.k', NULL, 0, CAST(0x0000AA9A003FBB49 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd5675ef7-7d98-4f84-ae0d-d8a4738c8a53', N'rachna.k', N'rachna.k', NULL, 0, CAST(0x0000AA9A003FBB4B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd6772e7f-a160-40e6-8b2d-aca6dedfa370', N'rady.v', N'rady.v', NULL, 0, CAST(0x0000AA9A003FBB4C AS DateTime))
GO
print 'Processed 300 total records'
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'43b27eb3-475f-4c4f-944c-7a9da9ac4286', N'RAKSMEY.C', N'raksmey.c', NULL, 0, CAST(0x0000AA9A003FBB4E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'22639d30-44d5-4ee6-a07d-f230eba9163e', N'rath.st', N'rath.st', NULL, 0, CAST(0x0000AA9A003FBB50 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'473eb59b-2529-46ee-b754-7450ba7318d8', N'ratha.c', N'ratha.c', NULL, 0, CAST(0x0000AA9A003FBB52 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e86f73ca-126d-4dd1-807b-a00c9dc9e052', N'RATPHEA.P', N'ratphea.p', NULL, 0, CAST(0x0000AA9A003FBB54 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2531d195-c1ed-4e57-a26d-5d625f1a2f01', N'rothmony.t', N'rothmony.t', NULL, 0, CAST(0x0000AA9A003FBB56 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9cf2ead7-2ec7-4a72-a612-0576f23dd173', N'sakada.s', N'sakada.s', NULL, 0, CAST(0x0000AA9A003FBB58 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5c8fe39b-25f7-423d-bfe5-2d39b25deb6a', N'saman.t', N'saman.t', NULL, 0, CAST(0x0000AA9A003FBB5B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'33694099-4b80-4a8b-80b1-0ad89ba8bf69', N'samath.l', N'samath.l', NULL, 0, CAST(0x0000AA9A003FBB5C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd3cd4581-9b6c-41e5-b832-cea2c36e0010', N'samnang.c', N'samnang.c', NULL, 0, CAST(0x0000AA9A003FBB5E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a8944be6-9be4-47ed-88e8-10ae6a097b8c', N'samnang.h', N'samnang.h', NULL, 0, CAST(0x0000AA9A003FBB60 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5aa05362-3ff3-48df-aff4-f0288707fdc7', N'samnang.k', N'samnang.k', NULL, 0, CAST(0x0000AA9A003FBB62 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fe3b11a5-2e4d-45ae-a7f7-6d49070b2355', N'sarak.h', N'sarak.h', NULL, 0, CAST(0x0000AAB9002E8EE2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'95fb94cb-b0b9-4d4f-9134-a919d927cc25', N'sarak01.h', N'sarak01.h', NULL, 0, CAST(0x0000AA9A003FBB65 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fe9917a9-b2bc-4b50-9098-070f208dcf6f', N'sarak02.h', N'sarak02.h', NULL, 0, CAST(0x0000AA9A003FBB68 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'34fb5b9f-27af-4348-9870-5804b5b3f108', N'sarak03.h', N'sarak03.h', NULL, 0, CAST(0x0000AA9A003FBB6A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'991ee162-af70-48d5-b766-dc9d1e0011f4', N'sarak04.h', N'sarak04.h', NULL, 0, CAST(0x0000AA9A003FBB6C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b01ca189-a9d1-4368-819d-38ede56e4e44', N'savtey.k', N'savtey.k', NULL, 0, CAST(0x0000AA9A003FBB6E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0693fb41-74d7-4457-bf82-6e6e77e85a9b', N'Seavlang.l', N'seavlang.l', NULL, 0, CAST(0x0000AA9A003FBB70 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'21514293-c4db-4f8f-a205-bb266bc245d1', N'seila.k', N'seila.k', NULL, 0, CAST(0x0000AA9A003FBB72 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7749f536-fd0e-4428-ae24-bda6cf97e641', N'SELA.H', N'sela.h', NULL, 0, CAST(0x0000AA9A003FBB74 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0026a458-b43e-428e-a68b-86ea2127e37c', N'sengthai.h', N'sengthai.h', NULL, 0, CAST(0x0000AA9A003FBB76 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'373a2074-84a7-4330-9989-1077601ddfc3', N'seyma.m', N'seyma.m', NULL, 0, CAST(0x0000AA9A003FBB78 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'035bc17f-1ada-4c11-ae25-557e66cf40b1', N'sidona.n', N'sidona.n', NULL, 0, CAST(0x0000AA9A003FBB7A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c72b0c30-8325-48f3-8c00-c30bb4406636', N'sith.m', N'sith.m', NULL, 0, CAST(0x0000AA9A003FBB7B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'aefdf7d8-388b-4fa6-856c-22d1b74a7c8b', N'sithan.p', N'sithan.p', NULL, 0, CAST(0x0000AA9A003FBB7D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'edac2ee0-b19f-41d0-96b6-762651fb269a', N'sithik.i', N'sithik.i', NULL, 0, CAST(0x0000AA9A003FBB7F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1b588cc2-b9da-46e0-945a-eecffccc416d', N'sivlang.m', N'sivlang.m', NULL, 0, CAST(0x0000AA9A003FBB81 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3d5f51a3-6b5b-47ed-96bf-26f3fd556d57', N'socheata.c', N'socheata.c', NULL, 0, CAST(0x0000AA9A003FBB82 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1e54f5ee-d989-4774-9c93-c29179b45ca4', N'Socheata.s', N'socheata.s', NULL, 0, CAST(0x0000AA9A003FBB84 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6c498537-2640-47f9-a162-3db17262067c', N'sodalin.v', N'sodalin.v', NULL, 0, CAST(0x0000AA9A003FBB86 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'74a719e8-0d9b-4d59-b310-feeb384a18ba', N'sodanet.p', N'sodanet.p', NULL, 0, CAST(0x0000AA9A003FBB88 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4a16cdbe-6351-45de-96de-2cbed1d0c3fc', N'sokanha.s', N'sokanha.s', NULL, 0, CAST(0x0000AA9A003FBB89 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'df62179a-6d5d-4c6d-9ff2-2096b49e0c90', N'Sokdany.k', N'sokdany.k', NULL, 0, CAST(0x0000AA9A003FBB8B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'995dae32-20b9-41c5-8732-853f639a1f43', N'sokea.y', N'sokea.y', NULL, 0, CAST(0x0000AA9A003FBB8D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2de925a4-b186-4472-8cde-10a7298d0efa', N'sokhemera', N'sokhemera', NULL, 0, CAST(0x0000AA9A003FBB90 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'20c45f26-56f6-4898-ade7-30bfe441f7b9', N'sokhouy.l', N'sokhouy.l', NULL, 0, CAST(0x0000AA9A003FBB93 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'719caddf-f326-4b2f-ab50-8398305427cd', N'soklinda.k', N'soklinda.k', NULL, 0, CAST(0x0000AA9A003FBB96 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'efd47d76-f6cc-43a5-9df8-e578e226994d', N'sokunthe.ms', N'sokunthe.ms', NULL, 0, CAST(0x0000AA9A003FBB99 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fcceccf8-92db-4c56-8d99-b2c315268081', N'sokunthea.m', N'sokunthea.m', NULL, 0, CAST(0x0000AA9A003FBB9B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'419f05f9-ea1c-4173-a2bd-df3bf5920018', N'SOMALA.L', N'somala.l', NULL, 0, CAST(0x0000AA9A003FBB9D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6f472a71-ed51-4b7d-8070-ccf72a69d3b3', N'somalal', N'somalal', NULL, 0, CAST(0x0000AA9A003FBB9F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7034766f-33ac-417c-877f-03dabdcbf01f', N'somanit.l', N'somanit.l', NULL, 0, CAST(0x0000AA9A003FBBA0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f71101f9-3f1b-450c-9beb-00c46f151570', N'somanith.l', N'somanith.l', NULL, 0, CAST(0x0000AA9A003FBBA2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'560c2152-624e-4eb2-b646-6c49b3eb3b15', N'SON.DT', N'son.dt', NULL, 0, CAST(0x0000AA9A003FBBA4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3ccdafac-b18a-4c73-b551-df555cce06c4', N'Sony.y', N'sony.y', NULL, 0, CAST(0x0000AA9A003FBBA6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f59a2707-3a43-49ff-a221-17badd6d4e7c', N'Sopanha.s', N'sopanha.s', NULL, 0, CAST(0x0000AA9A003FBBA7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9e04e39c-8878-4e6f-a43a-93b3cd59bd3d', N'SOPHANETH.K', N'sophaneth.k', NULL, 0, CAST(0x0000AA9A003FBBA9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0c9dc485-96a2-4b50-bdcb-a8325573cc57', N'Sophanna.p', N'sophanna.p', NULL, 0, CAST(0x0000AA9A003FBBAB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2932b20f-edbe-41c4-8997-224431413a56', N'sopheak.h', N'sopheak.h', NULL, 0, CAST(0x0000AA9A003FBBAD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'38cb5b75-cb70-4951-a606-0ac540d9fc07', N'SOPHEAK.S', N'sopheak.s', NULL, 0, CAST(0x0000AA9A003FBBAF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'672dc2e4-768c-4895-b8b9-77cc45d641b0', N'SOPHEAP.M', N'sopheap.m', NULL, 0, CAST(0x0000AA9A003FBBB0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9c148b50-3b7e-4601-9df8-035aaa886a11', N'sopheap.s', N'sopheap.s', NULL, 0, CAST(0x0000AA9A003FBBB2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0d93766d-c974-43b6-9b0f-6ca3bec4389e', N'sophearin.v', N'sophearin.v', NULL, 0, CAST(0x0000AA9A003FBBDC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'06483bd9-11f1-423b-9911-2498c59c076b', N'SOPHY.M', N'sophy.m', NULL, 0, CAST(0x0000AA9A003FBBDE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'99fbcc4f-1f76-467b-81f5-ad8cfeeebf38', N'soratha.c', N'soratha.c', NULL, 0, CAST(0x0000AA9A003FBBE0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0d8c7a52-6596-480b-8c9e-d0cb8c92198e', N'sovanarong.p', N'sovanarong.p', NULL, 0, CAST(0x0000AA9A003FBBE2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e577d82a-ba13-44a5-a574-0ebd0f10e0fe', N'sovanna.s', N'sovanna.s', NULL, 0, CAST(0x0000AA9A003FBBE4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3185e96f-64aa-467a-880d-9005e2e4eb98', N'sovannaroth.m', N'sovannaroth.m', NULL, 0, CAST(0x0000AA9A003FBBE6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'49409b72-421a-4970-a14f-893b629abf3d', N'sovannroth.c', N'sovannroth.c', NULL, 0, CAST(0x0000AA9A003FBBE8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'20df5152-62b7-4453-880c-0fecc5b94617', N'sovanthida.n', N'sovanthida.n', NULL, 0, CAST(0x0000AA9A003FBBEA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e0b19afc-398a-45d9-abb2-989ecf69a294', N'sreykhouch.b', N'sreykhouch.b', NULL, 0, CAST(0x0000AA9A003FBBEB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6cf19991-407f-4762-a36e-5fe005c57703', N'Sreykhouch.d', N'sreykhouch.d', NULL, 0, CAST(0x0000AA9A003FBBED AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1056f3c4-86ad-4fb4-868b-aaeb8e853e7e', N'sreymom.r', N'sreymom.r', NULL, 0, CAST(0x0000AA9A003FBBEF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3bdcd008-13b3-4c30-a278-eb9083e76e77', N'sreyneath.s', N'sreyneath.s', NULL, 0, CAST(0x0000AA9A003FBBF1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'398ab1fd-f8be-4178-89ce-cd70067bd8fd', N'Sreynuth.v', N'sreynuth.v', NULL, 0, CAST(0x0000AA9A003FBBF3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1cb6255f-0a13-4ad6-8272-c74238a11811', N'sreypov.s', N'sreypov.s', NULL, 0, CAST(0x0000AA9A003FBBF5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c3b7c2cf-69d5-4064-ad9f-d82f5fb2b82b', N'sreysros.p', N'sreysros.p', NULL, 0, CAST(0x0000AA9A003FBBF7 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'56665ee9-e136-44da-8804-48af86ad2464', N'suphea.s', N'suphea.s', NULL, 0, CAST(0x0000AA9A003FBBFA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'196ef17e-5d4c-4ea5-8700-6087cbbd934d', N'tai.pm', N'tai.pm', NULL, 0, CAST(0x0000AA9A003FBBFB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'69ec3119-6790-4673-a2d5-8030a365626b', N'tan.tm', N'tan.tm', NULL, 0, CAST(0x0000AA9A003FBC02 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'203970f2-a035-425b-9245-51d1c08e4869', N'TANA.TR', N'tana.tr', NULL, 0, CAST(0x0000AA9A003FBC04 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'153e9fd4-61ab-4167-93b3-6aef0a25013a', N'Test1', N'test1', NULL, 0, CAST(0x0000AA9A003FBC05 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'43a26d8c-f4cc-417e-8ec4-d2e7414f6934', N'Test2', N'test2', NULL, 0, CAST(0x0000AA9A003FBC07 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'db5f3de3-98c5-4e9e-9ffe-d7659ed8916f', N'testkh', N'testkh', NULL, 0, CAST(0x0000AA9A003FBC09 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b6326d01-e362-4d99-b3c9-b4d0104680b0', N'testkh1', N'testkh1', NULL, 0, CAST(0x0000AA9A003FBC0B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'386a5044-2f7d-40e0-8768-8acc3f0eea7c', N'Tha.s', N'tha.s', NULL, 0, CAST(0x0000AA9A003FBC0C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0ddc971f-eac5-4c6c-85a6-3102e784f471', N'thanh.nt', N'thanh.nt', NULL, 0, CAST(0x0000AA9A003FBC0E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2dcb41d7-07df-4022-909b-8dcedc3605c5', N'thanh.th', N'thanh.th', NULL, 0, CAST(0x0000AA9A003FBC10 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'38a91d30-2000-4cb6-906e-7f0b28832994', N'THAVRAT.S', N'thavrat.s', NULL, 0, CAST(0x0000AA9A003FBC12 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'36718159-12e6-4a41-be06-d53881d0cc96', N'THEAN.PM', N'thean.pm', NULL, 0, CAST(0x0000AA9A003FBC14 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1bace25e-abe4-4728-8f23-e97b6ad3e44a', N'thien.nt', N'thien.nt', NULL, 0, CAST(0x0000AA9A003FBC16 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a79563fe-edfb-4022-82f6-7aee2ca2a513', N'tivea.h', N'tivea.h', NULL, 0, CAST(0x0000AA9A003FBC18 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5de38f93-4368-42ee-bffc-b450cf3a9e32', N'trung.ln', N'trung.ln', NULL, 0, CAST(0x0000AA9A003FBC1A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'74e27d82-63f4-4709-aab7-1f90429bf2b3', N'truong.nv', N'truong.nv', NULL, 0, CAST(0x0000AA9A003FBC1C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'22aa5bd0-e005-45c2-950e-9cb1fcaba321', N'TUAN.NT', N'tuan.nt', NULL, 0, CAST(0x0000AA9A003FBC1E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6cc3d8c5-2814-4604-b2e0-4985c4cd726f', N'tuan.pd', N'tuan.pd', NULL, 0, CAST(0x0000AA9A003FBC23 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c27d064a-8382-4fb8-883b-9784d857602c', N'tuannq', N'tuannq', NULL, 0, CAST(0x0000AA9A003FBC26 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'965aa192-6dd4-495e-b090-f223e7869c84', N'Tuc.ht', N'tuc.ht', NULL, 0, CAST(0x0000AA9A003FBC29 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'caf8a1d1-0d70-436f-b117-b53cf1bceee7', N'van.lth', N'van.lth', NULL, 0, CAST(0x0000AA9A003FBC2B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'708e5b5e-41dd-4bed-ab99-54eb800cf226', N'VAN.NTK', N'van.ntk', NULL, 0, CAST(0x0000AA9A003FBC2D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'62b9ca23-a805-4b36-8a80-4ee43249ae54', N'VANNAK.P', N'vannak.p', NULL, 0, CAST(0x0000AA9A003FBC2F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'da14c8f9-5fe3-4018-8ac7-e7f2d1c5e1f9', N'VEANG.L', N'veang.l', NULL, 0, CAST(0x0000AA9A003FBC31 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'46c633c7-375d-49b3-849e-8ef63050f75a', N'vicheth.c', N'vicheth.c', NULL, 0, CAST(0x0000AA9A003FBC34 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'71a2a231-8143-47d2-a7c8-008ddd70670c', N'VIET.NQ', N'viet.nq', NULL, 0, CAST(0x0000AA9A003FBC36 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ff1e6a6d-987a-44df-b942-ffb9e2c3729c', N'VOLEAK.S', N'voleak.s', NULL, 0, CAST(0x0000AA9A003FBC37 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fc2cba24-f2e5-4dad-9ce1-d36b62b8a5c3', N'VOLINETH.K', N'volineth.k', NULL, 0, CAST(0x0000AA9A003FBC39 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f39a6a55-5d2f-47ff-84e9-7e76f445d064', N'vorlack.c', N'vorlack.c', NULL, 0, CAST(0x0000AA9A003FBC3B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'47f7973a-1ca4-48a6-8f04-b204bf20df6d', N'vu.dd', N'vu.dd', NULL, 0, CAST(0x0000AA9A003FBC3D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd9812476-e3d2-472b-a5d7-968bbc8c52b0', N'vuochnea.s', N'vuochnea.s', NULL, 0, CAST(0x0000AA9A003FBC3E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6b6ba3d4-d224-4ee3-abe2-c0347281495d', N'yekleng.k', N'yekleng.k', NULL, 0, CAST(0x0000AA9A003FBC40 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fa11c51c-e159-4d5d-a712-c027a5279f4d', N'younic.t', N'younic.t', NULL, 0, CAST(0x0000AA9A003FBC4B AS DateTime))
GO
print 'Processed 400 total records'
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'5f795ca3-cf79-4d44-9bce-d2c13a0475e9', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A45F001FB773 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'6e335c58-a568-44b8-9936-b03b17811717', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000A906001C5C10 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'4502e0cf-5e54-431c-aafa-d4391e71e34b', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009DB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'f52544d6-a878-4403-8c0c-06e6e8351255', N'hongmeng.c', N'hongmeng.c', NULL, 0, CAST(0x0000A63A009B2255 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'cc0bbc86-c75e-4290-8ef5-b971bbb4368f', N'lequocanh', N'lequocanh', NULL, 0, CAST(0x0000A63A008732C1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'50c8e5bf-3f0e-4b19-a1c1-64fcc5dc8161', N'minh.tv', N'minh.tv', NULL, 0, CAST(0x0000A39C0024E4FD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'89e5f33f-3c3e-4f83-b421-76788928f099', N'pisey.ong', N'pisey.ong', NULL, 0, CAST(0x0000A2490041C211 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'738a6c82-cea6-4c07-b8f7-0d0594dbb61b', N'quocdp', N'quocdp', NULL, 0, CAST(0x0000A2540043EA8E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'fe8933d5-2837-40b5-bdb1-f1c3226a34ee', N'sarak.h', N'sarak.h', NULL, 0, CAST(0x0000A90A0032E2DF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'21ad1923-8928-45e3-a805-4fa6fe7fceec', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000A906001C3104 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'462ed4d0-a3f9-4b11-a0c5-4d9d22b70168', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A5BF008F3707 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'51774728-0ecd-47b0-a0ca-a0c015390f53', N'kimlis', N'kimlis', NULL, 0, CAST(0x0000A3A300403466 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'c9a93442-d9b2-45a1-a54c-45852c2e5ab4', N'nit.ld', N'nit.ld', NULL, 0, CAST(0x0000A3A3003FCD8F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'694c5d3e-8a04-4826-a225-8bac89e66140', N'tai.pm', N'tai.pm', NULL, 0, CAST(0x0000A3A30041A629 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'8c517113-2ebf-412e-aa3f-959d51e3f1df', N'testkh', N'testkh', NULL, 0, CAST(0x0000A3A3004A1543 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'bc0b59fe-da3c-4e9a-9bd5-3449a1cf48f1', N'an.ts', N'an.ts', NULL, 0, CAST(0x0000A77D0090E58A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'938f747b-b16b-49d8-8572-e6ac0f8d8556', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A43C002DBB48 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'42f5efb7-6802-454d-a55d-8a9be977274f', N'binh.lx', N'binh.lx', NULL, 0, CAST(0x0000A906007E8512 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'a6e54c2c-62d7-4232-aa04-eb4bd55a1f92', N'binh.lx01', N'binh.lx01', NULL, 0, CAST(0x0000A92200893986 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'ab27d474-6331-4294-9b13-75d7a8143577', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009D3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'e1dc864d-0405-4e49-aaeb-d571bce8cfc2', N'cuong.tq', N'cuong.tq', NULL, 0, CAST(0x0000A6E2008237EC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'82641c61-0e2e-4522-8338-f73fc7163561', N'dung.p', N'dung.p', NULL, 0, CAST(0x0000A5B000717337 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'0bf24d71-cdcf-40b0-9bcf-c87c64e369df', N'keochenda.l', N'keochenda.l', NULL, 0, CAST(0x0000A43C002C8FD0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'd6f9e6ff-7f2c-476f-9dfc-eede8c4aa55a', N'lequocanh', N'lequocanh', NULL, 0, CAST(0x0000A5BA002CDB47 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'b80fd668-a91a-4b8e-87b5-6b72233f2265', N'lyvisal.a', N'lyvisal.a', NULL, 0, CAST(0x0000A5FD0020DA44 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'768ddd58-551c-499a-a725-7a73acb6d672', N'rath.st', N'rath.st', NULL, 0, CAST(0x0000A77D00919CBC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'2a65f8e4-662a-4038-94b5-0769a4df31bb', N'sarak.h', N'sarak.h', NULL, 0, CAST(0x0000A929003536D9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'2fdda0e2-4757-4595-9070-3ecf8d49ee97', N'Seavlang.l', N'seavlang.l', NULL, 0, CAST(0x0000A5620015B32D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'2620646c-864e-4012-bc6e-cba8682f7ae4', N'sidona.n', N'sidona.n', NULL, 0, CAST(0x0000A86A002DD64E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'2f2dd24b-8c84-491a-92fd-e189149acefb', N'sreymom.r', N'sreymom.r', NULL, 0, CAST(0x0000A4DD00919378 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'76b38de5-c7a4-4c1b-912c-e005a2d6bb10', N'VANNAK.P', N'vannak.p', NULL, 0, CAST(0x0000A43C002D1AD2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'5414e31b-7c4e-433b-84cb-56d95fd2b2d8', N'Anh.dd', N'anh.dd', NULL, 0, CAST(0x0000A8DD00D06B4E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6996259e-3041-421f-abcb-299c5bb44a63', N'ANH.ND', N'anh.nd', NULL, 0, CAST(0x0000A24B007878C3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'120cf64f-a0a2-49d6-8585-780becad98fb', N'bonis.m', N'bonis.m', NULL, 0, CAST(0x0000A72B007967AB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'98f45d4e-e8e8-45b2-a75f-eece6fbb5dff', N'bopha.l', N'bopha.l', NULL, 0, CAST(0x0000A20D00295099 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'5e18a096-7032-4f21-b113-96261a380745', N'Boren.m', N'boren.m', NULL, 0, CAST(0x0000A24B0071CCAB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'2b725440-cd2e-411b-8313-37af2ffc55b0', N'BORITHY.K', N'borithy.k', NULL, 0, CAST(0x0000A24B00485AA1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'c44dccaa-b26e-420f-95a0-84bd9e1c2b20', N'chandavy.k', N'chandavy.k', NULL, 0, CAST(0x0000A23E0038E22C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a1a00eae-a459-4cf4-809e-10b6e9a9b7bf', N'chandoeun.s', N'chandoeun.s', NULL, 0, CAST(0x0000A906003009BF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd48c8f69-f915-42ff-b0e6-74c66983d7d3', N'CHANDY.T', N'chandy.t', NULL, 0, CAST(0x0000A24B006BE9B5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'1536d59a-a53b-48f1-9781-f122ae338757', N'CHANMOLEKA.S', N'chanmoleka.s', NULL, 0, CAST(0x0000A24B006B98BD AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f7030f55-ad5c-4ae8-aa26-b5b69108b8fc', N'channa.c', N'channa.c', NULL, 0, CAST(0x0000A672007E2DFA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6c16b9c8-5e6d-4ac3-b14a-39554d1c822c', N'CHANNARY.K', N'channary.k', NULL, 0, CAST(0x0000A2F9002A9753 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'3a755304-93d8-47bf-9ed0-45f806afedc2', N'CHANNARY.P', N'channary.p', NULL, 0, CAST(0x0000A61700878732 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'138cedd2-9fa5-4816-887c-bd2ff061fc9d', N'chantha.k', N'chantha.k', NULL, 0, CAST(0x0000A672007F01E3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'46903703-f420-4dca-95d9-b1a390d4f406', N'CHARIYA.C', N'chariya.c', NULL, 0, CAST(0x0000A252006BED1F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6150dcc0-f1d9-41c4-a73e-f637e61bb614', N'Chariya.p', N'chariya.p', NULL, 0, CAST(0x0000A30000AA6414 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'03f4b1b1-c7b7-4efb-bc69-e105a2d095f8', N'chhorika.s', N'chhorika.s', NULL, 0, CAST(0x0000A3F0002B56E3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f3f8eb6f-b63f-4b18-8846-fca70e67ec1f', N'Chhorveanratana.c', N'chhorveanratana.c', NULL, 0, CAST(0x0000A5750028E707 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'039972f6-f474-42aa-92ae-c53449afef83', N'CHHOUKSOR.M', N'chhouksor.m', NULL, 0, CAST(0x0000A24B00755ACC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'17c52be7-557e-4cf6-9cbd-6a2de65f0df6', N'Danet.h', N'danet.h', NULL, 0, CAST(0x0000A4EB008F351C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b7e1569d-fd8b-4474-ab8f-8144e21e0c55', N'DARANITA.Y', N'daranita.y', NULL, 0, CAST(0x0000A30900180224 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'1f0bd182-9c4d-40e8-bcda-c15ef47587fe', N'DAT.LV', N'dat.lv', NULL, 0, CAST(0x0000A24B00782F70 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f5731904-68e1-43ca-be09-681eb6b5c1b9', N'Davin.i', N'davin.i', NULL, 0, CAST(0x0000A516002AD411 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'4a8139aa-9f60-46c5-87ca-9b54d0f2091e', N'duong.bt', N'duong.bt', NULL, 0, CAST(0x0000A37D009B8C2D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'06b1d559-b91d-4d9d-8d30-96b9327dec17', N'eefa.p', N'eefa.p', NULL, 0, CAST(0x0000A7EC006E06E3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'26dd27f5-aabd-4459-9432-f833cfb3d499', N'englang.c', N'englang.c', NULL, 0, CAST(0x0000A67C003F543A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'01b42a69-3d72-4db4-8250-95f2eba62fd5', N'Ha.dh', N'ha.dh', NULL, 0, CAST(0x0000A2F8008162DE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'45bbb7e9-b16d-411f-ac70-f1dbfa690094', N'HENG.K', N'heng.k', NULL, 0, CAST(0x0000A24B0072D799 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'50c7250d-32a8-4d61-883c-a6488b4d2524', N'hengk', N'hengk', NULL, 0, CAST(0x0000A22700A9C74F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'7ac67bff-4d3b-469e-84af-c0b6aed5aa1c', N'Houyly.s', N'houyly.s', NULL, 0, CAST(0x0000A24B0074C2CE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'842313cf-8830-4c7a-8c2c-1c494603cd2b', N'HUN.P', N'hun.p', NULL, 0, CAST(0x0000A24B0078BBBF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'15dc56df-674d-452f-8c4b-01b4aa74de93', N'huy.lq', N'huy.lq', NULL, 0, CAST(0x0000A2A00018C38D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'742b7c27-3b13-4179-88b4-bcc5cdc3d32e', N'inpay01', N'inpay01', NULL, 0, CAST(0x0000A29F00B76822 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'5d4155bf-c87c-4766-818c-165a9399f379', N'KACHANA.E', N'kachana.e', NULL, 0, CAST(0x0000A2FB008CB6C1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'158f03d2-79f5-46c0-8241-156024326849', N'KANHAWAT.S', N'kanhawat.s', NULL, 0, CAST(0x0000A24B00733B8B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'1d51c051-95a3-4a61-af99-14185692bfe7', N'keochenda.l', N'keochenda.l', NULL, 0, CAST(0x0000A2B600437EA3 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'ebe54cf2-1582-4b94-b584-32dfcb0ab5af', N'KEOSORITA.D', N'keosorita.d', NULL, 0, CAST(0x0000A24B006B46BF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'89ecb416-d516-4ce3-bcb6-e1df7f4f28d3', N'KHANH.L', N'khanh.l', NULL, 0, CAST(0x0000A24B006C4DC8 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b9b6825a-bf21-4cb5-b9e0-061f1b25f7b4', N'KHANPISEY.S', N'khanpisey.s', NULL, 0, CAST(0x0000A24B00739CBF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'4bbba9b8-4b16-4eb1-b2b8-1cac087a90a2', N'KIMLENG.S', N'kimleng.s', NULL, 0, CAST(0x0000A24B0073EF9E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'64e75200-af93-4e97-8753-a6e4bf0f588e', N'kimsoung.c', N'kimsoung.c', NULL, 0, CAST(0x0000A67400472411 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'4f22c410-428c-4d25-9348-06832bf16dff', N'Komoth.y', N'komoth.y', NULL, 0, CAST(0x0000A24B0073BFCB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'68ce76da-34c2-457b-9ad9-26e44dfc4606', N'kongkea.p', N'kongkea.p', NULL, 0, CAST(0x0000A4DD00911655 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6ae7a4f5-4978-458a-a579-3d57d00037c4', N'KOSAL.E', N'kosal.e', NULL, 0, CAST(0x0000A2B5007E6F81 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'614908e0-01bd-49e5-b9c8-bd9d58541a6c', N'kunthea.ms', N'kunthea.ms', NULL, 0, CAST(0x0000A8DB006CCD3A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd23e1dd9-3ac5-4a14-abf3-e00d052a9c91', N'limsron.n', N'limsron.n', NULL, 0, CAST(0x0000A459008D3A18 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'ab3a0853-62c4-40ca-89d3-ea4b27e787d9', N'LIN.R', N'lin.r', NULL, 0, CAST(0x0000A24D00135C6C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'5cbcef54-e6c2-4327-9f34-f7debf004840', N'lina.s', N'lina.s', NULL, 0, CAST(0x0000A2A000186B1E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'188f82b7-6c96-4481-a759-d393efef2726', N'ly.nk', N'ly.nk', NULL, 0, CAST(0x0000A5FD00846BFE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'19c22f47-b114-44b0-8340-bea951de1590', N'LYHOUNG.K', N'lyhoung.k', NULL, 0, CAST(0x0000A24B007861B6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd768d6ce-2a92-498b-a68c-4a374f6e1b12', N'malay.k', N'malay.k', NULL, 0, CAST(0x0000A2A000181830 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f17a5116-b182-4f02-85b2-3dfe6f2272e0', N'mapheap.c', N'mapheap.c', NULL, 0, CAST(0x0000A50C001914CF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'32c52738-0a3a-42ca-a381-0322f3f06426', N'MEACH SOPHEAP', N'meach sopheap', NULL, 0, CAST(0x0000A24B00693CBA AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'4600bf84-5cf0-460d-aa61-845a96063500', N'MINH.TC', N'minh.tc', NULL, 0, CAST(0x0000A24B0077EB94 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'16cc69f6-d23d-4979-b116-52f70156b6ce', N'MOLIKA.C', N'molika.c', NULL, 0, CAST(0x0000A24B0076E859 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'871d88b9-048a-403a-86d4-5094593d378a', N'MONIRORT.LS', N'monirort.ls', NULL, 0, CAST(0x0000A24B007796B2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'42485452-4d55-4168-8882-279c007524f0', N'nghia.lq', N'nghia.lq', NULL, 0, CAST(0x0000A6BA00AC1B7B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'8663da53-138f-4956-b578-2e816b93d38d', N'nika.k', N'nika.k', NULL, 0, CAST(0x0000A6FE006FE2D0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'8b0fea3b-74df-4cf4-9c3c-02b053e3f246', N'oly.dt', N'oly.dt', NULL, 0, CAST(0x0000A23E00395DF0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b22b5067-d090-456e-830f-ba4566b7cae2', N'phallyda.m', N'phallyda.m', NULL, 0, CAST(0x0000A78D009324C4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a27d4aa8-4ebc-4466-aedc-829558e13802', N'phanratana.b', N'phanratana.b', NULL, 0, CAST(0x0000A4BC009A0DD4 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'0e8e61e4-75e1-4780-b2b5-c09a885a1e26', N'pharin.n', N'pharin.n', NULL, 0, CAST(0x0000A3F0002ADDA2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6d5602ac-1a24-4143-8b0f-fe874c7b4bc6', N'phuong.dth', N'phuong.dth', NULL, 0, CAST(0x0000A75A0090DD42 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'79f1e422-9c7f-444e-83c7-22519feaebdd', N'PISEY.H', N'pisey.h', NULL, 0, CAST(0x0000A24B0078ACAF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6469bdec-8cbb-4b0e-88ff-811622e0591e', N'pisey.m', N'pisey.m', NULL, 0, CAST(0x0000A78C00719810 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'0052e83c-5559-4573-b46c-de4bdb8695b9', N'pisith.k', N'pisith.k', NULL, 0, CAST(0x0000A5EF0021A71A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6eb4deab-e900-4bbc-a2ae-92c5c137e080', N'quy.hv', N'quy.hv', NULL, 0, CAST(0x0000A4DC006D1E2E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'21a7e83e-1477-4844-9a0a-6742519add44', N'Rachana.k', N'rachana.k', NULL, 0, CAST(0x0000A28B003A654E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a5252fdd-80e3-48cf-9c8a-d3e3bc93c691', N'RAKSMEY.C', N'raksmey.c', NULL, 0, CAST(0x0000A24B00768E88 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'2ed874ab-c6c2-422e-89cf-85afa28f5c51', N'sakada.s', N'sakada.s', NULL, 0, CAST(0x0000A20D002A7646 AS DateTime))
GO
print 'Processed 500 total records'
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'e1ebf000-d320-4ce5-a008-4cf8460a8d67', N'savtey.k', N'savtey.k', NULL, 0, CAST(0x0000A28B003A102B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'9063a346-d423-4939-8f8c-8b7e03ec995c', N'Seavlang.l', N'seavlang.l', NULL, 0, CAST(0x0000A37D0081CF54 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'e726daa1-8294-4b5f-b663-149689754a30', N'SELA.H', N'sela.h', NULL, 0, CAST(0x0000A24B0074B568 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b248b2f9-3484-46f3-8f0d-ae316f60e09e', N'sithan.p', N'sithan.p', NULL, 0, CAST(0x0000A6D3007F453A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'5f960876-4125-43bc-9bc7-6c696fb7eeaa', N'socheata.c', N'socheata.c', NULL, 0, CAST(0x0000A59A006D0019 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a019a76d-2f34-4240-9a39-2fefdd15f8f5', N'Socheata.s', N'socheata.s', NULL, 0, CAST(0x0000A337002232B6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'3d0d0ac4-6167-4927-ab86-4010791e75c5', N'sodanet.p', N'sodanet.p', NULL, 0, CAST(0x0000A6880030121E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'c3ca08bb-309c-4405-b594-6bfa1bced4ee', N'Sokdany.k', N'sokdany.k', NULL, 0, CAST(0x0000A24B007555E6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'424e4c51-1f8e-4dcd-a7dc-adde18cf9b49', N'sokhouy.l', N'sokhouy.l', NULL, 0, CAST(0x0000A20D0029FF47 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b4a95059-8b5f-4f20-bf5f-204f3f50fe43', N'soklinda.k', N'soklinda.k', NULL, 0, CAST(0x0000A74A00A2F59B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'36481d3a-c9e6-40f6-b593-359459cf6cc3', N'sokunthe.ms', N'sokunthe.ms', NULL, 0, CAST(0x0000A8DB006DB1B0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'078cf4e8-26ce-44e1-901d-896006a3a15f', N'sokunthea.m', N'sokunthea.m', NULL, 0, CAST(0x0000A68F00AEA461 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'96591e0f-d0c1-494d-9ec2-e8d596e7b6e5', N'SOMALA.L', N'somala.l', NULL, 0, CAST(0x0000A24B007238E0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'742727ea-05de-40d4-b40a-8a548220d627', N'somalal', N'somalal', NULL, 0, CAST(0x0000A22700AB2743 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'c16b570b-c5db-413f-bb52-37c84b88d8e9', N'somanit.l', N'somanit.l', NULL, 0, CAST(0x0000A45D008B9FCB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'399896e5-9d9a-4313-8bff-be1dc7e56552', N'SON.DT', N'son.dt', NULL, 0, CAST(0x0000A24D0012834B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'124116ce-0a19-424b-a9c4-032c5079766e', N'Sony.y', N'sony.y', NULL, 0, CAST(0x0000A24B0072E605 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'9933b671-7bdf-4419-b4c7-66419d889b22', N'Sopanha.s', N'sopanha.s', NULL, 0, CAST(0x0000A31F00886FEC AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f20ee6d6-bcd3-4ec2-b111-2ca211b41473', N'SOPHANETH.K', N'sophaneth.k', NULL, 0, CAST(0x0000A24B007640F2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'cb25cc27-d3a0-4bfe-a974-00c31db3f586', N'Sophanna.p', N'sophanna.p', NULL, 0, CAST(0x0000A3D800BD2B4A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'28c13a7c-f5fe-45c4-a481-4529840254ec', N'SOPHEAK.S', N'sopheak.s', NULL, 0, CAST(0x0000A24B00744286 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd3a64794-3d18-444a-a2e7-32bcd36bf2bc', N'SOPHEAP.M', N'sopheap.m', NULL, 0, CAST(0x0000A24B006A70B1 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6aaa2c51-0eca-458a-ae3a-39e64f31f0e4', N'SOPHY.M', N'sophy.m', NULL, 0, CAST(0x0000A24B00750648 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a97b9b91-390b-4a56-b6f1-39f051840e3c', N'soratha.c', N'soratha.c', NULL, 0, CAST(0x0000A20D0029B20E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f29880ee-6161-44ce-912c-784751099884', N'sovanarong.p', N'sovanarong.p', NULL, 0, CAST(0x0000A6D3007E8F07 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'93c73be1-3101-4a92-ba15-4063a817de50', N'sreykhouch.b', N'sreykhouch.b', NULL, 0, CAST(0x0000A6CC0045E1A0 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'561f574e-68f6-4746-9cb0-8e6f9b93ec52', N'Sreykhouch.d', N'sreykhouch.d', NULL, 0, CAST(0x0000A24B007476F5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'ffe455d3-c3d0-483c-809b-77788f6d3b6a', N'sreymom.r', N'sreymom.r', NULL, 0, CAST(0x0000A4DD0092213D AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'01141d90-6188-47ba-a93a-a61c95af4768', N'sreyneath.s', N'sreyneath.s', NULL, 0, CAST(0x0000A3E8003875ED AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd5353fb2-f0cc-48af-96cf-0c97bc90343e', N'Sreynuth.v', N'sreynuth.v', NULL, 0, CAST(0x0000A37D00817358 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'65c9aa89-5aba-48c5-a11c-1a055653b1d2', N'sreypov.s', N'sreypov.s', NULL, 0, CAST(0x0000A67C003FABA9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'6e4826c1-2411-406b-8b46-458296c58ee3', N'sreysros.p', N'sreysros.p', NULL, 0, CAST(0x0000A83A006CFC6E AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a0932613-5194-4b92-bed3-b824f0394b93', N'suphea.s', N'suphea.s', NULL, 0, CAST(0x0000A46B00862041 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'2a47e31a-a728-4238-9edb-a2da30002987', N'TANA.TR', N'tana.tr', NULL, 0, CAST(0x0000A24B00795E24 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'1dc3e64b-a1d5-435e-8776-de7eb5c48997', N'testkh', N'testkh', NULL, 0, CAST(0x0000A20600823671 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'86c7361e-3248-4b66-bd4a-627734f58689', N'testkh1', N'testkh1', NULL, 0, CAST(0x0000A206008281FF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd0f4c58e-de54-460e-8b1e-0d95297f9a47', N'Tha.s', N'tha.s', NULL, 0, CAST(0x0000A24B007412AF AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b14425fb-4dcf-44fa-bc27-10423b6e2e54', N'thanh.th', N'thanh.th', NULL, 0, CAST(0x0000A2B600453106 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'dee7a1f2-af47-4591-8ca8-e0702e5e19dd', N'THAVRAT.S', N'thavrat.s', NULL, 0, CAST(0x0000A24B00773FE6 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'0c2662f4-6a95-411c-866a-3368ac680919', N'THEAN.PM', N'thean.pm', NULL, 0, CAST(0x0000A24B0056FE8A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'2e2c209e-fa86-4e6e-883e-ac5f9e374830', N'TUAN.NT', N'tuan.nt', NULL, 0, CAST(0x0000A24D00102DBB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'fc520102-3202-4fe8-9f89-a4e6b6d6df49', N'Tuc.ht', N'tuc.ht', NULL, 0, CAST(0x0000A24B00726ABB AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'b08a9095-43ce-4f56-a762-a4f71200280c', N'van.lth', N'van.lth', NULL, 0, CAST(0x0000A2B60044B62B AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'e6a5f4b6-eb83-4cb9-9bb5-3e8f2a02384b', N'VAN.NTK', N'van.ntk', NULL, 0, CAST(0x0000A24B007137D2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'8d631dab-4042-4764-a41d-5387dccd081d', N'VEANG.L', N'veang.l', NULL, 0, CAST(0x0000A24B006ADF7A AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a17783fa-4921-4a7b-a928-b27d65be86fe', N'VIET.NQ', N'viet.nq', NULL, 0, CAST(0x0000A24D000FEC9C AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'312655a7-178a-4b98-a19a-5a3321193de6', N'VOLEAK.S', N'voleak.s', NULL, 0, CAST(0x0000A24D0013A3E2 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'd82aecb5-b330-4f24-be69-b2ca0ab5e2c6', N'VOLINETH.K', N'volineth.k', NULL, 0, CAST(0x0000A24B0048E753 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a5bd6edf-24a3-41bf-b918-99f8e01318d3', N'vorlack.c', N'vorlack.c', NULL, 0, CAST(0x0000A59A006DBD59 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'f9eccf07-9c02-4ee3-a976-a64b831a202f', N'vuochnea.s', N'vuochnea.s', NULL, 0, CAST(0x0000A5020074D9B9 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'543cf25c-ad14-4bb8-85ec-b90d6ab46919', N'yekleng.k', N'yekleng.k', NULL, 0, CAST(0x0000A68800306E64 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'efad2c09-4eb3-4ce8-9f73-9359fbb3920d', N'younic.t', N'younic.t', NULL, 0, CAST(0x0000A44C00830B3A AS DateTime))
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK__aspnet_P__CD67DC5859063A47] PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__aspnet_R__8AFACE1B4222D4EF] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'45fe1366-0e52-4315-97a7-3a4badea91a4', N'CEO', N'ceo', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'db61a78e-ebb2-4eb0-8927-cf9d30dfd001', N'Inputer', N'inputer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'6eafa856-c7e5-4956-ae77-8b04387a1b80', N'VicePresident', N'vicepresident', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'80f0cdf9-49dd-4681-b1a7-08a6f9076ee3', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28', N'Viewer', N'viewer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23', N'DVKH.Authoriser', N'dvkh.authoriser', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'dfb769b5-0187-41b4-af1e-7284bcdbb404', N'DVKH.Inputter', N'dvkh.inputter', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'035d9d0b-ffdb-4c08-b706-154aebaf2545', N'0cb24690-9d2b-4461-8cf2-37efaa0b3430', N'Super', N'super', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1', N'DVKH.Authoriser', N'dvkh.authoriser', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'2510a876-9d74-4bbf-b073-67667e839294', N'DVKH.Inputter', N'dvkh.inputter', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'fdcd610e-5a48-4bdc-8c8b-1a56c7baf0ae', N'e1558314-997d-41e0-87c1-28cebf0c9aee', N'Super', N'super', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'e441ec8e-7f3a-46c2-a139-668f43f4e748', N'Admin', N'admin', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'9870e82b-b4f4-4120-8b52-c1389249765f', N'BranchOfficer', N'branchofficer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3', N'Deputy', N'deputy', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd', N'Officer', N'officer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'899bdd0e-6a1a-47c7-80c9-7a0fb96037f9', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4', N'RMDOfficer', N'rmdofficer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'6d174233-5380-46aa-9784-39a0b249c3db', N'FTP.Authoriser', N'ftp.authoriser', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f', N'FTP.Inputter', N'ftp.inputter', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'c2ab310e-02e9-4a15-9fa7-86da1f70c2c5', N'ea098045-17fc-4b2d-88e4-319b692392ce', N'FTP.Super', N'ftp.super', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9be12629-71b3-4248-8c13-5e233e85fa4b', N'Administrator', N'administrator', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861', N'Super', N'super', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'2944bf0c-b149-459b-b1e0-885da123c4b0', N'2e6563fb-c420-4ceb-9b56-18867043909a', N'User', N'user', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'0c69e54d-455a-48b5-8ecd-908e224ca468', N'Manager', N'manager', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'6263ffe4-2687-4f74-98ab-9a71b80c8538', N'0e9818dd-a3ae-458c-b80a-dbff39abc0ce', N'Viewer', N'viewer', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'685c3e9c-0cf5-4f4c-b0e1-6d5b022cf8ad', N'DVKH.Authoriser', N'dvkh.authoriser', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec', N'DVKH.Inputter', N'dvkh.inputter', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'381e2e28-9cfb-4f23-b95d-ee1bc7739f19', N'b889ee7b-67c6-44fa-88b3-2806b5ae168f', N'Super', N'super', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'2f613ed7-6b46-40d0-9a82-77fb497c6594', N'DVKH.Authoriser', N'dvkh.authoriser', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'a689a4d5-9a40-4987-98bf-a52809317668', N'DVKH.Inputter', N'dvkh.inputter', NULL)
INSERT [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'a83a3c78-c046-40d9-9684-efa35cc120a9', N'ebbbcaa3-d22d-4a6a-80b4-3a17838f8f35', N'Super', N'super', NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'71a2a231-8143-47d2-a7c8-008ddd70670c', N'T24UserName:S:0:7:FullName:S:7:16:T24SignOnName:S:23:9:BranchId:S:32:9:DepartmentId:S:41:2:', N'VIET.NQNGUYEN QUOC VIETKH9020104KH0010902CS', 0x, CAST(0x0000A24D00105C09 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f71101f9-3f1b-450c-9beb-00c46f151570', N'FullName:S:0:12:T24SignOnName:S:12:10:T24UserName:S:22:10:BranchId:S:32:9:DepartmentId:S:41:2:', N'Liv SomanithSOMANITH.LSOMANITH.LKH0010906CR', 0x, CAST(0x0000A8BF001F4153 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9c148b50-3b7e-4601-9df8-035aaa886a11', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:9:BranchId:S:29:9:DepartmentId:S:38:2:', N'Siv SopheapSOPHEAP.SSOPHEAP.SKH0010001RM', 0x, CAST(0x0000A865003B99EA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'7034766f-33ac-417c-877f-03dabdcbf01f', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:9:DepartmentId:S:38:2:', N'Liv SomanitKH0010906KH9062106somanit.lCS', 0x, CAST(0x0000A4A4009B70B4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'30657f2e-ea37-4b03-acac-054f03bbb52e', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:10:DepartmentId:S:43:2:', N'Sourng KanhawatKH0010906KH9062103KANHAWAT.SCS', 0x, CAST(0x0000A5B8007B9760 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9cf2ead7-2ec7-4a72-a612-0576f23dd173', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Sor SakadaKH0010905KH9052107SAKADA.SCS', 0x, CAST(0x0000A4210096A4A7 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0671de15-55ed-4818-a515-06a2b0006e4d', N'T24UserName:S:0:9:FullName:S:9:9:T24SignOnName:S:18:9:BranchId:S:27:9:DepartmentId:S:36:2:', N'SOPHEAP.MSOPHEAP.MKH0012124KH0010001CS', 0x, CAST(0x0000A24B00693CBA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'bdba508c-2822-4379-bd51-06fdd0006a64', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:8:BranchId:S:28:9:DepartmentId:S:37:2:', N'Chan MolikaKH9032108MOLIKA.CKH0010001CM', 0x, CAST(0x0000A85D0039A043 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fe9917a9-b2bc-4b50-9098-070f208dcf6f', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'Hour SarakKH0014226KH0014226KH0010001CM', 0x, CAST(0x0000A90A007ED72C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'777dd426-7403-4d30-84d3-087b21f3f490', N'FullName:S:0:10:T24SignOnName:S:10:6:T24UserName:S:16:6:BranchId:S:22:9:DepartmentId:S:31:2:', N'ROURM DINADINA.RDINA.RKH0010907CR', 0x, CAST(0x0000A8A20028AA90 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0c87f728-411b-4b38-9b87-096be7b3cb62', N'FullName:S:0:15:T24SignOnName:S:15:9:T24UserName:S:24:9:BranchId:S:33:9:DepartmentId:S:42:2:', N'Chhoung ChannryCHANNRY.CCHANNRY.CKH0010001CM', 0x, CAST(0x0000A8A500220FE9 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'38cb5b75-cb70-4951-a606-0ac540d9fc07', N'T24UserName:S:0:9:FullName:S:9:12:T24SignOnName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'SOPHEAK.SSeng SopheakKH0012210KH0010001IP', 0x, CAST(0x0000A24B0074428B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'33694099-4b80-4a8b-80b1-0ad89ba8bf69', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Ly Sam AthKH0010001KH0014306SAMATH.LPL', 0x, CAST(0x0000A5C500671150 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f55a6f22-cc45-4678-a91a-0bfe43fa5a6e', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:10:BranchId:S:33:9:DepartmentId:S:42:2:', N'Saman MeasmonyKH9063104MEASMONY.SKH0010001CM', 0x, CAST(0x0000A8A50020FF5D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e577d82a-ba13-44a5-a574-0ebd0f10e0fe', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:9:DepartmentId:S:41:2:', N'Soeung SovannaKH0010906KH9064103SOVANNA.SFA', 0x, CAST(0x0000A5DA006E1745 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'20df5152-62b7-4453-880c-0fecc5b94617', N'FullName:S:0:14:T24SignOnName:S:14:12:T24UserName:S:26:12:BranchId:S:38:9:DepartmentId:S:47:2:', N'Nov SovanthidaSOVANTHIDA.NSOVANTHIDA.NKH0010001CM', 0x, CAST(0x0000A8A50021C17F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'31a70f9c-b298-4b72-a25f-102583eda12a', N'FullName:S:0:17:BranchId:S:17:9:T24SignOnName:S:26:8:T24UserName:S:34:17:DepartmentId:S:51:2:', N'Nguyễn Mạnh CườngKH0010001CUONG.NMNguyen Manh CuongIP', 0x, CAST(0x0000A632010304FF AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'373a2074-84a7-4330-9989-1077601ddfc3', N'FullName:S:0:10:T24SignOnName:S:10:7:T24UserName:S:17:7:BranchId:S:24:9:DepartmentId:S:33:2:', N'Meas SeymaSEYMA.MSEYMA.MKH0010906CR', 0x, CAST(0x0000A8BF001F31E0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2de925a4-b186-4472-8cde-10a7298d0efa', N'FullName:S:0:13:T24SignOnName:S:13:11:T24UserName:S:24:11:BranchId:S:35:9:DepartmentId:S:44:2:', N'Sen SokhemeraSOKHEMERA.SSOKHEMERA.SKH0010901CS', 0x, CAST(0x0000A8A10011F1BA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a8944be6-9be4-47ed-88e8-10ae6a097b8c', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Hong SamnangSAMNANG.HSAMNANG.HKH0010907CR', 0x, CAST(0x0000A8A20027713C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'7ffcb00a-1dbd-4e18-80ff-1172a8216db0', N'FullName:S:0:11:T24SignOnName:S:11:7:T24UserName:S:18:7:BranchId:S:25:9:DepartmentId:S:34:2:', N'Vu Thi LieuLIEU.VTLIEU.VTKH0010001RM', 0x, CAST(0x0000A865003B1B11 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b7f38b6c-37aa-4320-983d-12d5e9f79b20', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:7:DepartmentId:S:35:2:', N'KHIM MALAYKH0010905KH9052104MALAY.KCS', 0x, CAST(0x0000A2A000181834 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b0a64ba3-541b-4422-844a-17b0db169df9', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:9:DepartmentId:S:39:2:', N'Pich KongkeaKH0010907KH9070102kongkea.pCS', 0x, CAST(0x0000A672007C8EC7 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f59a2707-3a43-49ff-a221-17badd6d4e7c', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Seng SopanhaKH0012134Sopanha.sKH0010001CM', 0x, CAST(0x0000A86B002BC8EF AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'57dcd054-799e-4c8e-99ea-182b355ddced', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:8:T24UserName:S:33:9:DepartmentId:S:42:2:', N'Tran Thi My HanhKH0010001HANH.TTMKH0010109HR', 0x, CAST(0x0000A5F00045AA5D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'69eec27e-11a2-4e20-bff0-1892965d4ace', N'FullName:S:0:12:T24SignOnName:S:12:10:T24UserName:S:22:10:BranchId:S:32:9:DepartmentId:S:41:2:', N'Mak ManorithMANORITH.MMANORITH.MKH0010904CR', 0x, CAST(0x0000A8A200790DA1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1068d9ad-690a-4a88-a0b7-1bc31104f645', N'FullName:S:0:12:T24SignOnName:S:12:7:T24UserName:S:19:7:BranchId:S:26:9:DepartmentId:S:35:2:', N'Đỗ Việt HùngHUNG.DVHUNG.DVKH0010001GP', 0x, CAST(0x0000A89C004B42B2 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'4f44a336-576e-4b3a-85b0-1c380dfee904', N'FullName:S:0:11:T24SignOnName:S:11:6:T24UserName:S:17:11:BranchId:S:28:9:DepartmentId:S:37:2:', N'Lâm Văn HảiHAI.LVLam Van HaiKH0010904GP', 0x, CAST(0x0000A8A200755E97 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd345cb4a-b561-4aa5-b995-1cb55b5fb97c', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:8:DepartmentId:S:40:2:', N'Than Thi DuongKH0010001KH0014109DUONG.TTFA', 0x, CAST(0x0000A5C5003650ED AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'74e27d82-63f4-4709-aab7-1f90429bf2b3', N'FullName:S:0:17:T24SignOnName:S:17:9:T24UserName:S:26:9:BranchId:S:35:9:DepartmentId:S:44:2:', N'Nguyen Van TruongTRUONG.NVTRUONG.NVKH0010905GP', 0x, CAST(0x0000A89B00A68585 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6e0bc385-fe9b-49b5-a091-1fefe21b7ee5', N'FullName:S:0:9:T24SignOnName:S:9:7:T24UserName:S:16:7:BranchId:S:23:9:DepartmentId:S:32:2:', N'Soy BophaBOPHA.SBOPHA.SKH0010001RM', 0x, CAST(0x0000A865003A75C4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'df62179a-6d5d-4c6d-9ff2-2096b49e0c90', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:9:DepartmentId:S:39:2:', N'KHUN SOKDANYKH0010904KH9042103Sokdany.kCS', 0x, CAST(0x0000A68A00429956 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e0ff0d6b-d20c-480d-8ec9-2102ee9e6815', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:10:DepartmentId:S:41:2:', N'Chan KimsoungKH0010902KH9022119kimsoung.cCS', 0x, CAST(0x0000A67400472439 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2932b20f-edbe-41c4-8997-224431413a56', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:9:BranchId:S:29:9:DepartmentId:S:38:2:', N'Hap SopheakSOPHEAK.HSOPHEAK.HKH0010001CM', 0x, CAST(0x0000A8A500224C22 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2cc9be95-70fc-4a36-8ae7-2274aabad8fc', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:7:T24UserName:S:26:8:DepartmentId:S:34:2:', N'inpay testKH0010001INPAY01INPAY.01CS', 0x, CAST(0x0000A2AE00C95851 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'aefdf7d8-388b-4fa6-856c-22d1b74a7c8b', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Pen SithanKH0010001KH0012149SITHAN.PCS', 0x, CAST(0x0000A6E9006CF3E7 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'06483bd9-11f1-423b-9911-2498c59c076b', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:7:DepartmentId:S:34:2:', N'Men SophyKH0010905KH9054103SOPHY.MCS', 0x, CAST(0x0000A5D8002D4D7C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'756e51a0-3944-4ed6-881e-26616c8c610e', N'T24UserName:S:0:5:FullName:S:5:8:T24SignOnName:S:13:9:BranchId:S:22:9:DepartmentId:S:31:2:', N'hengkKim HengKH0012204KH0010001CS', 0x, CAST(0x0000A22700A9C74F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3d5f51a3-6b5b-47ed-96bf-26f3fd556d57', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:10:DepartmentId:S:41:2:', N'Chan SocheataKH0010903KH9032116SOCHEATA.CCS', 0x, CAST(0x0000A59A006D0034 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'24f19be8-6d69-4ee0-ad04-27b78b26cbad', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:8:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Thong SamAnKH0010001KH100010KH100010CD', 0x, CAST(0x0000A77D0090E58F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2c54b878-1ffe-4db0-862c-27d035c4382c', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:10:DepartmentId:S:39:2:', N'So ChhorikaKH0010902KH9022118chhorika.sCS', 0x, CAST(0x0000A6B100A00C62 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a7e77bd5-0f93-4406-b734-286d29367717', N'FullName:S:0:17:T24SignOnName:S:17:9:T24UserName:S:26:9:BranchId:S:35:9:DepartmentId:S:44:2:', N'Nguyen Van PhuongPHUONG.NVPHUONG.NVKH0010904CR', 0x, CAST(0x0000A8A20075B705 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'435928e0-f480-4427-8de2-29cb6f2356ee', N'FullName:S:0:7:T24SignOnName:S:7:9:T24UserName:S:16:6:BranchId:S:22:9:DepartmentId:S:31:2:', N'PO EEFAKH9022123EEFA.PKH0010902CS', 0x, CAST(0x0000A80100712CEE AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'04445800-0119-43ed-990e-2a97134dd0b6', N'FullName:S:0:13:T24SignOnName:S:13:6:T24UserName:S:19:6:BranchId:S:25:9:DepartmentId:S:34:2:', N'Vu Thi Hoa AnAN.VTHAN.VTHKH0010001RM', 0x, CAST(0x0000A865003B4F22 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'ce23ed2d-14bc-4062-9892-2ab6fe50b280', N'FullName:S:0:9:T24SignOnName:S:9:7:T24UserName:S:16:7:BranchId:S:23:9:DepartmentId:S:32:2:', N'LIM MARDYMARDY.LMARDY.LKH0010901CS', 0x, CAST(0x0000A8BF001FE07B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'4a16cdbe-6351-45de-96de-2cbed1d0c3fc', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Sang SokanhaSOKANHA.SSOKANHA.SKH0010904CR', 0x, CAST(0x0000A8A200794937 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'ce3bdcbf-933a-4280-84b5-2cef12282abf', N'FullName:S:0:8:BranchId:S:8:9:T24SignOnName:S:17:10:T24UserName:S:27:10:DepartmentId:S:37:2:', N'HongmengKH0010001HONGMENG.CHONGMENG.CAD', 0x, CAST(0x0000A63A009B2257 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'5c8fe39b-25f7-423d-bfe5-2d39b25deb6a', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:7:DepartmentId:S:37:2:', N'Thong Sam AnKH0010904KH9044104SAMAN.TFA', 0x, CAST(0x0000A5C600328F6A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'711dab45-4d26-4913-9eb7-2de558b24782', N'T24UserName:S:0:9:FullName:S:9:12:T24SignOnName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'LYHOUNG.KKong LyhoungKH9012113KH0010901CS', 0x, CAST(0x0000A24B007861BB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'20c45f26-56f6-4898-ade7-30bfe441f7b9', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:9:DepartmentId:S:37:2:', N'Ly SokhouyKH0010906KH9062102SOKHOUY.LCS', 0x, CAST(0x0000A4A4009ADF07 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0ddc971f-eac5-4c6c-85a6-3102e784f471', N'FullName:S:0:18:BranchId:S:18:9:T24SignOnName:S:27:8:T24UserName:S:35:18:DepartmentId:S:53:2:', N'Nguyễn Trung ThànhKH0010905THANH.NTNguyen Trung ThanhGP', 0x, CAST(0x0000A63200FE6F50 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'cfc0a3d2-41ff-4683-bb5c-313d285b5a93', N'FullName:S:0:13:T24SignOnName:S:13:9:T24UserName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'Ngun Lim SronKH9053103limsron.nKH0010905CS', 0x, CAST(0x0000A89B00A607BA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'8596ea3f-41e9-473b-a928-32a658256879', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:11:DepartmentId:S:42:2:', N'San KhanpiseyKH0010001KH0012208KHANPISEY.SIP', 0x, CAST(0x0000A5FD00820711 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e92a4bca-1456-42d5-ab8b-35651065e67f', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:7:T24UserName:S:32:16:DepartmentId:S:48:2:', N'Nguyễn Hồng DũngKH0010902DUNG.NHNguyen Hong DungGP', 0x, CAST(0x0000A63200FB5315 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f0a70c15-3362-49b8-adb1-357661c692e1', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Kim ChandavyKH9012111CHANDAY.KKH0010901CS', 0x, CAST(0x0000A8A20073CCC5 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'736fd79a-c166-4ee6-af9b-3867cd99fe49', N'FullName:S:0:13:T24SignOnName:S:13:9:T24UserName:S:22:6:BranchId:S:28:9:DepartmentId:S:37:2:', N'Duch Thou OlyKH9012104OLY.DTKH0010901CS', 0x, CAST(0x0000A8A10012097F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b01ca189-a9d1-4368-819d-38ede56e4e44', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:8:BranchId:S:28:9:DepartmentId:S:37:2:', N'Kung SavteyKH9022118SAVTEY.KKH0010902CM', 0x, CAST(0x0000A8B800170711 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'604301d3-86b9-4047-8945-39d94c74eaf5', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Nou PharinKH0010907KH9072107pharin.nCS', 0x, CAST(0x0000A672007D9692 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'bea95a00-9571-46d6-a37e-3ad8b32e2650', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:7:DepartmentId:S:35:2:', N'EUNG KOSALKH0010902KH9022111KOSAL.ECS', 0x, CAST(0x0000A2B5007E6F9B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'ef6e23e3-ef96-466d-8c38-3c4695f07f9a', N'T24UserName:S:0:6:FullName:S:6:11:T24SignOnName:S:17:9:BranchId:S:26:9:DepartmentId:S:35:2:', N'DAT.LVLai Van DatKH9030102KH0010903CS', 0x, CAST(0x0000A24B00782F75 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'4c81cfcd-b1be-4ec4-90a2-3ce7b87ddda3', N'FullName:S:0:13:T24SignOnName:S:13:9:T24UserName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'Prach PhearomPHEAROM.PPHEAROM.PKH0010905CS', 0x, CAST(0x0000A8BF001FACCA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'84e4f419-1d31-4902-a11e-3d63035f4cde', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:6:BranchId:S:29:9:DepartmentId:S:38:2:', N'Duong Dong AnhKH0014218Anh.ddKH0010001IT', 0x, CAST(0x0000A907001695F4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6c498537-2640-47f9-a162-3db17262067c', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'VY SODALINSODALIN.VSODALIN.VKH0010905CS', 0x, CAST(0x0000A8BF001F8CCB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'ace4b264-5d47-41d7-94d3-4116743b120e', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:7:T24UserName:S:32:16:DepartmentId:S:48:2:', N'Nguyễn Xuân DũngKH0010901DUNG.NXNguyen Xuan DungGP', 0x, CAST(0x0000A63200F9DFCD AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'06a5421f-dba0-4da8-a612-41d55b2284f0', N'FullName:S:0:11:T24SignOnName:S:11:6:T24UserName:S:17:6:BranchId:S:23:9:DepartmentId:S:32:2:', N'Hoy Vor KinKIN.HVKIN.HVKH0010901CS', 0x, CAST(0x0000A8A20074274B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'56940e2a-1e0b-4336-80c1-42b3c20340f7', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:6:DepartmentId:S:33:2:', N'Yous DayaKH0010905KH9054102DAYA.YHR', 0x, CAST(0x0000A5D8002C2E0F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'809f522c-4601-43c7-a547-42ef91a6d353', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:9:DepartmentId:S:38:2:', N'Kao ChanthaKH0010907KH9072106CHANTHA.KCS', 0x, CAST(0x0000A672007F01E5 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'79f3540a-1050-43c1-89b9-448914838ae4', N'FullName:S:0:8:BranchId:S:8:9:T24SignOnName:S:17:9:T24UserName:S:26:7:DepartmentId:S:33:2:', N'Hy DanetKH0010907KH9072103DANET.HCS', 0x, CAST(0x0000A672007A6BEB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'63b6c79b-9370-43f3-aa29-45525ee0c126', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:7:DepartmentId:S:34:2:', N'ITH DAVINKH0010001KH0012143DAVIN.ICS', 0x, CAST(0x0000A516002AD427 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd48eb814-c202-4b7e-bbc9-4805090a7f24', N'FullName:S:0:10:T24SignOnName:S:10:8:T24UserName:S:18:8:BranchId:S:26:9:DepartmentId:S:35:2:', N'Kim ChannaCHANNA.KCHANNA.KKH0010904CR', 0x, CAST(0x0000A8A20076431C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'56665ee9-e136-44da-8804-48af86ad2464', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Sao SupheaKH0010905KH9052110suphea.sCS', 0x, CAST(0x0000A46B00862053 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e8933eba-e1f9-47a3-beed-497c50d653dd', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:8:DepartmentId:S:39:2:', N' KHENG MONIKAKH0010903KH9034103MONIKA.KFA', 0x, CAST(0x0000A5C4003DAA71 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6cc3d8c5-2814-4604-b2e0-4985c4cd726f', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:7:T24UserName:S:30:14:DepartmentId:S:44:2:', N'Phạm Đăng TuấnKH0010001TUAN.PDPham Dang TuanBD', 0x, CAST(0x0000A63201057021 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2b5ea8a7-8f6d-4018-9655-4bfe9f09663d', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:7:DepartmentId:S:36:2:', N'Le Huy KienKH0010001KH0013102KIEN.LHCM', 0x, CAST(0x0000A63200FA30D2 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9d2ce3ba-3b56-457d-a596-4e58e4dbfcef', N'FullName:S:0:12:T24SignOnName:S:12:12:T24UserName:S:24:12:BranchId:S:36:9:DepartmentId:S:45:2:', N'Kaob BunrithKAOB BUNRITHKAOB BUNRITHKH0010902CM', 0x, CAST(0x0000A8970069D235 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'62b9ca23-a805-4b36-8a80-4ee43249ae54', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:8:BranchId:S:28:9:DepartmentId:S:37:2:', N' Pol VannakKH0012115VANNAK.PKH0010001CD', 0x, CAST(0x0000A89C004C003A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'cab2232f-cb57-402c-bc35-5080c7e4b9b6', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:10:T24UserName:S:32:7:DepartmentId:S:39:2:', N'Đặng Phú QuốcVN0010801HCM8014005QUOC.DPIT', 0x, CAST(0x0000A3AB00256F1B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'293e0888-50c2-47fb-bf81-516f46227f0c', N'FullName:S:0:13:T24SignOnName:S:13:13:T24UserName:S:26:13:BranchId:S:39:9:DepartmentId:S:48:2:', N'Chhen KimhouyCHHEN KIMHOUYChhen KimhouyKH0010001AD', 0x, CAST(0x0000A7AF008E612E AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f1035db7-08ec-4ee5-9511-5173d8a5ef72', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:8:DepartmentId:S:37:2:', N'SEAN HOUYLYKH0010901KH9012114Houyly.sCS', 0x, CAST(0x0000A4C70036EF19 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'203970f2-a035-425b-9245-51d1c08e4869', N'T24UserName:S:0:7:FullName:S:7:14:T24SignOnName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'TANA.TRTran Rach TanaKH9012116KH0010901CS', 0x, CAST(0x0000A24B00795E24 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e24a41b8-4ebc-4ab0-95ee-51d7024598fa', N'FullName:S:0:7:BranchId:S:7:9:T24SignOnName:S:16:9:T24UserName:S:25:5:DepartmentId:S:30:2:', N'SOK KIMKH0010001KH0014312KIM.SPL', 0x, CAST(0x0000A5C4008F4796 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'708e5b5e-41dd-4bed-ab99-54eb800cf226', N'T24UserName:S:0:7:FullName:S:7:19:T24SignOnName:S:26:9:BranchId:S:35:9:DepartmentId:S:44:2:', N'VAN.NTKNguyen Thi kieu VanKH0012201KH0010001IP', 0x, CAST(0x0000A24B007137D2 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'035bc17f-1ada-4c11-ae25-557e66cf40b1', N'FullName:S:0:11:T24SignOnName:S:11:8:T24UserName:S:19:8:BranchId:S:27:9:DepartmentId:S:36:2:', N'Neou SidonaSIDONA.NSIDONA.NKH0010001CD', 0x, CAST(0x0000A86A002DD651 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'89fbf379-fbee-477d-8877-5591b5ffdaef', N'FullName:S:0:7:BranchId:S:7:9:T24SignOnName:S:16:4:T24UserName:S:20:4:DepartmentId:S:24:2:', N'Kim LisKH0010001nullnullIT', 0x, CAST(0x0000A3A3004BA509 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'37055e14-390f-443b-982b-559be7f50a6b', N'FullName:S:0:13:T24SignOnName:S:13:9:T24UserName:S:22:7:BranchId:S:29:9:DepartmentId:S:38:2:', N'Luu Xuan BinhKH0014222BINH.LXKH0010001IT', 0x, CAST(0x0000A9070014A2B9 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'798b9c28-5b8d-4d1a-bf35-55b61ce59aac', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:12:DepartmentId:S:45:2:', N'Buth PhanratanaKH0010901KH9012103phanratana.bCS', 0x, CAST(0x0000A5D800300F00 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c6e22b06-8656-4b2f-a9cb-56e284f8ae76', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:5:DepartmentId:S:38:2:', N'Nguyen Khanh LyKH0010907KH9071234LY.NKCS', 0x, CAST(0x0000A78B007D3C66 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'98551562-b532-4c29-91cd-57e4c1904671', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:8:BranchId:S:31:9:DepartmentId:S:40:2:', N'Bui Tuan DuongKH9051102duong.btKH0010905CS', 0x, CAST(0x0000A89B00A5E235 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'34fb5b9f-27af-4348-9870-5804b5b3f108', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'Hour SarakKH0014226KH0014226KH0010001CM', 0x, CAST(0x0000A90A007F2D59 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9b9b708c-bdea-49a5-86a8-5957d518484b', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:7:T24UserName:S:29:13:DepartmentId:S:42:3:', N'Keo Meng HongKH0010001HONG.KMKeo Meng HongCRI', 0x, CAST(0x0000A63201049711 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f24285eb-126f-4cb8-90e9-59f1af60e4d8', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:10:DepartmentId:S:41:2:', N'MENG PHALLYDAKH0010903KH9032117PHALLYDA.MCS', 0x, CAST(0x0000A78D009324C6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f067ff32-d8e6-4dfa-b5fe-59f3dc7ebc6c', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:10:DepartmentId:S:42:2:', N'Pheng ChannaryKH0010902KH9022120CHANNARY.PCS', 0x, CAST(0x0000A61D0083C9BF AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'5ea6c033-37db-47f4-a1f1-5d282bf4e739', N'FullName:S:0:13:T24SignOnName:S:13:9:T24UserName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'luu xuan binhKH0014222KH0014222KH0010001IT', 0x, CAST(0x0000A92200893989 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2531d195-c1ed-4e57-a26d-5d625f1a2f01', N'FullName:S:0:13:T24SignOnName:S:13:10:T24UserName:S:23:10:BranchId:S:33:9:DepartmentId:S:42:2:', N'TENG ROTHMONYROTHMONY.TROTHMONY.TKH0010907CR', 0x, CAST(0x0000A8A200290B03 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'beae2c9b-7c72-471f-8ecb-5dcf0987bad5', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:10:DepartmentId:S:39:2:', N'KE CHANNARYKH0010902KH9022113CHANNARY.KCS', 0x, CAST(0x0000A609004056E1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9185e417-b520-4c8a-8c6c-5de4eeef23bb', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:9:DepartmentId:S:41:2:', N'CHHUON CHARIYAKH0010902KH9024107CHARIYA.CFA', 0x, CAST(0x0000A5C4008E47D8 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd3776a3f-dc90-4f18-a321-5e6feba5aa2e', N'T24UserName:S:0:9:FullName:S:9:12:T24SignOnName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'KIMLENG.SSour KimlengKH0012209KH0010001IP', 0x, CAST(0x0000A24B0073EFB6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd8db8593-a1c6-4d6e-87c9-5e71f44bb4f6', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:6:DepartmentId:S:33:2:', N'Phan DungKH0010001KH0012131DUNG.PCD', 0x, CAST(0x0000A63200F8BFA0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6cf19991-407f-4762-a36e-5fe005c57703', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:9:T24UserName:S:34:12:DepartmentId:S:46:2:', N'DUONG SREYKHOUCHKH0010904KH9042108Sreykhouch.dCS', 0x, CAST(0x0000A5FC0036A551 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'196ef17e-5d4c-4ea5-8700-6087cbbd934d', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:6:DepartmentId:S:37:2:', N'Phan Minh taiKH0010001KH0014216tai.pmIT', 0x, CAST(0x0000A63200FCD8FB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b03d7fd9-e21d-40d0-b072-60cd76f372dc', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:9:DepartmentId:S:40:2:', N'KHIM RACHANA KH0010902KH9022119RACHANA.KCS', 0x, CAST(0x0000A28B003A6550 AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a4918866-825b-479b-9ab0-6239b5b7a476', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:7:T24UserName:S:28:7:DepartmentId:S:35:2:', N'Trần Bá HiếuKH0010001HIEU.TBHIEU.TBHR', 0x, CAST(0x0000A64100972C99 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9909b226-9dff-45d5-8560-637d1d3602c0', N'FullName:S:0:11:T24SignOnName:S:11:11:T24UserName:S:22:11:BranchId:S:33:9:DepartmentId:S:42:2:', N'Kimsophea.lKIMSOPHEA.LKIMSOPHEA.LKH0010901CR', 0x, CAST(0x0000A8BF0020A745 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'85c7b5a6-bd9f-444e-9e6e-644d9727645a', N'FullName:S:0:17:T24SignOnName:S:17:12:T24UserName:S:29:12:BranchId:S:41:9:DepartmentId:S:50:2:', N'Sreang MunynimethMUNYNIMETH.SMUNYNIMETH.SKH0010904CR', 0x, CAST(0x0000A8A20078997B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'37b54223-91b3-43d2-92c3-6457dc9371f7', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:5:T24UserName:S:26:5:DepartmentId:S:31:2:', N'Dương Vân CơVN0010802CO.DVCO.DVGP', 0x, CAST(0x0000A642001D5E5D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'7bc5f431-10b6-430a-b2ff-66243bde8311', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:2:T24UserName:S:23:2:DepartmentId:S:25:2:', N'Lê  Quốc AnhKH0010001khkhCD', 0x, CAST(0x0000A63A00879BAA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c78e5191-1904-4ff8-8c79-66319554faac', N'T24UserName:S:0:6:FullName:S:6:14:T24SignOnName:S:20:9:BranchId:S:29:9:DepartmentId:S:38:2:', N'ANH.NDNguyen Duy AnhKH9032101KH0010903CS', 0x, CAST(0x0000A24B007878C3 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e9117246-3f84-42d5-a7ed-66b542cc7d55', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:9:DepartmentId:S:39:2:', N'Chea MapheapKH0010905KH9052108MAPHEAP.CCS', 0x, CAST(0x0000A50C001914E3 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'93ff3b39-8740-4e27-a0e1-6897bfefec68', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Kruy LinhourLINHOUR.KLINHOUR.KKH0010906CR', 0x, CAST(0x0000A8BF001F582F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c7902f19-c1ac-4a20-a988-6ac42cacdeec', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Song KimhongKIMHONG.SKIMHONG.SKH0010904CR', 0x, CAST(0x0000A8A20078D100 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'153e9fd4-61ab-4167-93b3-6aef0a25013a', N'T24UserName:S:0:5:FullName:S:5:5:T24SignOnName:S:10:5:BranchId:S:15:9:DepartmentId:S:24:2:', N'Test1Test1Test1KH0010001CD', 0x, CAST(0x0000AA5D0080C24B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'560c2152-624e-4eb2-b646-6c49b3eb3b15', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:6:DepartmentId:S:39:2:', N'DUONG THANH SONKH0010901KH9013205SON.DTCS', 0x, CAST(0x0000A48A00BFABD0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0d93766d-c974-43b6-9b0f-6ca3bec4389e', N'FullName:S:0:14:T24SignOnName:S:14:11:T24UserName:S:25:11:BranchId:S:36:9:DepartmentId:S:45:2:', N'Vong SophearinSOPHEARIN.VSOPHEARIN.VKH0010905CS', 0x, CAST(0x0000A8BF001F9CF3 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fe3b11a5-2e4d-45ae-a7f7-6d49070b2355', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'Hour SarakKH0014226KH0014226KH0010001IT', 0x, CAST(0x0000A929003536DE AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0693fb41-74d7-4457-bf82-6e6e77e85a9b', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:10:DepartmentId:S:40:2:', N'Lim SeavlangKH0010001KH0012145Seavlang.lCD', 0x, CAST(0x0000A5BA002CB93B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'52bbcb57-6a67-4c1a-ac33-70ac757a2b1c', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:6:T24UserName:S:26:11:DepartmentId:S:37:2:', N'Vũ Ngọc HảiKH0010001HAI.VNVu Ngoc HaiPL', 0x, CAST(0x0000A63200FE1EE4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b0967d86-e0f5-47c8-871d-70c669fd77ab', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:10:DepartmentId:S:41:2:', N'Yim Dara NitaKH0010001KH0012133DARANITA.YCS', 0x, CAST(0x0000A30900180239 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'473eb59b-2529-46ee-b754-7450ba7318d8', N'FullName:S:0:11:T24SignOnName:S:11:11:T24UserName:S:22:11:BranchId:S:33:9:DepartmentId:S:42:2:', N'Chann RathaCHANN RATHACHANN RATHAKH0010902CM', 0x, CAST(0x0000A8B80017DA62 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'edac2ee0-b19f-41d0-96b6-762651fb269a', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:8:DepartmentId:S:35:2:', N'Im SithikKH0010901KH9014104SITHIK.IFA', 0x, CAST(0x0000A5C5009CD005 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'672dc2e4-768c-4895-b8b9-77cc45d641b0', N'T24UserName:S:0:9:FullName:S:9:13:T24SignOnName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'SOPHEAP.MMEACH SOPHEAPKH0012124KH0010001CS', 0x, CAST(0x0000A24B006A70B6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2511862f-d732-4cda-8299-796a25ab1b82', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:15:DepartmentId:S:48:2:', N'Trần Huy PhươngKH0010906PHUONG.THTran Huy PhuongGP', 0x, CAST(0x0000A63200FAC55E AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'7f354e21-ebeb-47eb-ae68-79a44684d4a5', N'T24UserName:S:0:5:FullName:S:5:8:T24SignOnName:S:13:9:BranchId:S:22:9:DepartmentId:S:31:2:', N'HUN.PPhan HunKH9032105KH0010903CS', 0x, CAST(0x0000A24B0078BBC4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'43b27eb3-475f-4c4f-944c-7a9da9ac4286', N'T24UserName:S:0:9:FullName:S:9:12:T24SignOnName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'RAKSMEY.CChap RaksmeyKH9032112KH0010903CS', 0x, CAST(0x0000A24B00768E88 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a79563fe-edfb-4022-82f6-7aee2ca2a513', N'FullName:S:0:10:T24SignOnName:S:10:7:T24UserName:S:17:7:BranchId:S:24:9:DepartmentId:S:33:2:', N'Heng TiveaTIVEA.HTIVEA.HKH0010001RM', 0x, CAST(0x0000A865003BD848 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f39a6a55-5d2f-47ff-84e9-7e76f445d064', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:9:DepartmentId:S:40:2:', N'Chhim VorlackKH0010903KH9032111VORLACK.CCS', 0x, CAST(0x0000A59A006DBD5B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'38a91d30-2000-4cb6-906e-7f0b28832994', N'T24UserName:S:0:9:FullName:S:9:13:T24SignOnName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'THAVRAT.SSoeun ThavratKH9032110KH0010903CS', 0x, CAST(0x0000A24B00773FE6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'026c0cbd-9269-4faf-8ecd-7f5a34a34049', N'FullName:S:0:13:BranchId:S:13:9:DepartmentId:S:22:2:', N'AdministratorVN0010801IT', 0x, CAST(0x0000A0B60091ABFB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd49f074b-07e6-4cd9-924a-7faf3c0da791', N'FullName:S:0:15:T24SignOnName:S:15:9:T24UserName:S:24:7:BranchId:S:31:9:DepartmentId:S:40:2:', N'Hoang Viet HungKH9063105HUNG.HVKH0010906FA', 0x, CAST(0x0000A89C004B5819 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'69ec3119-6790-4673-a2d5-8030a365626b', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:6:DepartmentId:S:38:2:', N'TRINH MINH TANKH0010001KH0014105TAN.TMFA', 0x, CAST(0x0000A63200FD0E75 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'719caddf-f326-4b2f-ab50-8398305427cd', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:10:DepartmentId:S:43:2:', N'KHEARN SOKLINDAKH0010001KH0012151SOKLINDA.KCS', 0x, CAST(0x0000A75B001D6902 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'7ac65a29-b033-4387-81bd-84198744986c', N'FullName:S:0:10:T24SignOnName:S:10:8:T24UserName:S:18:8:BranchId:S:26:9:DepartmentId:S:35:2:', N'Hoy ChheutCHHEUT.HCHHEUT.HKH0010901CR', 0x, CAST(0x0000A8A1009464C0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a6242b41-bf83-4728-89dc-845e9c0c4ace', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:9:DepartmentId:S:37:2:', N'EM KACHANAKH0010901KH9012118KACHANA.ECS', 0x, CAST(0x0000A3700072DE57 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'995dae32-20b9-41c5-8732-853f639a1f43', N'FullName:S:0:10:T24SignOnName:S:10:7:T24UserName:S:17:7:BranchId:S:24:9:DepartmentId:S:33:2:', N'Yung SokeaSOKEA.YSOKEA.YKH0010904CR', 0x, CAST(0x0000A8A200778230 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0026a458-b43e-428e-a68b-86ea2127e37c', N'FullName:S:0:13:T24SignOnName:S:13:10:T24UserName:S:23:10:BranchId:S:33:9:DepartmentId:S:42:2:', N'Hour SengthaiSENGTHAI.HSENGTHAI.HKH0010901CR', 0x, CAST(0x0000A8BF0020910C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'34ae60ba-3301-40f5-9668-87e166b169de', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:9:T24UserName:S:34:7:DepartmentId:S:41:2:', N'Nguyễn Quốc HưngKH0010001KH0010108HUNG.NQGP', 0x, CAST(0x0000A6010034E215 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e6a168cf-efb4-449a-a2d0-88f5ddc135a2', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:8:DepartmentId:S:37:2:', N'Khoy PisithKH0010902KH9022121PISITH.KHR', 0x, CAST(0x0000A6F6007AD6F6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'49409b72-421a-4970-a14f-893b629abf3d', N'FullName:S:0:15:T24SignOnName:S:15:12:T24UserName:S:27:12:BranchId:S:39:9:DepartmentId:S:48:2:', N'CHAN SOVANNROTHSOVANNROTH.CSOVANNROTH.CKH0010904CR', 0x, CAST(0x0000A8A20076A1C6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1cf81118-a629-4ff7-a1d0-89fa31cc8cc1', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:5:DepartmentId:S:35:2:', N'Dieu Hong HaKH0010902KH9022109Ha.dhCS', 0x, CAST(0x0000A2F8008162F3 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'24f68d34-4bfd-4656-a485-8a11da01cbf3', N'FullName:S:0:18:T24SignOnName:S:18:9:T24UserName:S:27:9:BranchId:S:36:9:DepartmentId:S:45:2:', N'Nguyen Ngoc PhuongPHUONG.NNPHUONG.NNKH0010001CM', 0x, CAST(0x0000A85D00386539 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'386a5044-2f7d-40e0-8768-8acc3f0eea7c', N'T24UserName:S:0:5:FullName:S:5:7:T24SignOnName:S:12:9:BranchId:S:21:9:DepartmentId:S:30:2:', N'Tha.sSOK THAKH9042107KH0010904CS', 0x, CAST(0x0000A24B007412B3 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2cb35afd-958d-4546-bc43-8c7c6e2e2d09', N'FullName:S:0:17:T24SignOnName:S:17:8:T24UserName:S:25:17:BranchId:S:42:9:DepartmentId:S:51:2:', N'Nguyễn Xuân ChiếnCHIEN.NXChien Nguyen XuanKH0010906GP', 0x, CAST(0x0000A89C004B180A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'2dcb41d7-07df-4022-909b-8dcedc3605c5', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:8:DepartmentId:S:41:2:', N'THACH HUU THANHKH0010901KH9011101THANH.THCS', 0x, CAST(0x0000A2B600453108 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'46c633c7-375d-49b3-849e-8ef63050f75a', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Chet VichethVICHETH.CVICHETH.CKH0010001RM', 0x, CAST(0x0000A86500398636 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3185e96f-64aa-467a-880d-9005e2e4eb98', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:9:T24UserName:S:34:13:DepartmentId:S:47:2:', N'Mean SovannarothKH0010001KH0014110SOVANNAROTH.MFA', 0x, CAST(0x0000A5C500355DA4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'9e04e39c-8878-4e6f-a43a-93b3cd59bd3d', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:11:DepartmentId:S:42:2:', N'Ken SophanethKH0010903KH9032109SOPHANETH.KCS', 0x, CAST(0x0000A61700799326 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd9812476-e3d2-472b-a5d7-968bbc8c52b0', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:10:DepartmentId:S:40:2:', N'San VuochneaKH0010905KH9052111VUOCHNEA.SCS', 0x, CAST(0x0000A5BF00904B29 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c27d064a-8382-4fb8-883b-9784d857602c', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:7:T24UserName:S:32:7:DepartmentId:S:39:2:', N'Nguyễn Quốc TuấnVN0010801TUAN.NQTUAN.NQGP', 0x, CAST(0x0000A642001762A3 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e0b19afc-398a-45d9-abb2-989ecf69a294', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:12:DepartmentId:S:44:2:', N'Bun SreyKhouchKH0010001KH0012148SREYKHOUCH.BCS', 0x, CAST(0x0000A6CC0045E1B6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0d0af9b4-5b07-408e-af07-98a1e0fae271', N'T24UserName:S:0:11:FullName:S:11:13:T24SignOnName:S:24:9:BranchId:S:33:9:DepartmentId:S:42:2:', N'KEOSORITA.DDUK KEOSORITAKH0012118KH0010001CS', 0x, CAST(0x0000A24B006B46BF AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'af30936f-6a4c-4977-b3fc-9a31fa222abb', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:8:T24UserName:S:32:8:DepartmentId:S:40:2:', N'Trần Quốc CườngKH0010001CUONG.TQCUONG.TQIT', 0x, CAST(0x0000A6E2008237F1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'95c72a77-5e6e-4c16-9768-9ad13840606c', N'FullName:S:0:20:T24SignOnName:S:20:9:T24UserName:S:29:10:BranchId:S:39:9:DepartmentId:S:48:2:', N'Dinh Thi Hoai PhuongKH0012152PHUONG.DTHKH0010001CS', 0x, CAST(0x0000A7CB0092CDE1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'8986d3cd-a751-4bd3-bcd9-9b93f9fac163', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:6:DepartmentId:S:37:2:', N'Huynh Van QuyKH0010001KH0014219quy.hvIT', 0x, CAST(0x0000A5BE00813193 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'22aa5bd0-e005-45c2-950e-9cb1fcaba321', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:7:DepartmentId:S:39:2:', N'NGO THANH TUANKH0010905KH9050102TUAN.NTCS', 0x, CAST(0x0000A44B0091FDEA AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e86f73ca-126d-4dd1-807b-a00c9dc9e052', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:9:DepartmentId:S:38:2:', N'Pin RatpheaKH0010001KH0012125RATPHEA.PCS', 0x, CAST(0x0000A2DF008787DD AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'813d6494-6edf-4303-817d-a01d93e8d5a5', N'T24UserName:S:0:5:FullName:S:5:7:T24SignOnName:S:12:9:BranchId:S:21:9:DepartmentId:S:30:2:', N'LIN.RROS LINKH9022116KH0010902CS', 0x, CAST(0x0000A24D00135C70 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'65396bd6-7c69-48ba-b870-a0eb612cec49', N'T24UserName:S:0:6:FullName:S:6:8:T24SignOnName:S:14:9:BranchId:S:23:9:DepartmentId:S:32:2:', N'HENG.KKim HengKH0012204KH0010001CS', 0x, CAST(0x0000A24B0072D799 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'21a472ce-7889-491a-ba77-a370353fe81f', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:7:DepartmentId:S:34:2:', N'Mey BonisKH0010907KH9072108BONIS.MCS', 0x, CAST(0x0000A72B007967C4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'99db782e-965c-49d9-af37-a5008b159536', N'FullName:S:0:8:T24SignOnName:S:8:6:T24UserName:S:14:6:BranchId:S:20:9:DepartmentId:S:29:2:', N'Nay AnnaANNA.NANNA.NKH0010906CR', 0x, CAST(0x0000A8BF001F0789 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'dcba3ead-4cd4-48a3-bdc4-a57b96622110', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:8:DepartmentId:S:37:2:', N'Chom ChannaKH0010907KH9071107CHANNA.CCS', 0x, CAST(0x0000A67200804699 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b31c8339-4132-49a5-ae56-a6e90331eb5a', N'T24UserName:S:0:9:FullName:S:9:9:T24SignOnName:S:18:9:BranchId:S:27:9:DepartmentId:S:36:2:', N'PISEY.ONGOng PiseyKH0014203KH0010001IT', 0x, CAST(0x0000A2490041C22E AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0e5f6a86-cc83-474b-8d52-a817153dcd6d', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:6:DepartmentId:S:36:2:', N'Le Quang HuyKH0010001KH9051101HUY.LQAD', 0x, CAST(0x0000A63201050489 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0c9dc485-96a2-4b50-bdcb-a8325573cc57', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:10:BranchId:S:30:9:DepartmentId:S:39:2:', N'Pa SophannaKH9031103Sophanna.pKH0010906CR', 0x, CAST(0x0000A89C004C2453 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'95fb94cb-b0b9-4d4f-9134-a919d927cc25', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'Hour SarakKH0014226KH0014226KH0010001RM', 0x, CAST(0x0000A90A007D64D1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1056f3c4-86ad-4fb4-868b-aaeb8e853e7e', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:9:DepartmentId:S:38:2:', N'Rin SreymomKH0010901KH9012119sreymom.rCS', 0x, CAST(0x0000A4DD0092215F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'460ce37b-0ec3-4575-8dd8-ac6069e2b1cf', N'FullName:S:0:9:BranchId:S:9:9:T24SignOnName:S:18:9:T24UserName:S:27:7:DepartmentId:S:34:2:', N'Mao PiseyKH0010902KH9022113PISEY.MCS', 0x, CAST(0x0000A78C0071982C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd6772e7f-a160-40e6-8b2d-aca6dedfa370', N'FullName:S:0:7:BranchId:S:7:9:T24SignOnName:S:16:9:T24UserName:S:25:6:DepartmentId:S:31:2:', N'Va RadyKH0010906KH9064102RADY.VFA', 0x, CAST(0x0000A5DA006EBCDE AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'99fbcc4f-1f76-467b-81f5-ad8cfeeebf38', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:9:DepartmentId:S:40:2:', N'Cheng SorathaKH0010905KH9052102SORATHA.CCS', 0x, CAST(0x0000A42000847B33 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b748af7a-e5cd-4669-ac2e-b14d03866c40', N'FullName:S:0:12:T24SignOnName:S:12:6:T24UserName:S:18:14:BranchId:S:32:9:DepartmentId:S:41:2:', N'Bui Ngoc AnhANH.BNBui Nguyen AnhKH0010001RM', 0x, CAST(0x0000A85D0037EF81 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'47f7973a-1ca4-48a6-8f04-b204bf20df6d', N'FullName:S:0:11:T24SignOnName:S:11:5:T24UserName:S:16:5:BranchId:S:21:9:DepartmentId:S:30:2:', N'Dinh Duy VuVU.DDVU.DDKH0010907CR', 0x, CAST(0x0000A8A20027D14C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fcceccf8-92db-4c56-8d99-b2c315268081', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:11:DepartmentId:S:44:2:', N'MEACH SOKUNTHEAKH0010001KH0012138SOKUNTHEA.MCS', 0x, CAST(0x0000A68F00AEA47D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'ffcef8a7-8b13-4dc5-97ea-b3dc0f183daa', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:9:DepartmentId:S:37:2:', N'An LyVisalKH0010001KH0012141LYVISAL.ACD', 0x, CAST(0x0000A5FD0020DA49 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'5de38f93-4368-42ee-bffc-b450cf3a9e32', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:8:T24UserName:S:29:8:DepartmentId:S:37:2:', N'Lê Nam TrungKH0010001TRUNG.LNTRUNG.LNGP', 0x, CAST(0x0000A641009818B7 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b6326d01-e362-4d99-b3c9-b4d0104680b0', N'FullName:S:0:19:BranchId:S:19:9:T24SignOnName:S:28:9:T24UserName:S:37:7:DepartmentId:S:44:2:', N'Test AutoFT KH AuthKH0010001QUYENNPV2KHANH.LCS', 0x, CAST(0x0000A3EE0024AD59 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'caf8a1d1-0d70-436f-b117-b53cf1bceee7', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:9:T24UserName:S:34:7:DepartmentId:S:41:2:', N'LE THUY HONG VANKH0010901KH9014106VAN.LTHCS', 0x, CAST(0x0000A2B60044B62D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'5abdb16c-c370-4a1b-a195-b58a683747a7', N'FullName:S:0:17:T24SignOnName:S:17:11:T24UserName:S:28:11:BranchId:S:39:9:DepartmentId:S:48:2:', N'Samreth NearyrathNEARYRATH.SNEARYRATH.SKH0010001RM', 0x, CAST(0x0000A865003AE495 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e1a7b9ef-dff7-4b46-856d-b7a61d8fa91b', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Phal ChariyaKH9052106CHARIYA.PKH0010905CS', 0x, CAST(0x0000A89B00A638AD AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6d4bbd12-2f72-4533-9f76-bb016297b7a3', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:8:BranchId:S:31:9:DepartmentId:S:40:2:', N'Le Quang NghiaKH9050103NGHIA.LQKH0010906GP', 0x, CAST(0x0000A89C004B2E43 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'21514293-c4db-4f8f-a205-bb266bc245d1', N'FullName:S:0:9:T24SignOnName:S:9:7:T24UserName:S:16:7:BranchId:S:23:9:DepartmentId:S:32:2:', N'Keo SeilaSEILA.KSEILA.KKH0010001RM', 0x, CAST(0x0000A86500392AA4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'43ea7390-a040-4e71-92a0-bb9865061d7e', N'T24UserName:S:0:8:FullName:S:8:10:T24SignOnName:S:18:9:BranchId:S:27:9:DepartmentId:S:36:2:', N'Komoth.yYUN KOMOTHKH9042106KH0010904CS', 0x, CAST(0x0000A24B0073BFD0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'209ac89e-95c3-4135-81b0-bd4c389d3744', N'T24UserName:S:0:7:FullName:S:7:8:T24SignOnName:S:15:9:BranchId:S:24:9:DepartmentId:S:33:2:', N'KHANH.LLE KHANHKH0012302KH0010001CS', 0x, CAST(0x0000A24B006C4DCC AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'7749f536-fd0e-4428-ae24-bda6cf97e641', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:6:DepartmentId:S:34:2:', N'Huong SelaKH0010001KH0012107SELA.HCS', 0x, CAST(0x0000A6A60022D831 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fa11c51c-e159-4d5d-a712-c027a5279f4d', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Tek YounicKH0010906KH9062104Younic.tCS', 0x, CAST(0x0000A4A4009A68B4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6b6ba3d4-d224-4ee3-abe2-c0347281495d', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:9:DepartmentId:S:38:2:', N'KHA YEKLENGKH0010905KH9052111YEKLENG.KCS', 0x, CAST(0x0000A68800306E66 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fac23cce-edc3-42b6-92a9-c127d4ccf39d', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:7:DepartmentId:S:39:2:', N'Truong Vu MinhKH0010001KH0014214minh.tvIT', 0x, CAST(0x0000A39C0024E518 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1e54f5ee-d989-4774-9c93-c29179b45ca4', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:10:DepartmentId:S:40:2:', N'Sak SocheataKH0010901KH9012115socheata.sCS', 0x, CAST(0x0000A6F9003BFE2F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c72b0c30-8325-48f3-8c00-c30bb4406636', N'FullName:S:0:9:T24SignOnName:S:9:6:T24UserName:S:15:6:BranchId:S:21:9:DepartmentId:S:30:2:', N'Mork SithSITH.MSITH.MKH0010906CR', 0x, CAST(0x0000A8BF001F1D08 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'8c840a95-9827-45e9-8d3b-c4622d2033fb', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:6:T24UserName:S:30:9:DepartmentId:S:39:2:', N'Mai Thị Ngọc HàKH0010001HA.MTNKH0010109GP', 0x, CAST(0x0000A6410096F031 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3ceba9ed-d7c0-4ae3-99a6-c54d243ab1f4', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:11:DepartmentId:S:43:2:', N'Morm ChhouksorKH0010901KH9013109CHHOUKSOR.MCS', 0x, CAST(0x0000A4DD0096AE41 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'cd942187-031c-450d-afb4-c5896911584d', N'T24UserName:S:0:7:FullName:S:7:14:T24SignOnName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'MINH.TCTran Cong MinhKH9030101KH0010903CS', 0x, CAST(0x0000A24B0077EB98 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'88955760-45fe-41a6-b4f0-c5e1f1fda70e', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:7:DepartmentId:S:35:2:', N'Long BophaKH0010001KH0012120BOPHA.LCS', 0x, CAST(0x0000A63201026568 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1cb6255f-0a13-4ad6-8272-c74238a11811', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:9:DepartmentId:S:37:2:', N'So SreyPovKH0010902KH9022123SREYPOV.SAD', 0x, CAST(0x0000A67C003FABAB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'6f472a71-ed51-4b7d-8070-ccf72a69d3b3', N'T24UserName:S:0:11:FullName:S:11:11:T24SignOnName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'LENG SOMALALENG SOMALAKH0012202KH0010001CS', 0x, CAST(0x0000A22700AB2743 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'398ab1fd-f8be-4178-89ce-cd70067bd8fd', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:10:BranchId:S:33:9:DepartmentId:S:42:2:', N'Veang SreynuthKH9052110Sreynuth.vKH0010905CS', 0x, CAST(0x0000A8BF001F7BF7 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd3cd4581-9b6c-41e5-b832-cea2c36e0010', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:9:DepartmentId:S:39:2:', N'Chea SamnangKH0010904KH9044103SAMNANG.CHR', 0x, CAST(0x0000A5C6003327A4 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'0d8c7a52-6596-480b-8c9e-d0cb8c92198e', N'FullName:S:0:15:BranchId:S:15:9:T24SignOnName:S:24:9:T24UserName:S:33:12:DepartmentId:S:45:2:', N'Phon SovanarongKH0010001KH0012150SOVANARONG.PCS', 0x, CAST(0x0000A6D3007E8F21 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'46bef49d-16f5-42f3-af42-d12d2f33d58b', N'FullName:S:0:19:T24SignOnName:S:19:9:T24UserName:S:28:11:BranchId:S:39:9:DepartmentId:S:48:2:', N'Limsovanna MonirortKH0012162MONIRORT.LSKH0010001CS', 0x, CAST(0x0000A8F500368BE6 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'43a26d8c-f4cc-417e-8ec4-d2e7414f6934', N'T24UserName:S:0:5:FullName:S:5:5:T24SignOnName:S:10:5:BranchId:S:15:9:DepartmentId:S:24:2:', N'Test2Test2Test2KH0010001CD', 0x, CAST(0x0000AA5D0080CBAB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'fc2cba24-f2e5-4dad-9ce1-d36b62b8a5c3', N'T24UserName:S:0:10:FullName:S:10:12:T24SignOnName:S:22:9:BranchId:S:31:9:DepartmentId:S:40:2:', N'VOLINETH.KKEM VOLINETHKH0012114KH0010001CS', 0x, CAST(0x0000A24B0048E753 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'36718159-12e6-4a41-be06-d53881d0cc96', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:8:DepartmentId:S:39:2:', N'PAN MOUYTHEANKH0010001KH0012119THEAN.PMCS', 0x, CAST(0x0000A64A0072356A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b65e779c-32c6-4b20-af64-d5d06ace60c9', N'FullName:S:0:9:T24SignOnName:S:9:7:T24UserName:S:16:7:BranchId:S:23:9:DepartmentId:S:32:2:', N'Mey BoninBONIN.MBONIN.MKH0010904CR', 0x, CAST(0x0000A8A20077371D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd6100367-ab21-4946-9d2f-d6201a6962a0', N'FullName:S:0:8:BranchId:S:8:9:T24SignOnName:S:17:9:T24UserName:S:26:6:DepartmentId:S:32:2:', N'Dary NitKH0010001KH0014211nit.ldIT', 0x, CAST(0x0000A5C20085D544 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'db5f3de3-98c5-4e9e-9ffe-d7659ed8916f', N'FullName:S:0:21:BranchId:S:21:9:T24SignOnName:S:30:9:T24UserName:S:39:9:DepartmentId:S:48:2:', N'Nguyễn Phạm Vạn QuyềnKH0010001KH0014213QUYEN.NPVIT', 0x, CAST(0x0000A4DB00A948F7 AS DateTime))
GO
print 'Processed 200 total records'
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c3b7c2cf-69d5-4064-ad9f-d82f5fb2b82b', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:10:BranchId:S:31:9:DepartmentId:S:40:2:', N'Pha SreySrosKH0012154SREYSROS.PKH0010001CS', 0x, CAST(0x0000A83A006CFC8B AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'd5675ef7-7d98-4f84-ae0d-d8a4738c8a53', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:8:DepartmentId:S:37:2:', N'KHIM RACHNAKH0010902KH9024112RACHNA.CFA', 0x, CAST(0x0000A5E000766F0A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1aebc802-4c81-42ec-a4dd-d9c25dedcb99', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:10:BranchId:S:33:9:DepartmentId:S:42:2:', N'Mork SokuntheaKH9074109KUNTHEA.MSKH0010907CS', 0x, CAST(0x0000A8DB006CCD3E AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'eb98f3d1-d967-450e-ad2f-db075b4a2e00', N'FullName:S:0:15:T24SignOnName:S:15:7:T24UserName:S:22:7:BranchId:S:29:9:DepartmentId:S:38:2:', N'Nguyen Duc MinhMINH.NDMINH.NDKH0010001RM', 0x, CAST(0x0000A85D0038EB4C AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1d9de33d-48b9-4271-a93b-db38c676f79c', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:12:DepartmentId:S:44:2:', N'SOR CHANMOLEKAKH0010905KH9052103CHANMOLEKA.SCS', 0x, CAST(0x0000A73F00961E1E AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'13afc92b-5490-47f1-92ec-dbe63ab31c60', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:8:T24UserName:S:31:14:DepartmentId:S:45:2:', N'Cao Hồng PhongKH0010001PHONG.CHCao Hong PhongCR', 0x, CAST(0x0000A6320103BDD1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'991ee162-af70-48d5-b766-dc9d1e0011f4', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'Hour SarakKH0014226KH0014226KH0010904RM', 0x, CAST(0x0000A90A007F8B3E AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'cdbe6087-d37d-44d2-b004-dcd7909c4d4e', N'T24UserName:S:0:12:FullName:S:12:13:T24SignOnName:S:25:9:BranchId:S:34:9:DepartmentId:S:43:2:', N'SIMCHANDOEUNSim ChandoeunKH0014215KH0010001IT', 0x, CAST(0x0000A9BB0039C733 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'4928a98e-575d-42c4-988a-dd286eaabe9a', N'FullName:S:0:9:T24SignOnName:S:9:9:T24UserName:S:18:7:BranchId:S:25:9:DepartmentId:S:34:2:', N'Hak PiseyKH9012115PISEY.HKH0010901CS', 0x, CAST(0x0000A8A1001134E7 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e17991ed-d277-4b6c-b1e3-de7bd2eb8ea6', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:11:DepartmentId:S:43:2:', N'Leng KeochendaKH0010001KH0012130KEOCHENDA.LCS', 0x, CAST(0x0000A5DF006D52FB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'419f05f9-ea1c-4173-a2bd-df3bf5920018', N'T24UserName:S:0:8:FullName:S:8:11:T24SignOnName:S:19:9:BranchId:S:28:9:DepartmentId:S:37:2:', N'SOMALA.LLeng SomalaKH0012202KH0010001IP', 0x, CAST(0x0000A24B007238E0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3ccdafac-b18a-4c73-b551-df555cce06c4', N'T24UserName:S:0:6:FullName:S:6:9:T24SignOnName:S:15:9:BranchId:S:24:9:DepartmentId:S:33:2:', N'Sony.yYEUN SONYKH9042101KH0010904CS', 0x, CAST(0x0000A24B0072E605 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'b47caf78-cc79-49a6-90a9-e3e648ab2e68', N'FullName:S:0:8:BranchId:S:8:9:T24SignOnName:S:17:9:T24UserName:S:26:6:DepartmentId:S:32:2:', N'Keo NikaKH0010906KH9062107NIKA.KAD', 0x, CAST(0x0000A6FE006FE2F1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'efd47d76-f6cc-43a5-9df8-e578e226994d', N'FullName:S:0:14:T24SignOnName:S:14:9:T24UserName:S:23:10:BranchId:S:33:9:DepartmentId:S:42:2:', N'Mork SokuntheaKH9074109KUNTHEA.MSKH0010907CS', 0x, CAST(0x0000A8DB006DB1B2 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'a6a4cf1d-32fe-45f7-85ea-e68022a0f073', N'FullName:S:0:11:BranchId:S:11:9:T24SignOnName:S:20:9:T24UserName:S:29:9:DepartmentId:S:38:2:', N'KIM BORITHYKH0010001KH0012126BORITHY.KCS', 0x, CAST(0x0000A65C00459F4F AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'c9125646-4429-40ae-8197-e71d9c28543b', N'FullName:S:0:21:BranchId:S:21:9:T24SignOnName:S:30:9:T24UserName:S:39:17:DepartmentId:S:56:2:', N'Chhim ChhorveanratanaKH0010902KH9022115CHHORVEANRATANA.CCS', 0x, CAST(0x0000A5750028EC25 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3f8d89a7-92bb-4d00-8a67-e7e14053300b', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:9:T24UserName:S:31:9:DepartmentId:S:40:2:', N'Cheng EngLangKH0010902KH9022122ENGLANG.CAD', 0x, CAST(0x0000A67C003F545A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'da14c8f9-5fe3-4018-8ac7-e7f2d1c5e1f9', N'FullName:S:0:8:BranchId:S:8:9:T24SignOnName:S:17:9:T24UserName:S:26:7:DepartmentId:S:33:2:', N'LY VEANGKH0010001KH0012123VEANG.LCS', 0x, CAST(0x0000A4FA009E7950 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'f3269ff4-5278-4837-a6a4-e912da408daa', N'T24UserName:S:0:7:FullName:S:7:10:T24SignOnName:S:17:9:BranchId:S:26:9:DepartmentId:S:35:2:', N'Boren.mMEAS BORENKH9040102KH0010904CS', 0x, CAST(0x0000A24B0071CCAB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1bace25e-abe4-4728-8f23-e97b6ad3e44a', N'FullName:S:0:16:BranchId:S:16:9:T24SignOnName:S:25:9:T24UserName:S:34:8:DepartmentId:S:42:2:', N'NGUYEN THI THIENKH0010903KH9034106THIEN.NTFA', 0x, CAST(0x0000A5C4003CF066 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'3bdcd008-13b3-4c30-a278-eb9083e76e77', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:11:DepartmentId:S:43:2:', N'Seng SreyNeathKH0010906KH9062105Sreyneath.sCS', 0x, CAST(0x0000A4A4009BA375 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e717afec-4814-4343-bb76-ed52b33b90d7', N'FullName:S:0:8:T24SignOnName:S:8:5:T24UserName:S:13:5:BranchId:S:18:9:DepartmentId:S:27:2:', N'Heng LayLAY.HLAY.HKH0010904CR', 0x, CAST(0x0000A8A20076D546 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'1b588cc2-b9da-46e0-945a-eecffccc416d', N'FullName:S:0:12:T24SignOnName:S:12:9:T24UserName:S:21:9:BranchId:S:30:9:DepartmentId:S:39:2:', N'Meng SivlangSIVLANG.MSIVLANG.MKH0010904CR', 0x, CAST(0x0000A8A2007828D5 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'5aa05362-3ff3-48df-aff4-f0288707fdc7', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:9:BranchId:S:29:9:DepartmentId:S:38:2:', N'Kun SamnangSAMNANG.KSAMNANG.KKH0010907CR', 0x, CAST(0x0000A8A20028535A AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'4d94afda-5947-4827-8bcf-f090a3577764', N'FullName:S:0:14:BranchId:S:14:9:T24SignOnName:S:23:9:T24UserName:S:32:8:DepartmentId:S:40:2:', N'Trần Lâm GiangKH0010001KH0010109GIANG.TLGP', 0x, CAST(0x0000A6010035C0E1 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'965aa192-6dd4-495e-b090-f223e7869c84', N'T24UserName:S:0:6:FullName:S:6:12:T24SignOnName:S:18:9:BranchId:S:27:9:DepartmentId:S:36:2:', N'Tuc.htHO THANH TUCKH9041101KH0010904CS', 0x, CAST(0x0000A24B00726ABB AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'22639d30-44d5-4ee6-a07d-f230eba9163e', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:8:T24UserName:S:27:8:DepartmentId:S:35:2:', N'Se TharathKH0010904KH100010KH100010AD', 0x, CAST(0x0000A77D00919CC0 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'077e1f5b-cbf9-4c0d-a144-f2401b53a3b5', N'FullName:S:0:8:BranchId:S:8:9:T24SignOnName:S:17:9:T24UserName:S:26:6:DepartmentId:S:32:2:', N'SIN LINAKH0010905KH9052105LINA.SCS', 0x, CAST(0x0000A69D0024CB87 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'48429338-448d-4715-b1a5-f4f5ef3736d7', N'FullName:S:0:11:T24SignOnName:S:11:9:T24UserName:S:20:8:BranchId:S:28:9:DepartmentId:S:37:2:', N'TENG CHANDYKH9072128CHANDY.TKH0010907CS', 0x, CAST(0x0000A83C003D45B9 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'e01a7869-195f-427b-8330-f824a24c1964', N'FullName:S:0:10:BranchId:S:10:9:T24SignOnName:S:19:9:T24UserName:S:28:8:DepartmentId:S:36:2:', N'Lim LalineKH0010001KH0014104LALINE.LFA', 0x, CAST(0x0000A5C50035DD1D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'82e5b85c-c6fb-4d31-97dd-fa18bfa4e8cc', N'FullName:S:0:13:BranchId:S:13:9:T24SignOnName:S:22:7:T24UserName:S:29:13:DepartmentId:S:42:2:', N'Bùi Ngọc HiếuKH0010001HIEU.BNBui Ngoc HieuIA', 0x, CAST(0x0000A63201021635 AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'74a719e8-0d9b-4d59-b310-feeb384a18ba', N'FullName:S:0:12:BranchId:S:12:9:T24SignOnName:S:21:9:T24UserName:S:30:9:DepartmentId:S:39:2:', N'PHON SODANETKH0010905KH9052109SODANET.PCS', 0x, CAST(0x0000A6880030123D AS DateTime))
INSERT [dbo].[aspnet_Profile] ([UserId], [PropertyNames], [PropertyValuesString], [PropertyValuesBinary], [LastUpdatedDate]) VALUES (N'ff1e6a6d-987a-44df-b942-ffb9e2c3729c', N'FullName:S:0:10:T24SignOnName:S:10:9:T24UserName:S:19:8:BranchId:S:27:9:DepartmentId:S:36:2:', N'SET VOLEAKKH9022112VOLEAK.SKH0010902CS', 0x, CAST(0x0000A7E6000FEB4F AS DateTime))
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK__aspnet_M__1788CC4D1FCDBCEB] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'026c0cbd-9269-4faf-8ecd-7f5a34a34049', N'R9NYYvRQQSwtPdNt/q2Mh4egy0k=', 1, N'LOJ+j2gxQNnbuJ/pxHsRgg==', NULL, N'admin@bidc.vn', N'admin@bidc.vn', NULL, NULL, 1, 0, CAST(0x0000A0550026F250 AS DateTime), CAST(0x0000AA9A003EC4D6 AS DateTime), CAST(0x0000A8F7004574FF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5c8fe39b-25f7-423d-bfe5-2d39b25deb6a', N'XbYocnPWYEb/XgPi18s3JNMumBs=', 1, N'gYXF4S+LqxjtrDmH4g9trw==', NULL, N'an.ts@bidc.com.kh', N'an.ts@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C600328E30 AS DateTime), CAST(0x0000A70D000F00E0 AS DateTime), CAST(0x0000A5C600328E30 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'24f19be8-6d69-4ee0-ad04-27b78b26cbad', N'sOlOlv1DTqQHlARRBky0Ml/KKCs=', 1, N'+0lCwHdgSe6+SZo6rLfusQ==', NULL, N'an.ts@bidc.com.kh', N'an.ts@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A77D0090E55C AS DateTime), CAST(0x0000A8FE00A4ED91 AS DateTime), CAST(0x0000A833009D4919 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'04445800-0119-43ed-990e-2a97134dd0b6', N'dr8OGT69FW8XgwdrmQ1mRDulb9c=', 1, N'PRvXX0BEkh+BOW4DiC5sUw==', NULL, N'an.vth@bidc.com.kh', N'an.vth@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003B4ED0 AS DateTime), CAST(0x0000A8FE00497560 AS DateTime), CAST(0x0000A865003B4ED0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b748af7a-e5cd-4669-ac2e-b14d03866c40', N'7wFvy/2lzAtp0UF1qbo3MCtjaTQ=', 1, N'x2jn+uH72V5y7M1QQ2a9xQ==', NULL, N'anh.bn@bidc.com.kh', N'anh.bn@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5DA006F4974 AS DateTime), CAST(0x0000A8C00087F662 AS DateTime), CAST(0x0000A696009FE4E7 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 2, CAST(0x0000AA030049715D AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'84e4f419-1d31-4902-a11e-3d63035f4cde', N'i+qjn9XI434jFQj8jOaRG/wSc+0=', 1, N'Yh3nXzQoJnquX4Zp8gpf7Q==', NULL, N'Anh.dd@bidc.com.kh', N'anh.dd@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A43C002DBB08 AS DateTime), CAST(0x0000A90700847C33 AS DateTime), CAST(0x0000A9070016AC2F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7bc5f431-10b6-430a-b2ff-66243bde8311', N'iBi5F2UBDMb2Id14SwTZbtnkrPU=', 1, N'F1tsPBOOqu3a6sT1VHzX8Q==', NULL, N'anh.lq@bidc.com.kh', N'anh.lq@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A36A00440F70 AS DateTime), CAST(0x0000A8E400A0A97B AS DateTime), CAST(0x0000A6B10054A674 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c78e5191-1904-4ff8-8c79-66319554faac', N'V4Ft4hJITjhRMfBpEyjAO0CcXPc=', 1, N'/iPvhMTZNkJ+5pD6O4WDeQ==', NULL, N'anh.nd@bidc.com.kh', N'anh.nd@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0078783C AS DateTime), CAST(0x0000A307009B2E80 AS DateTime), CAST(0x0000A24B0078783C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'99db782e-965c-49d9-af37-a5008b159536', N'X38WOi0J5EtFmuF5RNCAJKkGkSQ=', 1, N'jQZVGbCyWIjfqdbyjGJ1TA==', NULL, N'anna.n@bidc.com.kh', N'anna.n@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89C006E70A8 AS DateTime), CAST(0x0000A8B700317413 AS DateTime), CAST(0x0000A89C006E70A8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'37055e14-390f-443b-982b-559be7f50a6b', N'CTsKYZoYGhFBswXBF5YUWY3W6a0=', 1, N'UU0EZqay3Vi+bCzQU1FTnQ==', NULL, N'binh.lx@bidc.com.kh', N'binh.lx@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A906001C3068 AS DateTime), CAST(0x0000AA5D0078A159 AS DateTime), CAST(0x0000A906001C3068 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5ea6c033-37db-47f4-a1f1-5d282bf4e739', N'EYePxtkK8mLrPfY5mDwXs4fyaCE=', 1, N'x9Xn8XRHNwlZb6FgUr97Zw==', NULL, N'binh.lx@bidc.com.kh', N'binh.lx@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A9220089394C AS DateTime), CAST(0x0000A923003BE812 AS DateTime), CAST(0x0000A9220089394C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b65e779c-32c6-4b20-af64-d5d06ace60c9', N'GxJNZIzlGuk5edehWK4iqyRdla4=', 1, N'Bd7t6DSMOyz67WwQTPlkcQ==', NULL, N'bonin.m@bidc.com.kh', N'bonin.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A2007735F8 AS DateTime), CAST(0x0000A8A3000906BF AS DateTime), CAST(0x0000A8A2007735F8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'21a472ce-7889-491a-ba77-a370353fe81f', N'WyEnchI+8Ewsv9uKRapyJtfmIvk=', 1, N'20DI1idE6Uz1FVf/DLznQA==', NULL, N'bonis.m@bidc.com.kh', N'bonis.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A72B0079674C AS DateTime), CAST(0x0000A72B0079674C AS DateTime), CAST(0x0000A72B0079674C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'88955760-45fe-41a6-b4f0-c5e1f1fda70e', N'Ts//7IOORUl3n0xkiz+ibGDefpM=', 1, N'pGmaG6GNtCSsiOocOTik8w==', NULL, N'bopha.l@bidc.com.kh', N'bopha.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A20D0029502C AS DateTime), CAST(0x0000A8FE00A9BDF3 AS DateTime), CAST(0x0000A25A0075A284 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6e0bc385-fe9b-49b5-a091-1fefe21b7ee5', N'jpCCiQ7OfvhSpNBMmu0iEwvsskk=', 1, N'yEbZGmb/Nclg1SzFDjSvBg==', NULL, N'bopha.s@bidc.com.kh', N'bopha.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003A74D8 AS DateTime), CAST(0x0000A86C00437C36 AS DateTime), CAST(0x0000A865003A74D8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f3269ff4-5278-4837-a6a4-e912da408daa', N'RdEN3agTJqMLnRGdtTF0o25+I1w=', 1, N'afpmk4IkMd1Q5mE/IHPVCA==', NULL, N'boren.m@bidc.com.kh', N'boren.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0071CBA4 AS DateTime), CAST(0x0000A8CE006FA2E3 AS DateTime), CAST(0x0000A3010090CF19 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a6a4cf1d-32fe-45f7-85ea-e68022a0f073', N'4ZuA+ZaQf6Q9ayY+lWzhX3USO/U=', 1, N'mMKuRQrK1MxXjH4Q1+NncQ==', NULL, N'Borithy.k@bidc.com.kh', N'borithy.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0048597C AS DateTime), CAST(0x0000A37E009546B7 AS DateTime), CAST(0x0000A24B0048597C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9d2ce3ba-3b56-457d-a596-4e58e4dbfcef', N'arULi/N3DF8ET3HeOSREi/y76io=', 1, N'Vu+rFsUZo7xM7LXEnahTlQ==', NULL, N'bunrith.k@bidc.com.kh', N'bunrith.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8970069D110 AS DateTime), CAST(0x0000A8B8003FA160 AS DateTime), CAST(0x0000A8970069D110 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f0a70c15-3362-49b8-adb1-357661c692e1', N'XjLcbe1zdL6d7B89An5eyfKHQEg=', 1, N'7d4LJuK2mH8ztXP824kl3g==', NULL, N'chandavy.k@bidc.com.kh', N'chandavy.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A23E0038E1B8 AS DateTime), CAST(0x0000A8A200767635 AS DateTime), CAST(0x0000A23E0038E1B8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cdbe6087-d37d-44d2-b004-dcd7909c4d4e', N'fkAlW8T9hY3wD/BOg0CPvG+xbCM=', 1, N'ck7ttXvQXc448YMt07YR+w==', NULL, N'chandoeun.s@bidc.com.kh', N'chandoeun.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5BF008F361C AS DateTime), CAST(0x0000A9BB003A100D AS DateTime), CAST(0x0000A9BB0039E298 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'48429338-448d-4715-b1a5-f4f5ef3736d7', N'IRYgr6Gr1nMT09y95JOhDOn/sN4=', 1, N'IWY2iQpl6Dt1z8cuMCSCqw==', NULL, N'Chandy.t@bidc.com.kh', N'chandy.t@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B006BE89C AS DateTime), CAST(0x0000A8C000AF628C AS DateTime), CAST(0x0000A24B006BE89C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1d9de33d-48b9-4271-a93b-db38c676f79c', N'fzruFsQYTTXYSSBXuIYG1q2tJas=', 1, N'F6wobpNVA6Rw3+dH1icjJA==', NULL, N'Chanmoleka.s@bidc.com.kh', N'chanmoleka.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B006B97C0 AS DateTime), CAST(0x0000A66E00913713 AS DateTime), CAST(0x0000A24B006B97C0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'dcba3ead-4cd4-48a3-bdc4-a57b96622110', N'v2tN6x8nbEXfdmjoYZzxxax3TYA=', 1, N'FqpazUc59qV37Wf3s5/lmA==', NULL, N'channa.c@bidc.com.kh', N'channa.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A672007E2D90 AS DateTime), CAST(0x0000A678009E702F AS DateTime), CAST(0x0000A672007E2D90 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd48eb814-c202-4b7e-bbc9-4805090a7f24', N'lO7nYFoDu1WIjSNumhf9NIV9EbA=', 1, N'qvfWPRRvX3NEWNxA9DPGqQ==', NULL, N'channa.k@bidc.com.kh', N'channa.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A200764238 AS DateTime), CAST(0x0000A8A200764238 AS DateTime), CAST(0x0000A8A200764238 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'beae2c9b-7c72-471f-8ecb-5dcf0987bad5', N'LU+TfvyEPo82+VDwEwvxVkQE3nk=', 1, N'Bw3COgcH4DrFYjVd/uPGCg==', NULL, N'channary.k@bidc.com.kh', N'channary.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2F9002A9720 AS DateTime), CAST(0x0000A5FC00A11A0D AS DateTime), CAST(0x0000A624008138F6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f067ff32-d8e6-4dfa-b5fe-59f3dc7ebc6c', N'3+5g+MOeSfr2WfbDK02PwOK1aBk=', 1, N'hKNLcMxwmK85IXHwF8saag==', NULL, N'channary.p@bidc.com.kh', N'channary.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A61700878688 AS DateTime), CAST(0x0000A8F700748131 AS DateTime), CAST(0x0000A61700878688 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0c87f728-411b-4b38-9b87-096be7b3cb62', N'p8ybur7RSSJGiKKhuITR54/0P+s=', 1, N'W1uDb0RJJsd4d0ZuPBL3OQ==', NULL, N'channry.c@bidc.com.kh', N'channry.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A500220EC0 AS DateTime), CAST(0x0000A8EB001E65F3 AS DateTime), CAST(0x0000A8EB00159DD7 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'809f522c-4601-43c7-a547-42ef91a6d353', N'9a9JZ+e57ysrkKUUw8IB6jyIi48=', 1, N'tM8T/d+tjR5Yf4Z0MEdO0Q==', NULL, N'chantha.k@bidc.com.kh', N'chantha.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A672007F01AC AS DateTime), CAST(0x0000A83A007C005E AS DateTime), CAST(0x0000A672007F01AC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9185e417-b520-4c8a-8c6c-5de4eeef23bb', N'RBy8famxLDhqR3+9L4JqjBoINRA=', 1, N'+dBql2FpkmmzrV6wlj5DyQ==', NULL, N'chariya.c@bidc.com.kh', N'chariya.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A252006BEC20 AS DateTime), CAST(0x0000A8FF000A04DA AS DateTime), CAST(0x0000A863001EDE51 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e1a7b9ef-dff7-4b46-856d-b7a61d8fa91b', N'ZocJI+vwhzBglCHFg2OPnO5/mNk=', 1, N'osrDHuYy1Y6iL5QoCoDeEw==', NULL, N'Chariya.p@bidc.com.kh', N'chariya.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A30000AA6388 AS DateTime), CAST(0x0000A89B00A87998 AS DateTime), CAST(0x0000A30000AA6388 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7ac65a29-b033-4387-81bd-84198744986c', N'8yaVaPPGsr34IPI0CBKKU1bv7vE=', 1, N'EmFz/HDjlyAUhhpZFPWc/g==', NULL, N'chheut.h@bidc.com.kh', N'chheut.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A10015516C AS DateTime), CAST(0x0000A8A2006950C4 AS DateTime), CAST(0x0000A8A10015516C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2c54b878-1ffe-4db0-862c-27d035c4382c', N'OIaohuncnI1o2r0BTQuEDhjeEew=', 1, N'GA++2ggP01S+c9EybWp5zQ==', NULL, N'chhorika.s@bidc.com.kh', N'chhorika.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3F0002B5624 AS DateTime), CAST(0x0000A8F70075072E AS DateTime), CAST(0x0000A3F0002B5624 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c9125646-4429-40ae-8197-e71d9c28543b', N'tbI0MQ4HrscEC0E7rxe/lXPFdkM=', 1, N'8jtoe3XvfTsqumXiGjsbvg==', NULL, N'Chhorveanratana.c@bidc.com.kh', N'chhorveanratana.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5750028E588 AS DateTime), CAST(0x0000A7C2007152A7 AS DateTime), CAST(0x0000A5750028E588 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3ceba9ed-d7c0-4ae3-99a6-c54d243ab1f4', N'DjFH9SruYBzCV/QDxD6J2sNPqEQ=', 1, N'6lN6HiBheVpk78vCxrPtQQ==', NULL, N'Chhouksor.m@bidc.com.kh', N'chhouksor.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00755A30 AS DateTime), CAST(0x0000A61E00308DA6 AS DateTime), CAST(0x0000A24B00755A30 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2cb35afd-958d-4546-bc43-8c7c6e2e2d09', N'b9drI0EOmHwT6Q+wLInuGsZWO0I=', 1, N'mBI0iZGqs0GyvB/lTFMHgg==', NULL, N'chien.nx@bidc.com.kh', N'chien.nx@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200F889C8 AS DateTime), CAST(0x0000A89C006F8996 AS DateTime), CAST(0x0000A63200F889C8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'37b54223-91b3-43d2-92c3-6457dc9371f7', N'S7mk9vlDHT5e2euTXhqu24M4+WE=', 1, N'19sRb/+gA4g+huvVTEfoKw==', NULL, N'co.dv@bidc.com.kh', N'co.dv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A642001C8AA4 AS DateTime), CAST(0x0000A695009D09CA AS DateTime), CAST(0x0000A642001C8AA4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'31a70f9c-b298-4b72-a25f-102583eda12a', N'nBcce/xVQzQX9ym70qS1kvTlSBc=', 1, N'32cSv17m4bjhHoskQjqL8Q==', NULL, N'cuong.nm@bidc.com.kh', N'cuong.nm@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63201030434 AS DateTime), CAST(0x0000A82B00288987 AS DateTime), CAST(0x0000A63201030434 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'af30936f-6a4c-4977-b3fc-9a31fa222abb', N'1re+bCEAZ1irm0uBdzbwN8fk5eI=', 1, N'LSWo4Ed1ZDQaE2i6M15FmA==', NULL, N'cuong.tq@bidc.com.kh', N'cuong.tq@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6E200823728 AS DateTime), CAST(0x0000A85800B8B3F2 AS DateTime), CAST(0x0000A6E200823728 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'79f3540a-1050-43c1-89b9-448914838ae4', N'e2aBC641wQwXtvN1FQh0WxW/hug=', 1, N'Z5LfswabYgyn2HGwaxT4JQ==', NULL, N'danet.h@bidc.com.kh', N'danet.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A4EB008F34F0 AS DateTime), CAST(0x0000A8A900223DB8 AS DateTime), CAST(0x0000A4EB008F34F0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b0967d86-e0f5-47c8-871d-70c669fd77ab', N'y/NYFuwOnojdiMgNS4/FAdYXclQ=', 1, N'lKfB98T1Iiqj7dsC8WxNVQ==', NULL, N'Daranita.y.@bidc.com.kh', N'daranita.y.@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A30900180150 AS DateTime), CAST(0x0000A8FE00A57FBE AS DateTime), CAST(0x0000A30900180150 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ef6e23e3-ef96-466d-8c38-3c4695f07f9a', N'IJ3GJqoXCyyrSy/ai5PxE4hHctw=', 1, N'AT3AU4vBdectI2FuDLwtiQ==', NULL, N'dat.lv@bidc.com.kh', N'dat.lv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00782E68 AS DateTime), CAST(0x0000A24B00782E68 AS DateTime), CAST(0x0000A24B00782E68 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'63b6c79b-9370-43f3-aa29-45525ee0c126', N'QHB1g/iBcmvI6dtSpIv6dH9ez5k=', 1, N'sipfBPOBo1kROjK4Utcf9w==', NULL, N'davin.i@bidc.com.kh', N'davin.i@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A516002AD2E4 AS DateTime), CAST(0x0000A8FD0076A06D AS DateTime), CAST(0x0000A516002AD2E4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'56940e2a-1e0b-4336-80c1-42b3c20340f7', N'kGc91dAxSj8lAuaTiSBOxycWBho=', 1, N'SHgnhQiCCoRnB6HRYk6Jvg==', NULL, N'daya.y@bidc.com.kh', N'daya.y@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5D8002C2DC4 AS DateTime), CAST(0x0000A6210023612E AS DateTime), CAST(0x0000A5D8002C2DC4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'777dd426-7403-4d30-84d3-087b21f3f490', N'MyNyIRLTSHCacWluMnO+XM+CzIg=', 1, N'mw7Vlj2dh9JeVJO8JAPufQ==', NULL, N'dina.r@bidc.com.kh', N'dina.r@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20028A9C4 AS DateTime), CAST(0x0000A8A3000EAFDF AS DateTime), CAST(0x0000A8A20028A9C4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e92a4bca-1456-42d5-ab8b-35651065e67f', N'LyvSo400t/ijyq1eu2fEpYZf5Ig=', 1, N'MmVg/DkLl99QzypqrX+vyg==', NULL, N'dung.nh@bidc.com.kh', N'dung.nh@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200FB5248 AS DateTime), CAST(0x0000A69C00718813 AS DateTime), CAST(0x0000A64100984280 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ace4b264-5d47-41d7-94d3-4116743b120e', N'8sylIVNMI1U1VkZtS/w9Sm4v0HE=', 1, N'XkZYxjwNoGGlYCl053Zvng==', NULL, N'dung.nx@bidc.com.kh', N'dung.nx@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200F9DECC AS DateTime), CAST(0x0000A6420014DCBE AS DateTime), CAST(0x0000A63200F9DECC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd8db8593-a1c6-4d6e-87c9-5e71f44bb4f6', N'Doz8QzdGX0fqCpw02bghQDOOiUc=', 1, N'EC2HZnWz32LSaMXomLJrEg==', NULL, N'dung.p@bidc.com.kh', N'dung.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5B000717294 AS DateTime), CAST(0x0000A65D002977D2 AS DateTime), CAST(0x0000A641009E1C95 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'98551562-b532-4c29-91cd-57e4c1904671', N'1hnT+nkjwSRx6q/GD6U5dl3XJdA=', 1, N'N77uJZztAkwD2OLR8UQBiA==', NULL, N'duong.bt@bidc.com.kh', N'duong.bt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A37D009B8B24 AS DateTime), CAST(0x0000A8F600AFDB81 AS DateTime), CAST(0x0000A8F600480FEF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd345cb4a-b561-4aa5-b995-1cb55b5fb97c', N'IgBbFcXf4Gw1zFlajOcM5sLSsAo=', 1, N'w0bT90itia0mU/IPouhPCw==', NULL, N'duong.tt@bidc.com.kh', N'duong.tt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C50036504C AS DateTime), CAST(0x0000A5C50036504C AS DateTime), CAST(0x0000A5C50036504C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'435928e0-f480-4427-8de2-29cb6f2356ee', N'z4j21CizY9m5ipeCqTIFp0Vvd6A=', 1, N'E9jc8hi94tq9yQy9EJagGw==', NULL, N'eefa.p@bidc.com.kh', N'eefa.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A7EC006E0604 AS DateTime), CAST(0x0000A8EE007B39CE AS DateTime), CAST(0x0000A7EC006E0604 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3f8d89a7-92bb-4d00-8a67-e7e14053300b', N'kGwSpolLoPI3YglNGkny91LvhuI=', 1, N'2RhQj6dxuLEF5m8JCGkiKA==', NULL, N'englang.c@bidc.com.kh', N'englang.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A67C003F53B8 AS DateTime), CAST(0x0000A8F1006BC490 AS DateTime), CAST(0x0000A6B000949951 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4d94afda-5947-4827-8bcf-f090a3577764', N'v5B+/BjQb8djJDTypkYCH3JqjOw=', 1, N'kS71zcQ21hfRUmiCHsIWSA==', NULL, N'giang.tl@bidc.com.kh', N'giang.tl@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6010035C028 AS DateTime), CAST(0x0000A66D0088D2E2 AS DateTime), CAST(0x0000A66D0088FD5D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1cf81118-a629-4ff7-a1d0-89fa31cc8cc1', N'4jwqeqQBy+8lJF3XVdeolMdRYvI=', 1, N'uXQBiG54i0dkzjZrlZeL3g==', NULL, N'ha.dh@bidc.com.kh', N'ha.dh@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2F8008161E0 AS DateTime), CAST(0x0000A897009809DD AS DateTime), CAST(0x0000A2F8008161E0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4f44a336-576e-4b3a-85b0-1c380dfee904', N'd4m0MVaRxhgTCRWKAl47CX9d28E=', 1, N'IQzgP87GsqlczdsdvvJMVg==', NULL, N'hai.lv@bidc.com.kh', N'hai.lv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200FDA6C4 AS DateTime), CAST(0x0000A8A20075749B AS DateTime), CAST(0x0000A65F0099BB9B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'52bbcb57-6a67-4c1a-ac33-70ac757a2b1c', N'kN55lMC3btLSCL2gyPtfZlODGfQ=', 1, N'j1OhhVdkxf0TcLlI+398ow==', NULL, N'hai.vn@bidc.com.kh', N'hai.vn@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200FE1E4C AS DateTime), CAST(0x0000A68700434336 AS DateTime), CAST(0x0000A64100A35443 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'8c840a95-9827-45e9-8d3b-c4622d2033fb', N'8U+p7dTfRLIouxLioPBEIYO+o4o=', 1, N'vYKR0cmdbFBIu52jIFNfLQ==', NULL, N'hamtn@bidc.com.kh', N'hamtn@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6410096EF10 AS DateTime), CAST(0x0000A65700849FA7 AS DateTime), CAST(0x0000A6570028EA65 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'57dcd054-799e-4c8e-99ea-182b355ddced', N'jBfjwyuE5Sff8iemDQH6XXxY5jg=', 1, N'yzE9ZVrFaiUfjUrmYyICzg==', NULL, N'hanh.ttm@bidc.com.kh', N'hanh.ttm@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5F00045A998 AS DateTime), CAST(0x0000A790003E2AFB AS DateTime), CAST(0x0000A5F00045A998 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'756e51a0-3944-4ed6-881e-26616c8c610e', N'L3dbAE3c9NftHB5NBLFH7kDJ6+0=', 1, N'10rWLx8RD2Ac6kFQPUP6Sg==', NULL, N'heng.k@bidc.com.kh', N'heng.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A22700A9C680 AS DateTime), CAST(0x0000A261009DE9F1 AS DateTime), CAST(0x0000A22700AA0831 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'65396bd6-7c69-48ba-b870-a0eb612cec49', N'u9WT8STb30Yod5bbN9eSdxtB5Tg=', 1, N'uY5lRvk7S7Wq4ILCDVe3XQ==', NULL, N'heng.k@bidc.com.kh', N'heng.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0072D6D4 AS DateTime), CAST(0x0000A24B0072D6D4 AS DateTime), CAST(0x0000A24B0072D6D4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'82e5b85c-c6fb-4d31-97dd-fa18bfa4e8cc', N'xxTPHZuwJbzGDxzp+uVocIF4NPI=', 1, N'LYjE16CbC57pMaBnQ+EO3Q==', NULL, N'hieu.bn@bidc.com.kh', N'hieu.bn@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63201021524 AS DateTime), CAST(0x0000A7BB001C2940 AS DateTime), CAST(0x0000A7BA0087EF19 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a4918866-825b-479b-9ab0-6239b5b7a476', N'n/mppvlcWL/cN7vzXqPSi3CsFZ4=', 1, N'umHSITvpfr3BsrPGSWmOLg==', NULL, N'hieu.tb@bidc.com.kh', N'hieu.tb@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A64100972C00 AS DateTime), CAST(0x0000A664009B7221 AS DateTime), CAST(0x0000A64100972C00 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9b9b708c-bdea-49a5-86a8-5957d518484b', N'aC3bQBDCzKgQvJsgluN/aa+5j/4=', 1, N'CZmxAb3bsCyP5ugp1hzohQ==', NULL, N'hong.km@bidc.com.kh', N'hong.km@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63201049628 AS DateTime), CAST(0x0000A6B00018D654 AS DateTime), CAST(0x0000A641009AEF86 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ce3bdcbf-933a-4280-84b5-2cef12282abf', N'J2Cre2hay98FvfAxusPz/hxxyAE=', 1, N'edyp6w8cz+13h5s7ZhS/Ww==', NULL, N'hongmeng.c@bidc.com.kh', N'hongmeng.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63A009B21AC AS DateTime), CAST(0x0000AAAF00753779 AS DateTime), CAST(0x0000A63A009B21AC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f1035db7-08ec-4ee5-9511-5173d8a5ef72', N'7G94gPgTCsY9hbXT2UujdIym5aU=', 1, N'j8ZO8BJRP/647rBO+1rVjg==', NULL, N'houyly.s@bidc.com.kh', N'houyly.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0074C1D8 AS DateTime), CAST(0x0000A8F900897BE3 AS DateTime), CAST(0x0000A2BB009BB06D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7f354e21-ebeb-47eb-ae68-79a44684d4a5', N'rJMk0bJDYTioPAxUOh9t88paL1c=', 1, N'DTBUgw2FCHM9SccMRqOhBw==', NULL, N'hun.p@bidc.com.kh', N'hun.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0078BB08 AS DateTime), CAST(0x0000A8F90046443D AS DateTime), CAST(0x0000A24B0078BB08 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd49f074b-07e6-4cd9-924a-7faf3c0da791', N'kGQ86N53DBqT5+ZXaEtV617O3tg=', 1, N'HG2xhQ1nDBdTTodRP8mSJg==', NULL, N'hung.hv@bidc.com.kh', N'hung.hv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5DA006FD614 AS DateTime), CAST(0x0000A8B600876E1F AS DateTime), CAST(0x0000A5DA006FD614 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'34ae60ba-3301-40f5-9668-87e166b169de', N'zdZxZ+m+BJQFBLKi5VbmjsmAq1A=', 1, N'lyhlQ9h57DXI6xmKv1PKeQ==', NULL, N'hung.nq@bidc.com.kh', N'hung.nq@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6010034E180 AS DateTime), CAST(0x0000A664001477BE AS DateTime), CAST(0x0000A647001C5F79 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1068d9ad-690a-4a88-a0b7-1bc31104f645', N'yF7LDn8GGyt98ujL337vpg7+CyM=', 1, N'H9NcNC96wggG6k+sLCcG4g==', NULL, N'hungdv@bidc.com.kh', N'hungdv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A64100978C18 AS DateTime), CAST(0x0000A686009D5F73 AS DateTime), CAST(0x0000A64B008E2966 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0e5f6a86-cc83-474b-8d52-a817153dcd6d', N'Achc55URq7Kj88BsMUzCvdj/r54=', 1, N'SbNWIsk22Y7W/7MMcy9auQ==', NULL, N'huy.lq@bidc.com.kh', N'huy.lq@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2A00018C2AC AS DateTime), CAST(0x0000A46100A43ECB AS DateTime), CAST(0x0000A2A00018C2AC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a6242b41-bf83-4728-89dc-845e9c0c4ace', N'zAxWdKCB5jFkDCPcK1WD9YX4JKM=', 1, N'4jLAqS3NY4h+fXHuHwYjEA==', NULL, N'kachana.e@bidc.com.kh', N'kachana.e@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2FB008CB644 AS DateTime), CAST(0x0000A8F900878369 AS DateTime), CAST(0x0000A2FB008CB644 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'30657f2e-ea37-4b03-acac-054f03bbb52e', N'liNQQZWSXglMtM5R1PC+LeaK8TU=', 1, N'xVkxXSzOECc7bDfYkLjtQA==', NULL, N'kanhawat.s@bidc.com.kh', N'kanhawat.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00733A70 AS DateTime), CAST(0x0000A8F0007F7C39 AS DateTime), CAST(0x0000A24B00733A70 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e17991ed-d277-4b6c-b1e3-de7bd2eb8ea6', N'pDt+nabBJX8j5h1WHGCDyCCWm5g=', 1, N'DFdgeDVwhl7GInq2+5YWpg==', NULL, N'keochenda.l@bidc.com.kh', N'keochenda.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2B600437E20 AS DateTime), CAST(0x0000A8FE001E8757 AS DateTime), CAST(0x0000A5DF001D5CDE AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0d0af9b4-5b07-408e-af07-98a1e0fae271', N'orolgVj0Plem9YC1wQQPxCNGQmw=', 1, N'bgNpq4BpAFAWKBO/9nI2kw==', NULL, N'Keosorita.d@bidc.com.kh', N'keosorita.d@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B006B45B8 AS DateTime), CAST(0x0000A8FD007A4E14 AS DateTime), CAST(0x0000A38600973308 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'209ac89e-95c3-4135-81b0-bd4c389d3744', N'GqaPX1kbns8hIYon0Tkgkg8TewE=', 1, N'35GHWFecWr69BoZBWSarmw==', NULL, N'Khanh.l@bidc.com.kh', N'khanh.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B006C4D64 AS DateTime), CAST(0x0000A5BB00C04AEF AS DateTime), CAST(0x0000A251001B5B7E AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b6326d01-e362-4d99-b3c9-b4d0104680b0', N'vIkW5//ImU7QfuANOpxnYEj0T78=', 1, N'kkZ/fs/RR1RdHkSslXchuQ==', NULL, N'khanh.l@bidc.com.kh', N'khanh.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A206008280FC AS DateTime), CAST(0x0000A58D00178C54 AS DateTime), CAST(0x0000A3EE0024B6AC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'8596ea3f-41e9-473b-a928-32a658256879', N'MOLMiJThZZLnpvjAGD5FKyMTjuw=', 1, N'VywoxqVd1lVJYZ58jmmV2g==', NULL, N'khanpisey.s@bidc.com.kh', N'khanpisey.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00739BB4 AS DateTime), CAST(0x0000A24B00739BB4 AS DateTime), CAST(0x0000A24B00739BB4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2b5ea8a7-8f6d-4018-9655-4bfe9f09663d', N'dBiAnKhfSAr1JXsmPNJG4CrsOXg=', 1, N'gDVlm1wrhaGvyp15BNEZYw==', NULL, N'kien.lh@bidc.com.kh', N'kien.lh@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C600352ED8 AS DateTime), CAST(0x0000A6A2008705B5 AS DateTime), CAST(0x0000A5C600352ED8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e24a41b8-4ebc-4ab0-95ee-51d7024598fa', N'r/GiN4rKZm7oKiKH891FXrOkYrU=', 1, N'dp1T8LxwlTKFEh/rCZxg6g==', NULL, N'kim.s@bidc.com.kh', N'kim.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C4008F4684 AS DateTime), CAST(0x0000A5C4008F4684 AS DateTime), CAST(0x0000A5C4008F4684 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c7902f19-c1ac-4a20-a988-6ac42cacdeec', N'7NL/SoKQPZghverqzjc5dbTxXXk=', 1, N'pEvwsLmTJUaBUYGVrwvrgA==', NULL, N'kimhong.s@bidc.com.kh', N'kimhong.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20078D020 AS DateTime), CAST(0x0000A8A3001D5589 AS DateTime), CAST(0x0000A8A20078D020 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'293e0888-50c2-47fb-bf81-516f46227f0c', N'0YqMSP539gqJdGYD+6yDdo405Cw=', 1, N'+JBotbh3o27UnfMnPBYKBw==', NULL, N'kimhouy.c@bidc.com.kh', N'kimhouy.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A7AF008E60D4 AS DateTime), CAST(0x0000A8B10069CF94 AS DateTime), CAST(0x0000A7AF008E60D4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd3776a3f-dc90-4f18-a321-5e6feba5aa2e', N'btRm/0IcBqJZJwWtj6wdwuJ0qNg=', 1, N'MalR6DcSFeTkOEYt+nDu2w==', NULL, N'kimleng.s@bidc.com.kh', N'kimleng.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0073EEE8 AS DateTime), CAST(0x0000A24B0073EEE8 AS DateTime), CAST(0x0000A24B0073EEE8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'89fbf379-fbee-477d-8877-5591b5ffdaef', N'UXQ4ow58nJX7rhBnxF4v0HJ8fug=', 1, N'E3Fd2AQzJrOVp9YjY3Jnbg==', NULL, N'kimlis@bidc.com.kh', N'kimlis@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3A30040338C AS DateTime), CAST(0x0000A3F600A65FE1 AS DateTime), CAST(0x0000A3C7008BF178 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9909b226-9dff-45d5-8560-637d1d3602c0', N'qmSM6B9x4DtmyyhhrZUvOdJB3C0=', 1, N'Ve9LWUrA/BQKTjBbZ/MW+w==', NULL, N'kimsophea.l@bidc.com.kh', N'kimsophea.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A10015E514 AS DateTime), CAST(0x0000A8A20076ACB7 AS DateTime), CAST(0x0000A8A10015E514 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e0ff0d6b-d20c-480d-8ec9-2102ee9e6815', N'KDdBEGG7Ji8E9ed6U0q8VLyPN9s=', 1, N'cRzQwDCNufGymUbs19F7cQ==', NULL, N'kimsoung.c@bidc.com.kh', N'kimsoung.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A674004722F0 AS DateTime), CAST(0x0000A8EE007E3C5A AS DateTime), CAST(0x0000A674004722F0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'06a5421f-dba0-4da8-a612-41d55b2284f0', N'SFxos8lDczk5GqDbvOqpkR1RKB0=', 1, N'IwdpdXMSXVTZA+gSrIE9yA==', NULL, N'kin.hv@bidc.com.kh', N'kin.hv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A10012EB5C AS DateTime), CAST(0x0000A8A20077382D AS DateTime), CAST(0x0000A8A10012EB5C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'43ea7390-a040-4e71-92a0-bb9865061d7e', N'VFYYJFPOwgNTzTRHQqKZeKtDF6E=', 1, N'wplRZ1RbGQQX0qd2KKXbyQ==', NULL, N'komoth.y@bidc.com.kh', N'komoth.y@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0073BEDC AS DateTime), CAST(0x0000A8F700180E5C AS DateTime), CAST(0x0000A24B0073BEDC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b0a64ba3-541b-4422-844a-17b0db169df9', N'U4tjawb2OrMdqaWnr4/PkUOS8og=', 1, N'I4Qfa9JNXeFRSF78d0F4QA==', NULL, N'kongkea.p@bidc.com.kh', N'kongkea.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A4DD00911568 AS DateTime), CAST(0x0000A6790031EDAF AS DateTime), CAST(0x0000A5F8000278CA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'bea95a00-9571-46d6-a37e-3ad8b32e2650', N'GdA7XHJhqhHHw9R1cyHIDm62cKY=', 1, N'8o9BOc5/GSyrx5+26QrqWg==', NULL, N'kosal.e@bidc.com.kh', N'kosal.e@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2B5007E6F30 AS DateTime), CAST(0x0000A2FC009E4A18 AS DateTime), CAST(0x0000A2B5007E6F30 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1aebc802-4c81-42ec-a4dd-d9c25dedcb99', N's/1/mclB8lMINiW5knACSOIYfic=', 1, N'8eYdQX9OlcIbDk6kETHmUQ==', NULL, N'kunthea.ms@bidc.com.kh', N'kunthea.ms@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8DB006CCD20 AS DateTime), CAST(0x0000A8E800630AB5 AS DateTime), CAST(0x0000A8E800634F9F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'efd47d76-f6cc-43a5-9df8-e578e226994d', N'Rc8KQ5FCuXCEKnya9Rau/zuPfTQ=', 1, N'S/W8OFYtjJVyX+DyK0envA==', NULL, N'kunthea.ms@bidc.com.kh', N'kunthea.ms@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8DB006DB1A4 AS DateTime), CAST(0x0000A8DB006DB1A4 AS DateTime), CAST(0x0000A8DB006DB1A4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e01a7869-195f-427b-8330-f824a24c1964', N'NdK4ytlBMeH8LdrPbnULucrJmNI=', 1, N'M9tyGNYDBe35sk+5Y3egnA==', NULL, N'laline.l@bidc.com.kh', N'laline.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C50035DC48 AS DateTime), CAST(0x0000A66C00297E3A AS DateTime), CAST(0x0000A5C50035DC48 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e717afec-4814-4343-bb76-ed52b33b90d7', N'ctEUJyhuDvUWrpClDx5J8WvUULQ=', 1, N'K9a9M8dYYIxpH3I8E7ufmQ==', NULL, N'lay.h@bidc.com.kh', N'lay.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20076D4B4 AS DateTime), CAST(0x0000A8A20076D4B4 AS DateTime), CAST(0x0000A8A20076D4B4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7ffcb00a-1dbd-4e18-80ff-1172a8216db0', N'RAQJNwp1obDlqoQOuj/JPTVZpoY=', 1, N'Ul9FXCHuu6OIYJM4+2CPfQ==', NULL, N'lieu.vt@bidc.com.kh', N'lieu.vt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003B1A14 AS DateTime), CAST(0x0000A8FE001FC3AC AS DateTime), CAST(0x0000A865003B1A14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cfc0a3d2-41ff-4683-bb5c-313d285b5a93', N'lkHpqA2+oWF6lJKIWPJLN3ZVsfw=', 1, N'Rj8903qQE7JkrR5gcXiASQ==', NULL, N'limsron.n@bidc.com.kh', N'limsron.n@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A459008D3984 AS DateTime), CAST(0x0000A8A300403E5C AS DateTime), CAST(0x0000A459008D3984 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'813d6494-6edf-4303-817d-a01d93e8d5a5', N'E5WMFXHiklS7v8ajdLmUCRqkeqI=', 1, N'b5nxHaqEtTR5HYsh9MwWqQ==', NULL, N'Lin.r@bidc.com.kh', N'lin.r@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24D00135BDC AS DateTime), CAST(0x0000A268006EA30C AS DateTime), CAST(0x0000A261001E5FC3 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'077e1f5b-cbf9-4c0d-a144-f2401b53a3b5', N'cgxQkf+HQMmRdJlYbOhGSnJQ24o=', 1, N'ZUKeeDbcwJ4/8huiy6NVlg==', NULL, N'lina.s@bidc.com.kh', N'lina.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2A000186AC8 AS DateTime), CAST(0x0000A8F00042E848 AS DateTime), CAST(0x0000A2A000186AC8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'93ff3b39-8740-4e27-a0e1-6897bfefec68', N'Lcy5Mm/r9KTMeRAm7kUihXDj8WA=', 1, N'yzuycGtqnna1U0n/gNMR6Q==', NULL, N'linhour.k@bidc.com.kh', N'linhour.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89C006F7F5C AS DateTime), CAST(0x0000A8B7003332C6 AS DateTime), CAST(0x0000A89C006F7F5C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c6e22b06-8656-4b2f-a9cb-56e284f8ae76', N'cvWSYvZZy3SOWGyhKfeRrVVQ8HI=', 1, N'XUZYukpQVvF3MHefFiL5wQ==', NULL, N'ly.nk@bidc.com.kh', N'ly.nk@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5FD00846AD4 AS DateTime), CAST(0x0000A8E4009166A6 AS DateTime), CAST(0x0000A5FD00846AD4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'711dab45-4d26-4913-9eb7-2de558b24782', N'BvUYUPZxXWr9QnFVXwQiqqhAi3I=', 1, N'MvP3SZboJusIJfBh9MNc1g==', NULL, N'Lyhoung.k@bidc.com.kh', N'lyhoung.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B007860CC AS DateTime), CAST(0x0000A8D400807BB4 AS DateTime), CAST(0x0000A24B007860CC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ffcef8a7-8b13-4dc5-97ea-b3dc0f183daa', N'KL6TabVWTZoLxoEAfub/iIA5+us=', 1, N'I2QVUf5yktFoiKoqAnTUKw==', NULL, N'lyvisal.a@bidc.com.kh', N'lyvisal.a@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5FD0020D960 AS DateTime), CAST(0x0000A8D40078B2B1 AS DateTime), CAST(0x0000A5FD0029A92E AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b7f38b6c-37aa-4320-983d-12d5e9f79b20', N'GbB8TNIxZB6hFTrgZwMCLNSGZwI=', 1, N'y7hKBoiHkD3heyCdksqgGw==', NULL, N'malay.k@bidc.com.kh', N'malay.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2A000181794 AS DateTime), CAST(0x0000A355007A76FB AS DateTime), CAST(0x0000A2A000181794 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'69eec27e-11a2-4e20-bff0-1892965d4ace', N'HbQ4OECNSNvH+IODPBzBTmhiqgY=', 1, N'NdRNmcfjw8tWJQB6Emq8CQ==', NULL, N'manorith.m@bidc.com.kh', N'manorith.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A200790D10 AS DateTime), CAST(0x0000A8A200790D10 AS DateTime), CAST(0x0000A8A200790D10 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e9117246-3f84-42d5-a7ed-66b542cc7d55', N'vVA47erslpFFmvOnpQX7MTFfiIA=', 1, N'N3L4yvo15QBlD4qJMBXMyw==', NULL, N'mapheap.c@bidc.com.kh', N'mapheap.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A50C001914B4 AS DateTime), CAST(0x0000A89500290438 AS DateTime), CAST(0x0000A50C001914B4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ce23ed2d-14bc-4062-9892-2ab6fe50b280', N'oi7HemkmsGF0qxblBTaTPnZ+L/M=', 1, N'+d966LsDKmi6B0LipTdoNQ==', NULL, N'mardy.l@bidc.com.kh', N'mardy.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A100126240 AS DateTime), CAST(0x0000A8AA00495E26 AS DateTime), CAST(0x0000A8A100126240 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f55a6f22-cc45-4678-a91a-0bfe43fa5a6e', N'uMkNIIX9CUWMSezSKsdAHfArqYY=', 1, N'eURZ+bOe7rzBGrBVsaOCnQ==', NULL, N'measmony.s@bidc.com.kh', N'measmony.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5DA00705828 AS DateTime), CAST(0x0000A8EE007DFB04 AS DateTime), CAST(0x0000A5DA00705828 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'eb98f3d1-d967-450e-ad2f-db075b4a2e00', N'3ysgJ0Gdvkb8hq3q2frxl+YRmag=', 1, N'bsJ/1/QZV7zbf2V5NTRJHQ==', NULL, N'minh.nd@bidc.com.kh', N'minh.nd@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A85D0038EB18 AS DateTime), CAST(0x0000A877001087B3 AS DateTime), CAST(0x0000A85D0038EB18 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cd942187-031c-450d-afb4-c5896911584d', N'ZllmeGG8qclNYhVfHhKSiOip7Ps=', 1, N'hPpJKBdWm6kiDxhJeS+Jug==', NULL, N'minh.tc@bidc.com.kh', N'minh.tc@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0077EA70 AS DateTime), CAST(0x0000A24B0077EA70 AS DateTime), CAST(0x0000A24B0077EA70 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fac23cce-edc3-42b6-92a9-c127d4ccf39d', N'yyeo7OFlP2IUwBY2YOGmSeDszgo=', 1, N'VAaoqIVJjPHLKvL05kkrjw==', NULL, N'minh.tv@bidc.com.kh', N'minh.tv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A39C0024E424 AS DateTime), CAST(0x0000A39C002504DF AS DateTime), CAST(0x0000A39C0024E424 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'bdba508c-2822-4379-bd51-06fdd0006a64', N'Zmwiqr3Wr7Xtcn3VRxwU5n/djKY=', 1, N'CQnCOlIQrTWpoppXiPLPQw==', NULL, N'molika.c@bidc.com.kh', N'molika.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0076E774 AS DateTime), CAST(0x0000A8F000A8E272 AS DateTime), CAST(0x0000A85D0039C1EE AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e8933eba-e1f9-47a3-beed-497c50d653dd', N'HuSoBxl2nsTaPTYBz7H3Nqh/10w=', 1, N'WNDDvuPBM9RBOPZ0jvHy3g==', NULL, N'monika.k@bidc.com.kh', N'monika.k@bidc.com.kh', NULL, NULL, 1, 1, CAST(0x0000A5C4003DAA54 AS DateTime), CAST(0x0000A7700025849B AS DateTime), CAST(0x0000A697002EF33F AS DateTime), CAST(0x0000A776003584CB AS DateTime), 0, CAST(0x0000A776003584CB AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'46bef49d-16f5-42f3-af42-d12d2f33d58b', N'5hJSFiEP5IsqsOhUCow+8wbvAIQ=', 1, N'hu8mO9ce7au4octkxQcMuA==', NULL, N'monirort.ls@bidc.com.kh', N'monirort.ls@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00779610 AS DateTime), CAST(0x0000A8FE00AA0813 AS DateTime), CAST(0x0000A8F50036F2CA AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'85c7b5a6-bd9f-444e-9e6e-644d9727645a', N'efX0tcVAtPT1mBX4DZBDb8uMhb4=', 1, N'+li4a0N1zeCph/H0Jw//oA==', NULL, N'munynimeth.s@bidc.com.kh', N'munynimeth.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20078990C AS DateTime), CAST(0x0000A8A20078990C AS DateTime), CAST(0x0000A8A20078990C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2cc9be95-70fc-4a36-8ae7-2274aabad8fc', N'J8mng3bs1zGfkW/clLj6Nk1pXmI=', 1, N'e11KbHICrOMerKRXr2KiSA==', NULL, N'namsinhgiandi@gmail.com', N'namsinhgiandi@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A29F00B7672C AS DateTime), CAST(0x0000A39C0022FBDD AS DateTime), CAST(0x0000A29F00B7672C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5abdb16c-c370-4a1b-a195-b58a683747a7', N'ahcX5Kxl7cPTi8CtVGVsPV2o82M=', 1, N'/ORsBb7p+RFIrfnez6hylQ==', NULL, N'nearyrath.s@bidc.com.kh', N'nearyrath.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003AE42C AS DateTime), CAST(0x0000A8FD004B1DC7 AS DateTime), CAST(0x0000A865003AE42C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6d4bbd12-2f72-4533-9f76-bb016297b7a3', N'CUj8uwjo8EI4eu5Zd/WgtlwsHjs=', 1, N'Ta+L5FiY/Kuy/K7hmXq5BQ==', NULL, N'nghia.lq@bidc.com.kh', N'nghia.lq@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6BA00AC1AFC AS DateTime), CAST(0x0000A6F600A9DACB AS DateTime), CAST(0x0000A6F600A9723D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0x0000A89C00726827 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b47caf78-cc79-49a6-90a9-e3e648ab2e68', N'V+rSDz71Jt5oUcWth32dKLOMbmM=', 1, N'2hUdJCUy68CDT74HdFTmdA==', NULL, N'nika.k@bidc.com.kh', N'nika.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6FE006FE1CC AS DateTime), CAST(0x0000A6FE006FE1CC AS DateTime), CAST(0x0000A6FE006FE1CC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd6100367-ab21-4946-9d2f-d6201a6962a0', N'IZo2H+XqRP06ye3dz9VxE8ZvJEQ=', 1, N'nBXJHHsXHiR9KBDn9jL5kQ==', NULL, N'nit.ld@bidc.com.kh', N'nit.ld@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3A3003FCC6C AS DateTime), CAST(0x0000A77E009792E3 AS DateTime), CAST(0x0000A5EF0016AF10 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'736fd79a-c166-4ee6-af9b-3867cd99fe49', N'Cadx4N2kilCRXgm0CxIAe1DXO/0=', 1, N'chE2nulGOOJUahM0mcF8RA==', NULL, N'oly.dt@bidc.com.kh', N'oly.dt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A23E00395CC4 AS DateTime), CAST(0x0000A8AA0094B8E5 AS DateTime), CAST(0x0000A23E00395CC4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f24285eb-126f-4cb8-90e9-59f1af60e4d8', N'gSrJ9jGr5TlEVf9bX16ZrEZfZ6w=', 1, N'j5dSC7DhhAKEwACjXhNlmQ==', NULL, N'phallyda.m@bidc.com.kh', N'phallyda.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A78D00932394 AS DateTime), CAST(0x0000A8FF00139F49 AS DateTime), CAST(0x0000A8D9009F2597 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'798b9c28-5b8d-4d1a-bf35-55b61ce59aac', N'yLhEpwnaSOpCmBPJ0cDLdG76sGI=', 1, N'So7CjyqLi/9jgZlwJRGb/w==', NULL, N'phanratana@bidc.com.kh', N'phanratana@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A4BC009A0D1C AS DateTime), CAST(0x0000A8BD00B2FCE4 AS DateTime), CAST(0x0000A58A006AE008 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'604301d3-86b9-4047-8945-39d94c74eaf5', N'tOPN1zBvE7AJbs1zcDPcStkm9k8=', 1, N'ATQYaaDWh3f5FLQAdBiTzg==', NULL, N'pharin.n@bidc.com.kh', N'pharin.n@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3F0002ADD70 AS DateTime), CAST(0x0000A885008B8351 AS DateTime), CAST(0x0000A3F0002ADD70 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4c81cfcd-b1be-4ec4-90a2-3ce7b87ddda3', N'CKridVA9n4Uq2VvYlSIvlL95AVE=', 1, N'CGXILZoQWoa6iv4CXOzIlw==', NULL, N'phearom.p@bidc.com.kh', N'phearom.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89B00A7FD78 AS DateTime), CAST(0x0000A89B00A8B737 AS DateTime), CAST(0x0000A89B00A7FD78 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'13afc92b-5490-47f1-92ec-dbe63ab31c60', N'Gof5kHguRV2Y9opg+tmojV2bMKY=', 1, N'aCDuHeGOE+pHwqPMgHQeEw==', NULL, N'phong.ch@bidc.com.kh', N'phong.ch@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6320103BD5C AS DateTime), CAST(0x0000A71600A47A17 AS DateTime), CAST(0x0000A6320103BD5C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'95c72a77-5e6e-4c16-9768-9ad13840606c', N'4hKBa4qyeglZ4n7ZnQxhB/PGJGI=', 1, N'iIIKxIStUOxteIDueS7lDA==', NULL, N'phuong.dth@bidc.com.kh', N'phuong.dth@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C5009C4578 AS DateTime), CAST(0x0000A8F000AE499C AS DateTime), CAST(0x0000A7FD00812748 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'24f68d34-4bfd-4656-a485-8a11da01cbf3', N'4zu60UUXqE4TbQ+K0NyZfXJXNiM=', 1, N'hPiWEyN3WCgWwE3dWsXs2Q==', NULL, N'phuong.nn@bidc.com.kh', N'phuong.nn@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A85D00386454 AS DateTime), CAST(0x0000A8FC0072239C AS DateTime), CAST(0x0000A85D00386454 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 1, CAST(0x0000A9A80092FCFB AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a7e77bd5-0f93-4406-b734-286d29367717', N'TSs1MneoTSi2mwHsqBVubBOfGeI=', 1, N'LGVIooquOyu0YQF6YUKaIg==', NULL, N'phuong.nv@bidc.com.kh', N'phuong.nv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20075B6C4 AS DateTime), CAST(0x0000A8A20075B6C4 AS DateTime), CAST(0x0000A8A20075B6C4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2511862f-d732-4cda-8299-796a25ab1b82', N'PuhAFpEOot1QXp7V5x+bzKi0MLw=', 1, N'flWSoOyjykt3iqCqt6rKJw==', NULL, N'phuong.th@bidc.com.kh', N'phuong.th@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200FAC47C AS DateTime), CAST(0x0000A63200FAC47C AS DateTime), CAST(0x0000A63200FAC47C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4928a98e-575d-42c4-988a-dd286eaabe9a', N'Nqoh8ZiNAILcytEgECYz48QbD/Y=', 1, N'Gabhnawy+GJPB6PDbINXBw==', NULL, N'Pisey.h@bidc.com.kh', N'pisey.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0078ABCC AS DateTime), CAST(0x0000A8A1008B36A6 AS DateTime), CAST(0x0000A24B0078ABCC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0x0000A8A20077C207 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'460ce37b-0ec3-4575-8dd8-ac6069e2b1cf', N'+RxQLR7x9aKwX2GTbSB+1hfTykM=', 1, N'6UA0s2Nd40rzB578kqLgkA==', NULL, N'pisey.m@bidc.com.kh', N'pisey.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A78C007196E8 AS DateTime), CAST(0x0000A8F1004644F7 AS DateTime), CAST(0x0000A8B2004CD704 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b31c8339-4132-49a5-ae56-a6e90331eb5a', N'WFbbL1rzm6wygQ5IG8446QIieo4=', 1, N'qi9MTFmKed4FNndoLsQZUw==', NULL, N'pisey.ong@bidc.com.kh', N'pisey.ong@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2490041C0D0 AS DateTime), CAST(0x0000A63A00A0A1B6 AS DateTime), CAST(0x0000A2BD00813014 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e6a168cf-efb4-449a-a2d0-88f5ddc135a2', N'x4astJzT1ilt8EMfsOYP8XX8uwU=', 1, N'Gftb8NTOTW79S7ss4lnr7g==', NULL, N'pisith.k@bidc.com.kh', N'pisith.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C60095C310 AS DateTime), CAST(0x0000A6F0008401D4 AS DateTime), CAST(0x0000A60900AF764A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'cab2232f-cb57-402c-bc35-5080c7e4b9b6', N'5uuFWujffZe88X7P290X/QCqi4I=', 1, N'YT8Z8CpkwJY9PkkfDpoNog==', NULL, N'quocdp@bidc.vn', N'quocdp@bidc.vn', NULL, NULL, 1, 0, CAST(0x0000A2540043E9F0 AS DateTime), CAST(0x0000A46600A5F5A5 AS DateTime), CAST(0x0000A2540043E9F0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'8986d3cd-a751-4bd3-bcd9-9b93f9fac163', N'3XK92vsepGZIDGuqzbKfYYfXbsk=', 1, N'qNQZD+mMqITeeJhYmoyXTQ==', NULL, N'quy.hv@bidc.com.kh', N'quy.hv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A4DC006D1DFC AS DateTime), CAST(0x0000A8DD00C22CEC AS DateTime), CAST(0x0000A50C0072B7E9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'db5f3de3-98c5-4e9e-9ffe-d7659ed8916f', N'Vcf2/+XLoznjzZzMS0RcHasm8gU=', 1, N'Lc0N4/LZtjCTlRFCTGU80Q==', NULL, N'quyen.npv@bidc.com.kh', N'quyen.npv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A206008235FC AS DateTime), CAST(0x0000A7D600A85770 AS DateTime), CAST(0x0000A3ED00B4752F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b03d7fd9-e21d-40d0-b072-60cd76f372dc', N'1QowdV6NFDuf4BYamHuqtUZiOHg=', 1, N'aJDH6td6YfrZFY97hXl3Qw==', NULL, N'Rachana.k@bidc.com.kh', N'rachana.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A28B003A6470 AS DateTime), CAST(0x0000A5BD003B67BE AS DateTime), CAST(0x0000A35C00933231 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0x0000A63C0011EEDE AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd5675ef7-7d98-4f84-ae0d-d8a4738c8a53', N'8PyEXrqYMDNXZAWyZzKmcxutK9Y=', 1, N'GNhMEB8G5lDQ+HgTZ5Kbuw==', NULL, N'rachna.k@bidc.com.kh', N'rachna.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5E000766EC0 AS DateTime), CAST(0x0000A5E000766EC0 AS DateTime), CAST(0x0000A5E000766EC0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd6772e7f-a160-40e6-8b2d-aca6dedfa370', N'hfX4YoISEfxfWReBThe/x2JMKgc=', 1, N'C8gfwZmgCRk6fHwa2jkqmw==', NULL, N'rady.v', N'rady.v', NULL, NULL, 1, 0, CAST(0x0000A5DA006EBBA8 AS DateTime), CAST(0x0000A5E0008599E6 AS DateTime), CAST(0x0000A5DA006EBBA8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'43b27eb3-475f-4c4f-944c-7a9da9ac4286', N'0IC5H2pUKHJCtZ7ZvQ8b05WJQaY=', 1, N'HMl77vUZNvi7jUkAqumerg==', NULL, N'raksmey.c@bidc.com.kh', N'raksmey.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00768E64 AS DateTime), CAST(0x0000A2BA007CF323 AS DateTime), CAST(0x0000A24B00768E64 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'203970f2-a035-425b-9245-51d1c08e4869', N'TunNjWzssYdTTj5VgDb5Wzfud54=', 1, N'BI8BNDGF55OQ/SOmyDjoIA==', NULL, N'Rana.tr@bidc.com.kh', N'rana.tr@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00795DEC AS DateTime), CAST(0x0000A337003F6CB2 AS DateTime), CAST(0x0000A24B00795DEC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'22639d30-44d5-4ee6-a07d-f230eba9163e', N'FTxaffGFSi4UVzDw/ztS73VlvSA=', 1, N'4S9TkLPikOmLhTgz/fnPKA==', NULL, N'rath.st@bidc.com.kh', N'rath.st@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A77D00919C2C AS DateTime), CAST(0x0000A8FF001582C8 AS DateTime), CAST(0x0000A782008D7018 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'473eb59b-2529-46ee-b754-7450ba7318d8', N'oqCEnmDly32B5JtYFNv2K4EyYx4=', 1, N'MGJsr59WStBO/8kAhjYoRw==', NULL, N'ratha.c@bidc.com.kh', N'ratha.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A897006A5DB0 AS DateTime), CAST(0x0000A8E800670B2E AS DateTime), CAST(0x0000A897006A5DB0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e86f73ca-126d-4dd1-807b-a00c9dc9e052', N'ROZlNls4c5m6fPyJCP9CITkl9vM=', 1, N'Z+DIgLg6aOjk0R1FzCGtmQ==', NULL, N'Ratphea.p@bidc.com.kh', N'ratphea.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2DF008787B4 AS DateTime), CAST(0x0000A4DB003050A3 AS DateTime), CAST(0x0000A348000F5BB6 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2531d195-c1ed-4e57-a26d-5d625f1a2f01', N'I1oKExnq8UMt0wrtnN9mZE7gCsE=', 1, N'mbgSgUFEMIuZBUClWpwHTw==', NULL, N'rothmony.t@bidc.com.kh', N'rothmony.t@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A2002909DC AS DateTime), CAST(0x0000A8A800884AB4 AS DateTime), CAST(0x0000A8A2002909DC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9cf2ead7-2ec7-4a72-a612-0576f23dd173', N'cgTWfm4TcmgN158zRkDA+D9yHfM=', 1, N'UxmOZGhisXQFVBgCJ/wRrQ==', NULL, N'sakada.s@bidc.com.kh', N'sakada.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A20D002A7524 AS DateTime), CAST(0x0000A8CF0087B0F5 AS DateTime), CAST(0x0000A4210095B511 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'33694099-4b80-4a8b-80b1-0ad89ba8bf69', N'gqeIh3rgDz1SieBO7tvT4Hhygoc=', 1, N'qCeNMopK41HKpMewp0S30A==', NULL, N'samath.l@bidc.com.kh', N'samath.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C4008C60B8 AS DateTime), CAST(0x0000A8F1002A34A1 AS DateTime), CAST(0x0000A5C4008C60B8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd3cd4581-9b6c-41e5-b832-cea2c36e0010', N'dDMLAPMKaJPC0aXlemsWsfY493Y=', 1, N't6mgDvYQVX34pI2Zh4PwNg==', NULL, N'samnang.c@bidc.com.kh', N'samnang.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C600332688 AS DateTime), CAST(0x0000A746003E3003 AS DateTime), CAST(0x0000A5F00086CA31 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a8944be6-9be4-47ed-88e8-10ae6a097b8c', N'Ot/4xRZ7MCvRPy6eJw3NXpPjDnA=', 1, N'L5jEuVYlIKny3/A6fWUQLg==', NULL, N'samnang.h@bidc.com.kh', N'samnang.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A2002770E0 AS DateTime), CAST(0x0000A8A200726554 AS DateTime), CAST(0x0000A8A2002770E0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5aa05362-3ff3-48df-aff4-f0288707fdc7', N'dWX/Sz/tck+gAt1kGBsriPdgvHo=', 1, N'qQw0OcPGY+/xh0JTgf02ww==', NULL, N'samnang.k@bidc.om.kh', N'samnang.k@bidc.om.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20028530C AS DateTime), CAST(0x0000A8A50039CF8D AS DateTime), CAST(0x0000A8A20028530C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'95fb94cb-b0b9-4d4f-9134-a919d927cc25', N'3dkM9WbcTI4zqlKKvPJpe/hkacU=', 1, N'ykIF7Bbxx2nqBZu/e7cYNQ==', NULL, N'sarak.h@bidc.com.kh', N'sarak.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A90A007D6400 AS DateTime), CAST(0x0000A9210048083E AS DateTime), CAST(0x0000A90A007D6400 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fe9917a9-b2bc-4b50-9098-070f208dcf6f', N'GSKYHc5NeHt5o2MdrCSq8G2iyh0=', 1, N'EgW4euEnZphpkTdOja1hHg==', NULL, N'sarak.h@bidc.com.kh', N'sarak.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A90A007ED650 AS DateTime), CAST(0x0000A9210092A0A6 AS DateTime), CAST(0x0000A90A007ED650 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'34fb5b9f-27af-4348-9870-5804b5b3f108', N'a4R8tUmYyJN177KxVsITNyAgt6o=', 1, N'l9eOVO0HdN1XV94DATjGZw==', NULL, N'sarak.h@bidc.com.kh', N'sarak.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A90A007F2D08 AS DateTime), CAST(0x0000A90A007F2D08 AS DateTime), CAST(0x0000A90A007F2D08 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'991ee162-af70-48d5-b766-dc9d1e0011f4', N'0LqbZuyKtz23AwN3XAJ5zhtXVdM=', 1, N'b8BzYbmWMyPF3GdqeNwT3g==', NULL, N'sarak.h@bidc.com.kh', N'sarak.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A90A007F8AC8 AS DateTime), CAST(0x0000A90A007F9DD3 AS DateTime), CAST(0x0000A90A007F8AC8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fe3b11a5-2e4d-45ae-a7f7-6d49070b2355', N'CuWKlkShAUlQsG0auZwBZ7KitGU=', 1, N'q99VHXZSgxVnbzAyluCCjw==', NULL, N'sarak.h@bidc.com.kh', N'sarak.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A906003CD2B4 AS DateTime), CAST(0x0000AAB9002DC2C0 AS DateTime), CAST(0x0000A9690035E8EC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'b01ca189-a9d1-4368-819d-38ede56e4e44', N'AkzXuBmNO53L8fgwJ9Tz10Q9xqc=', 1, N'C/tgdOs/6MPGmF9K/uav0g==', NULL, N'Savtev.k@bidc.com.kh', N'savtev.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A28B003A1010 AS DateTime), CAST(0x0000A8F600327A09 AS DateTime), CAST(0x0000A28B003A1010 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0693fb41-74d7-4457-bf82-6e6e77e85a9b', N'bciVFIx470BDH83/2a079Nr4B/k=', 1, N'1EocOLCXbFmfX+xIKZtbhw==', NULL, N'Seavlang.l@bidc.com.kh', N'seavlang.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A37D0081CEDC AS DateTime), CAST(0x0000A714007D0661 AS DateTime), CAST(0x0000A900007D962D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'21514293-c4db-4f8f-a205-bb266bc245d1', N'/DMiy1D61pQcPZGPH8UD1TG2Q9M=', 1, N'sA3s9Za7i3DZE1Xu9S0EiA==', NULL, N'seila.k@bidc.com.kh', N'seila.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A86500392A60 AS DateTime), CAST(0x0000A8CD00415D62 AS DateTime), CAST(0x0000A86500392A60 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7749f536-fd0e-4428-ae24-bda6cf97e641', N'LdEVF1bvzG1JzdS749NbYFxNfcU=', 1, N'hJSLYkwWnaHrHrieW2O1ww==', NULL, N'sela.h@bidc.com.kh', N'sela.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0074B4F4 AS DateTime), CAST(0x0000A8FE0035B84F AS DateTime), CAST(0x0000A6A600230ED9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0026a458-b43e-428e-a68b-86ea2127e37c', N'DuNuVXgrmFXasc5JfC6tC/X2AJA=', 1, N'H6lL9fCNkF1cpzizR+Sd8w==', NULL, N'sengthai.h@bidc.om.kh', N'sengthai.h@bidc.om.kh', NULL, NULL, 1, 0, CAST(0x0000A8A100159A14 AS DateTime), CAST(0x0000A8A20076D2CE AS DateTime), CAST(0x0000A8A100159A14 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 1, CAST(0x0000A9AC0022903B AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'373a2074-84a7-4330-9989-1077601ddfc3', N'5gyRwvp50QLzyIjZ8uvTGK4ndzw=', 1, N'JlW42oYl9SLZXYAtPv0uKQ==', NULL, N'seyma.m@bidc.com.kh', N'seyma.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89C006EF514 AS DateTime), CAST(0x0000A8A2003144A0 AS DateTime), CAST(0x0000A89C006EF514 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'035bc17f-1ada-4c11-ae25-557e66cf40b1', N'0Oo/zszdbJJq1GUhJUKD/eDffGc=', 1, N'dYLUxNGS9rhLR0YwPud+OQ==', NULL, N'sidona.n@bidc.com.kh', N'sidona.n@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A86A002DD5FC AS DateTime), CAST(0x0000A8DA0093A39B AS DateTime), CAST(0x0000A86A00405E35 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c72b0c30-8325-48f3-8c00-c30bb4406636', N'CGoxmO0K1pMrFA7bzqCHT+HIVU0=', 1, N'omFz+xbrv/YQ1Q4irI3DQQ==', NULL, N'sith.m@bidc.com.kh', N'sith.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89C006EA690 AS DateTime), CAST(0x0000A8C0008BACEE AS DateTime), CAST(0x0000A89C006EA690 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'aefdf7d8-388b-4fa6-856c-22d1b74a7c8b', N'G458KZrnUsYwuqWxRw7d0q4k6XE=', 1, N'SbrB72p2LdSRZSA4k60jGg==', NULL, N'sithan.p@bidc.com.kh', N'sithan.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6D3007F4478 AS DateTime), CAST(0x0000A6D3007F4478 AS DateTime), CAST(0x0000A6D3007F4478 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'edac2ee0-b19f-41d0-96b6-762651fb269a', N'nQRNrY6RHMNj9mtkg/ZLwVChZyE=', 1, N'ul8ttXku2JwHBO9Ze1Y9cA==', NULL, N'sithik.i@bidc.com.kh', N'sithik.i@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C5009CCFC0 AS DateTime), CAST(0x0000A76200415FD3 AS DateTime), CAST(0x0000A5C5009CCFC0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1b588cc2-b9da-46e0-945a-eecffccc416d', N'jZ+Ke1saEO8jIsEvj6p64Rzdjqc=', 1, N'Yhse77pEv+6dwkFGBDfF7Q==', NULL, N'sivlang.m@bidc.com.kh', N'sivlang.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20078288C AS DateTime), CAST(0x0000A8A300213161 AS DateTime), CAST(0x0000A8A20078288C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3d5f51a3-6b5b-47ed-96bf-26f3fd556d57', N'FLBRfT4d2LgkG0UGaOFhmamDpY8=', 1, N'QG/UwoIXYoyrCiFkNGtsEQ==', NULL, N'socheata.c@bidc.com.kh', N'socheata.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A59A006CFF84 AS DateTime), CAST(0x0000A73200733496 AS DateTime), CAST(0x0000A59A006CFF84 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1e54f5ee-d989-4774-9c93-c29179b45ca4', N'guj6lxhqJbiGRqFVsalJcG43MLk=', 1, N'3+8KWz/f1a7aBK1wYwb8PA==', NULL, N'socheata.s@bidc.com.kh', N'socheata.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A337002231E8 AS DateTime), CAST(0x0000A6730044EA9B AS DateTime), CAST(0x0000A337002231E8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6c498537-2640-47f9-a162-3db17262067c', N'gdiQjyjO902TLBWPHTCjbEjBG8U=', 1, N'lDFrBQR8/E8v0Wvbxm1Cyg==', NULL, N'sodalin.v@bidc.com.kh', N'sodalin.v@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89B00A70AE4 AS DateTime), CAST(0x0000A89B00A899E1 AS DateTime), CAST(0x0000A89B00A70AE4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'74a719e8-0d9b-4d59-b310-feeb384a18ba', N'2bjb2UW8oWNIdfFcLSFXuOdyEwA=', 1, N'kbBTkGX618z1t96JzWux3A==', NULL, N'sodanet.p@bidc.com.kh', N'sodanet.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A688003011DC AS DateTime), CAST(0x0000A8F0006D3C41 AS DateTime), CAST(0x0000A688003011DC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'4a16cdbe-6351-45de-96de-2cbed1d0c3fc', N'H4Xq8CqOum/Lx+ruY9HPe2LwlWI=', 1, N'uhEFF8K3ENpJDaGbfab/EA==', NULL, N'sokanha.s@bidc.com.kh', N'sokanha.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A2007948D4 AS DateTime), CAST(0x0000A8A2007948D4 AS DateTime), CAST(0x0000A8A2007948D4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'df62179a-6d5d-4c6d-9ff2-2096b49e0c90', N'9woZ/6bkTGxZIBgMAIXUqj+3dRo=', 1, N'IrachujzPacBe+tUXRwIqA==', NULL, N'sokdany.k@bidc.com.kh', N'sokdany.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00755580 AS DateTime), CAST(0x0000A8FC0038F076 AS DateTime), CAST(0x0000A24B00755580 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'995dae32-20b9-41c5-8732-853f639a1f43', N'U3bkvwpvXiG3LqLmxO2PD+c5aLk=', 1, N'E6XNO5d9UYtahJrdUULpeA==', NULL, N'sokea.y@bidc.com.kh', N'sokea.y@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A200778224 AS DateTime), CAST(0x0000A8A20082602E AS DateTime), CAST(0x0000A8A200778224 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2de925a4-b186-4472-8cde-10a7298d0efa', N't3b9+kLv7wtnKoPYJ9xWe/8ZvmY=', 1, N'KsM5YmGHbH/vZrRPSPL49A==', NULL, N'sokhemera.s@bidc.com.kh', N'sokhemera.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A10011F094 AS DateTime), CAST(0x0000A8A10011F094 AS DateTime), CAST(0x0000A8A10011F094 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'20c45f26-56f6-4898-ade7-30bfe441f7b9', N'M0YTWaJHC+AX6JSc45yRXZw3dAw=', 1, N'a6hD7t9By/fxuO5W+D7n2A==', NULL, N'sokhouy.l@bidc.com.kh', N'sokhouy.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A20D0029FEC8 AS DateTime), CAST(0x0000A882004AD1D5 AS DateTime), CAST(0x0000A2BD00C26A73 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'719caddf-f326-4b2f-ab50-8398305427cd', N'P4R7cvaQ5d31a6IquNvGxgsB+Mw=', 1, N'38m1V8og/KdNGyhGZ5Isfw==', NULL, N'soklinda.k@bidc.com.kh', N'soklinda.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A74A00A2F468 AS DateTime), CAST(0x0000A8F900993299 AS DateTime), CAST(0x0000A75B001A5D78 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fcceccf8-92db-4c56-8d99-b2c315268081', N'6tfFJNnONwpdkyRDzA8rWly8rOg=', 1, N'EXSZxhuNa0j8OhEb1HnB/Q==', NULL, N'sokunthea.m@bidc.com.kh', N'sokunthea.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A68F00AEA434 AS DateTime), CAST(0x0000A8FC0093D536 AS DateTime), CAST(0x0000A68F00AEA434 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6f472a71-ed51-4b7d-8070-ccf72a69d3b3', N'pNnxTAEYhGO6CBG7CoHO32elAuY=', 1, N'rOsLxqWptItZsQbcq5ay4w==', NULL, N'somala.l@bidc.com.kh', N'somala.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A22700AB273C AS DateTime), CAST(0x0000A261009E26AE AS DateTime), CAST(0x0000A22700AB273C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'419f05f9-ea1c-4173-a2bd-df3bf5920018', N'np3wbjf3qwAqzp6HZyIpxJa8j0U=', 1, N'otTwGARIlq5YkCA/c29Hsg==', NULL, N'somala.l@bidc.com.kh', N'somala.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B007238A0 AS DateTime), CAST(0x0000A24B007238A0 AS DateTime), CAST(0x0000A24B007238A0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'7034766f-33ac-417c-877f-03dabdcbf01f', N'EZrFbN82NMTpR1JVJiA6PXPlPXY=', 1, N'nIjvDMr6eztZTn+xLAAZBQ==', NULL, N'somanit.l@bidc.com.kh', N'somanit.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A45D008B9F5C AS DateTime), CAST(0x0000A4F8008DC69D AS DateTime), CAST(0x0000A45D008B9F5C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f71101f9-3f1b-450c-9beb-00c46f151570', N'cVxEjnFjS6qjH1HDcT2J2MYEPS0=', 1, N'CGtI9iamtsbOY7ClMmu3IA==', NULL, N'somanith.l@bidc.com.kh', N'somanith.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89C006F37E0 AS DateTime), CAST(0x0000A89C008B00D6 AS DateTime), CAST(0x0000A89C006F37E0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'560c2152-624e-4eb2-b646-6c49b3eb3b15', N'r76l4lW1982lYFR+W7OdokIK75s=', 1, N'74Z9/6N0MAo11KEcBiKeHw==', NULL, N'Son.dt@bidc.com.kh', N'son.dt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24D00128310 AS DateTime), CAST(0x0000A5070044CE43 AS DateTime), CAST(0x0000A48A00BFBADC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3ccdafac-b18a-4c73-b551-df555cce06c4', N'IQHQNiVbZ1TtVAMsTfVM6eXdK/Q=', 1, N'AGs9KO7+oLToSVErjSrPXQ==', NULL, N'sony.y@bidc.com.kh', N'sony.y@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0072E4E4 AS DateTime), CAST(0x0000A8F7001A9600 AS DateTime), CAST(0x0000A24B0072E4E4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f59a2707-3a43-49ff-a221-17badd6d4e7c', N'usJlkvkoeISobeaB5cRXd0KH6Fg=', 1, N'Op4VP5zxUv+lcX7Cd7sEOw==', NULL, N'Sopanha.s@bidc.com.kh', N'sopanha.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A31F00886FBC AS DateTime), CAST(0x0000A8FC007C83F9 AS DateTime), CAST(0x0000A34500302466 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9e04e39c-8878-4e6f-a43a-93b3cd59bd3d', N'JF/wFuFBj8VbHngn8imDXI9tNks=', 1, N'SeIf3iDzYHKCcj5Iw1T7AA==', NULL, N'sophaneth.k@bidc.com.kh', N'sophaneth.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00763FE0 AS DateTime), CAST(0x0000A82B001AEA6D AS DateTime), CAST(0x0000A617007A3AE9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0c9dc485-96a2-4b50-bdcb-a8325573cc57', N'4yAgXIntvYf41hG02RdXi+zHvnU=', 1, N'4bzAZB69YkaBKsYM+N+kvg==', NULL, N'Sophanna.p@bidc.com.kh', N'sophanna.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3D800BD2A90 AS DateTime), CAST(0x0000A8CD0043B77B AS DateTime), CAST(0x0000A3D800BD2A90 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2932b20f-edbe-41c4-8997-224431413a56', N'4Dz1r0Ctd7biEgPgTlHNeXJRRnQ=', 1, N'c/sIsehs12n/E0f1AWpGDA==', NULL, N'sopheak.h@bidc.com.kh', N'sopheak.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A500224BB0 AS DateTime), CAST(0x0000A8A500224BB0 AS DateTime), CAST(0x0000A8A500224BB0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'38cb5b75-cb70-4951-a606-0ac540d9fc07', N'CdOoy6Ag4VgxxkjJLbOquuTZjEE=', 1, N'UH78j5lmMB4XHmvj3XuB+Q==', NULL, N'sopheak.s@bidc.com.kh', N'sopheak.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0074421C AS DateTime), CAST(0x0000A24B0074421C AS DateTime), CAST(0x0000A24B0074421C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0671de15-55ed-4818-a515-06a2b0006e4d', N'gkqSVku/Vyr7JVkEUJg+u0AJpxI=', 1, N'luDnN3tG7Faz18UbM56QTw==', NULL, N'Sopheap.m@bidc.com.kh', N'sopheap.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00693C3C AS DateTime), CAST(0x0000A24B00693C3C AS DateTime), CAST(0x0000A24B00693C3C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'672dc2e4-768c-4895-b8b9-77cc45d641b0', N'+LAJSmOmXDv8XuYkyROnMK577Sc=', 1, N'usjYHWzzC5fJeQi4mdnhkg==', NULL, N'Sopheap.m@bidc.com.kh', N'sopheap.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B006A7070 AS DateTime), CAST(0x0000A8F0009EB2AF AS DateTime), CAST(0x0000A24B00A9CA79 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'9c148b50-3b7e-4601-9df8-035aaa886a11', N'g8+OcnyuGSCVGc9WvJ5Wm9+gnnA=', 1, N'S+HiXe8aGK4KvmiZhOJifg==', NULL, N'sopheap.s@bidc.com.kh', N'sopheap.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003B99D0 AS DateTime), CAST(0x0000A865003B99D0 AS DateTime), CAST(0x0000A865003B99D0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0d93766d-c974-43b6-9b0f-6ca3bec4389e', N'L2ejdfjsyRXxpVp69ALM40atR/A=', 1, N'7AYuvJLqyL8zCmAoJ1gV5g==', NULL, N'sophearin.v@bidc.com.kh', N'sophearin.v@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89B00A799DC AS DateTime), CAST(0x0000A89B00A8A901 AS DateTime), CAST(0x0000A89B00A799DC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'06483bd9-11f1-423b-9911-2498c59c076b', N'RHE91qnQwOAEZqcqKHtxHMk/oiw=', 1, N'KFUHQzAnUEeOjjk9z9K0Hg==', NULL, N'Sophy.m@bidc.com.kh', N'sophy.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B007505D0 AS DateTime), CAST(0x0000A44C0063ADD9 AS DateTime), CAST(0x0000A24B007505D0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'99fbcc4f-1f76-467b-81f5-ad8cfeeebf38', N'rMgg+lGrQ+elLxbe9fOGBj+X27k=', 1, N'pi18GD7i/FJMhcmUI7j67Q==', NULL, N'soratha.c', N'soratha.c', NULL, NULL, 1, 0, CAST(0x0000A20D0029B170 AS DateTime), CAST(0x0000A412008D6BD3 AS DateTime), CAST(0x0000A25B001E6098 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0d8c7a52-6596-480b-8c9e-d0cb8c92198e', N'2Fzyo7lK+WdzBmKVn6NUd1ksm64=', 1, N'5DMluGWB1FCLuZ/bGwTHFw==', NULL, N'sovanarong.p@bidc.com.kh', N'sovanarong.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6D3007E8ED4 AS DateTime), CAST(0x0000A8F6002D3026 AS DateTime), CAST(0x0000A6D3007E8ED4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e577d82a-ba13-44a5-a574-0ebd0f10e0fe', N'ywDPMlYv/qbgoiKrngNlFmGs14U=', 1, N'm90HRc4aan1rKcLO2xVS6w==', NULL, N'sovanna.s@bidc.com.kh', N'sovanna.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5DA006E166C AS DateTime), CAST(0x0000A5DA006E166C AS DateTime), CAST(0x0000A5DA006E166C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3185e96f-64aa-467a-880d-9005e2e4eb98', N'PsGRtCNFAnEtKhmIZRHok18cpy4=', 1, N'WyKOICGqnI32NSOrBlp/qw==', NULL, N'sovannaroth.m@bidc.com.kh', N'sovannaroth.m@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C500355C8C AS DateTime), CAST(0x0000A68A0017E22D AS DateTime), CAST(0x0000A5C500355C8C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'49409b72-421a-4970-a14f-893b629abf3d', N'XOItSjzFviJfST5b3mn9rEXN9uI=', 1, N'dAOFf0GCBC0dLy7yHVN02w==', NULL, N'sovannroth.c@bidc.com.kh', N'sovannroth.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20076A124 AS DateTime), CAST(0x0000A8A20076A124 AS DateTime), CAST(0x0000A8A20076A124 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0x0000A8D9007B0BFA AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'20df5152-62b7-4453-880c-0fecc5b94617', N'/qpAEZshXYImJgpjnXoR+VVLRCU=', 1, N'6cyY+N2nNUAXnt240hewsw==', NULL, N'sovanthida.s@bidc.com.kh', N'sovanthida.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A50021C168 AS DateTime), CAST(0x0000A8FC0071D70C AS DateTime), CAST(0x0000A8A50021C168 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6cf19991-407f-4762-a36e-5fe005c57703', N'cJfMALSS2dypVi8RxYYeEqkQxOA=', 1, N'qvYNKPCbzY8isq1NMvGSdA==', NULL, N'sreykhouch.d@bidc.com.kh', N'sreykhouch.d@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B007476D8 AS DateTime), CAST(0x0000A5E1008F6EF2 AS DateTime), CAST(0x0000A24B007476D8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'e0b19afc-398a-45d9-abb2-989ecf69a294', N'YAcRI4Jjkq+aJ08ihocTnuTSDBA=', 1, N'axdl/lR1N6qyN9qhmUFCIQ==', NULL, N'sreykhuoch.b@bidc.com.kh', N'sreykhuoch.b@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6CC0045E0AC AS DateTime), CAST(0x0000A8AA0083008A AS DateTime), CAST(0x0000A6D400A18B16 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1056f3c4-86ad-4fb4-868b-aaeb8e853e7e', N'gm0Rrqx2CJFPd3DGG4drCG13HNI=', 1, N'Gea0s0UsXpZUvB/+v8ZH0A==', NULL, N'sreymom.r@bidc.com.kh', N'sreymom.r@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A4DD009192CC AS DateTime), CAST(0x0000A8F600366200 AS DateTime), CAST(0x0000A4DD009192CC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'3bdcd008-13b3-4c30-a278-eb9083e76e77', N'0yReABHtlRncau3Xf95D+6RV3/o=', 1, N'IL6+FJTT19Y1cwsy7aav3w==', NULL, N'sreyneath.s@bidc.com.kh', N'sreyneath.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3E8003874BC AS DateTime), CAST(0x0000A763008E3CC7 AS DateTime), CAST(0x0000A3E8003874BC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'398ab1fd-f8be-4178-89ce-cd70067bd8fd', N'dmOqcWMRzlLAuCFzwAakwwmEeRE=', 1, N'0C/luQNIazNoEIE+JoeAsw==', NULL, N'sreynuth.v@bidc.com.kh', N'sreynuth.v@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A37D00817248 AS DateTime), CAST(0x0000A89B00A88825 AS DateTime), CAST(0x0000A37D00817248 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1cb6255f-0a13-4ad6-8272-c74238a11811', N'HY2oMUakEsc6iHBvoFMPjFEQ2CM=', 1, N'epH0gwMN6S+mGA2IJ/tnIQ==', NULL, N'sreypov.s@bidc.com.kh', N'sreypov.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A67C003FAB9C AS DateTime), CAST(0x0000A782009B1671 AS DateTime), CAST(0x0000A67C003FAB9C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c3b7c2cf-69d5-4064-ad9f-d82f5fb2b82b', N'zioZWMvmH3lCQvSI5oNetsB5izc=', 1, N'CgvkT9G/axYMkx75A37cAw==', NULL, N'sreysros.p@bidc.com.kh', N'sreysros.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A83A006CFC00 AS DateTime), CAST(0x0000A8F600728D81 AS DateTime), CAST(0x0000A83A006CFC00 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'56665ee9-e136-44da-8804-48af86ad2464', N'P2kR0aj3WYXjhLNFyrkwHQ0Ahgc=', 1, N'wsOQwKr+0p7IEuhdD4GNyg==', NULL, N'suphea.s@bidc.com.kh', N'suphea.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A46B00861FF0 AS DateTime), CAST(0x0000A88100CF7E3B AS DateTime), CAST(0x0000A46B00861FF0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'196ef17e-5d4c-4ea5-8700-6087cbbd934d', N'0ViRB+0LGh4Hq7GQDtnrU6faHDo=', 1, N'EeSSSTqqr7AyN8T8iBLIrw==', NULL, N'tai.pm@bidc.com.kh', N'tai.pm@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A3A30041A5DC AS DateTime), CAST(0x0000A66D00149517 AS DateTime), CAST(0x0000A641009A09D1 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'69ec3119-6790-4673-a2d5-8030a365626b', N'lZVuZFxIQ83xOxjaIzG9xomjRNY=', 1, N'4NkgpmMEIfcn7ARUr0DPrA==', NULL, N'tan.tm@bidc.com.kh', N'tan.tm@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C50034C434 AS DateTime), CAST(0x0000A7C1007DF871 AS DateTime), CAST(0x0000A6410099FE6D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'153e9fd4-61ab-4167-93b3-6aef0a25013a', N'7LlyZfEJDCmL5Xblgz0SgNb2DyY=', 1, N'L015BLjRMvn7d2XDmQU8pw==', NULL, N'Test1@bidc.com.kh', N'test1@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000AA5D007ECF48 AS DateTime), CAST(0x0000AA5D00971CA1 AS DateTime), CAST(0x0000AA5D007ECF48 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'43a26d8c-f4cc-417e-8ec4-d2e7414f6934', N'Di24jQCLKZKbIwzKmp2Tz1dE+MY=', 1, N'd6S6bbKT4rKHjCpIK/04PQ==', NULL, N'Test2@bidc.com.kh', N'test2@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000AA5D007F146C AS DateTime), CAST(0x0000AA5D007F146C AS DateTime), CAST(0x0000AA5D007F146C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'386a5044-2f7d-40e0-8768-8acc3f0eea7c', N'44hD18py3pPOJ6KiM1Ihn+Si2Ug=', 1, N'iw5Hv2DgLx05E75hzbI0mw==', NULL, N'tha.s@bidc.com.kh', N'tha.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00741210 AS DateTime), CAST(0x0000A8FC00356408 AS DateTime), CAST(0x0000A254003C95B3 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'0ddc971f-eac5-4c6c-85a6-3102e784f471', N'z6id50F7r1QHiRcJVVmqRZVuyVY=', 1, N'gsX8PAEdWejDbulk8KIJ9w==', NULL, N'thanh.nt@bidc.com.kh', N'thanh.nt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63200FE6F28 AS DateTime), CAST(0x0000A63200FE6F28 AS DateTime), CAST(0x0000A63200FE6F28 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'2dcb41d7-07df-4022-909b-8dcedc3605c5', N'9n8rx1CEhnUWwzLJAtySAyvnrjA=', 1, N'5dln0XopTYslthKLJkos4w==', NULL, N'thanh.th@bidc.com.kh', N'thanh.th@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2B6004530E4 AS DateTime), CAST(0x0000A2B6004530E4 AS DateTime), CAST(0x0000A2B6004530E4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'38a91d30-2000-4cb6-906e-7f0b28832994', N'8oRw9hk6VKsR73pap9od+VWUG0s=', 1, N'zAE78MmTy0OLnF+bCDwE3Q==', NULL, N'thavrat.s@bidc.com.kh', N'thavrat.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B00773F58 AS DateTime), CAST(0x0000A770008CA640 AS DateTime), CAST(0x0000A24B00773F58 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'36718159-12e6-4a41-be06-d53881d0cc96', N'KsLPCYOxaT+wCPHT+rkNLkjxHp0=', 1, N'9HPMtfAecjMaxQUqZZ7otQ==', NULL, N'Thean.pm@bidc.com.kh', N'thean.pm@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0056FE50 AS DateTime), CAST(0x0000A8FC00960485 AS DateTime), CAST(0x0000A6B400A12F77 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'1bace25e-abe4-4728-8f23-e97b6ad3e44a', N'RqQCYJMYYnDFKXZsPiiVZikGPcs=', 1, N'hm2f62OMJunt9bbLPm+2Rg==', NULL, N'thien.nt@bidc.com.kh', N'thien.nt@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5C4003CF000 AS DateTime), CAST(0x0000A6D000274860 AS DateTime), CAST(0x0000A643006E327F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'a79563fe-edfb-4022-82f6-7aee2ca2a513', N'JpFz9Ci9GSSDZ9VSWqQf6R+vkZQ=', 1, N'xE7O6CKLsiFsTQm2LNJxeA==', NULL, N'tivea.h@bidc.com.kh', N'tivea.h@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003BD7EC AS DateTime), CAST(0x0000A8FD00A0F471 AS DateTime), CAST(0x0000A865003BD7EC AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'5de38f93-4368-42ee-bffc-b450cf3a9e32', N'mlvQB+dU2gIZEdte67PcnKYm0Ro=', 1, N'O48wPk0kz8zK6AOnxNEV2Q==', NULL, N'trung.ln@bidc.com.kh', N'trung.ln@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A6410098178C AS DateTime), CAST(0x0000A66400720469 AS DateTime), CAST(0x0000A64100A58D31 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0x0000A85700897F21 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'74e27d82-63f4-4709-aab7-1f90429bf2b3', N'05wLAwkSJIL8YEA5RVhTBMmOW7Y=', 1, N'4RQybDeq3BN0U68irfScQg==', NULL, N'truong.nv@bidc.com.kh', N'truong.nv@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A89B00A6854C AS DateTime), CAST(0x0000A8A100764A89 AS DateTime), CAST(0x0000A89B00A6854C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'22aa5bd0-e005-45c2-950e-9cb1fcaba321', N'wpgdYJpLc5PDD3PjAS7dTMtCQ+s=', 1, N'USNl93Z51+jpfLjIMbhoeA==', NULL, N'Tuan.nt@bidc.com', N'tuan.nt@bidc.com', NULL, NULL, 1, 0, CAST(0x0000A24D00102D68 AS DateTime), CAST(0x0000A26D003E864C AS DateTime), CAST(0x0000A44C00022889 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6cc3d8c5-2814-4604-b2e0-4985c4cd726f', N'kfe4aNtOU1BtCXaLvjrcO7W0+CY=', 1, N'xL8q9hhSShGpZ1CeJGmNjQ==', NULL, N'tuan.pd@bidc.com.kh', N'tuan.pd@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A63201056EF4 AS DateTime), CAST(0x0000A67B001C6329 AS DateTime), CAST(0x0000A643006F96E9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'c27d064a-8382-4fb8-883b-9784d857602c', N'E5pInpGs1WDlSPKoKl5eZTOv1o8=', 1, N'nGFbUyo4glnHMWVF6hXhdg==', NULL, N'tuannq@bidc.com.kh', N'tuannq@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A642001761F0 AS DateTime), CAST(0x0000A643001CD602 AS DateTime), CAST(0x0000A642001761F0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0x0000A694009FB3EB AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'965aa192-6dd4-495e-b090-f223e7869c84', N'udBzesqrOzDGfMDH/JxLaTteqt0=', 1, N'3AUuj54Um3kUs0V+0yT0sw==', NULL, N'tuc.ht@bidc.com.kh', N'tuc.ht@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B007269D8 AS DateTime), CAST(0x0000A650007E5668 AS DateTime), CAST(0x0000A643003B18F5 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'caf8a1d1-0d70-436f-b117-b53cf1bceee7', N'XLehtvJFB3ZuruTMpMD6CECL/7g=', 1, N'Ut7L/u7Fdxf6npHhcsK7wg==', NULL, N'van.lth@bidc.com.kh', N'van.lth@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2B60044B5D8 AS DateTime), CAST(0x0000A3B700A1041D AS DateTime), CAST(0x0000A2B60044B5D8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'708e5b5e-41dd-4bed-ab99-54eb800cf226', N'0S1aNqSUCY73zCYhVevWl46Y3DE=', 1, N'sOjaXJ4akCqf0mz/mMWaEQ==', NULL, N'van.ntk@bidc.com.kh', N'van.ntk@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B007136D0 AS DateTime), CAST(0x0000A24B007136D0 AS DateTime), CAST(0x0000A24B007136D0 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'62b9ca23-a805-4b36-8a80-4ee43249ae54', N'1+GXtkPEs7SDYJ9RvOvgk+pt584=', 1, N'FRdD7cgJ/F5vxW48BHwegA==', NULL, N'vannak.p@bidc.com.kh', N'vannak.p@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A2DF00880644 AS DateTime), CAST(0x0000A714002D3024 AS DateTime), CAST(0x0000A4BF000D872B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'da14c8f9-5fe3-4018-8ac7-e7f2d1c5e1f9', N'cVQGkV4PSxzAbJgRCDoceid3hHE=', 1, N'1ojiFa9L8cfhtBu+294zjQ==', NULL, N'Veang.l@bidc.com.kh', N'veang.l@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B006ADE98 AS DateTime), CAST(0x0000A4F10074D1C0 AS DateTime), CAST(0x0000A252001494B9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'46c633c7-375d-49b3-849e-8ef63050f75a', N'VmlB+PwP6X3XfeXxxoTuxS1UyBQ=', 1, N'o3X8+2wHZDtCZZXDie7RGw==', NULL, N'vicheth.c@bidc.com.kh', N'vicheth.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A865003985C8 AS DateTime), CAST(0x0000A865003985C8 AS DateTime), CAST(0x0000A865003985C8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'71a2a231-8143-47d2-a7c8-008ddd70670c', N'jeknt8Bz4wk1NGziR3M4fmJnI6E=', 1, N'Wo9GzZQ3XDZkHdbwiaR//w==', NULL, N'Viet.nq@bidc.com', N'viet.nq@bidc.com', NULL, NULL, 1, 0, CAST(0x0000A24D000FEBC8 AS DateTime), CAST(0x0000A24D000FEBC8 AS DateTime), CAST(0x0000A24D000FEBC8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'ff1e6a6d-987a-44df-b942-ffb9e2c3729c', N'S6aISQm3oou9d24pfi8FTQhrgp4=', 1, N'6L/cYhhetU1rHkIkPVdXuQ==', NULL, N'Voleak.s@bidc.com.kh', N'voleak.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24D0013A358 AS DateTime), CAST(0x0000A7E10036DE6F AS DateTime), CAST(0x0000A24D0013A358 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fc2cba24-f2e5-4dad-9ce1-d36b62b8a5c3', N'k0F5hb0M/xLJPKs9HXSqo5yx56M=', 1, N'vpnt5W+eFlc3Cry4X0OvLA==', NULL, N'Volineth.k@bidc.com.kh', N'volineth.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A24B0048E748 AS DateTime), CAST(0x0000A2BA0028DD9F AS DateTime), CAST(0x0000A24B0048E748 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'f39a6a55-5d2f-47ff-84e9-7e76f445d064', N'MTKdst0dpb7oEDxmuzeCCJlY/+I=', 1, N'e+coOcLwJoERyVcCoQD/ZA==', NULL, N'vorlack.c@bidc.com.kh', N'vorlack.c@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A59A006DBC30 AS DateTime), CAST(0x0000A74A008AF33B AS DateTime), CAST(0x0000A59A006DBC30 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'47f7973a-1ca4-48a6-8f04-b204bf20df6d', N'WzmrViBKMwUTG7xGC0G6FzNNsPE=', 1, N'xkPJoQKde6HG+PMdFv3Vww==', NULL, N'vu.dd@bidc.com.kh', N'vu.dd@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A8A20027D0F8 AS DateTime), CAST(0x0000A8A20027D0F8 AS DateTime), CAST(0x0000A8A20027D0F8 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'd9812476-e3d2-472b-a5d7-968bbc8c52b0', N'rdkDkfqERDjqo4bIERJYQYT5ul4=', 1, N'HlcvFx0ltaurVwk6mwenig==', NULL, N'vuochnea.s@bidc.com.kh', N'vuochnea.s@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A5020074D948 AS DateTime), CAST(0x0000A57800A63830 AS DateTime), CAST(0x0000A5020074D948 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'6b6ba3d4-d224-4ee3-abe2-c0347281495d', N'fmZYn9yXejDxtvO5vJgfuH5+eWg=', 1, N'o8H8XsMDj6EYlJjBeaakyQ==', NULL, N'yekleng.k@bidc.com.kh', N'yekleng.k@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A68800306D44 AS DateTime), CAST(0x0000A8640015D125 AS DateTime), CAST(0x0000A6880087F34B AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[aspnet_Membership] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'54784671-01fa-4d6e-946a-8853644cc611', N'fa11c51c-e159-4d5d-a712-c027a5279f4d', N'DwybkgjgilI482M8tUdj3JBL2c0=', 1, N'Si8RAGcvs9AU2+AllLqdmQ==', NULL, N'younic.t@bidc.com.kh', N'younic.t@bidc.com.kh', NULL, NULL, 1, 0, CAST(0x0000A44C00830A18 AS DateTime), CAST(0x0000A6CC0098828F AS DateTime), CAST(0x0000A4A6002CB36A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 08/30/2019 11:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6e335c58-a568-44b8-9936-b03b17811717', N'2e6563fb-c420-4ceb-9b56-18867043909a')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fe8933d5-2837-40b5-bdb1-f1c3226a34ee', N'2e6563fb-c420-4ceb-9b56-18867043909a')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5e5b029f-73f3-46b7-8a06-0efb1be88ecb', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5db49cbd-3d94-4fae-b80c-8c46349465a7', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd584b0fb-b265-4fe2-a79d-a55f87e09d57', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'06c7822f-90ba-4e11-803c-cccc7e6dff35', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'558b43f7-bb69-48b4-b2b3-e6548fc203a5', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9460b02e-20bf-4ad0-a381-f3138622a40d', N'8b12e6d0-61e3-4130-ab01-1d2811aa7da1')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f52544d6-a878-4403-8c0c-06e6e8351255', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'738a6c82-cea6-4c07-b8f7-0d0594dbb61b', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'50c8e5bf-3f0e-4b19-a1c1-64fcc5dc8161', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'89e5f33f-3c3e-4f83-b421-76788928f099', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cc0bbc86-c75e-4290-8ef5-b971bbb4368f', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5f795ca3-cf79-4d44-9bce-d2c13a0475e9', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4502e0cf-5e54-431c-aafa-d4391e71e34b', N'468bdc84-68fc-44f9-bb58-1e3bb2aa6861')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2a65f8e4-662a-4038-94b5-0769a4df31bb', N'b889ee7b-67c6-44fa-88b3-2806b5ae168f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ab27d474-6331-4294-9b13-75d7a8143577', N'b889ee7b-67c6-44fa-88b3-2806b5ae168f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e1dc864d-0405-4e49-aaeb-d571bce8cfc2', N'b889ee7b-67c6-44fa-88b3-2806b5ae168f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'938f747b-b16b-49d8-8572-e6ac0f8d8556', N'b889ee7b-67c6-44fa-88b3-2806b5ae168f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8c3dbe26-385c-4939-8ea9-8c0f99d96d6b', N'e1558314-997d-41e0-87c1-28cebf0c9aee')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5db49cbd-3d94-4fae-b80c-8c46349465a7', N'e1558314-997d-41e0-87c1-28cebf0c9aee')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'35266aca-eee5-4934-8f96-a52e5c8ef37c', N'e1558314-997d-41e0-87c1-28cebf0c9aee')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'731d733b-7f65-4b54-b867-e26e0fe90f39', N'e1558314-997d-41e0-87c1-28cebf0c9aee')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2a92893f-34c9-4b8e-bbf3-c1776ba1d61b', N'ea098045-17fc-4b2d-88e4-319b692392ce')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a62f3a41-d9b8-4cb9-97db-9d2411144383', N'0cb24690-9d2b-4461-8cf2-37efaa0b3430')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b3c2e2c8-34a0-4b15-8108-a5c22470f2e1', N'0cb24690-9d2b-4461-8cf2-37efaa0b3430')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1ee99abb-4244-4b6e-ac69-b8ac3ba6a9fe', N'0cb24690-9d2b-4461-8cf2-37efaa0b3430')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bb262e8e-0609-49a2-bd05-dfa84a2ce2f4', N'0cb24690-9d2b-4461-8cf2-37efaa0b3430')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5414e31b-7c4e-433b-84cb-56d95fd2b2d8', N'ebbbcaa3-d22d-4a6a-80b4-3a17838f8f35')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6eb4deab-e900-4bbc-a2ae-92c5c137e080', N'ebbbcaa3-d22d-4a6a-80b4-3a17838f8f35')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1dc3e64b-a1d5-435e-8776-de7eb5c48997', N'ebbbcaa3-d22d-4a6a-80b4-3a17838f8f35')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c13e58e7-3bb4-405d-bbb6-f899ad4bf9a6', N'45fe1366-0e52-4315-97a7-3a4badea91a4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a8c694ca-0607-4d3e-8f64-017e65c6d58b', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c84add95-e688-4283-8f5b-1ae1359f07c2', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a0b1f824-9648-4b86-88fb-2c4bb26d1746', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e798bde2-a586-4caf-a3d1-89a0def3af31', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0d39d04d-7892-4edd-a51d-f9fc0ccdcdb9', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dc4cdb12-2941-46e1-aaeb-ff42dae1389b', N'534aa3f9-fccd-457a-bc9a-5cfda7bda6dd')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c4d7a4f0-5adb-43b9-ad10-0bf2cb4bc520', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3dc7c4c4-4de1-4b8e-95f2-20badd9dbc9b', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e7e64b62-9a90-4a56-9822-95809717e720', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'44e44377-e30a-4488-9ad0-adc0d318eced', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'be74f38d-ab67-495b-b50d-b576245fb6ef', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1ee99abb-4244-4b6e-ac69-b8ac3ba6a9fe', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'501799e5-5503-485c-8b3a-be9ce8c47850', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ad557f56-902e-4371-b4ac-d530e992b5e5', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'25688a09-31c9-454a-9d7f-f56c86b314a0', N'077d7d14-7940-46eb-9e4a-5dadaaa40d23')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'37055e14-390f-443b-982b-559be7f50a6b', N'9be12629-71b3-4248-8c13-5e233e85fa4b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'196ef17e-5d4c-4ea5-8700-6087cbbd934d', N'9be12629-71b3-4248-8c13-5e233e85fa4b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'026c0cbd-9269-4faf-8ecd-7f5a34a34049', N'9be12629-71b3-4248-8c13-5e233e85fa4b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8986d3cd-a751-4bd3-bcd9-9b93f9fac163', N'9be12629-71b3-4248-8c13-5e233e85fa4b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd6100367-ab21-4946-9d2f-d6201a6962a0', N'9be12629-71b3-4248-8c13-5e233e85fa4b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'db5f3de3-98c5-4e9e-9ffe-d7659ed8916f', N'9be12629-71b3-4248-8c13-5e233e85fa4b')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8cad1ec2-fcb6-4cf5-8d8e-69845004eb99', N'e441ec8e-7f3a-46c2-a139-668f43f4e748')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c750e73c-c100-4ca2-aa74-6d4ff21553a8', N'e441ec8e-7f3a-46c2-a139-668f43f4e748')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'87089158-f899-4cf7-99a1-a3f8fad53a0f', N'e441ec8e-7f3a-46c2-a139-668f43f4e748')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd26c5d36-e47c-4b9f-884f-664fd83e3309', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8b06572f-99fe-42c8-acaa-8fdfd8862ede', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e5c2498b-baa9-4d55-92bb-b7d709a25448', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b449c4e5-66af-4d12-938e-bb9da4f9fcfb', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'622efecc-9a72-4216-97e1-c314fadf1e60', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'16b461b5-5abc-4704-81e8-e52501f6ee21', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8dbc90a0-0e64-4d14-9025-f7e142a21ce7', N'2510a876-9d74-4bbf-b073-67667e839294')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bc0b59fe-da3c-4e9a-9bd5-3449a1cf48f1', N'685c3e9c-0cf5-4f4c-b0e1-6d5b022cf8ad')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'938f747b-b16b-49d8-8572-e6ac0f8d8556', N'685c3e9c-0cf5-4f4c-b0e1-6d5b022cf8ad')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a6e54c2c-62d7-4232-aa04-eb4bd55a1f92', N'685c3e9c-0cf5-4f4c-b0e1-6d5b022cf8ad')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd6f9e6ff-7f2c-476f-9dfc-eede8c4aa55a', N'685c3e9c-0cf5-4f4c-b0e1-6d5b022cf8ad')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'82641c61-0e2e-4522-8338-f73fc7163561', N'685c3e9c-0cf5-4f4c-b0e1-6d5b022cf8ad')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ca3263c4-8a1a-4371-a66b-03180e56eb70', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd197c066-d466-414b-974b-15dbbbea80c3', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'94372f09-95f4-4e8c-bc95-1903315a26e7', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1b0d5092-5dee-49f3-8f26-23f28510d4c3', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fb1b2127-08f3-430b-8c1e-396f69b03111', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd445323d-aafe-4988-a6cf-5e74e7b5dff8', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'76f4ca9b-0b9e-438d-b546-6eae6e2ea4a7', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd854004d-7819-4145-aa20-7cef096fd40f', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'911d2105-9c21-4a7b-b4d8-7e0bdc030539', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd2c54652-51ab-4c27-9614-8ed35109e345', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8aee2ebf-06d5-4e10-994b-919be4700a8b', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'19b3ca16-ffa6-4b92-a162-9f2ea811a6cc', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'01a82fc2-ddb6-40fd-bee4-a8558aeccf23', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2e094b6e-c61a-47c3-b60e-a877064b7ccc', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'77afb800-cb11-4897-b50a-a93e48eec7f1', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9c9d8b6a-bfcb-4a27-8bde-aaa69b0b1aec', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e4a31e37-3ccf-41d9-8221-b59f231e910d', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e73558eb-4812-45d5-8ec5-b629047984a3', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'607ffad3-f6ab-4686-b505-cb62e1bbcb9b', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6e778441-2bf7-4886-b59d-dd6da5d4625c', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27287d4f-aede-40ac-a5e7-ea62ab67d8c5', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'70d8dda1-3267-4f9f-8cd3-eae292420636', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9c0c1253-3ea6-4a39-8584-f63b0dfa63d1', N'709fbe7e-5770-4bd6-9ec8-713d996a6a9f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cc36635f-b66c-47ef-9a08-07d9f3f3a2a5', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4fc84c54-f882-449e-90fa-3aaf3e1bc36b', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'bf7b4003-db30-47ac-998e-4e7808ea718b', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5177ec72-b4ee-4161-a0ca-4f6c55b6731f', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6d878e31-c789-41df-a712-5dee246b768b', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'18f34105-6e91-4c1e-9fc8-895de9c1c241', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'77b57597-5192-4096-88d2-8c2f390dfa7d', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e289b450-1641-4422-893d-966fbb68e9a7', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'adc470a1-c84b-46f6-aaaa-b69935a2520c', N'dfb769b5-0187-41b4-af1e-7284bcdbb404')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'66973730-a7e5-4d16-8b4f-1b22e8a2c845', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
GO
print 'Processed 100 total records'
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ea37f96e-2666-4193-94d7-32b5ad7665c0', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f44e635-5c74-4818-ba63-361660d4c47b', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'026e5ff4-a0ba-4845-9440-388b3603bf14', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'62c46077-f89f-494c-af8e-3c80b1ea0eea', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f4c46a56-9028-43c3-836b-53a3e902ce2e', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e3e6f021-49dd-4b88-b7bd-5aeb65a5c0d2', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a90d59dd-a6cf-48df-8ea9-65d878262ac9', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6cd920f4-c856-46ec-a650-667c513b6f45', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8ca4291d-29ca-4aac-bfa9-6a79469e0b2b', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a88dcb46-b2e0-48d3-9a78-885b7f9e92e0', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3fda72f0-694a-46ca-ae4d-9200ec17d979', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7bf9ef7a-8988-4e52-836e-9355e0a388e2', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'126bf670-b2ae-4bb0-9e1f-98d9629d3a9f', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1688b8d3-6c13-4ce7-8e97-a0e17ab7bb8f', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1a0d89e6-7b57-4248-a455-aa43c4076998', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9db4e92a-5a8c-4c25-8c1e-af60eed30ad8', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3eed512f-9047-4087-b000-d1e1fa33584c', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'44498a54-bac7-4291-aa4e-d6ca442ce649', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4971e39d-5b8d-4a13-ab55-e30b633ad121', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f53e65e0-c370-43a5-a9ee-ed8835fbfd40', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'96033a3e-da39-4211-b142-fb4cc29f47d6', N'c09341ab-d2fa-4d73-a6d2-72f49e193f28')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2fdda0e2-4757-4595-9070-3ecf8d49ee97', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b80fd668-a91a-4b8e-87b5-6b72233f2265', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'768ddd58-551c-499a-a725-7a73acb6d672', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'42f5efb7-6802-454d-a55d-8a9be977274f', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0bf24d71-cdcf-40b0-9bcf-c87c64e369df', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2620646c-864e-4012-bc6e-cba8682f7ae4', N'e42606d8-f8e4-4eec-93cd-7533a5fed8ec')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'cb25cc27-d3a0-4bfe-a974-00c31db3f586', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8b0fea3b-74df-4cf4-9c3c-02b053e3f246', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'124116ce-0a19-424b-a9c4-032c5079766e', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b14425fb-4dcf-44fa-bc27-10423b6e2e54', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e726daa1-8294-4b5f-b663-149689754a30', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'158f03d2-79f5-46c0-8241-156024326849', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'842313cf-8830-4c7a-8c2c-1c494603cd2b', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'68ce76da-34c2-457b-9ad9-26e44dfc4606', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'42485452-4d55-4168-8882-279c007524f0', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6996259e-3041-421f-abcb-299c5bb44a63', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f20ee6d6-bcd3-4ec2-b111-2ca211b41473', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0c2662f4-6a95-411c-866a-3368ac680919', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6c16b9c8-5e6d-4ac3-b14a-39554d1c822c', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6aaa2c51-0eca-458a-ae3a-39e64f31f0e4', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6ae7a4f5-4978-458a-a579-3d57d00037c4', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6a5f4b6-eb83-4cb9-9bb5-3e8f2a02384b', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'86c7361e-3248-4b66-bd4a-627734f58689', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'17c52be7-557e-4cf6-9cbd-6a2de65f0df6', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c3ca08bb-309c-4405-b594-6bfa1bced4ee', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a27d4aa8-4ebc-4466-aedc-829558e13802', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4600bf84-5cf0-460d-aa61-845a96063500', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2ed874ab-c6c2-422e-89cf-85afa28f5c51', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'742727ea-05de-40d4-b40a-8a548220d627', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'01b42a69-3d72-4db4-8250-95f2eba62fd5', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5e18a096-7032-4f21-b113-96261a380745', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'06b1d559-b91d-4d9d-8d30-96b9327dec17', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4a8139aa-9f60-46c5-87ca-9b54d0f2091e', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fc520102-3202-4fe8-9f89-a4e6b6d6df49', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b08a9095-43ce-4f56-a762-a4f71200280c', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2e2c209e-fa86-4e6e-883e-ac5f9e374830', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'424e4c51-1f8e-4dcd-a7dc-adde18cf9b49', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a17783fa-4921-4a7b-a928-b27d65be86fe', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'742b7c27-3b13-4179-88b4-bcc5cdc3d32e', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'399896e5-9d9a-4313-8bff-be1dc7e56552', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7ac67bff-4d3b-469e-84af-c0b6aed5aa1c', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'188f82b7-6c96-4481-a759-d393efef2726', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd23e1dd9-3ac5-4a14-abf3-e00d052a9c91', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'03f4b1b1-c7b7-4efb-bc69-e105a2d095f8', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'89ecb416-d516-4ce3-bcb6-e1df7f4f28d3', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'96591e0f-d0c1-494d-9ec2-e8d596e7b6e5', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'98f45d4e-e8e8-45b2-a75f-eece6fbb5dff', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5cbcef54-e6c2-4327-9f34-f7debf004840', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6d5602ac-1a24-4143-8b0f-fe874c7b4bc6', N'2f613ed7-6b46-40d0-9a82-77fb497c6594')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'465b6457-9d0e-4297-8e58-05a7dcebfea6', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6b3dd5da-174c-4c32-80e0-0edc3d6601fd', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'eeef0e7e-45bc-4d6d-94ee-13b1affc6d2e', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'10a1b372-73fb-4cec-9726-13e7eaa7d7e9', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'994125b4-381d-4f80-b9d1-19f480de1288', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ae908eb4-adbd-4cd6-9adb-1a57a4239ef4', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a4edb4b4-2aae-4106-a64e-24f295589a28', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'612fe107-69a9-427d-9004-2bfd1ec1cfd9', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'01970c6a-710a-40c5-81ce-2ec99791618a', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4a184235-9999-42e9-a64b-337a1e10c98e', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'31513e38-27c0-41df-ba53-3a0125597dba', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'787036bf-9c71-412b-ba82-46bd2de8469f', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'014e584f-05b7-4491-8cc1-5313529eeb56', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'468d7168-523f-448c-bc31-55a8c77f5f7e', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5d05e18c-9a93-432d-a629-58d63282ed50', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'633df39e-5f5c-407a-b1cd-5b0b0eed55c6', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b29b9c9e-a617-420d-9a15-6cb8b1f5bf16', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e444fb58-37be-40cd-9162-6e6b9660434a', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'921fac6e-1d60-4461-b1a5-6ea577ba16e1', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'27735f90-0154-4efc-8543-7262d465b7b4', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b46a20db-5bd4-48db-85b9-73f974c2fd4d', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1b9059b9-693d-4e9f-a050-7dce399285d7', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1964ef48-9fe3-4045-99bf-90847aafea3a', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3e0081ba-98a0-48c1-900b-942b35b5880f', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6e13705a-6e3d-43bc-9baa-9e21aa51a5ef', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a39b6ec5-1317-402c-ae5a-a02acf98888d', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'77eaede9-8ae6-4c93-babb-b42068553fd6', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd800e6ae-abfb-4689-b892-c58cb6b03919', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'88e65316-3c5b-42db-8f08-c6fb7a602464', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'85e2dee1-0d1a-4005-8864-cc650ab61bfd', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6d8edd9c-81c0-4860-858f-d28308db297e', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
GO
print 'Processed 200 total records'
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'88a49e65-ede7-4404-8300-d5a87ef59ad7', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd05ae2de-0daf-4831-9520-e11aa9dd8f2b', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3ba1cb42-fe3b-4e8f-9eb9-e61cd2e5a43e', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ad7e2fe4-2426-4af0-809b-e9b40fb39b72', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'fb790c92-cf0d-4e4f-b6c5-ea9bd35820e6', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e017e500-b156-47b6-816c-fbbf0a31bcb5', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'040dc0bb-89f9-4814-ab6b-fd219f0891c0', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e09f4566-de12-42e7-a766-fe9af9609c32', N'cc8f6d39-f616-42be-bd5e-84fc1cb011f4')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'91b8b6c1-09c2-4f88-89c5-4471bc881aed', N'6eafa856-c7e5-4956-ae77-8b04387a1b80')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4b5c24d7-e6b3-47ba-819b-5a8edcecccc6', N'6eafa856-c7e5-4956-ae77-8b04387a1b80')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a25f62cb-b313-47ec-b736-b03e22372793', N'6eafa856-c7e5-4956-ae77-8b04387a1b80')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c9a93442-d9b2-45a1-a54c-45852c2e5ab4', N'0c69e54d-455a-48b5-8ecd-908e224ca468')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'694c5d3e-8a04-4826-a225-8bac89e66140', N'0c69e54d-455a-48b5-8ecd-908e224ca468')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8c517113-2ebf-412e-aa3f-959d51e3f1df', N'0c69e54d-455a-48b5-8ecd-908e224ca468')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'51774728-0ecd-47b0-a0ca-a0c015390f53', N'0c69e54d-455a-48b5-8ecd-908e224ca468')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7f2a0667-2482-4c99-9160-025477645d48', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f38cce45-d835-4bae-b671-05839f03f47c', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f436c731-5dfe-4293-b408-0db44d8b3bf9', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0c2cd4bc-40ac-46f2-8edc-1c64079be64e', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1c3aa8b3-114b-44bf-b142-1df8d4cb8ab9', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e6825471-3b36-4152-8ff2-25ff2255ca2d', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'958ba221-a094-4868-86dd-49ce2778cc3d', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5c42df66-f7af-40cd-b3c3-4b0149da9607', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'54c0723a-4e0c-4687-8e3d-53e98a13e52a', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0f089d0b-8865-4978-a382-6deccca9f21d', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'40fb5932-88a9-4a93-ad0d-7fa7e0c5335a', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd62145a4-db27-4d88-9d98-887831e129f5', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3a200a3c-373e-46ec-8d2b-96b601782d81', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'25130689-bf6d-4cc1-be85-aea0b0767024', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'9a4f0863-ce60-49a4-ba80-bdf0707858ad', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'adf78a46-315b-43bc-9607-ce2b15befa83', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f3c7f6f5-4be6-4053-816d-daaffb489073', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dc99c038-b698-4ac2-afbf-ececa0bb918a', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a194ca79-50ec-4de1-bc35-f1d3adcbf174', N'c2fbea08-6e6d-4021-b829-a09d0a74b4b3')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'32c52738-0a3a-42ca-a381-0322f3f06426', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b9b6825a-bf21-4cb5-b9e0-061f1b25f7b4', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4f22c410-428c-4d25-9348-06832bf16dff', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd5353fb2-f0cc-48af-96cf-0c97bc90343e', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd0f4c58e-de54-460e-8b1e-0d95297f9a47', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5d4155bf-c87c-4766-818c-165a9399f379', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'65c9aa89-5aba-48c5-a11c-1a055653b1d2', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4bbba9b8-4b16-4eb1-b2b8-1cac087a90a2', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b4a95059-8b5f-4f20-bf5f-204f3f50fe43', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'79f1e422-9c7f-444e-83c7-22519feaebdd', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'8663da53-138f-4956-b578-2e816b93d38d', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd3a64794-3d18-444a-a2e7-32bcd36bf2bc', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ebe54cf2-1582-4b94-b584-32dfcb0ab5af', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'36481d3a-c9e6-40f6-b593-359459cf6cc3', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'c16b570b-c5db-413f-bb52-37c84b88d8e9', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f17a5116-b182-4f02-85b2-3dfe6f2272e0', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3d0d0ac4-6167-4927-ab86-4010791e75c5', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'93c73be1-3101-4a92-ba15-4063a817de50', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'28c13a7c-f5fe-45c4-a481-4529840254ec', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6e4826c1-2411-406b-8b46-458296c58ee3', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'3a755304-93d8-47bf-9ed0-45f806afedc2', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd768d6ce-2a92-498b-a68c-4a374f6e1b12', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e1ebf000-d320-4ce5-a008-4cf8460a8d67', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'871d88b9-048a-403a-86d4-5094593d378a', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'16cc69f6-d23d-4979-b116-52f70156b6ce', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'21a7e83e-1477-4844-9a0a-6742519add44', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f5731904-68e1-43ca-be09-681eb6b5c1b9', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'5f960876-4125-43bc-9bc7-6c696fb7eeaa', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd48c8f69-f915-42ff-b0e6-74c66983d7d3', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ffe455d3-c3d0-483c-809b-77788f6d3b6a', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'120cf64f-a0a2-49d6-8585-780becad98fb', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f29880ee-6161-44ce-912c-784751099884', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6469bdec-8cbb-4b0e-88ff-811622e0591e', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b7e1569d-fd8b-4474-ab8f-8144e21e0c55', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'078cf4e8-26ce-44e1-901d-896006a3a15f', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'efad2c09-4eb3-4ce8-9f73-9359fbb3920d', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a5bd6edf-24a3-41bf-b918-99f8e01318d3', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2a47e31a-a728-4238-9edb-a2da30002987', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'01141d90-6188-47ba-a93a-a61c95af4768', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'50c7250d-32a8-4d61-883c-a6488b4d2524', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'64e75200-af93-4e97-8753-a6e4bf0f588e', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd82aecb5-b330-4f24-be69-b2ca0ab5e2c6', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f7030f55-ad5c-4ae8-aa26-b5b69108b8fc', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a0932613-5194-4b92-bed3-b824f0394b93', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'543cf25c-ad14-4bb8-85ec-b90d6ab46919', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b22b5067-d090-456e-830f-ba4566b7cae2', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'138cedd2-9fa5-4816-887c-bd2ff061fc9d', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'614908e0-01bd-49e5-b9c8-bd9d58541a6c', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'19c22f47-b114-44b0-8340-bea951de1590', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'0e8e61e4-75e1-4780-b2b5-c09a885a1e26', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'1f0bd182-9c4d-40e8-bcda-c15ef47587fe', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'039972f6-f474-42aa-92ae-c53449afef83', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'a5252fdd-80e3-48cf-9c8a-d3e3bc93c691', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'dee7a1f2-af47-4591-8ca8-e0702e5e19dd', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'ab3a0853-62c4-40ca-89d3-ea4b27e787d9', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'45bbb7e9-b16d-411f-ac70-f1dbfa690094', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'6150dcc0-f1d9-41c4-a73e-f637e61bb614', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'26dd27f5-aabd-4459-9432-f833cfb3d499', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'f3f8eb6f-b63f-4b18-8846-fca70e67ec1f', N'a689a4d5-9a40-4987-98bf-a52809317668')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'd971f98f-5074-4273-b192-2d46fe5fbf5a', N'9870e82b-b4f4-4120-8b52-c1389249765f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'e1fd802c-cf45-4c1a-8e24-3822cb2720af', N'9870e82b-b4f4-4120-8b52-c1389249765f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'7c516368-449d-488e-9672-8016c8b95fff', N'9870e82b-b4f4-4120-8b52-c1389249765f')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2ebdc96d-aa72-45e5-bd4c-39b8504d4fe3', N'db61a78e-ebb2-4eb0-8927-cf9d30dfd001')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'b7922c03-2a07-4914-9e76-4c603feeb099', N'db61a78e-ebb2-4eb0-8927-cf9d30dfd001')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'4531cbbd-97ea-4885-90f0-b36ee4780e8f', N'db61a78e-ebb2-4eb0-8927-cf9d30dfd001')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'67f8e0c4-5288-4067-869a-e3bd2aa07af5', N'db61a78e-ebb2-4eb0-8927-cf9d30dfd001')
INSERT [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'21ad1923-8928-45e3-a805-4fa6fe7fceec', N'0e9818dd-a3ae-458c-b80a-dbff39abc0ce')
GO
print 'Processed 300 total records'
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 08/30/2019 11:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 08/30/2019 11:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
/****** Object:  Default [DF__aspnet_Ap__Appli__08EA5793]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Applications] ADD  CONSTRAINT [DF__aspnet_Ap__Appli__08EA5793]  DEFAULT (newid()) FOR [ApplicationId]
GO
/****** Object:  Default [DF__aspnet_Me__Passw__239E4DCF]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Membership] ADD  CONSTRAINT [DF__aspnet_Me__Passw__239E4DCF]  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF__aspnet_Pa__PathI__5BE2A6F2]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Paths] ADD  CONSTRAINT [DF__aspnet_Pa__PathI__5BE2A6F2]  DEFAULT (newid()) FOR [PathId]
GO
/****** Object:  Default [DF__aspnet_Perso__Id__6754599E]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF__aspnet_Ro__RoleI__44FF419A]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Roles] ADD  CONSTRAINT [DF__aspnet_Ro__RoleI__44FF419A]  DEFAULT (newid()) FOR [RoleId]
GO
/****** Object:  Default [DF__aspnet_Us__UserI__0EA330E9]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__UserI__0EA330E9]  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  Default [DF__aspnet_Us__Mobil__0F975522]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__Mobil__0F975522]  DEFAULT (NULL) FOR [MobileAlias]
GO
/****** Object:  Default [DF__aspnet_Us__IsAno__108B795B]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD  CONSTRAINT [DF__aspnet_Us__IsAno__108B795B]  DEFAULT ((0)) FOR [IsAnonymous]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__21B6055D]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Me__Appli__21B6055D] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__Appli__21B6055D]
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__22AA2996]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Me__UserI__22AA2996] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Membership] CHECK CONSTRAINT [FK__aspnet_Me__UserI__22AA2996]
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__5AEE82B9]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Paths] CHECK CONSTRAINT [FK__aspnet_Pa__Appli__5AEE82B9]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__628FA481]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__628FA481] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__628FA481]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__68487DD7]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7] FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__PathI__68487DD7]
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__693CA210]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pe__UserI__693CA210] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] CHECK CONSTRAINT [FK__aspnet_Pe__UserI__693CA210]
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__38996AB5]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_Profile] CHECK CONSTRAINT [FK__aspnet_Pr__UserI__38996AB5]
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__440B1D61]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Roles] CHECK CONSTRAINT [FK__aspnet_Ro__Appli__440B1D61]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__0DAF0CB0]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[aspnet_Users] CHECK CONSTRAINT [FK__aspnet_Us__Appli__0DAF0CB0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__4AB81AF0]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0] FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__RoleI__4AB81AF0]
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__49C3F6B7]    Script Date: 08/30/2019 11:09:53 ******/
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK__aspnet_Us__UserI__49C3F6B7] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[aspnet_UsersInRoles] CHECK CONSTRAINT [FK__aspnet_Us__UserI__49C3F6B7]
GO
