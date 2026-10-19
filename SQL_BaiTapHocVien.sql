CREATE DATABASE QLHocVien
USE QLHocVien

CREATE TABLE KHOA(
	MaKhoa VARCHAR(20),
	TenKhoa NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_MaKhoa PRIMARY KEY(MaKhoa)
);

CREATE TABLE LOP(
	MaLop VARCHAR(20),
	TenLop NVARCHAR(100) NOT NULL,
	MaKhoa VARCHAR(20),
	CONSTRAINT PK_MaLop PRIMARY KEY(MaLop),
	CONSTRAINT FK_MaKhoa_Lop FOREIGN KEY(MaKhoa) REFERENCES KHOA(MaKhoa)
);

CREATE TABLE SINHVIEN(
	MaSV VARCHAR(20),
	HoTen NVARCHAR(100),
	NgaySinh DATE NOT NULL,
	Phai NVARCHAR(50) NOT NULL,
	MaLop VARCHAR(20),
	CONSTRAINT PK_MaSV PRIMARY KEY(MaSV),
	CONSTRAINT FK_MaLop_SV FOREIGN KEY(MaLop) REFERENCES LOP(MaLop)
);

CREATE TABLE MONHOC(
	MaMH VARCHAR(20),
	TenMH NVARCHAR(100) NOT NULL,
	SoTC INT NOT NULL,
	CONSTRAINT PK_MaMH PRIMARY KEY(MaMH)
);

CREATE TABLE DIEM(
	MaSV VARCHAR(20),
	MaMH VARCHAR(20),
	Diem DECIMAL(4, 2) NOT NULL,
	CONSTRAINT PK_DIEM PRIMARY KEY(MaSV, MaMH),
	CONSTRAINT FK_MaSV_DIEM FOREIGN KEY(MaSV) REFERENCES SINHVIEN(MaSV),
	CONSTRAINT FK_MaMH_DIEM FOREIGN KEY(MaMH) REFERENCES MONHOC(MaMH)
);

SELECT * FROM KHOA
SELECT * FROM LOP
SELECT * FROM SINHVIEN
SELECT * FROM MONHOC
SELECT * FROM DIEM

DELETE FROM DIEM;
DELETE FROM SINHVIEN;
DELETE FROM LOP;
DELETE FROM MONHOC;
DELETE FROM KHOA;

INSERT INTO KHOA (MaKhoa, TenKhoa) VALUES
('K01', N'Công nghệ thông tin'),
('K02', N'Kinh tế'),
('K03', N'Ngoại ngữ'),
('K04', N'Quản trị kinh doanh'),
('K05', N'Kế toán'),
('K06', N'Luật');

INSERT INTO LOP (MaLop, TenLop, MaKhoa) VALUES
-- K01 - CNTT (7 lớp)
('L01', N'CNTT K1',              'K01'),
('L02', N'CNTT K2',              'K01'),
('L07', N'CNTT K3',              'K01'),
('L08', N'CNTT K4',              'K01'),
('L09', N'CNTT K5',              'K01'),
('L10', N'CNTT K6',              'K01'),
('L11', N'CNTT Chất lượng cao',  'K01'),
-- K02 - Kinh tế (6 lớp)
('L03', N'Kinh tế K1',           'K02'),
('L04', N'Kinh tế K2',           'K02'),
('L12', N'Kinh tế K3',           'K02'),
('L13', N'Kinh tế K4',           'K02'),
('L14', N'Kinh tế đối ngoại',    'K02'),
('L15', N'Kinh tế quốc tế',      'K02'),
-- K03 - Ngoại ngữ (5 lớp)
('L05', N'Anh văn K1',           'K03'),
('L06', N'Anh văn K2',           'K03'),
('L16', N'Anh văn K3',           'K03'),
('L17', N'Nhật văn K1',          'K03'),
('L18', N'Hàn văn K1',           'K03'),
-- K04 - QTKD (2 lớp)
('L19', N'QTKD K1',              'K04'),
('L20', N'QTKD K2',              'K04'),
-- K05 - Kế toán (2 lớp)
('L21', N'Kế toán K1',           'K05'),
('L22', N'Kế toán K2',           'K05'),
-- K06 - Luật (1 lớp)
('L23', N'Luật K1',              'K06');

