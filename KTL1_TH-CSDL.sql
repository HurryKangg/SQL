--Câu 1 (CLO1.1) 2.0 điểm:
create database QL_KHAMBENH
use QL_KHAMBENH

create table BENHNHAN(
	MaBN char(10) not null,
	HotenBN nvarchar(50),
	NgaySinh date,
	GioiTinh nchar(10),
	constraint PK_BENHNHAN primary key(MaBN)
);

create table BACSI(
	MaBS char(10) not null,
	HotenBS nvarchar(50),
	ChuyenKhoa nvarchar(50),
	constraint PK_BACSI primary key(MaBS)
)

create table HOSOBENH(
	MaHS char(10) not null,
	NgayLap date,
	MaBN char(10),
	MaBS char(10),
	constraint PK_HOSOBENH primary key(MaHS),
	constraint FK_HOSOBENH_BENHNHAN foreign key(MaBN) references BENHNHAN(MaBN),
	constraint FK_HOSOBENH_BACSI foreign key(MaBS) references BACSI(MaBS)
)

create table CHITIETKHAM(
	MaHS char(10) not null,
	ChanDoan nvarchar(100),
	TienKham float,
	constraint PK_CHITIETKHAM primary key(MaHS),
	constraint FK_CHITIETKHAM_HOSOBENH  foreign key(MaHS) references HOSOBENH(MaHS)
)
alter table CHITIETKHAM
add constraint PK_CHITIETKHAM primary key(MaHS)

USE QL_KHAMBENH;
GO

--Câu 2 (CLO1.1) 1.0 điểm:
-- =========================================================
-- 1. BENHNHAN (6 dòng)
--    - BN01, BN03: Nữ sinh sau 1990  -> thỏa câu 3a
--    - BN05: tồn tại để câu 5 cập nhật ngày sinh
-- =========================================================
INSERT INTO BENHNHAN (MaBN, HotenBN, NgaySinh, GioiTinh) VALUES
('BN01', N'Nguyễn Thị Lan',  '1995-03-12', N'Nữ'),   -- Nữ, sau 1990 ✔ 3a
('BN02', N'Trần Văn Minh',   '1988-07-20', N'Nam'),
('BN03', N'Lê Thị Hoa',      '1992-11-05', N'Nữ'),   -- Nữ, sau 1990 ✔ 3a
('BN04', N'Phạm Quốc Bảo',   '2000-01-15', N'Nam'),
('BN05', N'Đỗ Thị Mai',      '1990-12-31', N'Nữ'),   -- sẽ UPDATE ở câu 5
('BN06', N'Vũ Hoàng Nam',    '1993-09-09', N'Nam');

-- =========================================================
-- 2. BACSI (4 dòng)
--    - BS01: Nội tổng hợp  -> thỏa câu 3b + 3c (25 hồ sơ)
--    - BS03: Nguyễn Văn Thanh - Tim mạch -> câu 5 xóa
--    - BS04: Nội tổng hợp  -> thỏa câu 3b + 3c (22 hồ sơ)
-- =========================================================
INSERT INTO BACSI (MaBS, HotenBS, ChuyenKhoa) VALUES
('BS01', N'Phạm Minh Đức',    N'Nội tổng hợp'),   -- 25 hồ sơ ✔ 3c
('BS02', N'Võ Thị Hồng',      N'Nhi khoa'),
('BS03', N'Nguyễn Văn Thanh', N'Tim mạch'),       -- câu 5 xóa
('BS04', N'Đặng Quốc Hùng',   N'Nội tổng hợp');   -- 22 hồ sơ ✔ 3c

-- =========================================================
-- 3. HOSOBENH
--    - BS01: 25 hồ sơ  -> thỏa 3c (>20)
--    - BS04: 22 hồ sơ  -> thỏa 3c (>20)
--    - Có hồ sơ tháng 11/2025 -> thỏa câu 4
--    - Có hồ sơ của BS03 -> câu 5 phải xử lý FK khi xóa
-- =========================================================

