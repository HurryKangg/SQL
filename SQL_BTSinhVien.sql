CREATE DATABASE BT_QlSinhVien

USE BT_QlSinhVien

CREATE TABLE KHOA(
	MAKHOA VARCHAR(20) NOT NULL,
	TENKHOA NVARCHAR(100),
	CONSTRAINT PK_MAKHOA PRIMARY KEY (MAKHOA)
)

CREATE TABLE LOP(
	MALOP VARCHAR(20) NOT NULL,
	TENLOP NVARCHAR(100),
	MAKHOA VARCHAR(20),
	CONSTRAINT PK_MALOP PRIMARY KEY (MALOP),
	CONSTRAINT FK_LOP_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
)

CREATE TABLE SINHVIEN(
	MASV VARCHAR(20) NOT NULL,
	TENSV NVARCHAR(100),
	NGAYSINH DATE,
	PHAI NVARCHAR(5),
	MALOP VARCHAR(20),
	CONSTRAINT PK_MASV PRIMARY KEY(MASV),
	CONSTRAINT FK_SINHVIEN_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
)

CREATE TABLE MONHOC(
	MAMH VARCHAR(20) NOT NULL,
	TENMH NVARCHAR(100),
	SOTC INT,
	CONSTRAINT PK_MAMH PRIMARY KEY (MAMH)
)

CREATE TABLE KETQUA(
	MASV VARCHAR(20) NOT NULL,
	MAMH VARCHAR(20) NOT NULL,
	DIEM DECIMAL(4,2),
	CONSTRAINT PK_DIEM PRIMARY KEY (MASV, MAMH),
	CONSTRAINT FK_DIEM_SINHVIEN FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV),
	CONSTRAINT FK_DIEM_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH),
)

USE BT_QlSinhVien;

-- 1. NẠP DỮ LIỆU BẢNG KHOA
INSERT INTO KHOA (MAKHOA, TENKHOA) VALUES 
('K01', N'Công nghệ thông tin'),
('K02', N'Kinh tế'),
('K03', N'Cơ khí'),
('K04', N'Ngoại ngữ'),
('K05', N'Y học'),
('K06', N'Luật');

-- 2. NẠP DỮ LIỆU BẢNG LOP
-- Khoa K01 (CNTT) có nhiều lớp nhất (6 lớp) -> Để test câu 11 (Khoa nhiều lớp nhất)
INSERT INTO LOP (MALOP, TENLOP, MAKHOA) VALUES 
('L001', N'08 Đại học tin học', 'K01'),
('L002', N'09 Đại học tin học', 'K01'),
('L003', N'10 Đại học tin học', 'K01'),
('L004', N'11 Đại học tin học', 'K01'),
('L005', N'12 Đại học tin học', 'K01'),
('L006', N'13 Đại học tin học', 'K01'),

-- Khoa K02 (Kinh tế) có 5 lớp -> Không thỏa mãn câu 10 (trên 5 lớp)
('L007', N'08 Đại học Kinh tế', 'K02'),
('L008', N'09 Đại học Kinh tế', 'K02'),
('L009', N'10 Đại học Kinh tế', 'K02'),
('L010', N'11 Đại học Kinh tế', 'K02'),
('L011', N'12 Đại học Kinh tế', 'K02'),

-- Khoa K03 (Cơ khí) có 2 lớp
('L012', N'08 Đại học Cơ khí', 'K03'),
('L013', N'09 Đại học Cơ khí', 'K03'),

-- Khoa K04 (Ngoại ngữ) có 1 lớp
('L014', N'08 Đại học Ngoại ngữ', 'K04');

-- Lưu ý: Khoa K05 (Y học) và K06 (Luật) không có lớp nào -> Để test LEFT JOIN / truy vấn đếm bằng 0


-- 3. NẠP DỮ LIỆU BẢNG MONHOC
-- Có 22 môn học. Môn MH001 có 21 sinh viên học (để test câu 18 >= 20)
-- Môn MH022 không có sinh viên nào học (để test câu 20)
INSERT INTO MONHOC (MAMH, TENMH, SOTC) VALUES 
('MH001', N'Cơ sở dữ liệu', 3),
('MH002', N'Lập trình C', 3),
('MH003', N'Cấu trúc dữ liệu', 4),
('MH004', N'Mạng máy tính', 3),
('MH005', N'Trí tuệ nhân tạo', 3),
('MH006', N'Lập trình Java', 3),
('MH007', N'Phân tích thiết kế HTTT', 3),
('MH008', N'Kinh tế vĩ mô', 3),
('MH009', N'Kinh tế vi mô', 3),
('MH010', N'Nguyên lý kế toán', 3),
('MH011', N'Quản trị học', 3),
('MH012', N'Tiếng Anh giao tiếp', 3),
('MH013', N'Tiếng Anh chuyên ngành', 2),
('MH014', N'Tiếng Nhật sơ cấp', 4),
('MH015', N'Vẽ kỹ thuật', 3),
('MH016', N'Cơ học lý thuyết', 3),
('MH017', N'Vật liệu học', 2),
('MH018', N'Pháp luật đại cương', 2),
('MH019', N'Luật dân sự', 3),
('MH020', N'Giải phẫu', 4),
('MH021', N'Sinh lý học', 3),
('MH022', N'Đồ án tốt nghiệp', 5);


