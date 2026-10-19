use NORTHWND

--VD1 Hãy lọc ra tất cả các đơn hàng với đk:
--a đơn hàng đc giao đến Germany, UK, Brazil
select *
from Orders
where ShipCountry in ('UK', 'Germany', 'Brazil')

--b đơn hàng đc giao đến các quốc gia khác Germany, UK, Brazil
select *
from Orders
where ShipCountry not in ('UK', 'Germany', 'Brazil')

--VD2 lấy ra các sản phẩm có mã thể loại khác 2,3,4
select *
from Products
where CategoryID not in (2,3,4)

--VD3 1 Hãy liệt kê các nhân viên ko phải là nữ 
--	  2 Hãy liệt kê các nhân viên là nữ 
select *
from Employees
where TitleOfCourtesy not in ('Ms.', 'Mrs')

select *
from Employees
where TitleOfCourtesy in ('Ms.', 'Mrs')

--BT1 Hãy lấy tất cả các khách hành đến tp 
-- Berlin, London, Warszawa
select *
from Customers
where City in ('Berlin', 'London', 'Warszawa')

--- Thử thách 1: Hãy liệt kê tất cả các đơn hàng được gửi đến 
--khách hàng trong ngày 1/1/1997 hoặc 2/1/1997
select *
from Orders
where ShippedDate in ('1997-1-1', '1997-1-2')

--Bài tập cho các bạn: Hãy liệt kê các đơn hàng giao tới các thành phố ở Anh và Đức
--, chỉ lọc ra cột Mã đơn hàng, mã khách hàng, địa chỉ giao, thành phố, quốc gia

select OrderID, CustomerID, ShipAddress, ShipCity, ShipCountry
from Orders
where ShipCountry in ('UK', 'Germany')