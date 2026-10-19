CREATE DATABASE BT_QLDonHang

USE BT_QLDonHang

create table KHACH(
	MaKH VARCHAR(20) NOT NULL,
	TenKH NVARCHAR(100),
	DiaChi NVARCHAR(100),
	DienThoai VARCHAR(10),
	CONSTRAINT PK_MaKH PRIMARY KEY(MaKH)
);

create table HOADON(
	MaHD varchar(20) not null,
	NgayLap date,
	MaKH varchar(20),
	constraint PK_MaHD primary key(MaHD),
	constraint FK_HOADON_MaKH foreign key(MaKH) references KHACH(MaKH)
);

create table HANGHOA(
	MaHG varchar(20) not null,
	TenHG nvarchar(100),
	DVT nvarchar(100),
	NhaSX nvarchar(100),
	LoaiHang nvarchar(100),
	constraint PK_MaHG primary key(MaHG)
);

create table CHITIETHD(
	MaHD varchar(20) not null,
	MaHG varchar(20) not null,
	SoLuong int,
	DonGia float,
	constraint PK_CTHD primary key(MaHD, MaHG),
	constraint FK_CTHD_MaHD foreign key(MaHD) references HOADON(MaHD),
	constraint FK_CTHD_MaHG foreign key(MaHG) references HANGHOA(MaHG)
);

SELECT * FROM KHACH
SELECT * FROM HOADON
SELECT * FROM HANGHOA
SELECT * FROM CHITIETHD

-- ==========================================
-- 3. CHÈN DỮ LIỆU MẪU
-- ==========================================

-- 3.1. Bảng KHACH (35 dòng)
INSERT INTO KHACH (MaKH, TenKH, DiaChi, DienThoai) VALUES
('KH01', N'Nguyễn Văn A', N'Hà Nội', '0901234567'),
('KH02', N'Trần Thị B', N'TPHCM', '0912345678'),
('KH03', N'Lê Văn C', N'Đà Nẵng', '0923456789'),
('KH04', N'Phạm Thị D', N'TPHCM', '0934567890'),
('KH05', N'Hoàng Văn E', N'Hải Phòng', '0945678901'),
('KH06', N'Nguyễn Thị F', N'Hà Nội', '0956789012'),
('KH07', N'Vũ Thị G', N'Hà Nội', '0967890123'),
('KH08', N'Đặng Văn H', N'TPHCM', '0978901234'),
('KH09', N'Bùi Thị I', N'Cần Thơ', '0989012345'),
('KH10', N'Đỗ Văn K', N'Hà Nội', '0990123456'),
('KH11', N'Hồ Thị L', N'TPHCM', '0901234000'),
('KH12', N'Ngô Văn M', N'Đà Nẵng', '0912345000'),
('KH13', N'Dương Văn N', N'Hải Phòng', '0923456000'),
('KH14', N'Lý Thị O', N'TPHCM', '0934567000'),
('KH15', N'Trịnh Văn P', N'Hà Nội', '0945678000'),
('KH16', N'Phan Thị Q', N'Đà Nẵng', '0956789000'),
('KH17', N'Cao Văn R', N'Cần Thơ', '0967890000'),
('KH18', N'Đinh Thị S', N'Hà Nội', '0978900000'),
('KH19', N'Lâm Văn T', N'TPHCM', '0989010000'),
('KH20', N'Mai Thị U', N'Hải Phòng', '0990120000'),
('KH21', N'Võ Văn V', N'TPHCM', '0901231000'),
('KH22', N'Đoàn Thị W', N'Hà Nội', '0912342000'),
('KH23', N'Tô Văn X', N'Đà Nẵng', '0923453000'),
('KH24', N'Lưu Thị Y', N'Cần Thơ', '0934564000'),
('KH25', N'Dương Văn Z', N'TPHCM', '0945675000'),
('KH26', N'Trương Thị A1', N'Hà Nội', '0956786000'),
('KH27', N'Lê Văn B1', N'Hải Phòng', '0967897000'),
('KH28', N'Nguyễn Thị C1', N'Đà Nẵng', '0978908000'),
('KH29', N'Trần Văn D1', N'TPHCM', '0989019000'),
('KH30', N'Phạm Thị E1', N'Hà Nội', '0990121000'),
('KH31', N'Hoàng Văn F1', N'Cần Thơ', '0901232000'),
('KH32', N'Vũ Thị G1', N'TPHCM', '0912343000'),
('KH33', N'Đặng Văn H1', N'Hà Nội', '0923454000'),
('KH34', N'Bùi Thị I1', N'Đà Nẵng', '0934565000'),
('KH35', N'Đỗ Văn K1', N'Hải Phòng', '0945676000');