-- --- 5 hồ sơ đầu, trong đó có tháng 11/2025 và hồ sơ của BS03 ---
INSERT INTO HOSOBENH (MaHS, NgayLap, MaBN, MaBS) VALUES
('HS001', '2025-11-03', 'BN01', 'BS01'),   -- tháng 11/2025 ✔ câu 4
('HS002', '2025-11-15', 'BN02', 'BS01'),   -- tháng 11/2025 ✔ câu 4
('HS003', '2025-11-20', 'BN03', 'BS04'),   -- tháng 11/2025 ✔ câu 4
('HS004', '2025-12-01', 'BN04', 'BS02'),
('HS005', '2025-11-25', 'BN05', 'BS03');   -- của BS03 -> câu 5 xử lý FK

-- --- Bổ sung cho BS01 đủ 25 hồ sơ (HS006..HS025) ---
INSERT INTO HOSOBENH (MaHS, NgayLap, MaBN, MaBS) VALUES
('HS006','2025-01-05','BN01','BS01'),
('HS007','2025-02-06','BN02','BS01'),
('HS008','2025-03-07','BN03','BS01'),
('HS009','2025-04-08','BN04','BS01'),
('HS010','2025-05-09','BN05','BS01'),
('HS011','2025-06-10','BN06','BS01'),
('HS012','2025-07-11','BN01','BS01'),
('HS013','2025-08-12','BN02','BS01'),
('HS014','2025-09-13','BN03','BS01'),
('HS015','2025-10-14','BN04','BS01'),
('HS016','2025-11-16','BN05','BS01'),   -- tháng 11/2025 ✔ câu 4
('HS017','2025-12-17','BN06','BS01'),
('HS018','2024-01-18','BN01','BS01'),
('HS019','2024-02-19','BN02','BS01'),
('HS020','2024-03-20','BN03','BS01'),
('HS021','2024-04-21','BN04','BS01'),
('HS022','2024-05-22','BN05','BS01'),
('HS023','2024-06-23','BN06','BS01'),
('HS024','2024-07-24','BN01','BS01'),
('HS025','2024-08-25','BN02','BS01');   -- BS01 tổng = 25 ✔ 3c

-- --- Bổ sung cho BS04 đủ 22 hồ sơ (HS026..HS046) ---
INSERT INTO HOSOBENH (MaHS, NgayLap, MaBN, MaBS) VALUES
('HS026','2025-01-03','BN01','BS04'),
('HS027','2025-02-04','BN02','BS04'),
('HS028','2025-03-05','BN03','BS04'),
('HS029','2025-04-06','BN04','BS04'),
('HS030','2025-05-07','BN05','BS04'),
('HS031','2025-06-08','BN06','BS04'),
('HS032','2025-07-09','BN01','BS04'),
('HS033','2025-08-10','BN02','BS04'),
('HS034','2025-09-11','BN03','BS04'),
('HS035','2025-10-12','BN04','BS04'),
('HS036','2025-11-13','BN05','BS04'),   -- tháng 11/2025 ✔ câu 4
('HS037','2025-12-14','BN06','BS04'),
('HS038','2024-01-15','BN01','BS04'),
('HS039','2024-02-16','BN02','BS04'),
('HS040','2024-03-17','BN03','BS04'),
('HS041','2024-04-18','BN04','BS04'),
('HS042','2024-05-19','BN05','BS04'),
('HS043','2024-06-20','BN06','BS04'),
('HS044','2024-07-21','BN01','BS04'),
('HS045','2024-08-22','BN02','BS04'),
('HS046','2024-09-23','BN03','BS04');   -- BS04 tổng = 22 ✔ 3c

-- =========================================================
-- 4. CHITIETKHAM
--    - HS001 (BS01 - Nội tổng hợp): "Viêm họng cấp"  -> 3b ✔
--    - HS002 (BS01 - Nội tổng hợp): "Viêm phế quản"  -> 3b ✔
--    - HS016 (BS01 - Nội tổng hợp): "Viêm dạ dày"    -> 3b ✔
--    - HS026 (BS04 - Nội tổng hợp): "Viêm xoang"     -> 3b ✔
--    - HS005 (BS03 - Tim mạch): cần có để câu 5 xóa FK
-- =========================================================
INSERT INTO CHITIETKHAM (MaHS, ChanDoan, TienKham) VALUES
('HS001', N'Viêm họng cấp',      200000),   -- 3b ✔ (BS01 - Nội tổng hợp)
('HS002', N'Viêm phế quản',      300000),   -- 3b ✔ (BS01 - Nội tổng hợp)
('HS003', N'Cảm cúm',            150000),
('HS004', N'Viêm amidan',        180000),   -- BS02 - Nhi khoa -> KHÔNG thỏa 3b
('HS005', N'Rối loạn nhịp tim',  350000),   -- của BS03 -> câu 5
('HS016', N'Viêm dạ dày',        250000),   -- 3b ✔ (BS01 - Nội tổng hợp)
('HS026', N'Viêm xoang',         220000);   -- 3b ✔ (BS04 - Nội tổng hợp)