INSERT INTO MONHOC (MaMH, TenMH, SoTC) VALUES
('MH01', N'Lập trình C#',        3),
('MH02', N'Cơ sở dữ liệu',       3),
('MH03', N'Toán cao cấp',        4),
('MH04', N'Kinh tế vi mô',       3),
('MH05', N'Tiếng Anh giao tiếp', 2),
('MH06', N'Xác suất thống kê',   3);

INSERT INTO SINHVIEN (MaSV, HoTen, NgaySinh, Phai, MaLop) VALUES
-- Lớp L01
('SV001', N'Nguyễn Văn An',     '2004-01-15', N'Nam', 'L01'),
('SV002', N'Trần Thị Bình',     '2004-03-22', N'Nữ',  'L01'),
('SV003', N'Lê Hoàng Cường',    '2004-05-10', N'Nam', 'L01'),
('SV004', N'Phạm Thị Dung',     '2004-07-08', N'Nữ',  'L01'),
('SV005', N'Hoàng Văn Em',      '2004-09-19', N'Nam', 'L01'),
-- Lớp L02
('SV006', N'Vũ Thị Phương',     '2004-02-14', N'Nữ',  'L02'),
('SV007', N'Đặng Minh Quân',    '2004-04-30', N'Nam', 'L02'),
('SV008', N'Bùi Thị Hoa',       '2004-06-25', N'Nữ',  'L02'),
('SV009', N'Ngô Văn Hùng',      '2004-08-12', N'Nam', 'L02'),
('SV010', N'Đỗ Thị Lan',        '2004-10-05', N'Nữ',  'L02'),
-- Lớp L03
('SV011', N'Trịnh Văn Minh',    '2004-01-20', N'Nam', 'L03'),
('SV012', N'Lý Thị Ngọc',       '2004-03-18', N'Nữ',  'L03'),
('SV013', N'Phan Văn Phúc',     '2004-05-27', N'Nam', 'L03'),
-- Lớp L04
('SV014', N'Dương Thị Quỳnh',   '2004-07-14', N'Nữ',  'L04'),
('SV015', N'Cao Văn Sơn',       '2004-09-02', N'Nam', 'L04'),
('SV016', N'Mai Thị Trang',     '2004-11-11', N'Nữ',  'L04'),
-- Lớp L05
('SV017', N'Lâm Văn Tuấn',      '2004-02-28', N'Nam', 'L05'),
('SV018', N'Tạ Thị Uyên',       '2004-04-16', N'Nữ',  'L05'),
-- Lớp L06
('SV019', N'Chu Văn Vinh',      '2004-06-09', N'Nam', 'L06'),
('SV020', N'Hoàng Thị Yến',     '2004-08-21', N'Nữ',  'L06'),
-- Lớp L07
('SV021', N'Bùi Văn An',        '2004-01-05', N'Nam', 'L07'),
('SV022', N'Nguyễn Thị Bích',   '2004-02-14', N'Nữ',  'L07'),
-- Lớp L08
('SV023', N'Trần Văn Cảnh',     '2004-03-20', N'Nam', 'L08'),
('SV024', N'Lê Thị Diệp',       '2004-04-25', N'Nữ',  'L08'),
-- Lớp L09
('SV025', N'Phạm Văn Đạt',      '2004-05-30', N'Nam', 'L09'),
-- Lớp L10
('SV026', N'Hoàng Thị Én',      '2004-06-12', N'Nữ',  'L10'),
-- Lớp L11
('SV027', N'Vũ Văn Giang',      '2004-07-18', N'Nam', 'L11'),
('SV028', N'Đặng Thị Hạnh',     '2004-08-22', N'Nữ',  'L11'),
-- Lớp L12
('SV029', N'Bùi Văn Ích',       '2004-09-09', N'Nam', 'L12'),
-- Lớp L13
('SV030', N'Ngô Thị Kim',       '2004-10-15', N'Nữ',  'L13'),
-- Lớp L14
('SV031', N'Đỗ Văn Long',       '2004-11-20', N'Nam', 'L14'),
-- Lớp L15
('SV032', N'Trịnh Thị Mai',     '2004-12-25', N'Nữ',  'L15'),
-- Lớp L16
('SV033', N'Lý Văn Nam',        '2004-01-30', N'Nam', 'L16'),
-- Lớp L17
('SV034', N'Phan Thị Oanh',     '2004-02-05', N'Nữ',  'L17'),
-- Lớp L18
('SV035', N'Dương Văn Phú',     '2004-03-10', N'Nam', 'L18'),
-- Lớp L19
('SV036', N'Cao Thị Quyên',     '2004-04-15', N'Nữ',  'L19'),
-- Lớp L20
('SV037', N'Mai Văn Rạng',      '2004-05-20', N'Nam', 'L20'),
-- Lớp L21
('SV038', N'Lâm Thị Sen',       '2004-06-25', N'Nữ',  'L21'),
-- Lớp L22
('SV039', N'Tạ Văn Tài',        '2004-07-30', N'Nam', 'L22'),
-- Lớp L23
('SV040', N'Chu Thị Uyên',      '2004-08-04', N'Nữ',  'L23');

