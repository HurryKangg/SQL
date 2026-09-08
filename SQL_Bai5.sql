--SELECT TOP để lấy giá trị đầu tiên 
--VD1
USE NORTHWND
SELECT TOP 5 CustomerID
FROM Customers;

--VD2
SELECT TOP 30 percent *
FROM Employees;

--VD3 viết câu lệnh SQL lấy ra các mã khách hàng với quy định là mã khách hàng ko đc trùng lặp
SELECT DISTINCT TOP 5 CustomerID 
FROM[dbo].[Orders];

--Bài Tập viết câu lệnh SQL lấy ra các sản phẩm có mã thể loại ko bị trùng lập, và chỉ lấy ra 3 dòng đầu tiên.
SElECT DISTINCT TOP 3 [CategoryID]
FROM[dbo].[Products];