delete CHITIETKHAM
delete HOSOBENH
delete BACSI
delete BENHNHAN
select * from BENHNHAN
select * from BACSI
select * from HOSOBENH
select * from CHITIETKHAM

--Câu 3 (CLO1.1) 3.0 điểm:
--a. Liệt kê danh sách bệnh nhân có giới tính "Nữ" và sinh sau năm 1990?
select *
from BENHNHAN bn
where bn.GioiTinh = N'Nam' and YEAR(bn.NgaySinh) > '1990'
order by NgaySinh

--b. Lập danh sách các hồ sơ (Mã hồ sơ, ngày lập) có chẩn đoán chứa chuỗi “viêm” và bác sĩ lập 
--hồ sơ thuộc chuyên khoa “Nội tổng hợp”.
select *
from HOSOBENH hs, CHITIETKHAM ct, BACSI bs
where ct.MaHS = hs.MaHS and bs.MaBS = hs.MaBS and
ct.ChanDoan like '%viêm%'and bs.ChuyenKhoa = N'Nội tổng hợp'

--c. Thống kê danh sách bác sĩ đã lập trên 20 hồ sơ bệnh, 
--thông tin hiển thị gồm: Mã bác sĩ, họ tên bác sĩ, số lượng hồ sơ bệnh.
select bs.MaBS, bs.HotenBS, COUNT(hs.MaHS) as SoLuongHoSoBenh
from BACSI bs, HOSOBENH hs
where hs.MaBS = bs.MaBS
group by bs.MaBS, bs.HotenBS
having COUNT(*) > 20
order by SoLuongHoSoBenh desc

--Câu 4 (CLO2) 2.0 điểm:
--Tạo View hiển thị các thông tin sau: mã hồ sơ, ngày lập, họ tên bệnh nhân, họ tên bác sĩ, chuyên 
--khoa, chẩn đoán, tiền khám của những hồ sơ bệnh lập trong tháng 11 năm 2025.
CREATE VIEW V_HOSO_THANG11_2025 AS
select 
	hs.MaHS,
	hs.NgayLap,
	bn.HotenBN,
	bs.HotenBS,
	bs.ChuyenKhoa,
	ct.ChanDoan,
	ct.TienKham
from BENHNHAN bn, HOSOBENH hs, BACSI bs, CHITIETKHAM ct
where bn.MaBN = hs.MaBN and hs.MaBS = bs.MaBS and hs.MaHS = ct.MaHS and
	hs.NgayLap BETWEEN '2025-11-01' and '2025-11-30'

select * from V_HOSO_THANG11_2025

--Câu 5 (CLO3) 2.0 điểm
-- Cần lưu thêm thông tin địa chỉ của bệnh nhân trong bảng BENHNHAN.
alter table BENHNHAN
add DiaChi nvarchar(50)
--- Phát hiện dữ liệu ngày sinh bệnh nhân có mã “BN05” nhập sai,
--cần cập nhật lại ngày sinh “20/08/1997”.
update BENHNHAN
set NgaySinh = '1997-08-20'
where MaBN = 'BN05'
--Bác sĩ “Nguyễn Văn Thanh” chuyên khoa “Tim mạch” đã nghỉ việc, 
--cần xóa dữ liệu bác sĩ trong bảng BACSI
DELETE FROM ct
FROM CHITIETKHAM ct, HOSOBENH hs
WHERE ct.MaHS = hs.MaHS and	
hs.MaBS = 'BS03'

DELETE FROM HOSOBENH
WHERE MaBS = 'BS03'

DELETE FROM BACSI
WHERE MaBS = 'BS03'

