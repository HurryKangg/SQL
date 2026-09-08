--Câu lệnh AS viết câu lệnh SQl "Company"Và đặt tên thay thế là "Công ty"
--VD1
USE NORTHWND
SELECT CustomerID AS [Tên công ty],
		PostalCode AS "Mã bưu điện",
		City AS "Thành Phố"
FROM Customers;
--VD2
SELECT LastName AS "Họ",
		FirstName AS "Tên"
FROM Employees
--VD3 đặt bảng Orders thành "o"
SELECT TOP 15 "o".*
FROM Orders AS "o";

--BÀI TẬP Viết câu lệnh SQL thay thế tên: 
SELECT TOP 5 "p".
		ProductName AS "Tên Sản Phẩm",
		SupplierID AS "Mã nhà cung cấp",
		CategoryID AS "Mã thể loại"
FROM Products AS "p";