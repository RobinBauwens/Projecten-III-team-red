USE [master]
GO
/****** Object:  Database [KlimatogramDatabase]    Script Date: 27/03/2017 17:22:55 ******/
CREATE DATABASE [KlimatogramDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KlimatogramDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KlimatogramDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KlimatogramDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\KlimatogramDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KlimatogramDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KlimatogramDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KlimatogramDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KlimatogramDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KlimatogramDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KlimatogramDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KlimatogramDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KlimatogramDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KlimatogramDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [KlimatogramDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KlimatogramDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KlimatogramDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KlimatogramDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
USE [KlimatogramDatabase]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Continent]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[ContinentId] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Continent] PRIMARY KEY CLUSTERED 
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeterminatieTabel]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeterminatieTabel](
	[DeterminatieTabelId] [bigint] IDENTITY(1,1) NOT NULL,
	[RootNode_Id] [int] NULL,
 CONSTRAINT [PK_dbo.DeterminatieTabel] PRIMARY KEY CLUSTERED 
(
	[DeterminatieTabelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Graad]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Graad](
	[GraadId] [int] IDENTITY(1,1) NOT NULL,
	[DeterminatieTabel_DeterminatieTabelId] [bigint] NULL,
 CONSTRAINT [PK_dbo.Graad] PRIMARY KEY CLUSTERED 
(
	[GraadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GraadContinenten]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraadContinenten](
	[GraadId] [int] NOT NULL,
	[ContinentId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.GraadContinenten] PRIMARY KEY CLUSTERED 
(
	[GraadId] ASC,
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Klimatogram]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klimatogram](
	[KlimatogramId] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](100) NULL,
	[Station] [nvarchar](100) NULL,
	[Breedtegraad] [float] NOT NULL,
	[Lengtegraad] [float] NOT NULL,
	[Beginjaar] [int] NOT NULL,
	[Eindjaar] [int] NOT NULL,
	[Breedtekenmerk] [nvarchar](100) NULL,
	[Lengtekenmerk] [nvarchar](100) NULL,
	[NeerslagZomer] [float] NOT NULL,
	[NeerslagWinter] [float] NOT NULL,
	[Land_LandId] [int] NULL,
 CONSTRAINT [PK_dbo.Klimatogram] PRIMARY KEY CLUSTERED 
(
	[KlimatogramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land](
	[LandId] [int] IDENTITY(1,1) NOT NULL,
	[Naam] [nvarchar](50) NOT NULL,
	[Continent_ContinentId] [int] NULL,
 CONSTRAINT [PK_dbo.Land] PRIMARY KEY CLUSTERED 
(
	[LandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maand]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maand](
	[MaandId] [int] IDENTITY(1,1) NOT NULL,
	[KlimatogramId] [int] NOT NULL,
	[Temperatuur] [float] NOT NULL,
	[Neerslag] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Maand] PRIMARY KEY CLUSTERED 
(
	[MaandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Node]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Node](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Parameter] [float] NULL,
	[Operator] [nvarchar](100) NULL,
	[KlimaatKenmerk] [nvarchar](100) NULL,
	[VegetatieKenmerk] [nvarchar](100) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[EersteParameter_ParameterId] [int] NULL,
	[JaNode_Id] [int] NULL,
	[NeeNode_Id] [int] NULL,
	[TweedeParameter_ParameterId] [int] NULL,
 CONSTRAINT [PK_dbo.Node] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 27/03/2017 17:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[ParameterId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Omschrijving] [nvarchar](100) NULL,
	[Eenheid] [nvarchar](100) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.Parameter] PRIMARY KEY CLUSTERED 
(
	[ParameterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201703271454028_InitialCreate', N'Klimatogrammen.Models.DAL.KlimatogramDbContext', 0x1F8B0800000000000400ED5D5F6FDCB8117F2FD0EF20EC537BC8796D5F5B5C0DFB0E8EED046E623BC86ED2A22F06BDA2D78AF5674FD23A768A7EB23EF423F52B94FA4F911C8AA4A85D6D7BC84BBC2287C3991F471C7246F39F7FFDFBF8E7E7C0779E709C7851783239D8DB9F38385C44AE172E4F26EBF4FEFB1F273FFFF4DBDF1C5FB8C1B3F3B96AF743D68EF40C9393C9439AAE8EA6D364F1800394EC05DE228E92E83EDD5B44C114B9D1F4707FFFCFD38383292624268496E31C7F5C87A917E0FC0FF2E759142EF02A5D23FF2A72B19F94BF9327B39CAA738D029CACD0029F4CDEF95E80D26819A320C0E15ED161EFFCF4FDC439F53D44189A61FF7EE2A0308C529412768F3E257896C651B89CADC80FC89FBFAC3069778FFC0497D3386A9AABCE68FF309BD1B4E958915AAC93340A34091EFC508A68CA763712F4A4162111E2051176FA92CD3A17E4C984C83BF5421CA613871DEDE8CC8FB39690A0DD28C05EB8575378E5B4DBBDAA4142B094FD7BE59CADFD741DE39310AFD318F9AF9C0FEB3BDF5BBCC32FF3E8118727E1DAF7697E09C7E459EB07F2D387385AE1387DF988EFD9595CBA1367DA26306529D4FD459D8B095F86E90F8713E79AB083EE7C5C038412CE2C8D62FC1687384629763FA034C531D1EFA58B7311736C30835E231454A3114492353671AED0F37B1C2ED38793C91FC9A27AE33D63B7FAA164E053E8911549FAA4F11A0B186406BD464FDE32E79719FE3D0A09A313E723F6F3C7C983B72A964BA3CFDBAAD19B380A3E463E2DAAF2D9ED2C5AC70B32EE3C021ACC51BCC4699BB1E36903432938331AC6B8CC3A6F1192D9F02668ACFAFD9F00B1AD1F21203389DCB2ED1A4C0A1E73B014B5E9854C8A963140A9875BC42935B0095C99EE2341EDC1BE1A6CE583CCAAB7EEC0E3BC8E3176534C64886A119E4744BD0A0B8BB51E191B5628BDC64B2FFC8250DCA55439990B2F74FB53292544701EE0F87170851452DCD468D798AC751F2DFF4ECC42DC536B15ADBF7A61AA4F0CB4D25708DE2F5016E0B66ED79867C163CE3C8BDAF432CF391163C39CF7DEA249CEC73731C675C74D99612DEB2F2735C7C12AE362BDB6B506B4C82843EB1C1311055E48E487E7E80EFBC630E3286D11721C2F26F01312A931F1A73FD8852268AC3E46517A4D242DB4561C8FB74DF3C668C1AD38DB2569DACB847D26EFF0A531B6F2DEB6F0E4BC46092E5F82990C73694991F0019111B1C11B88A173939B8428B6FF0E06D173414494626A020210E5D2BDE55A36F81136E0A0236E25428D8CE1BF2010ECC500550396BDE27780ABF2A12E33C4F6767053B760D9291F00FC544F75199A7F253B472575722D5906990600A36CAB5E4680E2C6D010D414AC1983D3BB843C5DA4E5C23278D9D43C99BC645A9D37B5CF39CB113BB01F7013248B87D8FBF294931F78B00B1C3E60CFB53C8EFA2ECA7CD734D45B8D5A6B5329EFD75F8C99BFFEB27DEEBF9A73FF75FBDC7F33E7FEDBD6B99F9B2367BE7DE4CC1FCDB97FDC3EF7E6B89F8F00F7F90BC814F9E4AF11BDFE4DDEFAC3BDECD58FFC8BE3C0EC74CBF4C0BFA2B03DC72C1F17A5EF3674B4F91993BD6FE6190F33A0B2EEDE1607E2867ACB7B6FF170261FDF64D5D41D07DB27837E577D110C9C1AE7ACDDB65A35FE16F790F3B5F816BA8EA1E01C0F6453D09665963F0612B3CCB7D371104F93245A783993FC096C7DFADE96C045E83A0A47F18D1569DD6D5E114C7B2B8262C20D59A41316AD37E139F6C99C9CD34511E0728692057279CB4066E4EA3056898562AC3CD56FB3F41D3712593838CEF08A7C0290EC6DE58529BFCABC70E1AD90DF2D1BA6ABFE2D6A36FB7A3CF6C9395EE16CB4B45B165618A9C763D4D325B5E329053E39264517F690EAA5B7F78DEADF0B34BFBFB777C0295F4E59002A09DABF6317A5B204B8181A884938A0A6E1900AD1D21200188BD32157F3698BCF4521FE3A0E491B26CBA3F0AE75DF4559307D6AFFDD255A6D3194C7AE721ED933D8DE9366CE6DD9CDA1FD6956E7B972B6B8C3DDDE13650F84879F297B402CE70F3C2DEE3D73E88479705C4BEECE208E552ED21AB605FB2C75E1285CC475C9BE9774F81D2DC4A9647BDB3058BA2CEAF387B7C42AEF1273A30F6D91E57C4AF6CBBD6500EFB175B0A6018662B39EC9966C9A70CC6FC5CEEFB287F8591465FD29C1A51B9A08CF540AE2339C8A3CABC64DE015CC49A94DA78AEEE548147B828EDE6C3C2647A5B5AFEA2096EF7313019172C7DFD19D53A52FE448A0F10EC2B51915F1069CDD09C864364844A1784F7574269016ABA95C1C4C770AA1426535215A544B492417EB3FA87993F52478A0701E899A1B4851ACD0C23A98EDA92B88451858CC8BA5D39D517668A84954AB4F220E9903A32C6003B1F00900BC4CE40E8E9A8B43CDA165D32422015D9A4EC91AC80188F2E085A1E0F668383ED4544AC3211188DCD3A148D1A6CC9264AAB81248202207A8DB0532983EE3F37451309E701DBA02CD58E80B297843067366DD9FC126CD85C5409397BA471A0E928130208F6828FCCB820879F1A8BA4DBA8E13353BF10E4822370567690044090EFD797175F8518A9E14C57DB583928803F69DD45E52C6B210EC4921897478585A3E96897460AF4A1388126155F71EB52B553F3B9E16F9BFE50FC7532051F8F80AAD565EB8A41287CB5F9C5991357CF6FD4C3F8F3628684C1789209DB6E6B61E298D62B4C4CCD3228CEC8D47DED5E728457728BB7B3B7303AE99D07104BC846A48DE37E4F5593910559FECFF226F8ECAA4A6FC49FEF6A1A4F386CC35C82E30F2CB43D182E1FB3A593E37F2512CCBC53D8BFC75107666F8CAE815796234A1E2179EC2F194990E7773C20990BBE06AEB444963E0F6D94459B9E7AEAF27713748A455822A2D5471B2EB4E2BA6D3E13351107D28A2AF27696F48D0CC85202DF18EBB421BCA8328D4A9953491FA47753AEDD4499A58FB893AC55606650BE3F4030D0E9B3CCA167BCDCFEAB49A644A9A54F3ABB6DCEA144781E4EA67BAB21312651E6960AD9D1DD9025DFB913ECD2A4B5244B47A361A83541E7BD93144C5C1AABE0902FA4182AE1312690903E98D323A4318B156C2214DB1F5401F5462388D0848C23DBA1D5875FA280A1053A001A9409880486B4321CD718B8A29DC6C3B9A28EE37F5A52F3A968005CECA576F0552874A3411F0624546ABC914A44935BF0A2911A7C2F5F2ABCCCFC85F57C7490C64BC64117B3966C474FA82A543C59749F6FF9BFBDFC1BACE74F6FB91E87A606948B6D67578F63804217D955111D8DCBB8C7AA64E950FB4A6E9F24FD5960315F2BED12561683FA9335ECB2BACA66CB2CCC02371589DAD2447A16DD4035D91BFD83E4FE1EF9E6514DAC9892D1BDB7AA2E1CC5419882D5FA6FA714496E57CF43AE716EEF9B8DE619257D797DD136E96FFB923D2FDBA83D2FDBA33D2FDB683D2FDB62BD29DEFA06598EF8C65983FEEA0741F7746BA3B6877E79BB6BB869BFCF2BEDA8EA28A184A7D5D01FD203DD57998B48081ACCE4D88B67DFFCE5F48724191AA978F5C478D2BAC2CE04070D508C452F232D3BAACBC856E2CF33CC58A88198760B69EE5A36D29ABCDFABE4CB284DF3AD95751126C9086368EF82852AD7083BA97CA65B5403150D4A9A256BAE3106EA511099A3082E25A7BA27C18D42889A0377E80E85BE5B36FBEABCAA99F4037D2105B4505812F6A96ACF4C5AD092A6998B122E32A679DFD11A521054BB8AA6297D5E154F5E885A276A4B2A10E4A22D610D20EC01E1530C0A95A82411DD1AD8E83BA4B2F2030E1DB8642AFA858830213983E2A2CC093B504062ED25D1D145CD75EE000C2D9FBBE6B58B2F6DF354048FFA860A42185DEB892E50918855350FDB5C326045AEBCE0230545D4DC602B4BA33211499B4131DD21F8112E1F4469C20C342F91CA4DD4D78E40146740BF406E66628AA4BEFD044135460C28735FF508F494B8A17A493A8AB5FD059E9DC0B142F983132D882E587B48615309966F37056B23246B2E9862197A1C336A9CF2ECB5FEABFEB0C9D323BA6BBBE1F972E5334993844304F9E9BA5CACC5E88E318EC650DF666BFF867BE9719A7BAC1150ABD7B9CA4C5F7F72687FB07874C6DC0F1D4E99B2689DB7A69CB8AF5B5B5B6951A795E26E8CEEF05EAD6EEA0EA3A854F285E3C6471ED4C3D323B853CF883C44D16761BA9F4249ABF8530C07DD1E43274F1F3C9E41F398523E7F26FB74222AF9C9B98ACD12367DFF927CD568FEF7C82D70BDBAB85B61D45E75F53958994A7C9543BB3455654DCECDE8F506AA3B6991921AEB459AEA39E85CD4C6888CB9AD992BCB08A992DE2C2A26566EA10D72C33C4087DA3A567A3A8AE03582641E2CC668B810D6287608BA720F0566748E4A6B5C3FA4151874A8FCA61067018BA50D79DB71C0429AD430F3D9C505D07589882CF176EE02BF683C898ABBAC5C157A90CCDAA5D73CBD61B43FCE9795BD4A12FCDDBA2CF8443C9881FFEA8BF99905D80EAAD160929F5D5C37348DDC4E9F15377EC333A7DF7A3377CD3B3CFF8D24B033D8624A406B06ED0D76AB752A76B10A34797E6B2B5D84595B86CD1660A6F8DD13E6996D5304096AD8A1683204AF1E4B4BD5F5258F94A7407B001B29B9B5EEAB27FCC2852AF8264CB6EBD7C081BA75B5A2C0C5EE363CB453DCA6FF7F25FF31DBA7EC7860B76409FD230187384B539FA56E130C0A32544001FC3523DD0D7C2802EFA3A42D0378003FD0A25566A922841CA1200649FAED37A6F6941411976CA91E41B40835EE116EE9C41B7E6448BDA35B58107CB7758828424C74ACFFFD18284F8F312820135A3C137068C8E52364A1A5440417123BF192428EBC482EEF379A98C258DECDE98B6BB2AFAFCAA6E4BEA96876F6F4CDFAA758D7E35FBFA58501A5033307B03C030A8F464C32A00E18BE6D5A1466D2B543E96C70FDA115ABD0170A805F6B2DF0FEF2EEC34D0390473FCC5B1A15A12CB144E508EB9CE319B3AA8E461DABAC36E054DA220617387F47F1455DB716E0DD0B57DE756A97C82BDB750C73B4ED1185A8289D93B46318A5E0F366623AB46F45BC71113E64EDD36B62B38B07A2E7325B8886D69A9BE22B0FD64E2DE45041AC595815E253FB08E9F88B46E85BFAEF27EA231B4EBFFC1E5FF44E40D2B03AA9505140DA85F3DB0D80073E395E97B822194EA0152FE16479A4E4015D057AF58589A246E80F27711F1B7C2728442C2B245C13600879255E3D94A1144A8289FC05A719764544F31B04754DC902BB6279DA081804654B2505CFF493A6125118DA91A21675098AF91C9264B9BB826CFDDD6647B171854620F38971C6A52168A088E715A0394091C23303750F94F5FBBE02E07F830407F318047402AF5FC80C459DE47A22621DC5D481D72B633BC9DB631FDAA149ECAF4C549D0965E3F9B17C340250C7B82DA044F760A13F2E9CDC40B5D93DE4111E645BCE3C45B3624B274EE102F5AFE67DDE632BC8F2A2F99E1A86AC2A6FDE014B9C4393D8D53EF1E2D52F2788193248F642D3FF57911DC61F732BC59A7AB754AA68C833BFF851646E64ECBC6CFAB2FB6793EBE59657F2536A640D8F4C814F04DF87AEDF96ECDF71B41101D4022F3D3CB90D04C9769161ABA7CA9295D47A122A1527CF5F142966AE41362C94D38434FD884B74F097E8F9768F15265A9C344BA15D116FBF1B987B22D7552D268FA933F0986DDE0F9A7FF02DE354E9CEBAF0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([ContinentId], [Naam]) VALUES (1, N'Europa')
INSERT [dbo].[Continent] ([ContinentId], [Naam]) VALUES (2, N'Noord-Amerika')
INSERT [dbo].[Continent] ([ContinentId], [Naam]) VALUES (3, N'Zuid-Amerika')
INSERT [dbo].[Continent] ([ContinentId], [Naam]) VALUES (4, N'Azie')
INSERT [dbo].[Continent] ([ContinentId], [Naam]) VALUES (5, N'Afrika')
INSERT [dbo].[Continent] ([ContinentId], [Naam]) VALUES (6, N'Oceanië')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[DeterminatieTabel] ON 

INSERT [dbo].[DeterminatieTabel] ([DeterminatieTabelId], [RootNode_Id]) VALUES (1, 28)
SET IDENTITY_INSERT [dbo].[DeterminatieTabel] OFF
SET IDENTITY_INSERT [dbo].[Graad] ON 

INSERT [dbo].[Graad] ([GraadId], [DeterminatieTabel_DeterminatieTabelId]) VALUES (1, NULL)
INSERT [dbo].[Graad] ([GraadId], [DeterminatieTabel_DeterminatieTabelId]) VALUES (2, 1)
INSERT [dbo].[Graad] ([GraadId], [DeterminatieTabel_DeterminatieTabelId]) VALUES (3, 1)
SET IDENTITY_INSERT [dbo].[Graad] OFF
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (1, 1)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (2, 1)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (3, 1)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (2, 2)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (3, 2)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (2, 3)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (3, 3)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (2, 4)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (3, 4)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (2, 5)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (3, 5)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (2, 6)
INSERT [dbo].[GraadContinenten] ([GraadId], [ContinentId]) VALUES (3, 6)
SET IDENTITY_INSERT [dbo].[Klimatogram] ON 

INSERT [dbo].[Klimatogram] ([KlimatogramId], [Naam], [Station], [Breedtegraad], [Lengtegraad], [Beginjaar], [Eindjaar], [Breedtekenmerk], [Lengtekenmerk], [NeerslagZomer], [NeerslagWinter], [Land_LandId]) VALUES (1, N'Gent - Melle', N'6434', 40, 60, 1950, 2000, N'NB', N'OL', 392, 334, 1)
INSERT [dbo].[Klimatogram] ([KlimatogramId], [Naam], [Station], [Breedtegraad], [Lengtegraad], [Beginjaar], [Eindjaar], [Breedtekenmerk], [Lengtekenmerk], [NeerslagZomer], [NeerslagWinter], [Land_LandId]) VALUES (2, N'Ukkel', N'KMI', 40, 60, 1950, 2000, N'ZB', N'WL', 38.7, 74.899999999999991, 1)
INSERT [dbo].[Klimatogram] ([KlimatogramId], [Naam], [Station], [Breedtegraad], [Lengtegraad], [Beginjaar], [Eindjaar], [Breedtekenmerk], [Lengtekenmerk], [NeerslagZomer], [NeerslagWinter], [Land_LandId]) VALUES (3, N'Oslo', N'01384', 50, 60, 1961, 1990, N'NB', N'WL', 447, 415, 2)
INSERT [dbo].[Klimatogram] ([KlimatogramId], [Naam], [Station], [Breedtegraad], [Lengtegraad], [Beginjaar], [Eindjaar], [Breedtekenmerk], [Lengtekenmerk], [NeerslagZomer], [NeerslagWinter], [Land_LandId]) VALUES (4, N'Rio De Janeiro', N'83743', 22, 43, 1961, 1990, N'ZB', N'WL', 812, 360, 3)
SET IDENTITY_INSERT [dbo].[Klimatogram] OFF
SET IDENTITY_INSERT [dbo].[Land] ON 

INSERT [dbo].[Land] ([LandId], [Naam], [Continent_ContinentId]) VALUES (1, N'België', 1)
INSERT [dbo].[Land] ([LandId], [Naam], [Continent_ContinentId]) VALUES (2, N'Noorwegen', 1)
INSERT [dbo].[Land] ([LandId], [Naam], [Continent_ContinentId]) VALUES (3, N'Brazilië', 3)
INSERT [dbo].[Land] ([LandId], [Naam], [Continent_ContinentId]) VALUES (4, N'New York', 2)
SET IDENTITY_INSERT [dbo].[Land] OFF
SET IDENTITY_INSERT [dbo].[Maand] ON 

INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (1, 1, 2.4, 51)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (2, 1, 3, 42)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (3, 1, 5.2, 46)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (4, 1, 8.4, 50)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (5, 1, 12.1, 59)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (6, 1, 15.1, 65)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (7, 1, 16.8, 72)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (8, 1, 16.6, 74)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (9, 1, 14.3, 72)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (10, 1, 10.3, 72)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (11, 1, 6.2, 64)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (12, 1, 3.2, 59)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (13, 2, 51, 2.4)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (14, 2, 42, 3)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (15, 2, 46, 5.2)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (16, 2, 50, 8.4)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (17, 2, 59, 12.1)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (18, 2, 65, 15.1)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (19, 2, 72, 16.8)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (20, 2, 74, 16.6)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (21, 2, 72, 14.3)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (22, 2, 72, 10.3)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (23, 2, 64, 6.2)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (24, 2, 59, 3.2)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (25, 3, -7.2, 59)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (26, 3, -7.1, 49)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (27, 3, -2.3, 53)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (28, 3, 2.8, 48)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (29, 3, 9.4, 61)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (30, 3, 14.1, 73)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (31, 3, 15.2, 79)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (32, 3, 13.9, 90)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (33, 3, 9.3, 96)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (34, 3, 4.7, 100)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (35, 3, -1.5, 89)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (36, 3, -5.7, 65)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (37, 4, 26.2, 114)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (38, 4, 26.5, 105)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (39, 4, 26, 103)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (40, 4, 24.5, 137)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (41, 4, 23, 86)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (42, 4, 21.5, 80)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (43, 4, 21.3, 56)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (44, 4, 21.8, 51)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (45, 4, 21.8, 87)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (46, 4, 22.8, 88)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (47, 4, 24.2, 96)
INSERT [dbo].[Maand] ([MaandId], [KlimatogramId], [Temperatuur], [Neerslag]) VALUES (48, 4, 25.2, 169)
SET IDENTITY_INSERT [dbo].[Maand] OFF
SET IDENTITY_INSERT [dbo].[Node] ON 

INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (1, NULL, NULL, N'Koud Klimaat zonder dooiseizoen', N'Ijswoestijnklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (2, NULL, NULL, N'Koud klimaat met dooiseizoen', N'Toendraklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (3, NULL, NULL, N'Koudgematigd klimaat met strenge winter', N'Taigaklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (4, NULL, NULL, N'Gematigd altijd droog klimaat', N'Woestijnklimaat van de middelbreedten', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (5, NULL, NULL, N'Warm altijd droog klimaat', N'Woestijnklimaat van de tropen', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (6, NULL, NULL, N'Gematigd, droog kilmaat', N'Steppeklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (7, NULL, NULL, N'Koelgematigd klimaat met koude winter', N'Gemengd-woudklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (8, NULL, NULL, N'Koelgematigd klimaat met zachte winter', N'Loofbosklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (9, NULL, NULL, N'Warmgematigd altijd nat klimaat', N'Subtropisch regenwoudklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (10, NULL, NULL, N'Koelgematigd klimaat met natte winter', N'Hardbladige-vegetatieklimaat van de centrale middelbreedten', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (11, NULL, NULL, N'Warmgematigd klimaat met natte winter', N'Hardbladige-vegetatieklimaat van de subtropen', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (12, NULL, NULL, N'Warmgematigd klimaat met natte zomer', N'Subtropisch savanneklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (13, NULL, NULL, N'Warm klimaat met nat seizoen', N'Tropisch savanneklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (14, NULL, NULL, N'Warm altijd nat klimaat', N'Tropisch regenwoudklimaat', N'Kenmerken', NULL, NULL, NULL, NULL)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (15, 0, N'<=', NULL, NULL, N'Vraag', NULL, 1, 2, 1)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (16, 22, N'<=', NULL, NULL, N'Vraag', NULL, 8, 9, 1)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (17, 22, N'<=', NULL, NULL, N'Vraag', NULL, 10, 11, 1)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (18, 15, N'<=', NULL, NULL, N'Vraag', NULL, 4, 5, 2)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (19, -3, N'<=', NULL, NULL, N'Vraag', NULL, 7, 16, 2)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (20, 0, N'<=', NULL, NULL, N'Vraag', 3, 17, 12, 4)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (21, 1, N'<=', NULL, NULL, N'Vraag', NULL, 19, 20, 5)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (22, -10, N'<=', NULL, NULL, N'Vraag', NULL, 3, 21, 2)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (23, 1, N'<=', NULL, NULL, N'Vraag', NULL, 13, 14, 5)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (24, 400, N'<=', NULL, NULL, N'Vraag', NULL, 6, 22, 6)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (25, 18, N'<=', NULL, NULL, N'Vraag', NULL, 24, 23, 2)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (26, 200, N'<=', NULL, NULL, N'Vraag', NULL, 18, 25, 6)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (27, 0, N'<=', NULL, NULL, N'Vraag', NULL, 3, 26, 7)
INSERT [dbo].[Node] ([Id], [Parameter], [Operator], [KlimaatKenmerk], [VegetatieKenmerk], [Discriminator], [EersteParameter_ParameterId], [JaNode_Id], [NeeNode_Id], [TweedeParameter_ParameterId]) VALUES (28, 10, N'<=', NULL, NULL, N'Vraag', NULL, 15, 27, 1)
SET IDENTITY_INSERT [dbo].[Node] OFF
SET IDENTITY_INSERT [dbo].[Parameter] ON 

INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (1, N'TW', N'Temperatuur warmste maand', N'°C', N'Tw')
INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (2, N'TK', N'Temperatuur koudste maand', N'°C', N'Tk')
INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (3, N'NZ', N'Hoeveelheid neerslag in de zomer', N'mm', N'Nz')
INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (4, N'NW', N'Hoeveelheid neerslag in de winter', N'mm', N'Nw')
INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (5, N'D', N'Aantal droge maanden', N'', N'D')
INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (6, N'NJ', N'De totale jaarneerslag ', N'mm', N'Nj')
INSERT [dbo].[Parameter] ([ParameterId], [Code], [Omschrijving], [Eenheid], [Discriminator]) VALUES (7, N'TJ', N'De gemiddelde jaartemperatuur', N'°C', N'Tj')
SET IDENTITY_INSERT [dbo].[Parameter] OFF
/****** Object:  Index [IX_RootNode_Id]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_RootNode_Id] ON [dbo].[DeterminatieTabel]
(
	[RootNode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeterminatieTabel_DeterminatieTabelId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_DeterminatieTabel_DeterminatieTabelId] ON [dbo].[Graad]
(
	[DeterminatieTabel_DeterminatieTabelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContinentId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_ContinentId] ON [dbo].[GraadContinenten]
(
	[ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GraadId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_GraadId] ON [dbo].[GraadContinenten]
(
	[GraadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Land_LandId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_Land_LandId] ON [dbo].[Klimatogram]
(
	[Land_LandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Continent_ContinentId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_Continent_ContinentId] ON [dbo].[Land]
(
	[Continent_ContinentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_KlimatogramId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_KlimatogramId] ON [dbo].[Maand]
(
	[KlimatogramId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EersteParameter_ParameterId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_EersteParameter_ParameterId] ON [dbo].[Node]
(
	[EersteParameter_ParameterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JaNode_Id]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_JaNode_Id] ON [dbo].[Node]
(
	[JaNode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NeeNode_Id]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_NeeNode_Id] ON [dbo].[Node]
(
	[NeeNode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TweedeParameter_ParameterId]    Script Date: 27/03/2017 17:22:55 ******/
CREATE NONCLUSTERED INDEX [IX_TweedeParameter_ParameterId] ON [dbo].[Node]
(
	[TweedeParameter_ParameterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeterminatieTabel]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DeterminatieTabel_dbo.Node_RootNode_Id] FOREIGN KEY([RootNode_Id])
REFERENCES [dbo].[Node] ([Id])
GO
ALTER TABLE [dbo].[DeterminatieTabel] CHECK CONSTRAINT [FK_dbo.DeterminatieTabel_dbo.Node_RootNode_Id]
GO
ALTER TABLE [dbo].[Graad]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Graad_dbo.DeterminatieTabel_DeterminatieTabel_DeterminatieTabelId] FOREIGN KEY([DeterminatieTabel_DeterminatieTabelId])
REFERENCES [dbo].[DeterminatieTabel] ([DeterminatieTabelId])
GO
ALTER TABLE [dbo].[Graad] CHECK CONSTRAINT [FK_dbo.Graad_dbo.DeterminatieTabel_DeterminatieTabel_DeterminatieTabelId]
GO
ALTER TABLE [dbo].[GraadContinenten]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GraadContinenten_dbo.Continent_ContinentId] FOREIGN KEY([ContinentId])
REFERENCES [dbo].[Continent] ([ContinentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GraadContinenten] CHECK CONSTRAINT [FK_dbo.GraadContinenten_dbo.Continent_ContinentId]
GO
ALTER TABLE [dbo].[GraadContinenten]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GraadContinenten_dbo.Graad_GraadId] FOREIGN KEY([GraadId])
REFERENCES [dbo].[Graad] ([GraadId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GraadContinenten] CHECK CONSTRAINT [FK_dbo.GraadContinenten_dbo.Graad_GraadId]
GO
ALTER TABLE [dbo].[Klimatogram]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Klimatogram_dbo.Land_Land_LandId] FOREIGN KEY([Land_LandId])
REFERENCES [dbo].[Land] ([LandId])
GO
ALTER TABLE [dbo].[Klimatogram] CHECK CONSTRAINT [FK_dbo.Klimatogram_dbo.Land_Land_LandId]
GO
ALTER TABLE [dbo].[Land]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Land_dbo.Continent_Continent_ContinentId] FOREIGN KEY([Continent_ContinentId])
REFERENCES [dbo].[Continent] ([ContinentId])
GO
ALTER TABLE [dbo].[Land] CHECK CONSTRAINT [FK_dbo.Land_dbo.Continent_Continent_ContinentId]
GO
ALTER TABLE [dbo].[Maand]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Maand_dbo.Klimatogram_KlimatogramId] FOREIGN KEY([KlimatogramId])
REFERENCES [dbo].[Klimatogram] ([KlimatogramId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Maand] CHECK CONSTRAINT [FK_dbo.Maand_dbo.Klimatogram_KlimatogramId]
GO
ALTER TABLE [dbo].[Node]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Node_dbo.Node_JaNode_Id] FOREIGN KEY([JaNode_Id])
REFERENCES [dbo].[Node] ([Id])
GO
ALTER TABLE [dbo].[Node] CHECK CONSTRAINT [FK_dbo.Node_dbo.Node_JaNode_Id]
GO
ALTER TABLE [dbo].[Node]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Node_dbo.Node_NeeNode_Id] FOREIGN KEY([NeeNode_Id])
REFERENCES [dbo].[Node] ([Id])
GO
ALTER TABLE [dbo].[Node] CHECK CONSTRAINT [FK_dbo.Node_dbo.Node_NeeNode_Id]
GO
ALTER TABLE [dbo].[Node]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Node_dbo.Parameter_EersteParameter_ParameterId] FOREIGN KEY([EersteParameter_ParameterId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[Node] CHECK CONSTRAINT [FK_dbo.Node_dbo.Parameter_EersteParameter_ParameterId]
GO
ALTER TABLE [dbo].[Node]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Node_dbo.Parameter_TweedeParameter_ParameterId] FOREIGN KEY([TweedeParameter_ParameterId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[Node] CHECK CONSTRAINT [FK_dbo.Node_dbo.Parameter_TweedeParameter_ParameterId]
GO
USE [master]
GO
ALTER DATABASE [KlimatogramDatabase] SET  READ_WRITE 
GO
