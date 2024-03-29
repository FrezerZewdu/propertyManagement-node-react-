USE [master]
GO
/****** Object:  Database [property_management]    Script Date: 21-Jul-22 9:33:42 PM ******/
CREATE DATABASE [property_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'property_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\property_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'property_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\property_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [property_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [property_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [property_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [property_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [property_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [property_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [property_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [property_management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [property_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [property_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [property_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [property_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [property_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [property_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [property_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [property_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [property_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [property_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [property_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [property_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [property_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [property_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [property_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [property_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [property_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [property_management] SET  MULTI_USER 
GO
ALTER DATABASE [property_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [property_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [property_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [property_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [property_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [property_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [property_management] SET QUERY_STORE = OFF
GO
USE [property_management]
GO
/****** Object:  Table [dbo].[Customer_buys]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_buys](
	[CID] [int] NOT NULL,
	[FGID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Total_Amount] [money] NOT NULL,
	[Payment_status] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[Phone_number] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Department_head_ID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[password] [nchar](60) NOT NULL,
	[departmentID] [int] IDENTITY(1,1) NOT NULL,
	[Roles] [varchar](6) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Finished_goods]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Finished_goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Stocked_date] [date] NULL,
	[Product_name] [varchar](100) NULL,
	[Product_code] [varchar](50) NULL,
	[Stock_ID] [int] NULL,
	[Category] [varchar](50) NULL,
	[Total_price] [money] NULL,
	[Date] [date] NULL,
	[Registered_by] [int] NULL,
 CONSTRAINT [PK_Finished_goods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raw_material_withdrawal]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raw_material_withdrawal](
	[RMID] [int] NOT NULL,
	[EID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Total_amount] [int] NULL,
 CONSTRAINT [PK_Raw_material_withdrawal] PRIMARY KEY CLUSTERED 
(
	[RMID] ASC,
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raw_materials]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raw_materials](
	[stock_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[material_code] [varchar](100) NOT NULL,
	[packet] [int] NOT NULL,
	[total_packet] [int] NOT NULL,
	[price] [money] NOT NULL,
	[Total_price] [money] NOT NULL,
	[weight] [float] NOT NULL,
	[date] [date] NOT NULL,
	[registered_by] [int] NOT NULL,
 CONSTRAINT [PK_Raw_materials] PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer_buys]  WITH CHECK ADD  CONSTRAINT [FK_Customer_buys_Customers] FOREIGN KEY([CID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Customer_buys] CHECK CONSTRAINT [FK_Customer_buys_Customers]
GO
ALTER TABLE [dbo].[Customer_buys]  WITH CHECK ADD  CONSTRAINT [FK_Customer_buys_Finished_goods] FOREIGN KEY([FGID])
REFERENCES [dbo].[Finished_goods] ([id])
GO
ALTER TABLE [dbo].[Customer_buys] CHECK CONSTRAINT [FK_Customer_buys_Finished_goods]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Finished_goods]  WITH CHECK ADD  CONSTRAINT [FK_Finished_goods_Employee] FOREIGN KEY([Registered_by])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Finished_goods] CHECK CONSTRAINT [FK_Finished_goods_Employee]
GO
ALTER TABLE [dbo].[Finished_goods]  WITH CHECK ADD  CONSTRAINT [FK_Finished_goods_Raw_materials] FOREIGN KEY([Stock_ID])
REFERENCES [dbo].[Raw_materials] ([stock_id])
GO
ALTER TABLE [dbo].[Finished_goods] CHECK CONSTRAINT [FK_Finished_goods_Raw_materials]
GO
ALTER TABLE [dbo].[Raw_material_withdrawal]  WITH CHECK ADD  CONSTRAINT [FK_Raw_material_withdrawal_Employee] FOREIGN KEY([EID])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Raw_material_withdrawal] CHECK CONSTRAINT [FK_Raw_material_withdrawal_Employee]
GO
ALTER TABLE [dbo].[Raw_material_withdrawal]  WITH CHECK ADD  CONSTRAINT [FK_Raw_material_withdrawal_Raw_materials] FOREIGN KEY([RMID])
REFERENCES [dbo].[Raw_materials] ([stock_id])
GO
ALTER TABLE [dbo].[Raw_material_withdrawal] CHECK CONSTRAINT [FK_Raw_material_withdrawal_Raw_materials]
GO
ALTER TABLE [dbo].[Raw_materials]  WITH CHECK ADD  CONSTRAINT [FK_Raw_materials_Employee] FOREIGN KEY([registered_by])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Raw_materials] CHECK CONSTRAINT [FK_Raw_materials_Employee]
GO
/****** Object:  StoredProcedure [dbo].[spCreateCustomer]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tsion Assefa
-- Create date: 07/07/2022
-- Description:	Creates a new customer in the database
-- =============================================
CREATE PROCEDURE [dbo].[spCreateCustomer] 
		@firstName varchar(50),
		@lastName varchar(50),
		@phoneNumber varchar(12),
		@new_identity int output
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT into dbo.Customers (First_name,Last_name,Phone_number)
	values (@firstName,@lastName,@phoneNumber);

	SELECT @new_identity = SCOPE_IDENTITY();
	SELECT @new_identity AS id;
	
	RETURN 
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateEmployee]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsion Assefa>
-- Create date: <08/07/2022>
-- Description:	creates new Employee and returns id
-- =============================================
CREATE PROCEDURE [dbo].[spCreateEmployee]
	@firstName varchar(50),
	@lastName varchar(50),
	@email varchar(200),
	@password nchar(60),
	@departmentID int,
	@new_identity int output
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO dbo.Employee (First_name,Last_name,email,password,departmentID)
	VALUES (@firstName,@lastName,@email,@password,@departmentID)

	SELECT @new_identity = SCOPE_IDENTITY()

    SELECT @new_identity AS id
END
GO
/****** Object:  StoredProcedure [dbo].[spCreateFinishedGoods]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsion Assefa>
-- Create date: <07/06/2022>
-- Description:	creates finished goods
-- =============================================
CREATE PROCEDURE [dbo].[spCreateFinishedGoods] 
	@productName varchar(100),
	@productCode varchar(50),
	@stockId int,
	@category varchar(50),
	@total_price money,
	@registeredBy int,
	@new_identity INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	insert into dbo.Finished_goods(Stocked_date,Product_name,Product_code,Stock_ID,Category,Total_price,Date,Registered_by)
	values (GETDATE(),@productName,@productCode,@stockId,@category,@total_price,GETDATE(),@registeredBy);

	 SELECT @new_identity = SCOPE_IDENTITY()

    SELECT @new_identity AS id

    RETURN                      

END
GO
/****** Object:  StoredProcedure [dbo].[spCreateRawMaterials]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsion Assefa>
-- Create date: <07/06/2022>
-- Description:	creates finished goods
-- =============================================
CREATE PROCEDURE [dbo].[spCreateRawMaterials] 
	@name varchar(100),
	@materialCode varchar(100),
	@packet int,
	@totalPacket int,
	@price money,
	@totalPrice money,
	@weight float,
	@registeredBy int,
	@new_identity INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	insert into dbo.Raw_materials(name,material_code,packet,total_packet,price,Total_price,weight,Date,Registered_by)
	values (@name,@materialCode,@packet,@totalPacket,@price,@totalPrice,@weight,GETDATE(),@registeredBy);

	 SELECT @new_identity = SCOPE_IDENTITY()

    SELECT @new_identity AS id

    RETURN                      

END
GO
/****** Object:  StoredProcedure [dbo].[spCustomerTransaction]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsion Assefa>
-- Create date: <07/07/2022>
-- Description:	recieves id of customer and returns transactions
-- =============================================
CREATE PROCEDURE [dbo].[spCustomerTransaction] 
	@customerID int
AS
BEGIN
	SET NOCOUNT ON;
	select dbo.Customers.First_name, dbo.Customers.Last_name, dbo.Finished_goods.Product_name, dbo.Finished_goods.Category, dbo.Customer_buys.Date, 
	dbo.Customer_buys.Payment_status, dbo.Customer_buys.Total_Amount
	from dbo.Customer_buys
	INNER JOIN dbo.Finished_goods ON dbo.Finished_goods.id= dbo.Customer_buys.FGID
	INNER JOIN dbo.Customers ON dbo.Customers.id= dbo.Customer_buys.CID
	WHERE dbo.Customer_buys.CID = @customerID
	ORDER BY dbo.Customer_buys.Date DESC;
    RETURN                      

END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployeeByName]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsion Assefa>
-- Create date: <08/07/2022>
-- Description:	gets name and searches employees with similar
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployeeByName] 
	@name varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	select dbo.Employee.id,dbo.Employee.First_name,dbo.Employee.Last_name,dbo.Employee.email,
	dbo.Department.Name AS Department_Name
	from dbo.Employee
	INNER JOIN dbo.Department ON dbo.Department.id= dbo.Employee.departmentID
	WHERE dbo.Employee.First_name LIKE '%'+@name+'%'
	RETURN                      

END
GO
/****** Object:  StoredProcedure [dbo].[spGetEmployees]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tsion Assefa>
-- Create date: <07/07/2022>
-- Description:	recieves id of customer and returns transactions
-- =============================================
CREATE PROCEDURE [dbo].[spGetEmployees] 
AS
BEGIN
	SET NOCOUNT ON;
	select dbo.Employee.id,dbo.Employee.First_name,dbo.Employee.Last_name,dbo.Employee.email,
	dbo.Department.Name AS Department_Name
	from dbo.Employee
	INNER JOIN dbo.Department ON dbo.Department.id= dbo.Employee.departmentID
    RETURN                      

END
GO
/****** Object:  StoredProcedure [dbo].[spRawmaterialWithdrawal]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tsion Assefa
-- Create date: 07/07/2022
-- Description:	reports withdrawal of raw materials and deducts the material from the database
-- =============================================
CREATE PROCEDURE [dbo].[spRawmaterialWithdrawal] 
		@rmid int,
		@eid int,
		@amount int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT into dbo.Raw_material_withdrawal(RMID,EID,Date,Total_amount)
	values (@rmid,@eid,GETDATE(),@amount);

	UPDATE dbo.Raw_materials
	SET total_packet= total_packet-@amount
	WHERE stock_id=@rmid;

	SELECT * from dbo.Raw_materials where stock_id=@rmid
END
GO
/****** Object:  StoredProcedure [dbo].[spWithdrawalReportByDate]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tsion Assefa
-- Create date: 07/08/2022
-- Description:	returns raw material withdrawal by date
-- =============================================
CREATE PROCEDURE [dbo].[spWithdrawalReportByDate]
	@date DATE
AS
BEGIN
	SET NOCOUNT ON;

	select dbo.Raw_materials.name,dbo.Raw_materials.material_code,dbo.Employee.First_name,DAY(dbo.Raw_material_withdrawal.Date) AS Day, 
	dbo.Raw_material_withdrawal.Total_amount
	from dbo.Raw_material_withdrawal
	INNER JOIN dbo.Raw_materials ON dbo.Raw_materials.stock_id=dbo.Raw_material_withdrawal.RMID
	INNER JOIN dbo.Employee ON dbo.Employee.id=dbo.Raw_material_withdrawal.EID
	WHERE MONTH(dbo.Raw_material_withdrawal.Date)=MONTH(@date);
END
GO
/****** Object:  StoredProcedure [dbo].[spWithdrawalReportByEmployeeID]    Script Date: 21-Jul-22 9:33:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tsion Assefa
-- Create date: 07/08/2022
-- Description:	returns raw material withdrawal by date
-- =============================================
CREATE PROCEDURE [dbo].[spWithdrawalReportByEmployeeID]
	@employeeID int
AS
BEGIN
	SET NOCOUNT ON;

	select dbo.Raw_materials.name,dbo.Raw_materials.material_code,dbo.Employee.First_name,DAY(dbo.Raw_material_withdrawal.Date) AS DAY, 
	dbo.Raw_material_withdrawal.Total_amount
	from dbo.Raw_material_withdrawal
	INNER JOIN dbo.Raw_materials ON dbo.Raw_materials.stock_id=dbo.Raw_material_withdrawal.RMID
	INNER JOIN dbo.Employee ON dbo.Employee.id=dbo.Raw_material_withdrawal.EID
	WHERE dbo.Raw_material_withdrawal.EID=@employeeID
END
GO
USE [master]
GO
ALTER DATABASE [property_management] SET  READ_WRITE 
GO
