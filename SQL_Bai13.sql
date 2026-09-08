--VD1 lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20;

--VD2 Lấy danh sách các đơn đặt hàng được trong khoảng thời gian từ ngày 1996-07-01 đến 1996-07-31
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'
ORDER BY OrderDate ASC;

--VD3 Tính tổng số tiền vận chuyển (Freight) của các đơn đặt hàng được đặt trong khoảng thời gian từ 1996-07-01 đến 1996-07-31
SELECT SUM(Freight) AS "Tổng số tiền vận chuyển"
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'

--BT1 Lấy danh sách các đơn đặt hàng có ngày đặt hàng trong khoảng từ ngay 1/1/1997 đến ngày 31/12/1997
--và được vận chuyển bằng đường tày thủy  (Shipvia =3)
SELECT *
FROM Orders
WHERE (OrderDate BETWEEN '1997-1-1' AND '1997-12-31') AND ShipVia = 3;

--Viết câu lệnh SQL lấy ra top 5 sản phẩm (Products) theo thứ tự tồn kho (UnitsInStock) 
--từ giảm dần với điều kiện có CategoryID khác 2 và giá sản phẩm nằm trong khoảng từ 5 – 50$.  
SELECT TOP 5 ProductName
FROM Products
WHERE CategoryID <> 2 AND UnitPrice BETWEEN 5 AND 50
ORDER BY UnitsInStock  DESC;

--Viết câu lệnh SQL để lấy ra chi tiết đơn hàng (bảng Order Details) với điều kiện OrderID nằm giữa (10319 – 10331), 
--có số lượng (Quantity) từ 15 – 50 và sắp xếp theo thứ tự tăng dần cho giá đơn (UnitPrice).
SELECT *
FROM [Order Details]
WHERE (OrderID BETWEEN 10319 AND 10331) AND (Quantity BETWEEN 15 AND 50)
ORDER BY UnitPrice ASC;

--Thử thách 1: Viết câu lệnh SQL liệt kê họ và tên nhân viên,
-- chỉ sống ở London,
--có ngày tháng năm sinh từ đến 1/1/1952 đến 31/12/1963 
--hoặc ngày tuyển từ 1/2/1992 đến 31/12/1993
-- chỉ lấy 3 nhân viên đầu tiên sắp xếp theo [LastName] A-Z.
SELECT TOP 3 *
FROM Employees
WHERE [City] = 'London' AND 
		(BirthDate BETWEEN '1952-1-1' AND '1963-12-31' OR
		HireDate BETWEEN '1992-2-1' AND '1993-12-31') 
ORDER BY LastName ASC;

--Thử thách 2: Viết câu lệnh SQL liệt kê các đơn hàng, 
-- [OrderDate] từ 01-07-1996 đến 01-09-1996
-- [OrderID] từ 10000 đến 10250
--Sắp xếp theo [ShipName] Z-A.
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-09-01' AND OrderID BETWEEN 10000 AND 10250
ORDER BY ShipName DESC