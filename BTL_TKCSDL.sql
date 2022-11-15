CREATE DATABASE crown_store_dev
USE crown_store_dev

-- 1. Bảng Khách Hàng
CREATE TABLE KhachHang
(
	MaKH VARCHAR(20) NOT NULL,
	TenKH NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(200) NOT NULL,
	SDT VARCHAR(15) NOT NULL,
	PRIMARY KEY (MaKH),
)

INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH01', N'Nguyễn Văn A', N'Thanh Xuân, Hà Nội', '0123456789');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH02', N'Nguyễn Văn B', N'Cầu Giấy, Hà Nội', '0126985631');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH03', N'Nguyễn Văn C', N'Nam Từ Liêm, Hà Nội', '0998765432');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH04', N'Nguyễn Văn D', N'Hoàng Mai, Hà Nội', '0369874125');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH05', N'Nguyễn Văn E', N'Đống Đa, Hà Nội', '0555986314');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH06', N'Nguyễn Văn F', N'Tả Thanh Oai, Hà Nội', '0339687415');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH07', N'Nguyễn Văn G', N'Bắc Từ Liêm, Hà Nội', '0369877778');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH08', N'Nguyễn Văn H', N'Cấu Giấy, Hà Nội', '0333999874');
INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES ('KH09', N'Nguyễn Văn J', N'Thanh Xuân, Hà Nội', '0123555987');

SELECT * FROM KhachHang

-- 2. Bảng Nhân Viên
CREATE TABLE NhanVien
(
	MaNV VARCHAR(20) NOT NULL,
	TenNV NVARCHAR(50) NOT NULL,
	NgaySinh DATE NOT NULL,
	GioiTinh BIT  NOT NULL,
	DiaChi NVARCHAR(200) NOT NULL,
	SDT VARCHAR(15) NOT NULL,
	PRIMARY KEY (MaNV),
)

INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV01', N'Phạm Văn X', '2002-01-01', '0', N'Thanh Xuân, Hà Nội', '0123999874')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV02', N'Phạm Văn Y', '2001-05-05', '1', N'Nam Từ Liêm, Hà Nội', '0999888777')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV03', N'Phạm Văn Z', '2003-05-06', '0', N'Nam Từ Liêm, Hà Nội', '0369369369')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV04', N'Phạm Văn W', '2004-05-19', '1', N'Nam Từ Liêm, Hà Nội', '0147147147')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV05', N'Phạm Văn T', '2005-05-25', '0', N'Thanh Xuân, Hà Nội', '0258258258')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV06', N'Phạm Văn Y', '1990-03-05', '1', N'Thanh Xuân, Hà Nội', '0123123123')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV07', N'Phạm Văn U', '1997-02-05', '0', N'Cầu Giấy, Hà Nội', '0456456456')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV08', N'Phạm Văn J', '1998-01-05', '1', N'Thanh Xuân, Hà Nội', '0789789789')
INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES ('NV09', N'Phạm Văn K', '1999-09-05', '1', N'Thanh Xuân, Hà Nội', '0159159159')

SELECT * FROM NhanVien

-- 3. Bảng Nhà Cung Cấp
CREATE TABLE NhaCungCap
(
	MaNCC VARCHAR(20) NOT NULL,
	TenNCC NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(200) NOT NULL,
	SDT VARCHAR(15) NOT NULL,
	PRIMARY KEY (MaNCC),
)

INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES ('NCC01', N'May10', N'Gò Vấp, TP. Hồ Chí Minh', '0288888888')
INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES ('NCC02', N'Coolmate', N'Vạn Phúc, Hà Đông', '0369147258')
INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES ('NCC03', N'Uniqlo', N'Quận 1, TP. Hồ Chí Minh', '0357159842')
INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES ('NCC04', N'COS', N'Ngô Quyền, Hải Phòng', '0222229874')
INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES ('NCC05', N'Bitis', N'Thanh Xuân, Hà Nội', '0269696969')

