--VD1 Hãy lọc ra tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
SELECT *
FROM Customers
WHERE Country LIKE 'A%'

--VD2 Lấy danh sách các đơn đặt được gửi đến các thành phố có chứa chữ 'a'
SELECT *
FROM Orders
WHERE ShipCity LIKE '%a%';
--VD4 Hãy lọc ra tất cả các đơn hàng với điều:
--ShipCountry LIKE 'U_'
--ShipCountry LIKE 'U%'
SELECT *
FROM Orders
WHERE ShipCountry LIKE 'U_';

SELECT *
FROM Orders
WHERE ShipCountry LIKE 'U%';

--BT1 Hãy lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty
SELECT *
FROM Suppliers
WHERE CompanyName LIKE '%b%';

--Challenge1: Write an SQL statement to list employees fullname with the letter "e" in the last name 
--and born from 1952-01-01 to 1962-12-31, 
--arrange in A-Z order by first Name
--taking only the first 5 lines

SELECT TOP 5*, FirstName + ' ' + LastName AS "Full name"
FROM Employees
WHERE LastName LIKE '%e%' AND (BirthDate BETWEEN '1952-01-01' AND '1962-12-31') 
ORDER BY FirstName ASC

--Challenge 2: Write an SQL statement to list employees fullname with 'U__' (two underscores) in the [Country]
-- and start working from 1992-03-23 to 1994-12-31
-- agrange in Z-A order by the last name
--taking only the first 4 lines
SELECT TOP 4*, FirstName + ' ' + LastName AS "Full Name"
FROM Employees
WHERE Country LIKE 'U__' AND (HireDate BETWEEN '1992-03-23' AND '1994-12-31')
ORDER BY LastName ASC
-- Trong bảng products, hãy tìm ra các sản phẩm:
-- Có tên chứa chữ y trong đó
-- giá bán lớn hơn giá trung bình sản phẩm 
-- sắp xếp theo thứ tự giá bán từ nhỏ đến lớn
SELECT *
FROM Products
WHERE ProductName LIKE '%y%' AND UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice ASC;

-- trong bảng customer, tìm ra khách hàng:
-- Đến từ thành phố bắt đầu bnawgf chữ A
-- Đến từ nước MỸ
-- Sắp xếp theo tên từ Z-A
SELECT *
FROM Customers
WHERE City LIKE 'A%' AND Country = 'USA'
ORDER BY CompanyName DESC;

--Câu hỏi 1: hãy tìm những giá tiền của đơn hàng trong bảng OrderDetails
--có số 1 ở đầu và có số 8 ở bất kì đâu.
SELECT *
FROM [Order Details]
WHERE UnitPrice LIKE '1%8%'

--CHALLENGE
---Lấy lấy ra họ và tên nhân viên,[Title] ,[BirthDate], [HireDate], [City], [Region].
---Lọc ra các nhân viên "Sales Representative" hoặc là "Inside Sales Coordinator".
---Và lấy ra người có mật danh "Mr." hoặc đến từ "London" hoặc "Seattle".
---Lọc ra các nhân viên có chữ "a" hoặc (chữ "e" ở LastName và chữ "a" ở FirstName"  trong họ và tên.
---Sắp xếp A-Z theo LastName.

SELECT e.LastName AS "Họ",
		e.FirstName AS "Tên",
		e.LastName + ' ' + FirstName AS "Họ và Tên",
		e.Title AS "Tiêu đề",
		e.TitleOfCourtesy AS "Biệt Danh",
		e.BirthDate AS "Ngày sinh",
		e.HireDate AS "Ngày thuê",
		e.City AS "Thành phố",
		e.Region AS "Vùng/Miền"
FROM Employees AS e
WHERE e.Title = 'Sales Representative' OR e.Title = 'Inside Sales Coordinator'
		AND (e.TitleOfCourtesy = 'Mr.' OR (e.City = 'London' OR e.City = 'Seattle'))
		AND (e.LastName + ' ' + e.FirstName LIKE '%a' OR e.LastName + ' ' + e.FirstName LIKE '%e% %a%')
ORDER BY e.LastName ASC;