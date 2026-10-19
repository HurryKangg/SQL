CREATE DATABASE QuanLyDonVi
USE QuanLyDonVi

CREATE TABLE DONVI(
	MADV VARCHAR(20),
	TENDV NVARCHAR(100) NOT NULL,
	MALOAI NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_MADV PRIMARY KEY(MADV)
);

CREATE TABLE NGACH_LG(
	NGACH VARCHAR(20),
	TENNGACH NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_NGACH PRIMARY KEY(NGACH)
);

CREATE TABLE BAC_LG(
	NGACH VARCHAR(20),
	BAC VARCHAR(20),
	HESO INT NOT NULL,
	CONSTRAINT PK_BAC_LG PRIMARY KEY(NGACH,BAC),
	CONSTRAINT FK_NGACH_BAC FOREIGN KEY(NGACH) REFERENCES NGACH_LG(NGACH)
);

CREATE TABLE CCVC(
	MADV VARCHAR(20),
	MACC VARCHAR(20),
	HOTEN NVARCHAR(100) NOT NULL,
	PHAI NVARCHAR(10) NOT NULL,
	NGAYSINH DATE NOT NULL,
	NGACH VARCHAR(20),
	BAC VARCHAR(20),
	NGAY_XEPLUONG DATE NOT NULL,
	CONSTRAINT PK_CCVC PRIMARY KEY(MADV, MACC),
	CONSTRAINT FK_MADV_CCVC FOREIGN KEY(MADV) REFERENCES DONVI(MADV),
	CONSTRAINT FK_CCVC FOREIGN KEY(NGACH,BAC) REFERENCES BAC_LG(NGACH,BAC)
);
SELECT * FROM DONVI
SELECT * FROM NGACH_LG
SELECT * FROM BAC_LG
SELECT * FROM CCVC
-- 1. Danh mục Đơn Vị (DONVI)
INSERT INTO DONVI (MADV, TENDV, MALOAI) VALUES
('DV01', N'Phòng Hành chính - Tổng hợp', N'Hành chính'),
('DV02', N'Phòng Tổ chức Cán bộ', N'Hành chính'),
('DV03', N'Phòng Tài chính - Kế toán', N'Sự nghiệp'),
('DV04', N'Trung tâm Công nghệ Thông tin', N'Sự nghiệp'),
('DV05', N'Ban Quản lý Dự án Đầu tư', N'Dự án');

-- 2. Danh mục Ngạch Lương (NGACH_LG)
INSERT INTO NGACH_LG (NGACH, TENNGACH) VALUES
('01.001', N'Chuyên viên cao cấp'),
('01.002', N'Chuyên viên chính'),
('01.003', N'Chuyên viên'),
('01.004', N'Cán sự');

-- 3. Danh mục Bậc Lương (BAC_LG)
INSERT INTO BAC_LG (NGACH, BAC, HESO) VALUES
-- Ngạch Chuyên viên cao cấp (01.001)
('01.001', 'B1', 6),
('01.001', 'B2', 7),
('01.001', 'B3', 8),

-- Ngạch Chuyên viên chính (01.002)
('01.002', 'B1', 4),
('01.002', 'B2', 5),
('01.002', 'B3', 6),

-- Ngạch Chuyên viên (01.003)
('01.003', 'B1', 2),
('01.003', 'B2', 3),
('01.003', 'B3', 4),

-- Ngạch Cán sự (01.004)
('01.004', 'B1', 1),
('01.004', 'B2', 2),
('01.004', 'B3', 3);

-- 4. Danh sách 20 Công chức, Viên chức (CCVC)
INSERT INTO CCVC (MADV, MACC, HOTEN, PHAI, NGAYSINH, NGACH, BAC, NGAY_XEPLUONG) VALUES
('DV01', 'CC001', N'Nguyễn Văn An', N'Nam', '1978-05-12', '01.001', 'B2', '2020-06-01'),
('DV01', 'CC002', N'Trần Thị Mai', N'Nữ', '1985-08-20', '01.002', 'B3', '2021-01-15'),
('DV01', 'CC003', N'Lê Hoàng Long', N'Nam', '1992-11-03', '01.003', 'B2', '2022-09-01'),
('DV01', 'CC004', N'Phạm Minh Châu', N'Nữ', '1996-03-25', '01.004', 'B1', '2023-03-10'),

('DV02', 'CC005', N'Võ Quốc Bảo', N'Nam', '1980-09-17', '01.001', 'B1', '2019-12-01'),
('DV02', 'CC006', N'Đặng Gia Huy', N'Nam', '1988-04-14', '01.002', 'B2', '2021-08-01'),
('DV02', 'CC007', N'Bùi Phương Thảo', N'Nữ', '1994-07-29', '01.003', 'B1', '2022-10-15'),
('DV02', 'CC008', N'Đỗ Tuấn Kiệt', N'Nam', '1998-01-08', '01.004', 'B2', '2024-02-01'),

('DV03', 'CC009', N'Hồ Khánh Linh', N'Nữ', '1982-10-19', '01.001', 'B3', '2018-05-01'),
('DV03', 'CC010', N'Trịnh Quang Hưng', N'Nam', '1989-02-22', '01.002', 'B1', '2020-11-15'),
('DV03', 'CC011', N'Ngô Mỹ Duyên', N'Nữ', '1995-12-04', '01.003', 'B2', '2023-07-01'),
('DV03', 'CC012', N'Lý Vĩnh Phát', N'Nam', '1999-06-18', '01.004', 'B1', '2024-04-10'),

('DV04', 'CC013', N'Dương Thùy Trang', N'Nữ', '1986-03-11', '01.002', 'B3', '2019-09-01'),
('DV04', 'CC014', N'Phan Thanh Tùng', N'Nam', '1991-08-30', '01.003', 'B3', '2021-04-15'),
('DV04', 'CC015', N'Vũ Ngọc Ánh', N'Nữ', '1997-05-16', '01.003', 'B1', '2023-10-01'),
('DV04', 'CC016', N'Lâm Minh Khang', N'Nam', '1995-09-24', '01.004', 'B2', '2022-03-15'),

('DV05', 'CC017', N'Mai Trúc Quỳnh', N'Nữ', '1983-01-07', '01.001', 'B2', '2020-04-01'),
('DV05', 'CC018', N'Đinh Hữu Phước', N'Nam', '1987-11-12', '01.002', 'B2', '2021-12-01'),
('DV05', 'CC019', N'Cao Bích Hạnh', N'Nữ', '1993-04-28', '01.003', 'B2', '2022-06-15'),
('DV05', 'CC020', N'Trần Đình Trọng', N'Nam', '1996-10-05', '01.004', 'B3', '2023-08-20');