-- 4. NẠP DỮ LIỆU BẢNG SINHVIEN
-- Lớp L001 có SV 'sv001' (để test câu 5, 6)
INSERT INTO SINHVIEN (MASV, TENSV, NGAYSINH, PHAI, MALOP) VALUES 
('SV001', N'Nguyễn Văn An', '2000-01-01', N'Nam', 'L001'),
('SV002', N'Trần Thị Bích', '2000-02-02', N'Nữ', 'L001'),
('SV003', N'Lê Hoàng Cường', '2000-03-03', N'Nam', 'L001'),
('SV004', N'Phạm Thị Dung', '2000-04-04', N'Nữ', 'L002'),
('SV005', N'Hoàng Văn Em', '2000-05-05', N'Nam', 'L002'),
('SV006', N'Vũ Thị Giang', '2000-06-06', N'Nữ', 'L003'),
('SV007', N'Đặng Văn Hùng', '2000-07-07', N'Nam', 'L003'),
('SV008', N'Bùi Thị Inh', '2000-08-08', N'Nữ', 'L004'),
('SV009', N'Ngô Văn Khánh', '2000-09-09', N'Nam', 'L004'),
('SV010', N'Lý Thị Lan', '2000-10-10', N'Nữ', 'L005'),
('SV011', N'Trịnh Văn Minh', '2000-11-11', N'Nam', 'L005'),
('SV012', N'Phan Thị Ngọc', '2000-12-12', N'Nữ', 'L006'),
('SV013', N'Đỗ Văn Oanh', '2000-01-13', N'Nam', 'L006'),
('SV014', N'Lê Thị Phương', '2000-02-14', N'Nữ', 'L007'),
('SV015', N'Trần Văn Quân', '2000-03-15', N'Nam', 'L007'),
('SV016', N'Nguyễn Thị Rạng', '2000-04-16', N'Nữ', 'L008'),
('SV017', N'Vũ Văn Sơn', '2000-05-17', N'Nam', 'L008'),
('SV018', N'Hoàng Thị Thảo', '2000-06-18', N'Nữ', 'L009'),
('SV019', N'Phạm Văn Út', '2000-07-19', N'Nam', 'L009'),
('SV020', N'Đặng Thị Vân', '2000-08-20', N'Nữ', 'L010'),
('SV021', N'Bùi Văn Xuân', '2000-09-21', N'Nam', 'L010'),
('SV022', N'Ngô Thị Yến', '2000-10-22', N'Nữ', 'L011'),
('SV023', N'Lý Văn Zũ', '2000-11-23', N'Nam', 'L012'),
('SV024', N'Trịnh Thị Ánh', '2000-12-24', N'Nữ', 'L013'),
('SV025', N'Phan Văn Bình', '2000-01-25', N'Nam', 'L014'),
-- Thêm vài sinh viên nam lớp L001, nữ lớp L002 để test câu 2, 3
('SV026', N'Trần Nam 1', '2001-01-01', N'Nam', 'L001'),
('SV027', N'Trần Nữ 2', '2001-01-01', N'Nữ', 'L002'),
('SV028', N'Lê Nam 3', '2001-01-01', N'Nam', 'L001'),
('SV029', N'Lê Nữ 4', '2001-01-01', N'Nữ', 'L002');


-- 5. NẠP DỮ LIỆU BẢNG KETQUA
-- Để test câu 14, 15 (SV học > 5 môn), ta cho SV001 học 6 môn, các SV khác học ít hơn.
-- Để test câu 18 (Môn >= 20 SV), ta cho 21 SV học môn MH001.
-- Để test câu 19 (Môn nhiều SV nhất), MH001 có 21 SV, các môn khác ít hơn.

-- SV001 học 6 môn (MH001 đến MH006)
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV001', 'MH001', 8.5), ('SV001', 'MH002', 7.0), ('SV001', 'MH003', 9.0),
('SV001', 'MH004', 6.5), ('SV001', 'MH005', 8.0), ('SV001', 'MH006', 7.5);