-- 3.2. Bảng HANGHOA (12 mặt hàng)
-- Lưu ý: MH11, MH12 sẽ không có trong CHITIETHD để test câu 5
INSERT INTO HANGHOA (MaHG, TenHG, DVT, NhaSX, LoaiHang) VALUES
('MH01', N'Tủ lạnh', N'Cái', N'Samsung', N'Điện lạnh'),
('MH02', N'Máy giặt', N'Cái', N'LG', N'Điện lạnh'),
('MH03', N'Điều hòa', N'Cái', N'Daikin', N'Điện lạnh'),
('MH04', N'Tivi', N'Cái', N'Sony', N'Điện tử'),
('MH05', N'Lò vi sóng', N'Cái', N'Sharp', N'Gia dụng'),
('MH06', N'Nồi cơm điện', N'Cái', N'Toshiba', N'Gia dụng'),
('MH07', N'Máy lọc nước', N'Cái', N'Kangaroo', N'Gia dụng'),
('MH08', N'Quạt điện', N'Cái', N'Panasonic', N'Gia dụng'),
('MH09', N'Bếp từ', N'Cái', N'Electrolux', N'Gia dụng'),
('MH10', N'Máy hút bụi', N'Cái', N'Philips', N'Gia dụng'),
('MH11', N'Máy sấy tóc', N'Cái', N'Philips', N'Gia dụng'),
('MH12', N'Bàn ủi', N'Cái', N'Panasonic', N'Gia dụng');

-- 3.3. Bảng HOADON (25 hóa đơn)
-- Phân bổ các ngày quan trọng: 
-- 2017-11-12: HD01, HD03, HD06, HD07, HD08 (test câu 2, 3, 5, 7)
-- 2017-02-15: HD02, HD09 (KH01 Nguyễn Văn A - test câu 4)
-- 2017-12-10: HD12 (Trị giá cao nhất - test câu 8)
INSERT INTO HOADON (MaHD, NgayLap, MaKH) VALUES
('HD01', '2017-11-12', 'KH02'), 
('HD02', '2017-02-15', 'KH01'), 
('HD03', '2017-11-12', 'KH04'), 
('HD04', '2017-11-20', 'KH03'), 
('HD05', '2017-12-01', 'KH02'), 
('HD06', '2017-11-12', 'KH07'), 
('HD07', '2017-11-12', 'KH08'), 
('HD08', '2017-11-12', 'KH10'), 
('HD09', '2017-02-15', 'KH01'), 
('HD10', '2017-11-25', 'KH09'),
('HD11', '2017-12-05', 'KH11'),
('HD12', '2017-12-10', 'KH12'), 
('HD13', '2017-12-15', 'KH07'),
('HD14', '2017-11-12', 'KH15'),
('HD15', '2017-11-12', 'KH20'),
('HD16', '2017-11-12', 'KH25'),
('HD17', '2017-11-18', 'KH30'),
('HD18', '2017-11-19', 'KH35'),
('HD19', '2017-12-20', 'KH05'),
('HD20', '2017-12-21', 'KH13'),
('HD21', '2017-12-22', 'KH18'),
('HD22', '2017-12-23', 'KH22'),
('HD23', '2017-12-24', 'KH28'),
('HD24', '2017-12-25', 'KH33'),
('HD25', '2017-12-26', 'KH09');

