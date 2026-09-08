--VD1 tính số lượng sản phẩm còn lại trong kho (UnitsInStock) sau khi bán hết các sản phẩm đã được đặt hàng
SELECT	*,
		(UnitsInStock - UnitsOnOrder) AS "StockRemaining"
FROM Products;

--VD2 Tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng OrderDetails
SELECT OrderID, ProductID,UnitPrice,Quantity, (UnitPrice * Quantity) AS "OrderDetailValue"
FROM [Order Details]

--VD3 Tính tỷ lệ giá vận chuyển đơn hàng (Freight) trung bình của các đơn hàng trong bảng Orders so với giá trị vận chuyển đơn hàng lớn nhất (MaxFreight)
SELECT (AVG(Freight) / MAX(Freight)) AS "FreightRaito"
FROM Orders

--BT1 Hãy liệt kê danh sách các sản phẩm, với giá (UnitPrice) của từng sản phẩm sẽ đc giảm đi 10%
--Cách 1: dùng phép nhân + phép chia
SELECT ProductName, UnitPrice, ((UnitPrice * 90) / 100) AS "AfterSale"
FROM Products
--Cách 2: Chỉ được dùng phép nhân
SELECT ProductName, UnitPrice, (UnitPrice * 0.9) AS "AfterSale"
FROM Products