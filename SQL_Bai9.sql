--VD1 Bạn hãy liệt ke tất cả các nhà cung cấp theo thứ tụ tên đơn vị CompanyName
SELECT *
FROM [dbo].[Suppliers]
ORDER BY CompanyName ASC

--VD2 Bạn hãy liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
SELECT *
FROM [dbo].[Products]
ORDER BY UnitPrice DESC

--VD3 Bạn hãy liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm A-Z
SELECT *
FROM Employees
ORDER BY LastName, FirstName

--VD4 hãy lấy ra 1 sản phẩm có số lượng bán cao nhất từ bảng Order Details
SELECT *
FROM [Order Details]
ORDER BY Quantity DESC

SELECT TOP 1 *
FROM [Order Details]
ORDER BY Quantity DESC

--BT1 Hãy liệt kê danh sách các đơn hàng (OrderID) trong bảng Order theo thứ tự giảm dần của ngày đặt OrderTime
SELECT OrderID, OrderDate
FROM Orders
ORDER BY OrderDate DESC

--BT2 Hãy liệt kê tên, đơn giá, số lượng trong kho UnitsInStock của tất cả các sản phẩm trong bảng Products, thoe thứ tự giảm dần
SELECT ProductName, QuantityPerUnit, UnitsInStock
FROM [dbo].[Products]
ORDER BY UnitsInStock DESC