-- ===== Điểm cơ bản cho 20 SV đầu =====
INSERT INTO DIEM (MaSV, MaMH, Diem) VALUES
('SV001', 'MH01', 8.5), ('SV001', 'MH02', 7.0), ('SV001', 'MH03', 9.0),
('SV002', 'MH01', 7.5), ('SV002', 'MH02', 8.0), ('SV002', 'MH03', 6.5),
('SV003', 'MH01', 9.0), ('SV003', 'MH02', 8.5), ('SV003', 'MH03', 8.0),
('SV004', 'MH01', 6.5), ('SV004', 'MH02', 7.0), ('SV004', 'MH03', 7.5),
('SV005', 'MH01', 8.0), ('SV005', 'MH02', 9.0), ('SV005', 'MH03', 7.0),
('SV006', 'MH01', 7.0), ('SV006', 'MH02', 6.5), ('SV006', 'MH04', 8.0),
('SV007', 'MH01', 8.5), ('SV007', 'MH02', 7.5), ('SV007', 'MH04', 7.0),
('SV008', 'MH01', 9.0), ('SV008', 'MH02', 8.0), ('SV008', 'MH04', 9.5),
('SV009', 'MH01', 6.0), ('SV009', 'MH02', 7.0), ('SV009', 'MH04', 6.5),
('SV010', 'MH01', 7.5), ('SV010', 'MH02', 8.5), ('SV010', 'MH04', 8.0),
('SV011', 'MH04', 8.0), ('SV011', 'MH05', 7.5),
('SV012', 'MH04', 7.5), ('SV012', 'MH05', 8.0),
('SV013', 'MH04', 9.0), ('SV013', 'MH05', 8.5),
('SV014', 'MH04', 6.5), ('SV014', 'MH05', 7.0),
('SV015', 'MH04', 8.5), ('SV015', 'MH05', 9.0),
('SV016', 'MH04', 7.0), ('SV016', 'MH05', 7.5),
('SV017', 'MH05', 9.0), ('SV017', 'MH03', 7.0),
('SV018', 'MH05', 8.0), ('SV018', 'MH03', 6.5),
('SV019', 'MH05', 7.5), ('SV019', 'MH03', 8.0),
('SV020', 'MH05', 8.5), ('SV020', 'MH03', 7.5);

-- ===== SV001 học thêm 2 môn để có 6 môn (test câu 14) =====
INSERT INTO DIEM (MaSV, MaMH, Diem) VALUES
('SV001', 'MH04', 7.5),
('SV001', 'MH05', 8.0),
('SV001', 'MH06', 8.5);

-- ===== MH01 có thêm 20 SV (test câu 18) =====
INSERT INTO DIEM (MaSV, MaMH, Diem) VALUES
('SV021', 'MH01', 7.0), ('SV022', 'MH01', 8.0),
('SV023', 'MH01', 7.5), ('SV024', 'MH01', 8.5),
('SV025', 'MH01', 9.0), ('SV026', 'MH01', 6.5),
('SV027', 'MH01', 7.0), ('SV028', 'MH01', 8.0),
('SV029', 'MH01', 7.5), ('SV030', 'MH01', 8.5),
('SV031', 'MH01', 9.0), ('SV032', 'MH01', 6.5),
('SV033', 'MH01', 7.0), ('SV034', 'MH01', 8.0),
('SV035', 'MH01', 7.5), ('SV036', 'MH01', 8.5),
('SV037', 'MH01', 9.0), ('SV038', 'MH01', 6.5),
('SV039', 'MH01', 7.0), ('SV040', 'MH01', 8.0);