-- SV002 học 3 môn
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV002', 'MH001', 7.0), ('SV002', 'MH002', 8.0), ('SV002', 'MH008', 6.0);

-- SV003 học 2 môn
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV003', 'MH001', 9.0), ('SV003', 'MH003', 8.5);

-- Các SV từ SV004 đến SV021 đều học môn MH001 (Tổng cộng 21 SV học MH001: SV001,2,3 + 18 SV còn lại)
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV004', 'MH001', 7.0), ('SV005', 'MH001', 8.0), ('SV006', 'MH001', 6.5),
('SV007', 'MH001', 7.5), ('SV008', 'MH001', 8.5), ('SV009', 'MH001', 9.0),
('SV010', 'MH001', 5.5), ('SV011', 'MH001', 6.0), ('SV012', 'MH001', 7.0),
('SV013', 'MH001', 8.0), ('SV014', 'MH001', 9.5), ('SV015', 'MH001', 4.0),
('SV016', 'MH001', 5.0), ('SV017', 'MH001', 6.5), ('SV018', 'MH001', 7.5),
('SV019', 'MH001', 8.0), ('SV020', 'MH001', 9.0), ('SV021', 'MH001', 3.5);

-- Nạp thêm vài kết quả cho các môn khác để test
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV022', 'MH008', 7.0), ('SV022', 'MH009', 8.0),
('SV023', 'MH015', 6.0), ('SV024', 'MH015', 7.0),
('SV025', 'MH012', 8.5), ('SV025', 'MH013', 9.0);

-- Lưu ý: Môn MH022 và các môn từ MH010, MH011, MH014, MH016-MH021 hiện không có ai học.

-- ==========================================
-- 1. THÊM LỚP CHO KHOA Y HỌC (K05) VÀ LUẬT (K06)
-- ==========================================
INSERT INTO LOP (MALOP, TENLOP, MAKHOA) VALUES 
('L015', N'08 Đại học Y khoa', 'K05'),
('L016', N'09 Đại học Y khoa', 'K05'),
('L017', N'08 Đại học Luật', 'K06');

-- ==========================================
-- 2. THÊM SINH VIÊN CHO 2 KHOA NÀY
-- ==========================================
-- Thêm SV cho lớp Y khoa (L015, L016) và Luật (L017)
INSERT INTO SINHVIEN (MASV, TENSV, NGAYSINH, PHAI, MALOP) VALUES 
('SV030', N'Phạm Văn Y', '2001-05-15', N'Nam', 'L015'),
('SV031', N'Nguyễn Thị Bác Sĩ', '2001-06-20', N'Nữ', 'L015'),
('SV032', N'Trần Văn Điều Dưỡng', '2001-07-25', N'Nam', 'L016'),
('SV033', N'Lê Thị Dược', '2001-08-30', N'Nữ', 'L016'),
('SV034', N'Hoàng Văn Luật', '2001-09-10', N'Nam', 'L017'),
('SV035', N'Vũ Thị Sư', '2001-10-15', N'Nữ', 'L017');

-- ==========================================
-- 3. THÊM MÔN HỌC MỚI (Nếu cần thiết cho ngành Y/Luật)
-- ==========================================
-- (Lưu ý: Trong bài trước đã có MH018 Pháp luật đại cương, MH019 Luật dân sự, MH020 Giải phẫu, MH021 Sinh lý học)
-- Ta thêm 1 môn chuyên ngành Y nữa để test
INSERT INTO MONHOC (MAMH, TENMH, SOTC) VALUES 
('MH023', N'Dược lý học', 3),
('MH024', N'Luật Hình sự', 3);

-- ==========================================
-- 4. THÊM KẾT QUẢ HỌC TẬP CHO CÁC SINH VIÊN MỚI
-- ==========================================
-- SV030 (Y khoa - Nam) học 3 môn
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV030', 'MH020', 8.0), -- Giải phẫu
('SV030', 'MH021', 7.5), -- Sinh lý học
('SV030', 'MH023', 8.5); -- Dược lý học

-- SV031 (Y khoa - Nữ) học 3 môn (trong đó có MH001 để test lại câu 7,8,18,19)
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV031', 'MH020', 9.0), 
('SV031', 'MH001', 7.0), -- Cơ sở dữ liệu (Học chéo khoa)
('SV031', 'MH023', 8.0);

-- SV032 (Điều dưỡng - Nam) học 2 môn
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV032', 'MH021', 6.5), 
('SV032', 'MH023', 7.0);

