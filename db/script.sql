USE [master]
GO
/****** Object:  Database [PRO2021_Coffee_Shop]    Script Date: 8/28/2024 7:51:12 PM ******/
CREATE DATABASE [PRO2021_Coffee_Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRO2021_Coffee_Shop', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRO2021_Coffee_Shop.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRO2021_Coffee_Shop_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRO2021_Coffee_Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRO2021_Coffee_Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET  MULTI_USER 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRO2021_Coffee_Shop', N'ON'
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRO2021_Coffee_Shop]
GO
/****** Object:  User [qldaquancaphe]    Script Date: 8/28/2024 7:51:12 PM ******/
CREATE USER [qldaquancaphe] FOR LOGIN [qldaquancaphe] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [qldaquancaphe]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[district] [nvarchar](255) NULL,
	[province] [nvarchar](255) NULL,
	[street_number] [nvarchar](255) NULL,
	[ward] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[banks]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item_toppings]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item_toppings](
	[cart_item_id] [bigint] NOT NULL,
	[topping_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_items]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_items](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[cart_id] [bigint] NULL,
	[drink_id] [bigint] NULL,
	[size_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[total_items] [int] NULL,
	[total_price] [float] NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[information] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drink_images]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drink_images](
	[drink_id] [bigint] NOT NULL,
	[images] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drink_report]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drink_report](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[quantity] [bigint] NULL,
	[revenue] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drink_sizes]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drink_sizes](
	[price] [float] NULL,
	[drink_id] [bigint] NOT NULL,
	[size_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[drink_id] ASC,
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drink_toppings]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drink_toppings](
	[drink_id] [bigint] NOT NULL,
	[topping_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drinks]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drinks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[category_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invalidated_tokens]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invalidated_tokens](
	[id] [varchar](255) NOT NULL,
	[expiry_time] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[drink_size_id] [int] NOT NULL,
	[note] [nvarchar](255) NULL,
	[order_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_item_toppings]    Script Date: 8/28/2024 7:51:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item_toppings](
	[order_item_id] [bigint] NOT NULL,
	[topping_id] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[drink_id] [bigint] NULL,
	[order_id] [bigint] NULL,
	[size_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_statuses]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_statuses](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[create_date] [datetime2](6) NULL,
	[payment_status] [bit] NULL,
	[total_items] [int] NULL,
	[total_price] [float] NULL,
	[address_id] [bigint] NULL,
	[order_status_id] [bigint] NULL,
	[payment_method_id] [bigint] NULL,
	[user_id] [bigint] NULL,
	[voucher_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_method_banks]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_method_banks](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[bank_tran_no] [varchar](255) NULL,
	[card_type] [varchar](255) NULL,
	[pay_date] [datetime2](6) NULL,
	[transaction_no] [bigint] NULL,
	[bank_id] [int] NULL,
	[order_id] [bigint] NULL,
	[payment_method_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_methods]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_methods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenue_report]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenue_report](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[date] [datetime2](6) NULL,
	[number_of_orders] [bigint] NULL,
	[revenue] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment] [varchar](255) NULL,
	[rating] [int] NULL,
	[order_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_permissions]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permissions](
	[role_name] [varchar](255) NOT NULL,
	[permission_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_name] ASC,
	[permission_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[name] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizes]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[character] [varchar](255) NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[toppings]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[toppings](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[is_active] [bit] NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_addresses]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_addresses](
	[is_default] [bit] NULL,
	[address_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_id] [bigint] NOT NULL,
	[role_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[auth_type] [smallint] NULL,
	[dob] [date] NULL,
	[email] [varchar](255) NULL,
	[first_name] [nvarchar](255) NULL,
	[is_active] [bit] NULL,
	[last_name] [nvarchar](255) NULL,
	[password] [varchar](255) NULL,
	[phone_number] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher_types]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 8/28/2024 7:51:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vouchers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [real] NOT NULL,
	[begin_date] [datetime2](6) NOT NULL,
	[discount_code] [varchar](20) NOT NULL,
	[end_date] [datetime2](6) NOT NULL,
	[image] [varchar](255) NULL,
	[voucher_type_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[addresses] ON 

INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (1, N'test', N'test', N'test', N'test')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (2, N'test', N'test', N'test', N'test')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (3, N'test', N'test', N'test', N'test')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (4, N'test', N'test', N'test', N'test')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (5, N'test', N'test', N'test', N'test')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (6, N'Quận Tân Bình', N'Thành phố Hồ Chí Minh', N'123', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (7, N'Quận 9', N'Thành phố Hồ Chí Minh', N'123', N'Phường Hiệp Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (8, N'Huyện Cờ Đỏ', N'Thành phố Cần Thơ', N'test', N'Thị trấn Cờ Đỏ')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (9, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N'test', N'Phường 26')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (10, N'Quận 10', N'Thành phố Hồ Chí Minh', N't', N'Phường 07')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (11, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 04')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (12, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Tân Túc')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (13, N'Quận 9', N'Thành phố Hồ Chí Minh', N't', N'Phường Phước Long A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (14, N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (15, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (16, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Tân Túc')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (17, N'Quận 7', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Thuận')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (18, N'Quận 4', N'Thành phố Hồ Chí Minh', N'123', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (19, N'Quận 5', N'Thành phố Hồ Chí Minh', N'123', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (20, N'Quận 5', N'Thành phố Hồ Chí Minh', N'123', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (21, N'Quận 5', N'Thành phố Hồ Chí Minh', N'123', N'Phường 06')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (22, N'Quận 5', N'Thành phố Hồ Chí Minh', N'123', N'Phường 06')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (23, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N'321', N'Thị trấn Tân Túc')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (24, N'Quận 11', N'Thành phố Hồ Chí Minh', N'321', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (25, N'Quận 3', N'Thành phố Hồ Chí Minh', N'321', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (26, N'Quận 3', N'Thành phố Hồ Chí Minh', N'321', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (27, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N'4321', N'Xã An Phú Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (28, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã Thái Mỹ')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (29, N'', N'', N't', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (30, N'', N'', N't', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (31, N'Quận 8', N'Thành phố Hồ Chí Minh', N'test', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (32, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Trị Đông A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (33, N'Quận 7', N'Thành phố Hồ Chí Minh', N't', N'Phường Tân Kiểng')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (34, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N'124', N'Xã Đông Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (35, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường An Lạc')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (36, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Xã An Phú Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (37, N'Quận 7', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Thuận')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (38, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Bà Điểm')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (39, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Bà Điểm')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (40, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Tân Túc')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (41, N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh', N'321', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (42, N'Huyện Nhà Bè', N'Thành phố Hồ Chí Minh', N'321', N'Thị trấn Nhà Bè')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (43, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N'321', N'Phường 19')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (44, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N'321', N'Xã Bà Điểm')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (45, N'Quận 7', N'Thành phố Hồ Chí Minh', N'123', N'Phường Phú Thuận')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (46, N'Quận 6', N'Thành phố Hồ Chí Minh', N'321', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (47, N'Quận 5', N'Thành phố Hồ Chí Minh', N'321', N'Phường 02')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (48, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'321', N'Xã Bình Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (49, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'321', N'Xã Bình Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (50, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'321', N'Xã Bình Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (51, N'Quận 2', N'Thành phố Hồ Chí Minh', N'321', N'Phường Bình An')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (52, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Cát Lái')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (53, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N'321', N'Phường 21')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (54, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N'321', N'Phường 21')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (55, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N'321', N'Phường 21')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (56, N'Quận 3', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Phường 10')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (57, N'Quận Phú Nhuận', N'Thành phố Hồ Chí Minh', N'test', N'Phường 17')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (58, N'Quận 12', N'Thành phố Hồ Chí Minh', N'123', N'Phường Đông Hưng Thuận')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (59, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N'321', N'Xã An Phú Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (60, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'321', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (61, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'321', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (62, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'321', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (63, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'1sdfaf', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (64, N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Phường 9')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (65, N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Phường 9')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (66, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'5125124', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (67, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N'5125124', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (68, N'Quận Phú Nhuận', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Phường 17')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (69, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Phường 26')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (70, N'Quận 6', N'Thành phố Hồ Chí Minh', N'aetsatsea', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (71, N'Huyện Bình Chánh', N'Thành phố Hồ Chí Minh', N'test', N'Xã Vĩnh Lộc A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (72, N'Quận 10', N'Thành phố Hồ Chí Minh', N'tesst', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (73, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N'3123123', N'Phường An Lạc')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (74, N'Huyện Nhà Bè', N'Thành phố Hồ Chí Minh', N'123123', N'Thị trấn Nhà Bè')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (75, N'Quận Tân Bình', N'Thành phố Hồ Chí Minh', N'cu chinh lan', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (76, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (77, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (78, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (79, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (80, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (81, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (82, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (83, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (84, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (85, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (86, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (87, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (88, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (89, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (90, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (91, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (92, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (93, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (94, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (95, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (96, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (97, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (98, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (99, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
GO
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (100, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (101, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (102, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (103, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (104, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N't', N'Phường 06')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (105, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N't', N'Phường 06')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (106, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N't', N'Phường 06')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (107, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N't', N'Phường 06')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (108, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (109, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (110, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (111, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (112, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (113, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 15')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (114, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (115, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (116, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (117, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (118, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (119, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (120, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (121, N'Quận 2', N'Thành phố Hồ Chí Minh', N't', N'Phường An Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (122, N'Huyện Nhà Bè', N'Thành phố Hồ Chí Minh', N't', N'Xã Long Thới')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (123, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N't', N'Phường 24')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (124, N'Quận Bình Thạnh', N'Thành phố Hồ Chí Minh', N't', N'Phường 24')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (125, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Củ Chi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (126, N'Quận 4', N'Thành phố Hồ Chí Minh', N't', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (127, N'Quận 7', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Thuận')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (128, N'Quận 5', N'Thành phố Hồ Chí Minh', N't', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (129, N'Quận 8', N'Thành phố Hồ Chí Minh', N't', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (130, N'Quận 8', N'Thành phố Hồ Chí Minh', N't', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (131, N'Quận 8', N'Thành phố Hồ Chí Minh', N't', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (132, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (133, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (134, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (135, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (136, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (137, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Củ Chi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (138, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Củ Chi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (139, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N't', N'Xã An Thới Đông')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (140, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N't', N'Xã An Thới Đông')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (141, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (142, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (143, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (144, N'Huyện Cần Giờ', N'Thành phố Hồ Chí Minh', N't', N'Thị trấn Cần Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (145, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã Bình Mỹ')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (146, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (147, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Bà Điểm')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (148, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường An Lạc A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (149, N'Quận 9', N'Thành phố Hồ Chí Minh', N't', N'Phường Tăng Nhơn Phú A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (150, N'Quận 9', N'Thành phố Hồ Chí Minh', N'ttt', N'Phường Phước Long A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (151, N'Quận 12', N'Thành phố Hồ Chí Minh', N't', N'Phường Hiệp Thành')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (152, N'Quận 9', N'Thành phố Hồ Chí Minh', N't', N'Phường Tăng Nhơn Phú A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (153, N'Huyện Đăk Glong', N'Tỉnh Đắk Nông', N't', N'Xã Đắk Ha')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (154, N'Quận 8', N'Thành phố Hồ Chí Minh', N't', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (155, N'Quận 12', N'Thành phố Hồ Chí Minh', N't', N'Phường Tân Chánh Hiệp')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (156, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (157, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (158, N'Quận 1', N'Thành phố Hồ Chí Minh', N'cu chinh lan', N'Phường Bến Nghé')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (159, N'Quận 1', N'Thành phố Hồ Chí Minh', N'cu chinh lan', N'Phường Bến Nghé')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (160, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (161, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (162, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (163, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (164, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (165, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (166, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (167, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (168, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (169, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (170, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (171, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (172, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (173, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (174, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (175, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (176, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (177, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (178, N'', N'', N'cu chinh lan', N'')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (179, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Hưng Hòa')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (180, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Hưng Hòa')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (181, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Hưng Hòa')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (182, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N't', N'Phường Bình Hưng Hòa')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (183, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N'tttttt', N'Xã Phước Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (184, N'Quận 2', N'Thành phố Hồ Chí Minh', N'tttttttttt', N'Phường Thạnh Mỹ Lợi')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (185, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (186, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (187, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (188, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (189, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (190, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (191, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (192, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (193, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (194, N'Quận 8', N'Thành phố Hồ Chí Minh', N'testset', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (195, N'Quận 5', N'Thành phố Hồ Chí Minh', N't', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (196, N'Quận 5', N'Thành phố Hồ Chí Minh', N't', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (197, N'Quận 5', N'Thành phố Hồ Chí Minh', N't', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (198, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (199, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 09')
GO
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (200, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (201, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Nhị Bình')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (202, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Nhị Bình')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (203, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Nhị Bình')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (204, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Nhơn Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (205, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Nhơn Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (206, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Nhơn Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (207, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Nhơn Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (208, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N't', N'Xã An Nhơn Tây')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (209, N'Quận 7', N'Thành phố Hồ Chí Minh', N't', N'Phường Tân Hưng')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (210, N'Quận 9', N'Thành phố Hồ Chí Minh', N't', N'Phường Phước Long A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (211, N'Huyện Hóc Môn', N'Thành phố Hồ Chí Minh', N't', N'Xã Đông Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (212, N'Quận 9', N'Thành phố Hồ Chí Minh', N't', N'Phường Tăng Nhơn Phú A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (213, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (214, N'Quận 5', N'Thành phố Hồ Chí Minh', N't', N'Phường 02')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (215, N'Quận 3', N'Thành phố Hồ Chí Minh', N't', N'Phường 07')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (216, N'Quận 6', N'Thành phố Hồ Chí Minh', N't', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (217, N'Quận 10', N'Thành phố Hồ Chí Minh', N't', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (218, N'Huyện Củ Chi', N'Thành phố Hồ Chí Minh', N'321', N'Xã An Phú')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (219, N'Quận Bình Tân', N'Thành phố Hồ Chí Minh', N'321', N'Phường Bình Trị Đông B')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (220, N'Quận 5', N'Thành phố Hồ Chí Minh', N'321', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (221, N'Quận 5', N'Thành phố Hồ Chí Minh', N'321', N'Phường 09')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (222, N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh', N'321', N'Phường 14')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (223, N'Quận 6', N'Thành phố Hồ Chí Minh', N'321', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (224, N'Quận 8', N'Thành phố Hồ Chí Minh', N'321', N'Phường 14')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (225, N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh', N'321', N'Phường 9')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (226, N'Quận Gò Vấp', N'Thành phô Hồ Chí Minh', N't', N'Phường 17')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (227, N'Quận Bình Thạnh', N'Thành phô Hồ Chí Minh', N'321', N'Phường 26')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (228, N'Quận 7', N'Thành phô Hồ Chí Minh', N'321', N'Phường Phú Mỹ')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (229, N'Quận 12', N'Thành phô Hồ Chí Minh', N'321', N'Phường Tân Thới Nhất')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (230, N'Quận Gò Vấp', N'Thành phô Hồ Chí Minh', N'321', N'Phường 14')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (231, N'Quận Tân Bình', N'Thành phô Hồ Chí Minh', N'4321', N'Phường 11')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (232, N'Quận Tân Bình', N'Thành phô Hồ Chí Minh', N'aetsatsea', N'Phường 13')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (233, N'Quận Gò Vấp', N'Thành phô Hồ Chí Minh', N'aetsatsea', N'Phường 07')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (234, N'Quận 5', N'Thành phô Hồ Chí Minh', N'123', N'Phường 01')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (235, N'Huyện Cần Giờ', N'Thành phô Hồ Chí Minh', N'123', N'Xã Bình Khánh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (236, N'Quận 9', N'Thành phô Hồ Chí Minh', N'321', N'Phường Phú Hữu')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (237, N'Quận 9', N'Thành phô Hồ Chí Minh', N'321', N'Phường Tăng Nhơn Phú B')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (238, N'Quận 7', N'Thành phô Hồ Chí Minh', N'321', N'Phường Tân Quy')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (239, N'Quận 4', N'Thành phô Hồ Chí Minh', N'321', N'Phường 14')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (240, N'Quận Bình Tân', N'Thành phô Hồ Chí Minh', N'321', N'Phường Bình Trị Đông')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (241, N'Quận 7', N'Thành phô Hồ Chí Minh', N't', N'Phường Tân Phong')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (242, N'Quận 8', N'Thành phô Hồ Chí Minh', N'321', N'Phường 12')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (243, N'Quận 9', N'Thành phô Hồ Chí Minh', N'321', N'Phường Tăng Nhơn Phú B')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (244, N'Quận 6', N'Thành phô Hồ Chí Minh', N'4321', N'Phường 08')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (245, N'Quận 9', N'Thành phô Hồ Chí Minh', N'321', N'Phường Phước Long B')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (246, N'Quận Bình Thạnh', N'Thành phô Hồ Chí Minh', N'test', N'Phường Tân Thuận Đông')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (247, N'Quận 9', N'Thành phô Hồ Chí Minh', N'test', N'Phường Trường Thạnh')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (248, N'Quận 9', N'Thành phô Hồ Chí Minh', N'test', N'Phường Tăng Nhơn Phú A')
INSERT [dbo].[addresses] ([id], [district], [province], [street_number], [ward]) VALUES (249, N'Quận 6', N'Thành phô Hồ Chí Minh', N'test', N'Phường 12')
SET IDENTITY_INSERT [dbo].[addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[banks] ON 

INSERT [dbo].[banks] ([id], [name]) VALUES (1, N'ACB')
INSERT [dbo].[banks] ([id], [name]) VALUES (2, N'EximBank')
INSERT [dbo].[banks] ([id], [name]) VALUES (12, N'NCB')
SET IDENTITY_INSERT [dbo].[banks] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 

INSERT [dbo].[cart_items] ([id], [price], [quantity], [cart_id], [drink_id], [size_id]) VALUES (135, 45000, 1, 9, 1, NULL)
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (3, 0, 0, 2)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (4, 0, 0, 3)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (5, 0, 0, 4)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (6, 0, 0, 5)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (7, 0, 0, 6)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (8, 0, 0, 7)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (9, 1, 45000, 8)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (10, 0, 0, 10)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (11, 0, 0, 11)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (12, 0, 0, 12)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (13, 0, 0, 13)
INSERT [dbo].[carts] ([id], [total_items], [total_price], [user_id]) VALUES (14, 0, 0, 14)
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Cà Phê Việt Nam')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Cà Phê Máy')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Cold Brew')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Trà Trái Cây')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Trà Sữa Macchiato')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'CloudFee')
INSERT [dbo].[categories] ([id], [name]) VALUES (7, N'CloudTea Mochi')
INSERT [dbo].[categories] ([id], [name]) VALUES (8, N'Hi-Tea Trà')
INSERT [dbo].[categories] ([id], [name]) VALUES (9, N'Cà Phê sữa đá')
INSERT [dbo].[categories] ([id], [name]) VALUES (10, N'Cà Phê đen đá')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (9, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716631762/bpbjklzjfovtl2dsno6d.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (10, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716631810/ikqeygwnuph4iejyidvv.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (2, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716465723/rhhyvo6ln721merfgmnl.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (2, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716465739/cmzdry9pr3z2u1sei4kx.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (3, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716468384/nkmvc5g49ahfqhzcys82.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (4, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716469395/f6okrphmkvhhaedzmhhg.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (4, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716469402/m6l3p6kimvpsw7hfmnce.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (11, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716631900/df0xwixrthgxeri0vnce.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (12, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716631949/mug1ku8hrxhkwxsq8vqn.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (13, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716631982/dnhiugyhwfmpmlrhcuvm.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (14, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632036/zxymqey61qpokfjbhfau.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (15, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632084/jcthlat5pobaxiorfyur.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (17, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632146/swchkmul0hfgwk6fsgqi.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (16, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632163/hoj0veokkfzyhj6ler6o.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (18, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632232/utib60ezpwqapiozfprg.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (19, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632252/llmm1kovc6ud0itxcxxd.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (20, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632282/knvfdbzrsuzqjqxpwskx.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (21, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632308/yrfhcagqqi14xnjsrcl0.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (22, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632357/vguu1qybwahuj6qrlfxl.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (23, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632407/ohidt88u61hjlv7qqkiw.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (24, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632448/zonutplhmkuj6uaikgkv.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (25, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632475/mvgawgyre0sa5wt1leij.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (26, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632534/lwaedqgnrmgrxwshmtjk.jpg')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (27, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632576/z1xrvagnw4lzlx0asjzm.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (28, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632603/hzovlhuwprqzdgbsiwdh.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (29, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632635/e5x5cvrvafuo0azl6edh.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (30, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632665/q0kl29fd2zjb7vtcxets.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (31, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716632702/osumakpy6qvrea5ae6qu.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (48, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716464396/tivcf77ci9lttoriz4c1.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (48, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716641216/xjg30o1ybsca0hccet0x.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (32, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716813203/fupfnm8jwwjpnkxrxzhl.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (3, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716468401/gspco99mhq9814orzv2e.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (1, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716464396/tivcf77ci9lttoriz4c1.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (1, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716641216/xjg30o1ybsca0hccet0x.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (45, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716464396/tivcf77ci9lttoriz4c1.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (45, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1716641216/xjg30o1ybsca0hccet0x.webp')
INSERT [dbo].[drink_images] ([drink_id], [images]) VALUES (49, N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1718109977/juqlzpds0vcr4hzujt8b.png')
GO
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (45000, 1, 1)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (49000, 1, 2)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (55000, 1, 3)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (39000, 2, 1)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (45000, 2, 2)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (49000, 2, 3)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (35000, 48, 1)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (39000, 48, 2)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (30000, 49, 1)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (33000, 49, 2)
INSERT [dbo].[drink_sizes] ([price], [drink_id], [size_id]) VALUES (33300, 49, 3)
GO
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (1, 1)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (1, 2)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (1, 3)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (2, 1)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (2, 2)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (2, 3)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (49, 1)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (49, 2)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (49, 3)
INSERT [dbo].[drink_toppings] ([drink_id], [topping_id]) VALUES (49, 4)
GO
SET IDENTITY_INSERT [dbo].[drinks] ON 

INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (1, N'Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng', 1, N'Đường Đen Sữa Đá', 45000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (2, N'Thức uống giúp tỉnh táo tức thì để bắt đầu ngày mới thật hứng khởi. Không đắng khét như cà phê truyền thống, The Coffee House Sữa Đá mang hương vị hài hoà đầy lôi cuốn. Là sự đậm đà của 100% cà phê Arabica Cầu Đất rang vừa tới, biến tấu tinh tế với sữa đặc và kem sữa ngọt ngào cực quyến rũ. Càng hấp dẫn hơn với topping thạch 100% cà phê nguyên chất giúp giữ trọn vị ngon đến ngụm cuối cùng.', 1, N'The Coffee House Sữa Đá', 39000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (3, N'Cà phê Đắk Lắk nguyên chất được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.', 1, N'Cà Phê Sữa Đá', 29000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (4, N'Cà phê được pha phin truyền thống kết hợp với sữa đặc tạo nên hương vị đậm đà, hài hòa giữa vị ngọt đầu lưỡi và vị đắng thanh thoát nơi hậu vị.', 1, N'Cà Phê Sữa Nóng', 39000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (9, N'Bạc sỉu chính là "Ly sữa trắng kèm một chút cà phê". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.', 1, N'Bạc Sỉu', 29000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (10, N'Bạc sỉu chính là "Ly sữa trắng kèm một chút cà phê". Thức uống này rất phù hợp những ai vừa muốn trải nghiệm chút vị đắng của cà phê vừa muốn thưởng thức vị ngọt béo ngậy từ sữa.', 1, N'Bạc Sỉu Nóng', 39000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (11, N'Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.', 1, N'Cà Phê Đen Đá', 29000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (12, N'Không ngọt ngào như Bạc sỉu hay Cà phê sữa, Cà phê đen mang trong mình phong vị trầm lắng, thi vị hơn. Người ta thường phải ngồi rất lâu mới cảm nhận được hết hương thơm ngào ngạt, phảng phất mùi cacao và cái đắng mượt mà trôi tuột xuống vòm họng.', 1, N'Cà Phê Đen Nóng', 39000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (13, N'Đường Đen Marble Latte êm dịu cực hấp dẫn bởi vị cà phê đắng nhẹ hoà quyện cùng vị đường đen ngọt thơm và sữa tươi béo mịn. Sự kết hợp đầy mới mẻ của cà phê và đường đen cũng tạo nên diện mạo phân tầng đẹp mắt. Đây là lựa chọn đáng thử để bạn khởi đầu ngày mới đầy hứng khởi. - Khuấy đều trước khi sử dụng', 1, N'Đường Đen Marble Latte', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (14, N'Khuấy đều trước khi sử dụng Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.', 1, N'Caramel Macchiato Đá', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (15, N'Caramel Macchiato sẽ mang đến một sự ngạc nhiên thú vị khi vị thơm béo của bọt sữa, sữa tươi, vị đắng thanh thoát của cà phê Espresso hảo hạng và vị ngọt đậm của sốt caramel được gói gọn trong một tách cà phê.', 1, N'Caramel Macchiato Nóng', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (16, N'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.', 1, N'Latte Đá', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (17, N'Một sự kết hợp tinh tế giữa vị đắng cà phê Espresso nguyên chất hòa quyện cùng vị sữa nóng ngọt ngào, bên trên là một lớp kem mỏng nhẹ tạo nên một tách cà phê hoàn hảo về hương vị lẫn nhãn quan.', 1, N'Latte Nóng', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (18, N'Americano được pha chế bằng cách pha thêm nước với tỷ lệ nhất định vào tách cà phê Espresso, từ đó mang lại hương vị nhẹ nhàng và giữ trọn được mùi hương cà phê đặc trưng.', 1, N'Americano Đá', 45000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (19, N'Americano được pha chế bằng cách pha thêm nước với tỷ lệ nhất định vào tách cà phê Espresso, từ đó mang lại hương vị nhẹ nhàng và giữ trọn được mùi hương cà phê đặc trưng.', 1, N'Americano Nóng', 45000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (20, N'Capuchino là thức uống hòa quyện giữa hương thơm của sữa, vị béo của bọt kem cùng vị đậm đà từ cà phê Espresso. Tất cả tạo nên một hương vị đặc biệt, một chút nhẹ nhàng, trầm lắng và tinh tế.', 1, N'Cappuccino Đá', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (21, N'Capuchino là thức uống hòa quyện giữa hương thơm của sữa, vị béo của bọt kem cùng vị đậm đà từ cà phê Espresso. Tất cả tạo nên một hương vị đặc biệt, một chút nhẹ nhàng, trầm lắng và tinh tế.', 1, N'Cappuccino Nóng', 55000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (22, N'Một tách Espresso nguyên bản được bắt đầu bởi những hạt Arabica chất lượng, phối trộn với tỉ lệ cân đối hạt Robusta, cho ra vị ngọt caramel, vị chua dịu và sánh đặc.', 1, N'Espresso Đá', 49000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (23, N'Một tách Espresso nguyên bản được bắt đầu bởi những hạt Arabica chất lượng, phối trộn với tỉ lệ cân đối hạt Robusta, cho ra vị ngọt caramel, vị chua dịu và sánh đặc.', 1, N'Espresso Nóng', 45000, 2)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (24, N'Vị chua ngọt của trái phúc bồn tử, làm dậy lên hương vị trái cây tự nhiên vốn sẵn có trong hạt cà phê, hòa quyện thêm vị đăng đắng, ngọt dịu nhẹ nhàng của Cold Brew 100% hạt Arabica Cầu Đất để mang đến một cách thưởng thức cà phê hoàn toàn mới, vừa thơm lừng hương cà phê quen thuộc, vừa nhẹ nhàng và thanh mát bởi hương trái cây đầy thú vị.', 1, N'Cold Brew Phúc Bồn Tử', 49000, 3)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (25, N'Thanh mát và cân bằng với hương vị cà phê nguyên bản 100% Arabica Cầu Đất cùng sữa tươi thơm béo cho từng ngụm tròn vị, hấp dẫn.', 1, N'Cold Brew Sữa Tươi', 49000, 3)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (26, N'Tại The Coffee House, Cold Brew được ủ và phục vụ mỗi ngày từ 100% hạt Arabica Cầu Đất với hương gỗ thông, hạt dẻ, nốt sô-cô-la đặc trưng, thoang thoảng hương khói nhẹ giúp Cold Brew giữ nguyên vị tươi mới.', 1, N'Cold Brew Truyền Thống', 45000, 3)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (27, N'Thức uống mang hương vị của nhãn, của sen, của trà Oolong đầy thanh mát cho tất cả các thành viên trong dịp Tết này. An lành, thư thái và đậm đà chính là những gì The Coffee House mong muốn gửi trao đến bạn và gia đình.', 1, N'Trà Long Nhãn Hạt Sen', 49000, 4)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (28, N'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.', 1, N'Trà Đào Cam Sả Đá', 49000, 4)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (29, N'Vị thanh ngọt của đào, vị chua dịu của Cam Vàng nguyên vỏ, vị chát của trà đen tươi được ủ mới mỗi 4 tiếng, cùng hương thơm nồng đặc trưng của sả chính là điểm sáng làm nên sức hấp dẫn của thức uống này.', 1, N'Trà Đào Cam Sả Nóng', 59000, 4)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (30, N'Nền trà oolong hảo hạng kết hợp cùng hạt sen tươi, bùi bùi và lớp foam cheese béo ngậy. Trà hạt sen là thức uống thanh mát, nhẹ nhàng phù hợp cho cả buổi sáng và chiều tối.', 1, N'Trà Hạt Sen Đá', 49000, 4)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (31, N'Nền trà oolong hảo hạng kết hợp cùng hạt sen tươi, bùi bùi thơm ngon. Trà hạt sen là thức uống thanh mát, nhẹ nhàng phù hợp cho cả buổi sáng và chiều tối.', 1, N'Trà Hạt Sen Nóng', 59000, 4)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (32, N'Vị đắng nhẹ từ cà phê phin truyền thống kết hợp Espresso Ý, lẫn chút ngọt ngào của kem sữa và lớp foam trứng cacao, nhấn thêm hạnh nhân nướng thơm bùi, kèm topping thạch cà phê dai giòn mê ly. Tất cả cùng quyện hoà trong một thức uống làm vị giác "thức giấc", thơm ngon hết nấc.', 1, N'CloudFee Hạnh Nhân Nướng', 49000, 5)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (45, N'Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng', 1, N'Đường Đen Sữa Đá', 35000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (48, N'Nếu chuộng vị cà phê đậm đà, bùng nổ và thích vị đường đen ngọt thơm, Đường Đen Sữa Đá đích thị là thức uống dành cho bạn. Không chỉ giúp bạn tỉnh táo buổi sáng, Đường Đen Sữa Đá còn hấp dẫn đến ngụm cuối cùng bởi thạch cà phê giòn dai, nhai cực cuốn. - Khuấy đều trước khi sử dụng', 1, N'Đường Đen Sữa Đá', 35000, 1)
INSERT [dbo].[drinks] ([id], [description], [is_active], [name], [price], [category_id]) VALUES (49, N'test', 1, N'test', 30000, 1)
SET IDENTITY_INSERT [dbo].[drinks] OFF
GO
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'0084db8a-dba8-4d0a-af9b-23e70a3851fe', CAST(N'2024-08-29T00:37:52.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'03cced49-4a6f-4ccc-ab7d-d4647bc0fafc', CAST(N'2024-07-20T22:29:48.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'048b4534-fcd3-4b06-b3e9-df06532d2029', CAST(N'2024-07-29T17:19:47.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'0b1d0d43-6844-467b-bd5f-9293f85af847', CAST(N'2024-06-11T19:43:54.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'16589bdd-5822-46a8-b25f-c893f14e4b03', CAST(N'2024-08-01T20:57:51.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'1a80e70d-4a03-4e13-bd49-649c18c52a97', CAST(N'2024-08-23T21:44:30.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'1c4222fa-8f3a-49db-9ba1-3a967fc4bba7', CAST(N'2024-06-16T17:37:01.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'1c813a56-31ff-45b4-8c80-e8a4d0d47942', CAST(N'2024-08-08T14:53:36.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'219f7e8e-a6bc-4167-86e8-a929282106ab', CAST(N'2024-07-23T14:13:40.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'2277aa15-52c5-4db4-8a39-98e7a434a94d', CAST(N'2024-07-29T18:39:00.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'22cb93da-0379-4118-86ed-668076f2dacf', CAST(N'2024-07-06T21:35:54.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'22f081e6-ee45-4cf8-9d88-a9940661c568', CAST(N'2024-07-14T23:15:54.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'235f4231-5e84-4a8a-acc7-ad6f9da8f0af', CAST(N'2024-08-27T00:40:41.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'29224265-d449-4925-b593-5879e25e11af', CAST(N'2024-08-07T12:39:33.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'2d738813-0e37-496d-8554-948c5118397a', CAST(N'2024-06-16T17:40:46.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'2e873023-bb08-4331-8544-20cafffd674d', CAST(N'2024-07-23T23:14:44.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'35837f25-4763-4915-b876-283313f421d2', CAST(N'2024-08-29T00:23:28.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'37634b56-d6b7-4c72-ae75-ff21dcf2bfe0', CAST(N'2024-06-11T19:43:13.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'37b9a53f-1c39-42f9-9d97-246f19954eb5', CAST(N'2024-08-29T00:29:38.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'38a9b583-7777-431e-b631-030262d183e0', CAST(N'2024-07-23T15:18:04.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'3a87233d-518d-4db2-aea7-9236c31a3200', CAST(N'2024-07-20T22:31:46.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'3e3de77c-b55e-42f9-8788-c3ff076f9fd2', CAST(N'2024-07-16T14:59:51.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'49923151-8b98-4637-b0a7-c1e24bb5bd0b', CAST(N'2024-07-20T21:38:30.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'4bd699fb-ffa5-4fd6-9c39-44542a80e35f', CAST(N'2024-08-28T23:47:03.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'513e5b6a-4a23-40c1-9b47-c5ab1c43964c', CAST(N'2024-06-26T19:00:53.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'54be5455-c82f-4dfd-932d-8b59c60a9d78', CAST(N'2024-08-29T00:10:03.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'597a94f7-08cd-49e5-9641-d86f386343ef', CAST(N'2024-07-23T18:51:07.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'5d11bd85-8ddd-455c-a4cc-6e81fc1ac698', CAST(N'2024-06-11T20:44:47.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'5e752027-8b39-4fb2-bc94-d83bdf01000e', CAST(N'2024-08-27T00:41:42.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'5fc63568-a0ef-495a-b9ba-0fdd46688e51', CAST(N'2024-08-29T00:37:10.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'60eca96b-f2a8-4b3a-b19e-716c2db84750', CAST(N'2024-08-29T00:24:33.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'6573d439-c68f-4f49-85a5-a4b130fb6cc7', CAST(N'2024-06-19T22:57:15.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'68877ad8-f460-4a30-bb58-a943cecd4865', CAST(N'2024-08-19T16:43:10.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'6a78d30c-d093-42f9-a79e-f64eb0a7191c', CAST(N'2024-08-07T12:41:39.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'771e5f11-4946-4dbe-8140-b4b4c4ab48c5', CAST(N'2024-08-25T19:59:53.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'77445b68-9451-42a0-a1bf-91da8b87b9e5', CAST(N'2024-07-29T18:16:38.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'78edff0f-fae8-46c7-9af3-4ce3931d6329', CAST(N'2024-08-07T15:46:13.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'7d701a6a-b2c0-4e33-a533-c06dc3db96e2', CAST(N'2024-08-08T14:33:39.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'7d8bf14d-745a-4a41-abb1-63cf8a3d2da7', CAST(N'2024-06-11T19:39:35.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'81369424-7b74-45c1-8132-923a7e8136fe', CAST(N'2024-08-27T00:42:08.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'8519d8fe-7e5d-476f-ac91-a61219a5f82a', CAST(N'2024-08-23T22:16:52.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'867ad64b-2d81-4798-863d-15420c211b02', CAST(N'2024-07-29T18:01:38.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'88e54ba1-87a8-460e-8122-b589e64d6d9f', CAST(N'2024-06-26T19:01:45.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'898fbecf-e030-44c1-b24a-b340f69c0732', CAST(N'2024-06-26T17:46:23.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'8c0373db-f5e8-4a88-9ae0-bb854349c73e', CAST(N'2024-07-20T23:16:07.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'957a7b5b-d888-4437-8aa6-0b02b5c29b0f', CAST(N'2024-08-08T14:13:52.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'959e5425-2188-439d-801c-53885549d9ef', CAST(N'2024-08-29T00:29:21.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'95ac6947-968e-4ee0-8928-7e5fc9b98241', CAST(N'2024-07-16T01:49:19.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'9684732f-1dff-4f1b-85c9-9c8f202fa747', CAST(N'2024-08-29T00:24:19.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'9a9016f3-f7c6-4ea9-bbc9-9fbead303881', CAST(N'2024-07-14T23:40:04.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'9ab720da-ba57-4b1b-bcc3-a65a61e7d73e', CAST(N'2024-07-14T23:01:54.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'a2fb1e31-4b7a-4a6b-88ac-aa9ecfcc44e4', CAST(N'2024-08-29T00:38:16.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'b8eafa3b-7c0d-4373-b284-da1c7c53a44c', CAST(N'2024-08-01T17:47:02.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'bcdd56f3-8ffa-4b0c-94c9-4c0ef70fde26', CAST(N'2024-07-16T01:47:04.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'c1df4f3e-b799-4da6-835c-da785ef5ac2f', CAST(N'2024-08-29T00:40:38.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'c3e1d97c-0f16-4e6e-afa9-6c180eeab03d', CAST(N'2024-08-08T14:02:37.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'c6e40c0c-a832-4677-a47d-e224d54ba7b6', CAST(N'2024-07-16T15:32:20.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'cc87a02e-95ae-48c1-b777-451f6e984df7', CAST(N'2024-08-08T14:50:15.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'd087227c-1fec-4b57-83d5-50aefb7cf7b6', CAST(N'2024-06-26T18:58:57.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'd8158631-3eac-42af-a790-1865d883e0e6', CAST(N'2024-08-25T20:04:33.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'd920be68-ba75-4fa4-91ef-dfde2ff36834', CAST(N'2024-07-23T18:37:05.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'de1be897-cad9-41a5-869e-949072252d0a', CAST(N'2024-07-16T15:17:27.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'dfab3fe4-7aa5-4f6c-bfbf-9761371d5609', CAST(N'2024-08-07T16:03:06.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'e5db3e7c-e3a9-41bd-9e16-f47ea983542b', CAST(N'2024-08-25T18:59:01.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'e70b2cbf-5e01-4c29-b9e4-29d2d4eb3a1f', CAST(N'2024-08-23T21:47:02.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'f095c55f-ed4b-4bb5-b3d2-6293fbda415c', CAST(N'2024-08-07T13:36:38.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'f6287f22-4680-4e8e-8cd3-e23740152f6e', CAST(N'2024-06-26T19:00:44.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'f7429ee2-3379-48e6-a5b4-d4d28a102054', CAST(N'2024-08-29T00:43:39.0000000' AS DateTime2))
INSERT [dbo].[invalidated_tokens] ([id], [expiry_time]) VALUES (N'f8b69c82-ef35-46df-87f8-288afdad7cf0', CAST(N'2024-07-16T01:48:21.0000000' AS DateTime2))
GO
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (1, 1)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (4, 1)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (5, 1)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (6, 1)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (7, 2)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (50, 1)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (161, 1)
INSERT [dbo].[order_item_toppings] ([order_item_id], [topping_id]) VALUES (161, 3)
GO
SET IDENTITY_INSERT [dbo].[order_items] ON 

INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (1, 55000, 1, 1, 1, 1)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (2, 45000, 1, 1, 2, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (3, 49000, 1, 1, 3, 2)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (4, 55000, 1, 1, 4, 1)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (5, 55000, 1, 1, 5, 1)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (6, 59000, 1, 1, 6, 2)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (7, 65000, 1, 1, 7, 3)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (8, 29000, 1, 3, 7, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (9, 135000, 3, 1, 8, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (10, 225000, 5, 1, 9, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (11, 45000, 1, 1, 10, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (12, 45000, 1, 1, 11, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (13, 39000, 1, 4, 12, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (14, 45000, 1, 1, 13, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (15, 29000, 1, 3, 14, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (16, 39000, 1, 2, 15, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (17, 39000, 1, 4, 16, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (18, 78000, 2, 2, 17, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (19, 90000, 2, 1, 17, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (20, 49000, 1, 2, 18, 3)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (21, 45000, 1, 1, 20, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (22, 45000, 1, 1, 21, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (23, 29000, 1, 3, 22, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (24, 45000, 1, 1, 23, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (25, 45000, 1, 1, 24, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (26, 39000, 1, 2, 25, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (27, 39000, 1, 2, 26, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (28, 29000, 1, 3, 27, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (29, 29000, 1, 3, 28, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (30, 156000, 4, 4, 29, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (31, 39000, 1, 2, 30, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (32, 58000, 2, 3, 31, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (33, 45000, 1, 1, 33, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (34, 58000, 2, 3, 34, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (35, 39000, 1, 2, 35, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (36, 45000, 1, 1, 36, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (37, 90000, 2, 1, 37, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (38, 29000, 1, 3, 38, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (39, 45000, 1, 1, 38, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (40, 78000, 2, 2, 39, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (41, 39000, 1, 4, 40, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (42, 29000, 1, 3, 40, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (43, 39000, 1, 2, 41, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (44, 87000, 3, 3, 42, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (45, 45000, 1, 1, 43, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (46, 39000, 1, 2, 44, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (47, 39000, 1, 4, 47, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (48, 29000, 1, 3, 48, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (49, 90000, 2, 1, 49, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (50, 118000, 2, 1, 50, 2)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (51, 45000, 1, 1, 51, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (52, 45000, 1, 1, 53, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (53, 39000, 1, 2, 54, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (54, 45000, 1, 1, 54, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (55, 39000, 1, 2, 55, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (56, 45000, 1, 1, 56, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (57, 90000, 2, 1, 57, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (58, 45000, 1, 1, 58, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (59, 39000, 1, 4, 59, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (60, 90000, 2, 1, 60, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (61, 29000, 1, 3, 61, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (62, 45000, 1, 1, 62, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (63, 39000, 1, 2, 63, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (64, 45000, 1, 1, 63, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (65, 45000, 1, 1, 64, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (66, 90000, 2, 1, 65, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (67, 45000, 1, 1, 66, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (68, 45000, 1, 1, 67, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (69, 45000, 1, 1, 68, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (70, 39000, 1, 4, 69, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (71, 90000, 2, 1, 69, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (72, 29000, 1, 9, 70, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (73, 39000, 1, 10, 71, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (74, 39000, 1, 2, 72, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (75, 45000, 1, 1, 73, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (76, 78000, 2, 4, 73, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (77, 39000, 1, 2, 73, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (78, 29000, 1, 3, 73, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (79, 45000, 1, 1, 74, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (80, 45000, 1, 1, 75, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (81, 45000, 1, 1, 78, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (82, 45000, 1, 1, 79, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (83, 45000, 1, 1, 80, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (84, 45000, 1, 1, 81, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (85, 39000, 1, 4, 82, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (86, 39000, 1, 2, 83, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (87, 45000, 1, 1, 84, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (88, 90000, 2, 1, 85, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (89, 45000, 1, 1, 86, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (90, 45000, 1, 1, 87, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (91, 45000, 1, 1, 88, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (92, 78000, 2, 2, 88, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (93, 58000, 2, 3, 89, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (94, 90000, 2, 1, 89, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (95, 90000, 2, 1, 90, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (96, 45000, 1, 1, 91, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (97, 45000, 1, 1, 92, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (98, 45000, 1, 1, 93, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (99, 45000, 1, 1, 96, NULL)
GO
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (100, 39000, 1, 2, 97, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (101, 29000, 1, 3, 98, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (102, 78000, 2, 2, 100, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (103, 39000, 1, 2, 101, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (104, 45000, 1, 1, 102, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (105, 45000, 1, 1, 103, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (106, 29000, 1, 3, 104, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (107, 90000, 2, 1, 108, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (108, 45000, 1, 1, 109, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (109, 45000, 1, 1, 110, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (110, 45000, 1, 1, 120, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (111, 45000, 1, 1, 123, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (112, 45000, 1, 1, 125, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (113, 45000, 1, 1, 132, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (114, 135000, 3, 1, 133, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (115, 78000, 2, 2, 133, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (116, 39000, 1, 2, 134, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (117, 39000, 1, 2, 135, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (118, 39000, 1, 2, 136, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (119, 29000, 1, 3, 136, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (120, 45000, 1, 1, 137, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (121, 45000, 1, 1, 138, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (122, 90000, 2, 1, 139, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (123, 45000, 1, 1, 140, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (124, 90000, 2, 1, 141, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (125, 39000, 1, 2, 142, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (126, 45000, 1, 1, 143, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (127, 45000, 1, 1, 144, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (128, 39000, 1, 2, 145, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (129, 90000, 2, 1, 146, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (130, 39000, 1, 2, 147, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (131, 45000, 1, 1, 148, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (132, 39000, 1, 2, 148, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (133, 45000, 1, 1, 149, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (134, 45000, 1, 1, 150, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (135, 45000, 1, 1, 151, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (136, 45000, 1, 1, 152, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (137, 45000, 1, 1, 153, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (138, 39000, 1, 2, 154, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (139, 39000, 1, 2, 155, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (140, 39000, 1, 4, 156, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (141, 135000, 3, 1, 157, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (142, 39000, 1, 2, 158, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (143, 29000, 1, 3, 159, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (147, 45000, 1, 1, 162, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (159, 49000, 1, 32, 173, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (160, 29000, 1, 3, 173, NULL)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (161, 138000, 2, 1, 173, 2)
INSERT [dbo].[order_items] ([id], [price], [quantity], [drink_id], [order_id], [size_id]) VALUES (162, 117000, 3, 4, 174, NULL)
SET IDENTITY_INSERT [dbo].[order_items] OFF
GO
SET IDENTITY_INSERT [dbo].[order_statuses] ON 

INSERT [dbo].[order_statuses] ([id], [name]) VALUES (1, N'pending')
INSERT [dbo].[order_statuses] ([id], [name]) VALUES (2, N'In Progress')
INSERT [dbo].[order_statuses] ([id], [name]) VALUES (3, N'Shipping')
INSERT [dbo].[order_statuses] ([id], [name]) VALUES (4, N'Delivered')
INSERT [dbo].[order_statuses] ([id], [name]) VALUES (5, N'Completed')
INSERT [dbo].[order_statuses] ([id], [name]) VALUES (6, N'Cancel')
SET IDENTITY_INSERT [dbo].[order_statuses] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (1, CAST(N'2024-06-26T16:57:38.6683740' AS DateTime2), 0, 1, 55000, 1, 2, 1, 2, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (2, CAST(N'2024-06-26T17:32:59.4457190' AS DateTime2), 0, 1, 45000, 2, 1, 1, 2, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (3, CAST(N'2024-06-26T17:43:45.4505620' AS DateTime2), 0, 1, 49000, 3, 1, 1, 2, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (4, CAST(N'2024-06-26T17:44:12.9324150' AS DateTime2), 0, 1, 55000, 4, 1, 1, 2, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (5, CAST(N'2024-06-26T17:45:53.1200720' AS DateTime2), 0, 1, 55000, 5, 1, 1, 2, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (6, CAST(N'2024-07-05T16:25:03.5023120' AS DateTime2), 0, 1, 59000, 6, 1, 1, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (7, CAST(N'2024-07-06T15:44:27.1895660' AS DateTime2), 0, 2, 94000, 7, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (8, CAST(N'2024-07-06T21:01:33.5815250' AS DateTime2), 0, 3, 135000, 8, 1, 1, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (9, CAST(N'2024-07-13T15:21:29.9998020' AS DateTime2), 0, 5, 225000, 9, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (10, CAST(N'2024-07-13T15:22:14.5534950' AS DateTime2), 0, 1, 45000, 10, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (11, CAST(N'2024-07-13T15:36:37.1730410' AS DateTime2), 0, 1, 45000, 11, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (12, CAST(N'2024-07-13T15:37:52.8020930' AS DateTime2), 0, 1, 39000, 12, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (13, CAST(N'2024-07-13T15:51:55.5092330' AS DateTime2), 0, 1, 45000, 13, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (14, CAST(N'2024-07-13T15:53:51.7858220' AS DateTime2), 0, 1, 29000, 14, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (15, CAST(N'2024-07-13T16:01:53.8062430' AS DateTime2), 0, 1, 39000, 16, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (16, CAST(N'2024-07-13T16:03:49.4691210' AS DateTime2), 1, 1, 39000, 17, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (17, CAST(N'2024-07-13T18:46:35.7787460' AS DateTime2), 0, 4, 168000, 24, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (18, CAST(N'2024-07-13T18:47:49.3096580' AS DateTime2), 0, 1, 49000, 25, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (19, CAST(N'2024-07-13T18:48:09.2795770' AS DateTime2), 0, 0, 0, 26, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (20, CAST(N'2024-07-13T18:52:01.4711740' AS DateTime2), 0, 1, 45000, 27, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (21, CAST(N'2024-07-14T21:26:55.9771060' AS DateTime2), 0, 1, 45000, 28, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (22, CAST(N'2024-07-14T21:30:43.2418420' AS DateTime2), 0, 1, 29000, 29, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (23, CAST(N'2024-07-14T21:53:19.8927400' AS DateTime2), 0, 1, 45000, 30, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (24, CAST(N'2024-07-14T21:58:27.3090140' AS DateTime2), 0, 1, 45000, 31, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (25, CAST(N'2024-07-14T22:02:15.0368410' AS DateTime2), 0, 1, 39000, 32, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (26, CAST(N'2024-07-14T22:03:21.8890430' AS DateTime2), 0, 1, 39000, 33, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (27, CAST(N'2024-07-14T22:04:20.7725160' AS DateTime2), 0, 1, 29000, 34, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (28, CAST(N'2024-07-14T22:09:13.4184260' AS DateTime2), 0, 1, 29000, 35, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (29, CAST(N'2024-07-14T22:16:21.2885790' AS DateTime2), 0, 4, 156000, 36, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (30, CAST(N'2024-07-14T22:26:06.1567880' AS DateTime2), 0, 1, 39000, 37, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (31, CAST(N'2024-07-14T22:27:08.4252900' AS DateTime2), 0, 2, 58000, 38, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (32, CAST(N'2024-07-14T22:27:12.0722170' AS DateTime2), 0, 0, 0, 39, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (33, CAST(N'2024-07-14T22:34:08.6108480' AS DateTime2), 0, 1, 45000, 40, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (34, CAST(N'2024-07-14T22:41:43.9886920' AS DateTime2), 0, 2, 58000, 41, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (35, CAST(N'2024-07-14T22:43:54.2873580' AS DateTime2), 0, 1, 39000, 42, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (36, CAST(N'2024-07-15T23:30:18.0003400' AS DateTime2), 1, 1, 45000, 43, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (37, CAST(N'2024-07-15T23:40:25.1370090' AS DateTime2), 1, 2, 90000, 44, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (38, CAST(N'2024-07-16T00:12:51.6062370' AS DateTime2), 0, 2, 74000, 45, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (39, CAST(N'2024-07-16T00:13:44.4384870' AS DateTime2), 0, 2, 78000, 46, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (40, CAST(N'2024-07-16T01:09:03.9793600' AS DateTime2), 0, 2, 68000, 47, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (41, CAST(N'2024-07-16T01:12:36.4646540' AS DateTime2), 0, 1, 27299.999535083771, 50, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (42, CAST(N'2024-07-16T01:13:48.7627720' AS DateTime2), 0, 3, 18000, 51, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (43, CAST(N'2024-07-16T10:25:45.6100660' AS DateTime2), 0, 1, -24000, 52, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (44, CAST(N'2024-07-16T14:17:43.6345410' AS DateTime2), 0, 1, 19500, 53, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (45, CAST(N'2024-07-16T14:17:45.5371200' AS DateTime2), 0, 0, 0, 54, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (46, CAST(N'2024-07-16T14:17:47.7584090' AS DateTime2), 0, 0, 0, 55, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (47, CAST(N'2024-07-16T14:18:30.1529650' AS DateTime2), 1, 1, 19500, 56, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (48, CAST(N'2024-07-16T14:33:15.0236880' AS DateTime2), 1, 1, 14500, 57, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (49, CAST(N'2024-07-20T17:59:27.9974260' AS DateTime2), 1, 2, 45000, 58, 1, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (50, CAST(N'2024-07-20T18:11:22.2876250' AS DateTime2), 0, 2, 59000, 59, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (51, CAST(N'2024-07-20T21:16:25.3333120' AS DateTime2), 0, 1, 22500, 61, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (52, CAST(N'2024-07-20T21:16:58.9040070' AS DateTime2), 0, 0, 0, 62, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (53, CAST(N'2024-07-20T21:30:32.2498840' AS DateTime2), 0, 1, 22500, 63, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (54, CAST(N'2024-07-20T22:16:30.5737490' AS DateTime2), 0, 2, 42000, 68, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (55, CAST(N'2024-07-20T22:35:44.5633070' AS DateTime2), 0, 1, 19500, 69, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (56, CAST(N'2024-07-20T22:36:28.5050510' AS DateTime2), 0, 1, 22500, 70, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (57, CAST(N'2024-07-23T13:14:11.3896560' AS DateTime2), 1, 2, 45000, 71, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (58, CAST(N'2024-07-23T14:19:39.7324520' AS DateTime2), 0, 1, 22500, 72, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (59, CAST(N'2024-07-23T17:20:42.0924340' AS DateTime2), 0, 1, 19500, 73, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (60, CAST(N'2024-07-23T17:37:40.6622780' AS DateTime2), 0, 2, 45000, 74, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (61, CAST(N'2024-07-23T17:52:50.5452080' AS DateTime2), 0, 1, 14500, 75, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (62, CAST(N'2024-07-23T18:07:42.5202110' AS DateTime2), 0, 1, 22500, 76, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (63, CAST(N'2024-07-27T18:56:29.4015020' AS DateTime2), 0, 2, 42000, 77, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (64, CAST(N'2024-07-27T18:57:50.6979040' AS DateTime2), 0, 1, 15000, 78, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (65, CAST(N'2024-07-27T19:00:23.7928030' AS DateTime2), 0, 2, 60000, 79, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (66, CAST(N'2024-07-27T19:12:47.2878670' AS DateTime2), 0, 1, 61000, 81, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (67, CAST(N'2024-07-27T19:13:42.9834970' AS DateTime2), 0, 1, 61000, 82, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (68, CAST(N'2024-07-29T16:50:26.3821030' AS DateTime2), 0, 1, 45500, 83, 6, 13, 4, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (69, CAST(N'2024-07-29T17:02:29.1857460' AS DateTime2), 1, 3, 145000, 84, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (70, CAST(N'2024-07-29T17:16:51.3515920' AS DateTime2), 1, 1, 37500, 85, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (71, CAST(N'2024-07-29T17:39:16.2125150' AS DateTime2), 1, 1, 42500, 86, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (72, CAST(N'2024-07-29T17:52:11.5507710' AS DateTime2), 1, 1, 42500, 87, 1, 13, 5, 49)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (73, CAST(N'2024-08-07T13:31:03.4998060' AS DateTime2), 0, 5, 207000, 103, 6, 1, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (74, CAST(N'2024-08-07T13:40:37.0698260' AS DateTime2), 0, 1, 61000, 113, 1, 1, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (75, CAST(N'2024-08-07T13:48:14.7012830' AS DateTime2), 0, 1, 61000, 122, 1, 1, 5, 48)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (78, CAST(N'2024-08-07T14:07:41.4298500' AS DateTime2), 0, 1, 91000, 139, 1, 1, 5, 48)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (79, CAST(N'2024-08-07T14:46:50.7233240' AS DateTime2), 0, 1, 91000, 140, 1, 13, 5, 48)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (80, CAST(N'2024-08-07T14:52:15.7099470' AS DateTime2), 0, 1, 91000, 144, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (81, CAST(N'2024-08-07T14:52:47.4167200' AS DateTime2), 0, 1, 91000, 145, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (82, CAST(N'2024-08-07T14:58:05.1267020' AS DateTime2), 0, 1, 85000, 146, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (83, CAST(N'2024-08-07T15:02:20.7977640' AS DateTime2), 0, 1, 62000, 147, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (84, CAST(N'2024-08-07T15:02:45.0579090' AS DateTime2), 0, 1, 68000, 148, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (85, CAST(N'2024-08-07T15:04:02.0110320' AS DateTime2), 0, 2, 136000, 149, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (86, CAST(N'2024-08-07T15:10:13.4407340' AS DateTime2), 0, 1, 91000, 150, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (87, CAST(N'2024-08-07T15:10:52.1232340' AS DateTime2), 0, 1, 57000, 151, 1, 1, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (88, CAST(N'2024-08-07T15:19:31.9289450' AS DateTime2), 0, 3, 169000, 152, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (89, CAST(N'2024-08-07T15:20:28.2117900' AS DateTime2), 0, 4, 194000, 153, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (90, CAST(N'2024-08-07T15:21:35.5184960' AS DateTime2), 0, 2, 136000, 154, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (91, CAST(N'2024-08-07T15:22:17.9489650' AS DateTime2), 0, 1, 57000, 155, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (92, CAST(N'2024-08-07T15:27:13.8534900' AS DateTime2), 0, 1, 91000, 159, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (93, CAST(N'2024-08-07T15:32:07.8124500' AS DateTime2), 0, 1, 91000, 160, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (94, CAST(N'2024-08-07T15:32:09.3859570' AS DateTime2), 0, 0, 46000, 161, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (95, CAST(N'2024-08-07T15:32:31.0092750' AS DateTime2), 0, 0, 46000, 162, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (96, CAST(N'2024-08-07T15:38:57.0740930' AS DateTime2), 0, 1, 91000, 170, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (97, CAST(N'2024-08-07T15:39:27.0903680' AS DateTime2), 0, 1, 85000, 171, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (98, CAST(N'2024-08-07T15:40:49.0094230' AS DateTime2), 0, 1, 75000, 172, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (99, CAST(N'2024-08-07T15:40:53.7145340' AS DateTime2), 0, 0, 46000, 173, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (100, CAST(N'2024-08-07T15:42:14.4915400' AS DateTime2), 0, 2, 124000, 175, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (101, CAST(N'2024-08-07T15:47:28.3568820' AS DateTime2), 0, 1, 85000, 176, 1, 1, 5, NULL)
GO
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (102, CAST(N'2024-08-07T15:48:05.1755070' AS DateTime2), 0, 1, 64000, 177, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (103, CAST(N'2024-08-07T15:50:06.4142500' AS DateTime2), 0, 1, 63700, 178, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (104, CAST(N'2024-08-07T16:23:55.2312210' AS DateTime2), 0, 1, 52000, 179, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (105, CAST(N'2024-08-07T16:23:56.4800940' AS DateTime2), 0, 0, 23000, 180, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (106, CAST(N'2024-08-07T16:24:02.4165380' AS DateTime2), 0, 0, 23000, 181, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (107, CAST(N'2024-08-07T16:24:08.8579220' AS DateTime2), 0, 0, -7000, 182, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (108, CAST(N'2024-08-08T13:03:09.6975120' AS DateTime2), 0, 2, 136000, 183, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (109, CAST(N'2024-08-08T13:03:33.0460820' AS DateTime2), 0, 1, 91000, 184, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (110, CAST(N'2024-08-08T13:04:02.7521860' AS DateTime2), 0, 1, 91000, 185, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (111, CAST(N'2024-08-08T13:04:09.2301900' AS DateTime2), 0, 0, 46000, 186, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (112, CAST(N'2024-08-08T13:04:11.4375530' AS DateTime2), 0, 0, 32200, 187, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (113, CAST(N'2024-08-08T13:04:16.6678100' AS DateTime2), 0, 0, 32200, 188, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (114, CAST(N'2024-08-08T13:04:19.3034790' AS DateTime2), 0, 0, 32200, 189, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (115, CAST(N'2024-08-08T13:04:31.9495630' AS DateTime2), 0, 0, 32200, 190, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (116, CAST(N'2024-08-08T13:04:55.3440120' AS DateTime2), 0, 0, 32200, 191, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (117, CAST(N'2024-08-08T13:05:02.8069830' AS DateTime2), 0, 0, 32200, 192, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (118, CAST(N'2024-08-08T13:06:20.5188020' AS DateTime2), 0, 0, 32200, 193, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (119, CAST(N'2024-08-08T13:08:59.1018360' AS DateTime2), 0, 0, 32200, 194, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (120, CAST(N'2024-08-08T13:14:18.0206650' AS DateTime2), 0, 1, 91000, 195, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (121, CAST(N'2024-08-08T13:14:25.6631050' AS DateTime2), 0, 0, 32200, 196, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (122, CAST(N'2024-08-08T13:16:44.3185480' AS DateTime2), 0, 0, 32200, 197, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (123, CAST(N'2024-08-08T13:34:22.4285220' AS DateTime2), 0, 1, 64000, 199, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (124, CAST(N'2024-08-08T13:36:20.4833880' AS DateTime2), 1, 0, 32000, 200, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (125, CAST(N'2024-08-08T13:39:22.9025170' AS DateTime2), 0, 1, 48000, 202, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (126, CAST(N'2024-08-08T13:41:05.6084830' AS DateTime2), 0, 0, 16000, 203, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (127, CAST(N'2024-08-08T13:41:19.3002890' AS DateTime2), 0, 0, 32000, 204, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (128, CAST(N'2024-08-08T13:41:36.7720990' AS DateTime2), 0, 0, 16000, 205, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (129, CAST(N'2024-08-08T13:42:26.4051210' AS DateTime2), 0, 0, 16000, 206, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (130, CAST(N'2024-08-08T13:42:39.0874010' AS DateTime2), 0, 0, 16000, 207, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (131, CAST(N'2024-08-08T13:48:44.3972990' AS DateTime2), 1, 0, 32000, 208, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (132, CAST(N'2024-08-08T13:54:12.3901050' AS DateTime2), 1, 1, 63700, 209, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (133, CAST(N'2024-08-08T14:02:53.2952190' AS DateTime2), 0, 5, 181300, 210, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (134, CAST(N'2024-08-08T14:06:18.8986710' AS DateTime2), 0, 1, 43400, 211, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (135, CAST(N'2024-08-08T14:07:08.0051530' AS DateTime2), 0, 1, 85000, 212, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (136, CAST(N'2024-08-08T14:08:09.9259840' AS DateTime2), 1, 2, 79800, 213, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (137, CAST(N'2024-08-08T14:14:49.8847660' AS DateTime2), 0, 1, 63700, 214, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (138, CAST(N'2024-08-08T14:17:27.1725480' AS DateTime2), 0, 1, 63700, 215, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (139, CAST(N'2024-08-08T14:18:13.5260520' AS DateTime2), 1, 2, 95200, 216, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (140, CAST(N'2024-08-08T15:55:22.9471990' AS DateTime2), 1, 1, 63700, 217, 1, 13, 8, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (141, CAST(N'2024-08-19T16:34:55.8363050' AS DateTime2), 1, 2, 95200, 218, 5, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (142, CAST(N'2024-08-19T16:37:46.1702370' AS DateTime2), 0, 1, 62000, 219, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (143, CAST(N'2024-08-23T20:46:43.1165040' AS DateTime2), 0, 1, 91000, 220, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (144, CAST(N'2024-08-23T20:49:10.8538850' AS DateTime2), 0, 1, 61000, 221, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (145, CAST(N'2024-08-23T20:54:48.6300810' AS DateTime2), 0, 1, 62000, 222, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (146, CAST(N'2024-08-23T21:17:31.7141890' AS DateTime2), 0, 2, 95200, 223, 1, 13, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (147, CAST(N'2024-08-23T21:20:47.2469370' AS DateTime2), 1, 1, 55000, 224, 1, 13, 5, 51)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (148, CAST(N'2024-08-23T21:27:20.1870310' AS DateTime2), 0, 2, 107000, 225, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (149, CAST(N'2024-08-23T21:27:36.9364750' AS DateTime2), 0, 1, 68000, 226, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (150, CAST(N'2024-08-23T21:33:10.8657520' AS DateTime2), 0, 1, 68000, 227, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (151, CAST(N'2024-08-23T21:42:37.0426180' AS DateTime2), 0, 1, 91000, 228, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (152, CAST(N'2024-08-23T22:02:50.3503280' AS DateTime2), 0, 1, 57000, 229, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (153, CAST(N'2024-08-23T22:04:45.5106670' AS DateTime2), 0, 1, 68000, 230, 1, 1, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (154, CAST(N'2024-08-23T22:05:06.4282030' AS DateTime2), 0, 1, 43400, 231, 1, 1, 5, 52)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (155, CAST(N'2024-08-23T22:05:26.4962170' AS DateTime2), 1, 1, 62000, 232, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (156, CAST(N'2024-08-23T22:06:23.1770140' AS DateTime2), 1, 1, 62000, 233, 1, 13, 5, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (157, CAST(N'2024-08-25T11:52:29.7992500' AS DateTime2), 0, 3, 181000, 234, 1, 1, 6, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (158, CAST(N'2024-08-25T11:58:11.4033360' AS DateTime2), 0, 1, 85000, 235, 1, 1, 2, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (159, CAST(N'2024-08-25T15:07:35.8856510' AS DateTime2), 0, 1, 29000, NULL, 1, 1, 10, NULL)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (162, CAST(N'2024-08-28T19:01:17.8743660' AS DateTime2), 0, 1, 910, 238, 1, 1, 5, 55)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (173, CAST(N'2024-08-28T19:39:30.9427840' AS DateTime2), 1, 4, 131000, 249, 1, 13, 5, 57)
INSERT [dbo].[orders] ([id], [create_date], [payment_status], [total_items], [total_price], [address_id], [order_status_id], [payment_method_id], [user_id], [voucher_id]) VALUES (174, CAST(N'2024-08-28T19:44:45.9549490' AS DateTime2), 1, 3, 117000, NULL, 5, 1, 10, NULL)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_method_banks] ON 

INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (1, 2250000, N'VNP14226112', N'ATM', CAST(N'2024-07-23T18:07:56.0000000' AS DateTime2), 14527982, 12, 62, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (2, 42000, N'VNP14226112', N'ATM', CAST(N'2024-07-27T18:57:00.0000000' AS DateTime2), 14534632, 12, 63, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (3, 15000, N'VNP14226112', N'ATM', CAST(N'2024-07-27T18:58:06.0000000' AS DateTime2), 14534633, 12, 64, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (4, 60000, N'VNP14226112', N'ATM', CAST(N'2024-07-27T19:00:42.0000000' AS DateTime2), 14534635, 12, 65, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (5, 61000, N'VNP14226112', N'ATM', CAST(N'2024-07-27T19:13:06.0000000' AS DateTime2), 14534646, 12, 66, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (6, 61000, N'VNP14226112', N'ATM', CAST(N'2024-07-27T19:13:56.0000000' AS DateTime2), 14534648, 12, 67, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (7, NULL, NULL, NULL, NULL, NULL, 1, 68, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (9, NULL, NULL, NULL, NULL, NULL, 1, 69, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (12, 37500, N'VNP14226112', N'ATM', CAST(N'2024-07-29T17:17:19.0000000' AS DateTime2), 14537118, 12, 70, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (13, 42500, N'VNP14226112', N'ATM', CAST(N'2024-07-29T17:39:34.0000000' AS DateTime2), 14537153, 12, 71, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (14, 42500, N'VNP14226112', N'ATM', CAST(N'2024-07-29T17:52:44.0000000' AS DateTime2), 14537171, 12, 72, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (15, 63700, N'VNP14549055', N'ATM', CAST(N'2024-08-08T13:54:44.0000000' AS DateTime2), 14549055, 12, 132, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (16, 79800, N'VNP14549080', N'ATM', CAST(N'2024-08-08T14:09:01.0000000' AS DateTime2), 14549080, 12, 136, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (17, 95200, N'VNP14549101', N'ATM', CAST(N'2024-08-08T14:18:54.0000000' AS DateTime2), 14549101, 12, 139, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (18, 63700, N'VNP14549348', N'ATM', CAST(N'2024-08-08T15:55:45.0000000' AS DateTime2), 14549348, 12, 140, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (19, 95200, N'VNP14559506', N'ATM', CAST(N'2024-08-19T16:35:42.0000000' AS DateTime2), 14559506, 12, 141, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (20, 55000, N'VNP14564934', N'ATM', CAST(N'2024-08-23T21:21:40.0000000' AS DateTime2), 14564934, 12, 147, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (21, 62000, N'VNP14564969', N'ATM', CAST(N'2024-08-23T22:05:46.0000000' AS DateTime2), 14564969, 12, 155, 13)
INSERT [dbo].[payment_method_banks] ([id], [amount], [bank_tran_no], [card_type], [pay_date], [transaction_no], [bank_id], [order_id], [payment_method_id]) VALUES (22, 62000, N'VNP14564971', N'ATM', CAST(N'2024-08-23T22:06:36.0000000' AS DateTime2), 14564971, 12, 156, 13)
SET IDENTITY_INSERT [dbo].[payment_method_banks] OFF
GO
SET IDENTITY_INSERT [dbo].[payment_methods] ON 

INSERT [dbo].[payment_methods] ([id], [name]) VALUES (1, N'COD')
INSERT [dbo].[payment_methods] ([id], [name]) VALUES (12, N'Momo')
INSERT [dbo].[payment_methods] ([id], [name]) VALUES (13, N'VnPay')
SET IDENTITY_INSERT [dbo].[payment_methods] OFF
GO
INSERT [dbo].[permissions] ([name], [description]) VALUES (N'CREATE_DATA', N'Create data permission')
INSERT [dbo].[permissions] ([name], [description]) VALUES (N'UPDATE_DATA', N'Update data permission')
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (1, N'aaaaa', 0, 28)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (2, N'aaaaa', 0, 29)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (3, N'aaaaa', 0, 30)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (4, N'aaaaa', 0, 31)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (5, N'test', 0, 32)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (6, N'a', 3, 33)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (7, N'a', 3, 34)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (8, N'test', 4, 35)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (9, N'tt', 2, 36)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (14, N't', 3, 72)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (15, N't', 3, 79)
INSERT [dbo].[reviews] ([id], [comment], [rating], [order_id]) VALUES (16, N'ngon', 5, 140)
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
INSERT [dbo].[role_permissions] ([role_name], [permission_name]) VALUES (N'ADMIN', N'CREATE_DATA')
INSERT [dbo].[role_permissions] ([role_name], [permission_name]) VALUES (N'ADMIN', N'UPDATE_DATA')
INSERT [dbo].[role_permissions] ([role_name], [permission_name]) VALUES (N'USER', N'CREATE_DATA')
GO
INSERT [dbo].[roles] ([name], [description]) VALUES (N'ADMIN', N'Role admin')
INSERT [dbo].[roles] ([name], [description]) VALUES (N'USER', N'Role user')
GO
SET IDENTITY_INSERT [dbo].[sizes] ON 

INSERT [dbo].[sizes] ([id], [character], [name]) VALUES (1, N'S', N'Nhỏ')
INSERT [dbo].[sizes] ([id], [character], [name]) VALUES (2, N'M', N'Vừa')
INSERT [dbo].[sizes] ([id], [character], [name]) VALUES (3, N'L', N'Lớn')
SET IDENTITY_INSERT [dbo].[sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[toppings] ON 

INSERT [dbo].[toppings] ([id], [is_active], [name], [price]) VALUES (1, 1, N'Shot Espresso', 10000)
INSERT [dbo].[toppings] ([id], [is_active], [name], [price]) VALUES (2, 1, N'Trân châu trắng', 10000)
INSERT [dbo].[toppings] ([id], [is_active], [name], [price]) VALUES (3, 1, N'Sốt Caramel', 10000)
INSERT [dbo].[toppings] ([id], [is_active], [name], [price]) VALUES (4, 1, N'a', 55)
SET IDENTITY_INSERT [dbo].[toppings] OFF
GO
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (1, N'ADMIN')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (2, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (3, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (4, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (5, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (6, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (7, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (8, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (10, N'ADMIN')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (11, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (12, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (13, N'USER')
INSERT [dbo].[user_roles] ([user_id], [role_name]) VALUES (14, N'USER')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (1, 0, CAST(N'1998-04-24' AS Date), N'admin@gmail.com', NULL, 1, NULL, N'$2a$10$r7wq/NJGSPVg2C4xivgo/.x1HhJ5BRnYFFZB/CV.jZruJZHr9KFKe', NULL)
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (2, 1, CAST(N'1998-04-24' AS Date), N'hoangnmps26822@fpt.edu.vn', N'Nguyen Minh Hoang', 1, N'(FPL HCM)', NULL, N'0900000002')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (3, 0, CAST(N'1998-04-24' AS Date), N'a@gmail.com', N'test', 0, N'test', N'$2a$10$PzIeZLCZLYB.f/Dt0UOgNuCFwVYvhemMnUkDzsSfPfYbaEMRu/Lxm', N'0900000001')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (4, 0, CAST(N'1998-04-24' AS Date), N'user@gmail.com', N'user', 0, N'user', N'$2a$10$d3efqgiqoBJbDTIzh8cQJ.QIwQFI1/RjMoO8CLO8FHKa5YSKschqm', N'0900000001')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (5, 1, CAST(N'1998-04-24' AS Date), N'minhhoang25498@gmail.com', N'Hoàng', 1, N'Nguyễn Minh', N'$2a$10$hSeSr3lDe4d0j3SIv7ZpeuO8nSHqthVsylv7BpPVQph.f84hwn5Fa', N'0900000001')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (6, 0, CAST(N'1998-04-24' AS Date), N'minhhoang250498@gmail.com', N'test', 1, N'test', N'$2a$10$Zzzi8uImiqmnzOKVCiyBMuoLPpQaiQylFB8QKnne2uF/quuSPk1t.', N'0900000001')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (7, 0, CAST(N'1998-04-24' AS Date), N'test@yopmail.com', N'test', 1, N'test', N'$2a$10$U93cMvBpoT0Db5cV14CnLeV7MaT5FsZAspeK8VFTq7EXYpoNMfEJe', N'0900000001')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (8, 0, CAST(N'1998-04-24' AS Date), N'user1@yopmail.com', N'user1', 1, N'user1', N'$2a$10$7UOofrZQOedn4HOXt1/oF.05PsbvbjLcgrG2FAOkT5JhqBjzSZD96', N'0900000001')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (9, 1, CAST(N'1998-04-24' AS Date), N'user0@gmail.com', NULL, 1, NULL, N'$2a$10$r7wq/NJGSPVg2C4xivgo/.x1HhJ5BRnYFFZB/CV.jZruJZHr9KFKe', NULL)
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (10, 0, NULL, N'user2@yopmail.com', N'123', 1, N'123', N'$2a$10$.tRfrqRF4QF3/TIa9VLjtuLUnav5wTtRf4lHxhbDiwtUzz3XfR6o2', N'0900000002')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (11, 0, NULL, N'user4@yopmail.com', N'test', 1, N'test', N'$2a$10$K7xvWYmNfaUg5Mvi02gk2eWhKhvECpU2NsHqUduLhmhUx1Lq3OhIW', N'090555555555')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (12, 0, NULL, N'user5@yopmail.com', N'user5', 1, N'user5', N'$2a$10$7rsglgj59ZcPaPNlkk/ZEe.U4tkMX8EkLZRDZWib..PBxX84t0JtG', N'0900000005')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (13, 0, NULL, N'user6@yopmail.com', N'user6', 1, N'user6', N'$2a$10$ce4okCYWrO.6cs1jaB3ZCeoiuh3zrLgrfzbzNHSdiQmD5eriXYHQS', N'0900000006')
INSERT [dbo].[users] ([id], [auth_type], [dob], [email], [first_name], [is_active], [last_name], [password], [phone_number]) VALUES (14, 0, NULL, N'user7@yopmail.com', N'user7', 1, N'user7', N'$2a$10$qfFRS/AXk.YSfIan8FNWr.sUvTWUWFBQ.Qsg78shGRzX5KzxbmAma', N'0900000007')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[voucher_types] ON 

INSERT [dbo].[voucher_types] ([id], [name]) VALUES (6, N'Order')
INSERT [dbo].[voucher_types] ([id], [name]) VALUES (7, N'Drink')
INSERT [dbo].[voucher_types] ([id], [name]) VALUES (8, N'Combo')
INSERT [dbo].[voucher_types] ([id], [name]) VALUES (9, N'Ship')
SET IDENTITY_INSERT [dbo].[voucher_types] OFF
GO
SET IDENTITY_INSERT [dbo].[vouchers] ON 

INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (48, 30000, CAST(N'2024-06-30T17:00:00.0000000' AS DateTime2), N'CUNGVUI30', CAST(N'2024-07-30T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1721102816/hcymgbbe8y0xhhweldkn.png', 9)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (49, 0.5, CAST(N'2024-06-30T17:00:00.0000000' AS DateTime2), N'ROMRA', CAST(N'2024-07-30T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1721102962/geciszcfedsegqjdkolp.webp', 6)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (50, 0.5, CAST(N'2024-05-31T17:00:00.0000000' AS DateTime2), N'ROMRA6', CAST(N'2024-06-29T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1721103054/omiq41tgl6dsfqna3eg8.png', 6)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (51, 30000, CAST(N'2024-08-01T17:00:00.0000000' AS DateTime2), N'TUNGBUNG30', CAST(N'2024-08-30T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1721104373/nhnhaweprfbg7fghnnf4.png', 6)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (52, 0.3, CAST(N'2024-08-01T17:00:00.0000000' AS DateTime2), N'ROMRA6', CAST(N'2024-08-30T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1721103054/omiq41tgl6dsfqna3eg8.png', 6)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (53, 0.5, CAST(N'2024-08-01T03:00:00.0000000' AS DateTime2), N'ROMRA6', CAST(N'2024-08-30T03:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1723102848/f2ze61qccxvd7uamvgsb.webp', 6)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (55, 0.99, CAST(N'2024-07-31T17:00:00.0000000' AS DateTime2), N'tttt', CAST(N'2024-08-30T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1724846452/futpeujoze7grfrm5mum.png', 6)
INSERT [dbo].[vouchers] ([id], [amount], [begin_date], [discount_code], [end_date], [image], [voucher_type_id]) VALUES (57, 0.5, CAST(N'2024-07-31T17:00:00.0000000' AS DateTime2), N'ROMRA', CAST(N'2024-08-30T17:00:00.0000000' AS DateTime2), N'http://res.cloudinary.com/dcsdki6zn/image/upload/v1724848568/venyhoqjbzccw0cjmwnq.webp', 6)
SET IDENTITY_INSERT [dbo].[vouchers] OFF
GO
/****** Object:  Index [UK64t7ox312pqal3p7fg9o503c2]    Script Date: 8/28/2024 7:51:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK64t7ox312pqal3p7fg9o503c2] ON [dbo].[carts]
(
	[user_id] ASC
)
WHERE ([user_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKpuj7xuxrgu9ooct0y7dfwbsh0]    Script Date: 8/28/2024 7:51:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKpuj7xuxrgu9ooct0y7dfwbsh0] ON [dbo].[payment_method_banks]
(
	[order_id] ASC
)
WHERE ([order_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKsbkc1fll14ly5y6yxxk2jwlef]    Script Date: 8/28/2024 7:51:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKsbkc1fll14ly5y6yxxk2jwlef] ON [dbo].[reviews]
(
	[order_id] ASC
)
WHERE ([order_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart_item_toppings]  WITH CHECK ADD  CONSTRAINT [FK7qpc6ofhbvkroff8h1aexla8p] FOREIGN KEY([cart_item_id])
REFERENCES [dbo].[cart_items] ([id])
GO
ALTER TABLE [dbo].[cart_item_toppings] CHECK CONSTRAINT [FK7qpc6ofhbvkroff8h1aexla8p]
GO
ALTER TABLE [dbo].[cart_item_toppings]  WITH CHECK ADD  CONSTRAINT [FKllaqbllrqscijq2qhlav8woqk] FOREIGN KEY([topping_id])
REFERENCES [dbo].[toppings] ([id])
GO
ALTER TABLE [dbo].[cart_item_toppings] CHECK CONSTRAINT [FKllaqbllrqscijq2qhlav8woqk]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FK13bjx0o7t93tkgan9ikdbw779] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FK13bjx0o7t93tkgan9ikdbw779]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FKpcttvuq4mxppo8sxggjtn5i2c] FOREIGN KEY([cart_id])
REFERENCES [dbo].[carts] ([id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FKpcttvuq4mxppo8sxggjtn5i2c]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FKt9j3fnc0t5th68fjipwrbbea5] FOREIGN KEY([drink_id])
REFERENCES [dbo].[drinks] ([id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FKt9j3fnc0t5th68fjipwrbbea5]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FKb5o626f86h46m4s7ms6ginnop] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FKb5o626f86h46m4s7ms6ginnop]
GO
ALTER TABLE [dbo].[drink_images]  WITH CHECK ADD  CONSTRAINT [FKg3m7wl44phhyfkhoatmbw3kx7] FOREIGN KEY([drink_id])
REFERENCES [dbo].[drinks] ([id])
GO
ALTER TABLE [dbo].[drink_images] CHECK CONSTRAINT [FKg3m7wl44phhyfkhoatmbw3kx7]
GO
ALTER TABLE [dbo].[drink_sizes]  WITH CHECK ADD  CONSTRAINT [FKk6xnahpfaxsxwfwb9jvk1thvm] FOREIGN KEY([drink_id])
REFERENCES [dbo].[drinks] ([id])
GO
ALTER TABLE [dbo].[drink_sizes] CHECK CONSTRAINT [FKk6xnahpfaxsxwfwb9jvk1thvm]
GO
ALTER TABLE [dbo].[drink_sizes]  WITH CHECK ADD  CONSTRAINT [FKrgqfgbu7fc92bk23d2sk77coc] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([id])
GO
ALTER TABLE [dbo].[drink_sizes] CHECK CONSTRAINT [FKrgqfgbu7fc92bk23d2sk77coc]
GO
ALTER TABLE [dbo].[drink_toppings]  WITH CHECK ADD  CONSTRAINT [FK7qb5ay3t9p3dycc81s5vo8bkd] FOREIGN KEY([drink_id])
REFERENCES [dbo].[drinks] ([id])
GO
ALTER TABLE [dbo].[drink_toppings] CHECK CONSTRAINT [FK7qb5ay3t9p3dycc81s5vo8bkd]
GO
ALTER TABLE [dbo].[drink_toppings]  WITH CHECK ADD  CONSTRAINT [FKea7fccmtpow1s7ppecyafu7dw] FOREIGN KEY([topping_id])
REFERENCES [dbo].[toppings] ([id])
GO
ALTER TABLE [dbo].[drink_toppings] CHECK CONSTRAINT [FKea7fccmtpow1s7ppecyafu7dw]
GO
ALTER TABLE [dbo].[drinks]  WITH CHECK ADD  CONSTRAINT [FKivr4pooetq4771isaglt2j0br] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[drinks] CHECK CONSTRAINT [FKivr4pooetq4771isaglt2j0br]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FKjyu2qbqt8gnvno9oe9j2s2ldk]
GO
ALTER TABLE [dbo].[order_item_toppings]  WITH CHECK ADD  CONSTRAINT [FK3xmmr76snfleub6gara1po23b] FOREIGN KEY([topping_id])
REFERENCES [dbo].[toppings] ([id])
GO
ALTER TABLE [dbo].[order_item_toppings] CHECK CONSTRAINT [FK3xmmr76snfleub6gara1po23b]
GO
ALTER TABLE [dbo].[order_item_toppings]  WITH CHECK ADD  CONSTRAINT [FKqonqgw2q2blcduhtbkekq27wr] FOREIGN KEY([order_item_id])
REFERENCES [dbo].[order_items] ([id])
GO
ALTER TABLE [dbo].[order_item_toppings] CHECK CONSTRAINT [FKqonqgw2q2blcduhtbkekq27wr]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FK9t2qyxv7hnjv24ox49t7oyga2] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FK9t2qyxv7hnjv24ox49t7oyga2]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FKbioxgbv59vetrxe0ejfubep1w] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FKbioxgbv59vetrxe0ejfubep1w]
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD  CONSTRAINT [FKsaffx2t5drxsy79xd2s82veuh] FOREIGN KEY([drink_id])
REFERENCES [dbo].[drinks] ([id])
GO
ALTER TABLE [dbo].[order_items] CHECK CONSTRAINT [FKsaffx2t5drxsy79xd2s82veuh]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK32ql8ubntj5uh44ph9659tiih]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKa03ljb6t6oa6mqtoifuwkb0kw] FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[payment_methods] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKa03ljb6t6oa6mqtoifuwkb0kw]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKcbbqf26brulgfgvd0mf74rv4y] FOREIGN KEY([order_status_id])
REFERENCES [dbo].[order_statuses] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKcbbqf26brulgfgvd0mf74rv4y]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKdimvsocblb17f45ikjr6xn1wj] FOREIGN KEY([voucher_id])
REFERENCES [dbo].[vouchers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKdimvsocblb17f45ikjr6xn1wj]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKhlglkvf5i60dv6dn397ethgpt] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKhlglkvf5i60dv6dn397ethgpt]
GO
ALTER TABLE [dbo].[payment_method_banks]  WITH CHECK ADD  CONSTRAINT [FKlg8fdgax24vfeoc97fcso5c34] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[payment_method_banks] CHECK CONSTRAINT [FKlg8fdgax24vfeoc97fcso5c34]
GO
ALTER TABLE [dbo].[payment_method_banks]  WITH CHECK ADD  CONSTRAINT [FKsds1v9speg9y6voopa992tp13] FOREIGN KEY([bank_id])
REFERENCES [dbo].[banks] ([id])
GO
ALTER TABLE [dbo].[payment_method_banks] CHECK CONSTRAINT [FKsds1v9speg9y6voopa992tp13]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FKqwgq1lxgahsxdspnwqfac6sv6] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FKqwgq1lxgahsxdspnwqfac6sv6]
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD  CONSTRAINT [FKie537gni0kx7t0vxakg9kbur9] FOREIGN KEY([permission_name])
REFERENCES [dbo].[permissions] ([name])
GO
ALTER TABLE [dbo].[role_permissions] CHECK CONSTRAINT [FKie537gni0kx7t0vxakg9kbur9]
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD  CONSTRAINT [FKq893o9jg7ihgdxfwtiswn0uk2] FOREIGN KEY([role_name])
REFERENCES [dbo].[roles] ([name])
GO
ALTER TABLE [dbo].[role_permissions] CHECK CONSTRAINT [FKq893o9jg7ihgdxfwtiswn0uk2]
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD  CONSTRAINT [FKhqfg2eivfexu69i6cbw3w0tej] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[user_addresses] CHECK CONSTRAINT [FKhqfg2eivfexu69i6cbw3w0tej]
GO
ALTER TABLE [dbo].[user_addresses]  WITH CHECK ADD  CONSTRAINT [FKn2fisxyyu3l9wlch3ve2nocgp] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_addresses] CHECK CONSTRAINT [FKn2fisxyyu3l9wlch3ve2nocgp]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FKdcdh0gl1mdce42vy0klyio6fi] FOREIGN KEY([role_name])
REFERENCES [dbo].[roles] ([name])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FKdcdh0gl1mdce42vy0klyio6fi]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FKhfh9dx7w3ubf1co1vdev94g3f] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FKhfh9dx7w3ubf1co1vdev94g3f]
GO
ALTER TABLE [dbo].[vouchers]  WITH CHECK ADD  CONSTRAINT [FKyjfaqle8q8ti7k5lpyfw1vub] FOREIGN KEY([voucher_type_id])
REFERENCES [dbo].[voucher_types] ([id])
GO
ALTER TABLE [dbo].[vouchers] CHECK CONSTRAINT [FKyjfaqle8q8ti7k5lpyfw1vub]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([auth_type]>=(0) AND [auth_type]<=(2)))
GO
USE [master]
GO
ALTER DATABASE [PRO2021_Coffee_Shop] SET  READ_WRITE 
GO