--1
SELECT L.MaLop, L.TenLop, K.TenKhoa
FROM KHOA K, LOP L
WHERE  K.MaKhoa = L.MaKhoa AND K.TenKhoa = N'Công nghệ thông tin'
--2
SELECT S.MaSV, S.HoTen, S.Phai, L.MaLop
FROM SINHVIEN S, LOP L
WHERE Phai = N'Nam' AND S.MaLop = L.MaLop AND L.MaLop = 'L01'
--3
SELECT *
FROM SINHVIEN S, LOP L
WHERE S.MaLop = L.MaLop AND S.MaLop = 'L02'AND Phai = N'Nữ' 
--4
SELECT *
FROM SINHVIEN S, LOP L
WHERE Phai = N'Nam' AND L.TenLop = N'Kinh tế K1'
--5
SELECT S.MaSV, M.MaMH
FROM MONHOC M, SINHVIEN S
WHERE MaSV = 'SV001'
--6
SELECT M.MaMH, M.TenMH
FROM MONHOC M, SINHVIEN S
WHERE MaSV = 'SV001'
--7
SELECT * 
FROM SINHVIEN S, MONHOC M
WHERE M.MaMH = 'MH01'
--8
SELECT S.MaSV, S.HoTen
FROM SINHVIEN S, MONHOC M
WHERE M.MaMH = 'MH01'
--9
SELECT K.MaKhoa, K.TenKhoa, COUNT(L.MaLop) AS SL
FROM KHOA K, LOP L
WHERE K.MaKhoa = L.MaKhoa
GROUP BY K.MaKhoa, K.TenKhoa
--10
SELECT K.MaKhoa, K.TenKhoa, COUNT(*) AS SL
FROM KHOA K, LOP L
WHERE K.MaKhoa = L.MaKhoa 
GROUP BY K.MaKhoa, K.TenKhoa
HAVING COUNT(L.MaLop) > 5
--11 
SELECT TOP 1 K.MaKhoa, K.TenKhoa, COUNT(*) AS SL
FROM KHOA K, LOP L
WHERE K.MaKhoa = L.MaKhoa
GROUP BY K.MaKhoa, K.TenKhoa
ORDER BY SL DESC
--12
SELECT S.MaSV, COUNT(D.MaMH) AS SOMON
FROM SINHVIEN S, DIEM D, MONHOC M
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY S.MaSV
--13
SELECT S.MaSV,S.HoTen, COUNT(*) AS SOMON
FROM SINHVIEN S, DIEM D, MONHOC M
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY S.MaSV, S.HoTen
--14
SELECT S.MaSV,S.HoTen, COUNT(*) AS SOMON
FROM SINHVIEN S, DIEM D, MONHOC M
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY S.MaSV, S.HoTen
HAVING COUNT(*) > 5
--15
SELECT TOP 1 S.MaSV, S.HoTen, COUNT(*) AS SOMON
FROM SINHVIEN S, MONHOC M, DIEM D
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY S.MaSV, S.HoTen
ORDER BY SOMON DESC
--16 
SELECT M.MaMH, COUNT(*) AS SOMON
FROM MONHOC M, SINHVIEN S, DIEM D
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY M.MaMH
--17
SELECT M.MaMH, M.TenMH, COUNT(*) AS SLSV
FROM MONHOC M, SINHVIEN S, DIEM D
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY M.MaMH, M.TenMH
--18
SELECT M.MaMH, M.TenMH, COUNT(*) AS SLSV
FROM MONHOC M, SINHVIEN S, DIEM D
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY M.MaMH, M.TenMH
HAVING COUNT(*) >= 20
--19
SELECT TOP 1 M.MaMH, M.TenMH, COUNT(*) AS SLSV
FROM MONHOC M, SINHVIEN S, DIEM D
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY M.MaMH, M.TenMH
ORDER BY SLSV DESC
--20
SELECT M.MaMH, M.TenMH, COUNT(*) AS SLSV
FROM MONHOC M, SINHVIEN S, DIEM D
WHERE S.MaSV = D.MaSV AND M.MaMH = D.MaMH
GROUP BY M.MaMH, M.TenMH
HAVING COUNT(*) = NULL