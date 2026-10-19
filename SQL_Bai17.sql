USE NORTHWND

--VD1 Lấy ra tất cả các đơn hàng chưa được giao
select *
from Orders
where (ShippedDate is NULL)

select COUNT(*) Sl
from Orders
where (ShippedDate is NULL)

--VD2 Lấy danh sách các khách hàng có khu vực (Region) không bị Null
select *
from Customers
where Region is not null

--VD3 Lấy danh sách các khách hàng không có tên công ty
select *
from Customers
where CompanyName is null

--BT1 Hãy lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vực giao hàng (ShipRegion) ko bị null
select *
from Orders
where ShippedDate is null and ShipRegion is not null

-- Thử thách 1: Hãy liệt kê tất cả các đơn hàng chưa được vận chuyển và
-- có giá vận chuyển lớn hơn 20 USD
select *
from Orders
where ShippedDate is null and Freight > 20

-- Thử thách 2: Liệt kê tất cả các nhà cung cấp mà không có số FAX và không có HomePage
select *
from Suppliers
where Fax is null and HomePage is null

-- Bài tập Challenge: Lấy ra tất cả những nhân viên có lãnh thổ bị NULL
select *
from Employees
where Region is null