SELECT * FROM NhaCungCap

-- 4. Bảng Bộ Sưu Tập
CREATE TABLE BoSuuTap
(
	MaBST VARCHAR(20) NOT NULL,
	TenBST NVARCHAR(50) NOT NULL,
	PRIMARY KEY (MaBST),
)

INSERT INTO BoSuuTap(MaBST, TenBST) VALUES ('BST01', N'Áo')
INSERT INTO BoSuuTap(MaBST, TenBST) VALUES ('BST02', N'Quần')
INSERT INTO BoSuuTap(MaBST, TenBST) VALUES ('BST03', N'Giày')
INSERT INTO BoSuuTap(MaBST, TenBST) VALUES ('BST04', N'Nam')
INSERT INTO BoSuuTap(MaBST, TenBST) VALUES ('BST05', N'Nữ')

SELECT * FROM BoSuuTap

-- 5. Bảng Size
CREATE TABLE Size
(
	MaSize VARCHAR(20) NOT NULL,
	ChieuDai INT NOT NULL,
	ChieuRong INT NOT NULL,
	PRIMARY KEY (MaSize),
)

INSERT INTO Size(MaSize, ChieuDai, ChieuRong) VALUES ('AOM', '68', '54')
INSERT INTO Size(MaSize, ChieuDai, ChieuRong) VALUES ('AOL', '70', '56')
INSERT INTO Size(MaSize, ChieuDai, ChieuRong) VALUES ('AOXL', '72', '58')
INSERT INTO Size(MaSize, ChieuDai, ChieuRong) VALUES ('AO2XL', '74', '60')

SELECT * FROM Size

-- 6. Bảng Chất Liệu
CREATE TABLE ChatLieu
(
	MaChatLieu VARCHAR(20) NOT NULL,
	TenChatLieu NVARCHAR(50) NOT NULL,
	DacDiem NVARCHAR(200) NOT NULL,
	PRIMARY KEY (MaChatLieu),
)

INSERT INTO ChatLieu(MaChatLieu, TenChatLieu, DacDiem) VALUES ('CL01', N'Vải Cotton', N'Thoáng mát')
INSERT INTO ChatLieu(MaChatLieu, TenChatLieu, DacDiem) VALUES ('CL02', N'Vải Len', N'Giữ nhiệt tốt, phù hợp cho mùa đông')
INSERT INTO ChatLieu(MaChatLieu, TenChatLieu, DacDiem) VALUES ('CL03', N'Vải ', N'Thoáng mát')
INSERT INTO ChatLieu(MaChatLieu, TenChatLieu, DacDiem) VALUES ('CL04', N'Vải Cotton', N'Thoáng mát')
INSERT INTO ChatLieu(MaChatLieu, TenChatLieu, DacDiem) VALUES ('CL05', N'Vải Cotton', N'Thoáng mát')

SELECT * FROM ChatLieu

-- 7. Bảng Sản Phẩm
CREATE TABLE SanPham
(
	MaSP VARCHAR(20) NOT NULL,
	TenSP NVARCHAR(50) NOT NULL,
	DonGiaNhap FLOAT NOT NULL,
	DonGiaBan FLOAT NOT NULL,
	SoLuongTonKho INT NOT NULL,
	Anh VARCHAR(200) NOT NULL,
	MauSac NVARCHAR(10) NOT NULL,
	MaBST VARCHAR(20) NOT NULL,
	MaNCC VARCHAR(20) NOT NULL,
	MaSize VARCHAR(20) NOT NULL,
	MaChatLieu VARCHAR(20) NOT NULL,
	PRIMARY KEY (MaSP),
	FOREIGN KEY (MaBST) REFERENCES BoSuuTap(MaBST),
	FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
	FOREIGN KEY (MaSize) REFERENCES Size(MaSize),
	FOREIGN KEY (MaChatLieu) REFERENCES ChatLieu(MaChatLieu),
)

INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP01', N'Burgundy T-shirt', '100000', '150000', '100', 'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Đen', 'BST04', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP02', N'Jean Long Sleeve', '100000', '150000', '100', 'https://i.ibb.co/VpW4x5t/roll-up-jean-shirt.png', N'Đen', 'BST04', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP03', N'Pink T-shirt', '100000', '150000', '100', 'https://i.ibb.co/RvwnBL8/pink-shirt.png', N'Hồng', 'BST04', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP04', N'Black & White Longsleeve', '100000', '150000', '100', 'https://i.ibb.co/55z32tw/long-sleeve.png', N'Đen', 'BST04', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP05', N'Floral T-shirt', '100000', '150000', '100', 'https://i.ibb.co/qMQ75QZ/floral-shirt.png', N'Đen', 'BST04', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP06', N'Camo Down Vest', '100000', '150000', '100', 'https://i.ibb.co/xJS0T3Y/camo-vest.png', N'Đen', 'BST04', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP07', N'White Blouse', '100000', '150000', '100', 'https://i.ibb.co/qBcrsJg/white-vest.png', N'Trắng', 'BST05', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP08', N'Yellow Track Suit', '100000', '150000', '100', 'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Vàng', 'BST05', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP09', N'Striped Sweater', '100000', '150000', '100', 'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Đen', 'BST05', 'NCC02', 'AOL', 'CL01')
INSERT INTO SanPham(MaSP, TenSP, DonGiaNhap, DonGiaBan, SoLuongTonKho, Anh, MauSac, MaBST, MaNCC, MaSize, MaChatLieu)
VALUES ('SP10', N'Red Dots Dress', '100000', '150000', '100', 'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Đen', 'BST05', 'NCC02', 'AOL', 'CL01')

SELECT * FROM SanPham

-- 8. Bảng Hóa Đơn Bán
CREATE TABLE HoaDonBan
(
	SoHDB VARCHAR(20) NOT NULL,
	NgayBan DATE NOT NULL,
	TriGia FLOAT NOT NULL,
	MaNV VARCHAR(20) NOT NULL,
	MaKH VARCHAR(20) NOT NULL,
	PRIMARY KEY (SoHDB),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
)

INSERT INTO HoaDonBan(SoHDB, NgayBan, TriGia, MaNV, MaKH) VALUES ('HDB01', '2022-10-24', '300000', 'NV01', 'KH01')
INSERT INTO HoaDonBan(SoHDB, NgayBan, TriGia, MaNV, MaKH) VALUES ('HDB02', '2022-10-24', '600000', 'NV02', 'KH02')
INSERT INTO HoaDonBan(SoHDB, NgayBan, TriGia, MaNV, MaKH) VALUES ('HDB03', '2022-10-24', '150000', 'NV03', 'KH03')
INSERT INTO HoaDonBan(SoHDB, NgayBan, TriGia, MaNV, MaKH) VALUES ('HDB04', '2022-10-25', '1500000', 'NV01', 'KH01')

SELECT * FROM HoaDonBan

-- 9. Bảng Chi Tiết Hóa Đơn Bán
CREATE TABLE ChiTietHDB
(
	SoHDB VARCHAR(20) NOT NULL,
	MaSP VARCHAR(20) NOT NULL,
	SLBan INT NOT NULL,
	DonGia FLOAT NOT NULL,
	GiamGia FLOAT NOT NULL,
	ThanhTien FLOAT NOT NULL,
	PRIMARY KEY (SoHDB, MaSP),
	FOREIGN KEY (SoHDB) REFERENCES HoaDonBan(SoHDB),
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
)

INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB01', 'SP01', '1', '150000', '0', '150000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB01', 'SP02', '1', '150000', '0', '150000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB02', 'SP05', '2', '150000', '0', '300000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB02', 'SP06', '2', '150000', '0', '300000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB03', 'SP01', '1', '150000', '0', '150000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB04', 'SP01', '2', '150000', '0', '300000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB04', 'SP02', '2', '150000', '0', '300000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB04', 'SP07', '2', '150000', '0', '300000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB04', 'SP08', '2', '150000', '0', '300000')
INSERT INTO ChiTietHDB(SoHDB, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDB04', 'SP09', '2', '150000', '0', '300000')


SELECT * FROM ChiTietHDB

-- 10. Bảng Hóa Đơn Nhập
CREATE TABLE HoaDonNhap
(
	SoHDN VARCHAR(20) NOT NULL,
	NgayNhap DATE NOT NULL,
	TriGia FLOAT NOT NULL,
	MaNV VARCHAR(20) NOT NULL,
	MaNCC VARCHAR(20) NOT NULL,
	PRIMARY KEY (SoHDN),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
)

INSERT INTO HoaDonNhap(SoHDN, NgayNhap, TriGia, MaNV, MaNCC) VALUES ('HDN01', '2021-10-24', '300000', 'NV01', 'NCC01')
INSERT INTO HoaDonNhap(SoHDN, NgayNhap, TriGia, MaNV, MaNCC) VALUES ('HDN02', '2021-10-24', '600000', 'NV02', 'NCC02')
INSERT INTO HoaDonNhap(SoHDN, NgayNhap, TriGia, MaNV, MaNCC) VALUES ('HDN03', '2021-10-24', '200000', 'NV03', 'NCC03')
INSERT INTO HoaDonNhap(SoHDN, NgayNhap, TriGia, MaNV, MaNCC) VALUES ('HDN04', '2021-01-01', '1200000', 'NV04', 'NCC03')

-- 11. Bảng Chi Tiết Hóa Đơn Nhập
CREATE TABLE ChiTietHDN
(
	SoHDN VARCHAR(20) NOT NULL,
	MaSP VARCHAR(20) NOT NULL,
	SLBan INT NOT NULL,
	DonGia FLOAT NOT NULL,
	GiamGia FLOAT NOT NULL,
	ThanhTien FLOAT NOT NULL,
	PRIMARY KEY (SoHDN, MaSP),
	FOREIGN KEY (SoHDN) REFERENCES HoaDonNhap(SoHDN),
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
)

INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN01', 'SP01', '2', '100000', '0', '200000')
INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN01', 'SP02', '1', '100000', '0', '100000')
INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN02', 'SP05', '3', '100000', '0', '300000')
INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN02', 'SP06', '3', '100000', '0', '300000')
INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN03', 'SP09', '2', '100000', '0', '200000')
INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN04', 'SP07', '6', '100000', '0', '600000')
INSERT INTO ChiTietHDN(SoHDN, MaSP, SLBan, DonGia, GiamGia, ThanhTien) VALUES ('HDN04', 'SP02', '6', '100000', '0', '600000')

SELECT * FROM ChiTietHDN

-- VIEWS
-- 1 View danh sách nhân viên
CREATE VIEW DSNV 
AS
SELECT 
	MaNV,
	TenNV,
	NgaySinh,
	CASE
		WHEN GioiTinh = 0 THEN N'Nữ'
		ELSE N'Nam'
	END AS GioiTinh,
	DiaChi,
	SDT
FROM NhanVien

SELECT * FROM DSNV

-- 2 View danh sách khách hàng
CREATE VIEW view_dskh
AS
SELECT 
	MaKH,
	TenKH,
	DiaChi,
	SDT
FROM KhachHang

SELECT * FROM view_dskh

-- 3 View hóa đơn có trị giá lớn hơn 1000k
CREATE VIEW view_top_hdb
AS
SELECT
	HDB.*,
	STRING_AGG(CTHDB.MaSP, ', ') AS DSSP 
FROM HoaDonBan AS HDB
INNER JOIN ChiTietHDB AS CTHDB on HDB.SoHDB = CTHDB.SoHDB
WHERE HDB.TriGia > 1000000
GROUP BY 
	HDB.SoHDB, HDB.NgayBan, HDB.TriGia, hdb.MaKH, HDB.MaNV

SELECT * FROM view_top_hdb

-- 4 View top khách hàng có giá trị hóa đơn cao nhất
CREATE VIEW view_top_kh
AS
SELECT TOP 3 WITH TIES 
	KH.MAKH,
	KH.TenKH,
	SUM(HDB.TriGia) AS SoTienDaMua 
FROM KhachHang AS KH
INNER JOIN HoaDonBan AS HDB on KH.MaKH = HDB.MaKH
GROUP BY KH.MaKH, KH.TenKH
ORDER BY SoTienDaMua DESC

SELECT * FROM view_top_kh

--5 View top nhân viên bán được nhiều đơn hàng nhất
CREATE VIEW view_top_nv
AS
SELECT TOP 3 WITH TIES
	NV.MaNV,
	NV.TenNV,
	COUNT(HDB.SoHDB) AS TongHoaDonBan
FROM NhanVien AS NV
INNER JOIN HoaDonBan AS HDB ON NV.MaNV = HDB.MaNV
GROUP BY NV.MaNV, NV.TenNV
ORDER BY TongHoaDonBan DESC

SELECT * FROM view_top_nv

-- 6 View danh sách nhà cung cấp
CREATE VIEW view_ds_ncc
AS
SELECT
	MaNCC,
	TenNCC,
	DiaChi,
	SDT
FROM NhaCungCap

SELECT * FROM view_ds_ncc

-- 7 View danh sách sản phẩm
CREATE VIEW view_ds_sp
AS
SELECT
	SP.MaSP,
	SP.TenSP,
	SP.DonGiaBan,
	SP.DonGiaNhap,
	SP.SoLuongTonKho,
	SP.Anh,
	SP.MauSac,
	NCC.TenNCC,
	BST.TenBST,
	S.ChieuDai,
	S.ChieuRong,
	CL.TenChatLieu,
	CL.DacDiem
FROM SanPham AS SP
INNER JOIN ChatLieu AS CL ON SP.MaChatLieu = CL.MaChatLieu
INNER JOIN Size AS S ON SP.MaSize = S.MaSize
INNER JOIN NhaCungCap AS NCC ON SP.MaNCC = NCC.MaNCC
INNER JOIN BoSuuTap AS BST ON SP.MaBST = BST.MaBST

SELECT * FROM view_ds_sp

-- 8 View hóa đơn nhập có giá trị lớn hơn 1000k
CREATE VIEW view_top_hdn
AS
SELECT
	HDN.*,
	STRING_AGG(CTHDN.MaSP, ', ') AS DSSP 
FROM HoaDonNhap AS HDN
INNER JOIN ChiTietHDN AS CTHDN on HDN.SoHDN = CTHDN.SoHDN
WHERE HDN.TriGia > 1000000
GROUP BY 
	HDN.SoHDN, HDN.NgayNhap, HDN.TriGia, HDN.MaNCC, HDN.MaNV

SELECT * FROM view_top_hdn

-- FUNCTIONS
-- 1 Function tìm nhân viên theo tên
CREATE FUNCTION func_tim_nv_theo_ten(@ten_nv NVARCHAR(50))
RETURNS TABLE
	RETURN
		SELECT * FROM NhanVien WHERE TenNV LIKE '%' + @ten_nv + '%'

SELECT * FROM func_tim_nv_theo_ten('X')

-- 2 Function tìm khách hàng theo tên
CREATE FUNCTION func_tim_kh_theo_ten(@ten_kh NVARCHAR(50))
RETURNS TABLE
	RETURN
		SELECT * FROM KhachHang WHERE TenKH LIKE '%' + @ten_kh + '%'

SELECT * FROM func_tim_kh_theo_ten('A')

-- 3 Function lọc sản phẩm theo bộ sưu tập
CREATE FUNCTION func_loc_san_pham_theo_bst(@ten_bst NVARCHAR(50))
RETURNS TABLE
	RETURN
		SELECT
			SP.MaSP,
			SP.TenSP,
			SP.DonGiaNhap,
			SP.DonGiaBan
		FROM SanPham AS SP
		INNER JOIN BoSuuTap AS BST ON SP.MaBST = BST.MaBST
		WHERE BST.TenBST LIKE '%' + @ten_bst + '%'

SELECT * FROM func_loc_san_pham_theo_bst(N'Nữ')

-- 4 Function lấy chi tiết hóa đơn bán
CREATE FUNCTION func_lay_cthdb(@SoHDB NVARCHAR(20))
RETURNS TABLE
	RETURN
		SELECT
			SP.TenSP,
			CTHDB.SLBan,
			SP.DonGiaBan,
			CTHDB.GiamGia,
			CTHDB.ThanhTien
		FROM ChiTietHDB AS CTHDB
		INNER JOIN SanPham AS SP ON CTHDB.MaSP = SP.MaSP
		WHERE CTHDB.SoHDB = @SoHDB

SELECT * FROM func_lay_cthdb('HDB01')

-- 5 Function lấy thông tin hóa đơn bán
CREATE FUNCTION func_lay_hdb(@SoHDB NVARCHAR(20))
RETURNS TABLE
	RETURN
		SELECT
			HDB.SoHDB,
			HDB.NgayBan,
			HDB.TriGia,
			KH.TenKH,
			KH.DiaChi,
			KH.SDT,
			NV.TenNV
		FROM HoaDonBan AS HDB
		INNER JOIN KhachHang AS KH ON HDB.MaKH = KH.MaKH
		INNER JOIN NhanVien AS NV ON HDB.MaNV = NV.MaNV
		WHERE HDB.SoHDB = @SoHDB

SELECT * FROM func_lay_hdb('HDB03')

-- PROCEDURE
-- 1
CREATE PROC proc_them_nv
	@MaNV VARCHAR(20),
	@TenNV NVARCHAR(50),
	@NgaySinh DATE,
	@GioiTinh BIT,
	@DiaChi NVARCHAR(200),
	@SDT VARCHAR(15)
AS
BEGIN
	INSERT INTO NhanVien(MaNV, TenNV, NgaySinh, GioiTinh, DiaChi, SDT) VALUES (@MaNV, @TenNV, @NgaySinh, @GioiTinh, @DiaChi, @SDT)
END

EXEC proc_them_nv 'NV10', N'Trần Văn Q', '1990-01-24', '1', N'Hải Phòng', '098453627'

-- 2
CREATE PROC proc_them_kh
	@MaKH VARCHAR(20),
	@TenKH NVARCHAR(50),
	@DiaChi NVARCHAR(200),
	@SDT VARCHAR(15)
AS
BEGIN
	INSERT INTO KhachHang(MaKH, TenKH, DiaChi, SDT) VALUES (@MaKH, @TenKH, @DiaChi, @SDT)
END

EXEC proc_them_kh 'KH10', N'Trần Văn JQK', N'Hải Phòng', '0111190836'

-- 3
CREATE PROC proc_them_ncc
	@MaNCC VARCHAR(20),
	@TenNCC NVARCHAR(50),
	@DiaChi NVARCHAR(200),
	@SDT VARCHAR(15)
AS
BEGIN
	INSERT INTO NhaCungCap(MaNCC, TenNCC, DiaChi, SDT) VALUES (@MaNCC, @TenNCC, @DiaChi, @SDT)
END

EXEC proc_them_ncc 'NCC06', N'Adidas', N'Hà Nội', '0222696969'
-- TRIGGERS
-- 1
CREATE OR ALTER TRIGGER trigger_update_quantity_product
AFTER INSERT
AS
BEGIN
	
END