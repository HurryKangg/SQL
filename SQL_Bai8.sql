--Hãy đếm số lượng khách hàng trong bảng
--VD1
SELECT COUNT(*) AS "SỐ LƯỢNG KHÁCH HÀNG"
FROM [dbo].[Customers];

--C2
SELECT COUNT(CustomerID) AS "SỐ LƯỢNG KHÁCH HÀNG"
FROM [dbo].[Customers];

--VD2 Tính tổng số tiền vận chuyên của tất cả đơn hàng
SELECT SUM(Freight) AS "SUM ORDER"
FROM [dbo].[Orders]

--VD3 Tính trung bình số lượng đặt hàng của tất cả các phẩm trong bảng Order Detail
SELECT AVG(Quantity) AS "AVG Quantity"
FROM [dbo].[Order Details];

--VD4 Đếm số lượng, tính tổng số lượng hàng trong kho và trung bình các sản phẩm trong bảng Product
SELECT COUNT([UnitsInStock]) AS "Quantiy",
SUM([UnitsInStock]) AS "Sum", AVG([UnitPrice]) AS "AVG"
FROM [dbo].[Products]

--BT1 Hãy đếm số lượng đơn hàng từ bảng Orders
--Cách 1: Dùng*
--Cách 2: Dùng mã đơn hàng
SELECT COUNT(*) AS "Count Order"
FROM [dbo].[Orders]
SELECT COUNT(OrderID) AS "Count Order"
FROM [dbo].[Orders]

--BT2 Từ bảng Order Detail hãy tính trung bình cho cột unitprice, và tính tổng quantity
SELECT AVG(UnitPrice) AS "Trung bình",
		SUM(Quantity) AS "Tổng"
FROM [dbo].[Order Details]