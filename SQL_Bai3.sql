USE NORTHWND
--Dùng lệnh SELECT và FROM--
SELECT [ProductName]
FROM [dbo].[Products];

--Viết câu lệnh SQL lấy ra tên sản phẩm,
--Giá bán trên mỗi đơn vị, số lượng sản phẩm trên đơn vị

SELECT[ProductName],[UnitPrice],[QuantityPerUnit]
FROM [dbo].[Products];

--Viết câu lênh SQL lấy ra tên công ty của khách hàng
--và quốc gia của các khách hàng đó

SELECT [CompanyName],[Country]
FROM[dbo].[Customers];

SELECT ContactName,Address
FROM Customers;

--Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng 

SELECT * 
FROM [dbo].[Order Details];

SELECT *
FROM [dbo].[Customers];