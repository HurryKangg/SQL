--Nhỏ nhất -> SELECT MIN(..)
--Lớn nhất -> SELECT MAX(..)
--SELECCT chỉ lấy 1 cột
--VD1
SELECT MIN(ProductID) AS "Giá trị nhỏ PRICE"
FROM Products;

--VD2 Viết câu lệnh lấy ra ngày đặt hàng gần đây nhất
SELECT MAX(OrderDate) AS "MinOrderDate"
FROM Orders;

--VD3 Viết câu lệnh SQL tìm ra sản phẩm(Lấy mã và tên sản phẩm) có số lượng hàng tốt kho (UnitslnStock) lớn nhất
SELECT MAX([UnitsInStock]) AS "Số lượng hàng"
FROM Products;

--BT1
SELECT Min(BirthDate) AS "Tuổi Đời Lớn Nhất"
FROM Employees;