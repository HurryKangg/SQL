--VD1 Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London
SELECT *
FROM [dbo].[Employees]
WHERE City = 'London';

--VD1 Bạn hãy liệt kê tất cả các nhân viên đến từ thành phố London
-- Sắp xếp kết quả theo lastname từ A-Z
SELECT *
FROM [dbo].[Employees]
WHERE City = 'London'
ORDER BY LastName ASC

--VD2 bạn hãy liệt kê tất cả các đơn hàng bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate
SELECT OrderID, RequiredDate, ShippedDate
FROM [dbo].[Orders]
WHERE ShippedDate > RequiredDate

--Đếm số lượng
SELECT  COUNT(*) AS "Số lượng đơn"
FROM [dbo].[Orders]
WHERE ShippedDate > RequiredDate

--VD3 Lấy tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10% (Discount > 0.1)
SELECT *
FROM [Order Details]
WHERE Discount > 0.1;

--BT1 hãy liệt kê tất cả các đơn hàng được gửi đến quốc gia France
SELECT *
FROM [dbo].[Orders]
WHERE ShipCountry = 'France';
--BT2 Hãy liệt kê các sản phẩm có số lượng trong kho lớn hơn 20
SELECT *
FROM [dbo].[Products]
WHERE UnitsInStock > 20
ORDER BY UnitsInStock;

--hãy liệt kê các sản phẩm có giá bán lớn hơn hoặc bằng 2 lần sản phẩm có giá bán nhỏ nhất. sau đó sắp xếp chúng theo thứ tự từ bé đến lớn.
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice >= 2*(SELECT MIN(UnitPrice) FROM Products)
ORDER BY UnitPrice ASC;

--Hãy liệt kê ra sản phẩm có lượng tồn kho lớn hơn 50
SELECT *, (UnitsInStock - UnitsOnOrder) AS "Tồn kho"
FROM Products
WHERE (UnitsInStock - UnitsOnOrder)  > 50;

--Hãy liệt kê ra nhân viên đến từ LONDON & sắp xếp thứ tự Last name từ A->Z
SELECT EmployeeID, LastName, FirstName, City, Country
FROM Employees
WHERE City = 'LONDON';

--Lấy ra các đơn hàng được giảm giá >20% trong bảng Order Details, và sắp xếp theo tăng dần theo OrderID.
SELECT *
FROM [dbo].[Order Details]
WHERE Discount > 0.2
ORDER BY OrderID ASC;