-- SV033 (Dược - Nữ) học 4 môn (Để test hàm đếm số môn)
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV033', 'MH020', 8.0), 
('SV033', 'MH021', 8.5),
('SV033', 'MH023', 9.0),
('SV033', 'MH004', 7.0); -- Học chéo môn Mạng máy tính

-- SV034 (Luật - Nam) học 2 môn luật
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV034', 'MH018', 8.5), -- Pháp luật đại cương
('SV034', 'MH019', 7.5); -- Luật dân sự

-- SV035 (Luật - Nữ) học 3 môn (trong đó có 1 môn không thuộc chuyên ngành)
INSERT INTO KETQUA (MASV, MAMH, DIEM) VALUES 
('SV035', 'MH018', 9.0), 
('SV035', 'MH019', 8.0),
('SV035', 'MH024', 8.5); -- Luật Hình sự

-- Lưu ý: Môn MH024 (Luật Hình sự) và MH023 (Dược lý) hiện đã có người học.
-- Môn MH022 (Đồ án tốt nghiệp) và các môn khác vẫn không có ai học để test câu 20.

INSERT INTO LOP (MALOP, TENLOP, MAKHOA) VALUES 
('L018', N'13 Đại học Kinh tế', 'K02'),
('L019', N'14 Đại học Kinh tế', 'K02');

-- 2. Thêm lớp cho Khoa K03 (Cơ khí)
-- Hiện tại K03 có 2 lớp (L012, L013). Thêm 3 lớp để tổng thành 5 lớp (chưa vượt qua 5).
INSERT INTO LOP (MALOP, TENLOP, MAKHOA) VALUES 
('L020', N'10 Đại học Cơ khí', 'K03'),
('L021', N'11 Đại học Cơ khí', 'K03'),
('L022', N'12 Đại học Cơ khí', 'K03');

-- 3. Thêm lớp cho Khoa K05 (Y học) và K06 (Luật) để đa dạng dữ liệu
INSERT INTO LOP (MALOP, TENLOP, MAKHOA) VALUES 
('L023', N'10 Đại học Y khoa', 'K05'),
('L024', N'09 Đại học Luật', 'K06'),
('L025', N'10 Đại học Luật', 'K06');

-- ==========================================
-- THÊM SINH VIÊN VÀO CÁC LỚP MỚI NÀY (Tùy chọn, để dữ liệu không bị trống)
-- ==========================================
-- Thêm 1 vài sinh viên cho lớp Kinh tế mới (L018, L019)
INSERT INTO SINHVIEN (MASV, TENSV, NGAYSINH, PHAI, MALOP) VALUES 
('SV036', N'Nguyễn Văn Kinh Tế', '2002-01-01', N'Nam', 'L018'),
('SV037', N'Trần Thị Kinh Tế', '2002-02-02', N'Nữ', 'L019'),
('SV038', N'Lê Văn Cơ Khí', '2002-03-03', N'Nam', 'L020'),
('SV039', N'Phạm Thị Y Khoa', '2002-04-04', N'Nữ', 'L023');

SELECT * FROM KHOA
SELECT * FROM LOP
SELECT * FROM SINHVIEN
SELECT * FROM MONHOC
SELECT * FROM KETQUA

--1 Cho biết mã và tên những lớp thuộc khoa có tên CNTT
select MALOP, TENLOP
from LOP l, KHOA k
where l.MAKHOA = k.MAKHOA and TENKHOA = N'Công nghệ thông tin'

--2 Cho biết mã và họ tên những sinh viên phái nam thuộc lớp có mã lớp là ‘L001’
select *
from SINHVIEN s, LOP l
where s.MALOP = l.MALOP and PHAI = N'Nam' and s.MALOP = 'L001'

--3 Cho biết mã và họ tên những sinh viên phái nam thuộc
--lớp có mã lớp là ‘L001’ hoặc phái nữ học lớp có mã là ‘L002’
select *
from SINHVIEN s, LOP l
where (s.MALOP = l.MALOP) and 
((PHAI = N'Nam' and s.MALOP = 'L001') or (PHAI = N'Nữ' and s.MALOP = 'L002'))

--4 Cho biết mã và họ tên những sinh viên phái nam thuộc lớp có tên lớp là ‘08 Đại học tin học’
select *
from SINHVIEN s, LOP l
where s.MALOP = l.MALOP and s.PHAI = N'Nam' and l.TENLOP = N'08 Đại học tin học'

--5 Liệt kê danh sách những môn học (MaMH) do sinh viên có mã ‘sv001’ đã học
SELECT DISTINCT MAMH 
FROM KETQUA 
WHERE MASV = 'SV001'

