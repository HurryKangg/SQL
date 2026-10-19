use NORTHWND

--VD1 lọc tên khách hàng liên hệ bắt đầu chữ A
SELECT * 
FROM Customers
WHERE ContactName LIKE 'A%'

--VD2 lọc tên khách hàng liên hệ bắt đầu chữ H, chữ số thứ 2 còn lại là ký tự bất kỳ
SELECT *
FROM Customers
WHERE ContactName LIKE 'H_%'

--VD3 Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ thứ hai là u hoặc o
SELECT *
FROM Orders
WHERE ShipCity LIKE 'L[uo]%'

--VD4 Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ thứ hai không là u hoặc o
SELECT CustomerID, ShipCity
FROM Orders
WHERE ShipCity LIKE 'L[^u,o]%'

--VD4 Hãy lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu là L, chữ thứ hai từ a đến e
SELECT CustomerID, ShipCity
FROM Orders
WHERE ShipCity LIKE 'L[a-u]%'

--BT1 Hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ A và không chứa ký tự b
SELECT *
FROM Suppliers s
WHERE s.CompanyName LIKE 'A[^b]%'
--BT2 Viết câu lệnh SQL tìm ra tất cả sản phẩm có tên (ProductName) bắt đầu bằng ký tự ‘S’ và ký tự thứ 2 
--là các ký tự từ (a – i), sau đó sắp xếp chúng theo thứ tự giảm dần về giá (UnitPrice).

SELECT *
FROM Products p
WHERE p.ProductName LIKE 'S[a-i]%'
ORDER BY p.UnitPrice DESC

--BT3 Trong bảng Employees, lấy ra tên các title, bắt đầu bằng 1 ký 
--tự bất kỳ và ký tự thứ 2 là chữ "u" và sắp xếp lại theo thứ tự từ lớn đến bé của cột EmployeeID.

SELECT *
FROM Employees e
WHERE e.LastName LIKE '_u%'
ORDER BY e.EmployeeID DESC