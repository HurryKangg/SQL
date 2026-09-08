--Viết ra câu lệnh SQL lấy ra các tên quốc gia khác nhau
--SELECT DISTINT--
--VD1
SELECT DISTINCT Country
FROM [dbo].[Customers];

--VD2
SELECT DISTINCT PostalCode
FROM [dbo].[Suppliers]

--VD3
SELECT DISTINCT LastName, TitleOfCourtesy
FROM Employees;

SELECT DISTINCT TitleOfCourtesy, LastName 
FROM Employees;

--VD4
SELECT DISTINCT ShipVia
FROM [dbo].[Orders];