--6 Liệt kê danh sách những môn học (MaMH, TenMH) do sinh viên có mã ‘sv001’ đã học.
select kq.MAMH, TENMH
from MONHOC m, KETQUA kq
where m.MAMH = kq.MAMH and kq.MASV = 'SV001' 

--7 Liệt kê danh sách những sinh viên (MaSV) có học môn với mã môn là ‘mh001’
select DISTINCT MASV
from KETQUA kq
where kq.MAMH = 'MH001'

--8 Liệt kê danh sách những sinh viên (MaSV, HoTen) có học môn với mã môn là ‘mh001’
select kq.MASV,s.TENSV
from SINHVIEN s, KETQUA kq
where s.MASV = kq.MASV and kq.MAMH = 'MH001' 

--9 Cho biết mã khoa, tên khoa và số lớp trong từng khoa.
select k.MAKHOA, k.TENKHOA, COUNT(l.MALOP) soluonglop
from KHOA k, LOP l
where k.MAKHOA = l.MAKHOA
GROUP BY k.MAKHOA,k.TENKHOA

--10.Mã và tên những khoa nào có số lớp trên 5
select k.MAKHOA, k.TENKHOA, COUNT(l.MALOP) soluonglop
from KHOA k, LOP l
where k.MAKHOA = l.MAKHOA
GROUP BY k.MAKHOA,k.TENKHOA
having COUNT(*) > 5

--11.Mã và tên những khoa có nhiều lớp nhất
select k.MAKHOA, k.TENKHOA, COUNT(l.MALOP) soluonglop
from KHOA k, LOP l
where k.MAKHOA = l.MAKHOA
group by k.MAKHOA, k.TENKHOA
having COUNT(l.MALOP) >= ALL(
	SELECT COUNT(MALOP) 
    FROM LOP 
    GROUP BY MAKHOA
)
--12.Cho biết mã sinh viên và số môn học của từng sinh viên.
select s.MASV, COUNT(kq.MAMH) soluongmon
from SINHVIEN s, KETQUA kq
where s.MASV = kq.MASV
group by s.MASV, s.TENSV

--13.Cho biết mã, họ tên và số môn học của từng sinh viên.
select s.MASV, s.TENSV, COUNT(kq.MAMH) soluongmon
from SINHVIEN s, KETQUA kq
where s.MASV = kq.MASV
group by s.MASV, s.TENSV

--14.Cho biết mã và họ tên những sinh viên học trên 5 môn học.
select s.MASV, s.TENSV, COUNT(kq.MAMH) soluongmon
from SINHVIEN s, KETQUA kq
where s.MASV = kq.MASV
group by s.MASV, s.TENSV
having COUNT(*) > 5

--15.Cho biết mã, họ tên những sinh viên học nhiều môn nhất.\
select s.MASV, s.TENSV, COUNT(kq.MAMH) soluonglop
from SINHVIEN s, KETQUA kq
where s.MASV = kq.MASV
group by s.MASV, s.TENSV
having COUNT(kq.MAMH) >= ALL(
	SELECT COUNT(MAMH) 
    FROM KETQUA 
    GROUP BY MASV
)
--16.Cho biết mã môn học và số sinh viên học của từng môn.
select m.MAMH, COUNT(kq.MASV) soluongmon
from MONHOC m, KETQUA kq
where m.MAMH = kq.MAMH
group by  m.MAMH

--17.Cho biết mã môn học, tên môn học và số lượng sinh viên học tương ứng.
select m.MAMH,m.TENMH, COUNT(kq.MASV) soluongmon
from MONHOC m, KETQUA kq
where m.MAMH = kq.MAMH
group by  m.MAMH,m.TENMH

--18.Cho biết mã và tên những môn học có ít nhất 20 sinh viên học
select m.MAMH,m.TENMH, COUNT(kq.MASV) soluongmon
from MONHOC m, KETQUA kq
where m.MAMH = kq.MAMH
group by  m.MAMH,m.TENMH
having COUNT(*) >= 20

--19.Cho biết mã và tên những môn học có nhiều sinh viên học nhất.
select m.MAMH, m.MAMH, COUNT(kq.MASV) soluongsv
from MONHOC m, KETQUA kq
where m.MAMH = kq.MAMH
group by m.MAMH, m.MAMH
having COUNT(kq.MASV) >= ALL(
	SELECT COUNT(MASV) 
    FROM KETQUA 
    GROUP BY MAMH
)
--20.Mã và tên những môn học nào không có sinh viên học.
select m.MAMH, m.TENMH
from MONHOC m
where MAMH not in( select MAMH from KETQUA)