-- 3.4. Bảng CHITIETHD
-- HD12 sẽ có trị giá cực lớn để test câu 8
INSERT INTO CHITIETHD (MaHD, MaHG, SoLuong, DonGia) VALUES
-- HD01 (Ngày 12/11)
('HD01', 'MH01', 2, 5000000),
('HD01', 'MH04', 1, 10000000),
-- HD02 (Ngày 15/02 - KH01)
('HD02', 'MH02', 1, 8000000),
('HD02', 'MH03', 1, 12000000),
-- HD03 (Ngày 12/11) - Trị giá 124tr (Cũ)
('HD03', 'MH04', 10, 10000000),
('HD03', 'MH03', 2, 12000000),
-- HD04
('HD04', 'MH06', 2, 1500000),
-- HD05
('HD05', 'MH01', 1, 5000000),
-- HD06 (Ngày 12/11)
('HD06', 'MH08', 3, 500000),
('HD06', 'MH07', 2, 4000000),
-- HD07 (Ngày 12/11)
('HD07', 'MH09', 1, 3000000),
('HD07', 'MH10', 1, 2500000),
-- HD08 (Ngày 12/11)
('HD08', 'MH08', 5, 500000),
-- HD09 (Ngày 15/02 - KH01)
('HD09', 'MH05', 1, 2000000),
('HD09', 'MH06', 2, 1500000),
-- HD10
('HD10', 'MH07', 2, 4000000),
('HD10', 'MH09', 1, 3000000),
-- HD11
('HD11', 'MH10', 3, 2500000),
-- HD12 (Trị giá cao nhất): 20 Tủ lạnh (100tr) + 10 Điều hòa (120tr) + 10 Tivi (100tr) = 320tr
('HD12', 'MH01', 20, 5000000),
('HD12', 'MH03', 10, 12000000),
('HD12', 'MH04', 10, 10000000),
-- HD13
('HD13', 'MH02', 1, 8000000),
('HD13', 'MH01', 1, 5000000),
-- HD14 (Ngày 12/11)
('HD14', 'MH01', 1, 5000000),
-- HD15 (Ngày 12/11)
('HD15', 'MH02', 2, 8000000),
-- HD16 (Ngày 12/11)
('HD16', 'MH04', 2, 10000000),
-- HD17
('HD17', 'MH05', 1, 2000000),
-- HD18
('HD18', 'MH03', 1, 12000000),
-- HD19
('HD19', 'MH07', 1, 4000000),
-- HD20
('HD20', 'MH09', 2, 3000000),
-- HD21
('HD21', 'MH10', 1, 2500000),
-- HD22
('HD22', 'MH06', 3, 1500000),
-- HD23
('HD23', 'MH08', 10, 500000),
-- HD24
('HD24', 'MH02', 1, 8000000),
-- HD25
('HD25', 'MH01', 2, 5000000);

--1 Cho biết mã và tên những khách hàng có địa chỉ ở TPHCM hay Hà Nội.
select *
from KHACH k
where DiaChi in (N'TPHCM', N'Hà Nội')

--2 Khách hàng nào có mua hàng trong ngày 12/11/2017
select kh.MaKH, kh.TenKH
from KHACH kh
where MaKH in (
	select MaKH
	from HOADON
	where NgayLap = '2017-11-12'
)

--3 Khách hàng nào không mua hàng trong ngày 12/11/2017
select kh.MaKH, kh.TenKH
from KHACH kh
where MaKH not in (
	select MaKH
	from HOADON
	where NgayLap = '2017-11-12'
)

--4 Ngày 15/02/2017, khách hàng Nguyễn Văn A mua những mặt hàng nào (MaHG, TenHG, DVT)
select distinct h.MaHG, h.TenHG, h.DVT
from KHACH kh, HANGHOA h, HOADON hd, CHITIETHD ct
where kh.MaKH= hd.MaKH and 
	hd.MaHD = ct.MaHD and 
	h.MaHG = ct.MaHG and
	hd.NgayLap = '2017-02-15' and
	kh.TenKH = N'Nguyễn Văn A'


--5 Mã và tên những mặt hàng nào không bán ra trong ngày 12/11/2017
select h.MaHG, h.TenHG
from HANGHOA h
where h.MaHG not in(
	select ct.MaHG
	from HOADON hd, CHITIETHD ct
	where hd.MaHD = ct.MaHD and 
	hd.NgayLap = '2017-11-12'
)

--6. Cho biết mã hàng, tên hàng và tổng số lượng mặt hàng được bán ra tương ứng.
select h.MaHG, TenHG, SUM(ct.SoLuong) tong
from HANGHOA h, CHITIETHD ct
where h.MaHG = ct.MaHG
group by h.MaHG, TenHG

--7. Mã và tên những mặt hàng nào bán chạy nhất trong ngày 12/11/2017
select TOP 1 h.MaHG, TenHG, SUM(ct.SoLuong) sl
from HANGHOA h, HOADON d, CHITIETHD ct
where h.MaHG = ct.MaHG and d.MaHD = ct.MaHD and NgayLap = '2017-11-12'
group by h.MaHG, TenHG
order by sl DESC

--8. Hoá đơn nào có trị giá cao nhất. Thông tin liệt kê gồm: mã hoá đơn, ngày lập.
select TOP 1 d.MaHD, d.NgayLap, SUM(ct.SoLuong * ct.DonGia) hoadongiatricao 
from HOADON d, CHITIETHD ct
where d.MaHD = ct.MaHD
group by d.MaHD, d.NgayLap
order by hoadongiatricao DESC