--VD1 bạn hãy liệt kê tất cả các sản phẩm có số lượng trong kho (UnitsInStock) thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100
SELECT *
FROM Products
WHERE UnitsInStock < 50 OR UnitsInStock > 100

--VD2 Bạn hãy liệt kê tất cả các đơn hàng được giao đến Brazil, đã bị giao muộn, biết rằng ngày cần phải giao hàng là RequiredDate, ngày giao hàng thực tế là ShippedDate
SELECT *
FROM Orders
WHERE ShippedDate > RequiredDate AND ShipCountry = 'Brazil'

--VD3 Lấy ra tất cả các sản phẩm có giá dưới 100$ và mã thể loại khác 1
SELECT *
FROM Products
WHERE NOT UnitPrice >= 100 OR CategoryID = 1;

--BT1 hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50,100]
SELECT *
FROM Orders
WHERE Freight >= 50 OR Freight <= 100
--BT2 Hãy liệt kê các sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20 và số lượng hàng trong đơn hàng (UnitsOnOrders) nhỏ hơn 20
SELECT *
FROM Products
WHERE UnitsInStock > 20 AND UnitsOnOrder < 20;