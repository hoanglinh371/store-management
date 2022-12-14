USE [master]
GO
/****** Object:  Database [crown_store_dev]    Script Date: 10/29/2022 1:27:15 PM ******/
CREATE DATABASE [crown_store_dev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'crown_store_dev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\crown_store_dev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'crown_store_dev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\crown_store_dev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [crown_store_dev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [crown_store_dev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [crown_store_dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [crown_store_dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [crown_store_dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [crown_store_dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [crown_store_dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [crown_store_dev] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [crown_store_dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [crown_store_dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [crown_store_dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [crown_store_dev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [crown_store_dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [crown_store_dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [crown_store_dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [crown_store_dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [crown_store_dev] SET  ENABLE_BROKER 
GO
ALTER DATABASE [crown_store_dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [crown_store_dev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [crown_store_dev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [crown_store_dev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [crown_store_dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [crown_store_dev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [crown_store_dev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [crown_store_dev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [crown_store_dev] SET  MULTI_USER 
GO
ALTER DATABASE [crown_store_dev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [crown_store_dev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [crown_store_dev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [crown_store_dev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [crown_store_dev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [crown_store_dev] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [crown_store_dev] SET QUERY_STORE = OFF
GO
USE [crown_store_dev]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](20) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_tim_nv_theo_ten]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_tim_nv_theo_ten](@ten_nv NVARCHAR(50))
RETURNS TABLE
	RETURN
		SELECT * FROM NhanVien WHERE TenNV LIKE '%' + @ten_nv + '%'
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](20) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_tim_kh_theo_ten]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_tim_kh_theo_ten](@ten_kh NVARCHAR(50))
RETURNS TABLE
	RETURN
		SELECT * FROM KhachHang WHERE TenKH LIKE '%' + @ten_kh + '%'
GO
/****** Object:  Table [dbo].[BoSuuTap]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoSuuTap](
	[MaBST] [varchar](20) NOT NULL,
	[TenBST] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](20) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[DonGiaNhap] [float] NOT NULL,
	[DonGiaBan] [float] NOT NULL,
	[SoLuongTonKho] [int] NOT NULL,
	[Anh] [varchar](200) NOT NULL,
	[MauSac] [nvarchar](10) NOT NULL,
	[MaBST] [varchar](20) NOT NULL,
	[MaNCC] [varchar](20) NOT NULL,
	[MaSize] [varchar](20) NOT NULL,
	[MaChatLieu] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[func_loc_san_pham_theo_bst]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[func_loc_san_pham_theo_bst](@ten_bst NVARCHAR(50))
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
GO
/****** Object:  View [dbo].[DSNV]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DSNV] 
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
GO
/****** Object:  View [dbo].[view_dskh]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_dskh]
AS
SELECT 
	MaKH,
	TenKH,
	DiaChi,
	SDT
FROM KhachHang
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[SoHDB] [varchar](20) NOT NULL,
	[NgayBan] [date] NOT NULL,
	[TriGia] [float] NOT NULL,
	[MaNV] [varchar](20) NOT NULL,
	[MaKH] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHDB]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDB](
	[SoHDB] [varchar](20) NOT NULL,
	[MaSP] [varchar](20) NOT NULL,
	[SLBan] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHDB] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_top_hdb]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_top_hdb]
AS
SELECT
	HDB.*,
	STRING_AGG(CTHDB.MaSP, ', ') AS DSSP 
FROM HoaDonBan AS HDB
INNER JOIN ChiTietHDB AS CTHDB on HDB.SoHDB = CTHDB.SoHDB
WHERE HDB.TriGia > 1000000
GROUP BY 
	HDB.SoHDB, HDB.NgayBan, HDB.TriGia, hdb.MaKH, HDB.MaNV
GO
/****** Object:  View [dbo].[view_top_kh]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_top_kh]
AS
SELECT TOP 3 WITH TIES 
	KH.MAKH,
	KH.TenKH,
	SUM(HDB.TriGia) AS SoTienDaMua 
FROM KhachHang AS KH
INNER JOIN HoaDonBan AS HDB on KH.MaKH = HDB.MaKH
GROUP BY KH.MaKH, KH.TenKH
ORDER BY SoTienDaMua DESC
GO
/****** Object:  View [dbo].[view_top_nv]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_top_nv]
AS
SELECT TOP 3 WITH TIES
	NV.MaNV,
	NV.TenNV,
	COUNT(HDB.SoHDB) AS TongHoaDonBan
FROM NhanVien AS NV
INNER JOIN HoaDonBan AS HDB ON NV.MaNV = HDB.MaNV
GROUP BY NV.MaNV, NV.TenNV
ORDER BY TongHoaDonBan DESC
GO
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatLieu](
	[MaChatLieu] [varchar](20) NOT NULL,
	[TenChatLieu] [nvarchar](50) NOT NULL,
	[DacDiem] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChatLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHDN]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHDN](
	[SoHDN] [varchar](20) NOT NULL,
	[MaSP] [varchar](20) NOT NULL,
	[SLBan] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[GiamGia] [float] NOT NULL,
	[ThanhTien] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonNhap]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonNhap](
	[SoHDN] [varchar](20) NOT NULL,
	[NgayNhap] [date] NOT NULL,
	[TriGia] [float] NOT NULL,
	[MaNV] [varchar](20) NOT NULL,
	[MaNCC] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SoHDN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](20) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 10/29/2022 1:27:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[MaSize] [varchar](20) NOT NULL,
	[ChieuDai] [int] NOT NULL,
	[ChieuRong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (N'BST01', N'Áo')
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (N'BST02', N'Quần')
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (N'BST03', N'Giày')
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (N'BST04', N'Nam')
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (N'BST05', N'Nữ')
GO
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu], [DacDiem]) VALUES (N'CL01', N'Vải Cotton', N'Thoáng mát')
INSERT [dbo].[ChatLieu] ([MaChatLieu], [TenChatLieu], [DacDiem]) VALUES (N'CL02', N'Vải Len', N'Giữ nhiệt tốt, phù hợp cho mùa đông')
GO
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB01', N'SP01', 1, 150000, 0, 150000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB01', N'SP02', 1, 150000, 0, 150000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB02', N'SP05', 2, 150000, 0, 300000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB02', N'SP06', 2, 150000, 0, 300000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB03', N'SP01', 1, 150000, 0, 150000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB04', N'SP01', 2, 150000, 0, 300000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB04', N'SP02', 2, 150000, 0, 300000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB04', N'SP07', 2, 150000, 0, 300000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB04', N'SP08', 2, 150000, 0, 300000)
INSERT [dbo].[ChiTietHDB] ([SoHDB], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDB04', N'SP09', 2, 150000, 0, 300000)
GO
INSERT [dbo].[ChiTietHDN] ([SoHDN], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDN01', N'SP01', 2, 100000, 0, 200000)
INSERT [dbo].[ChiTietHDN] ([SoHDN], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDN01', N'SP02', 1, 100000, 0, 100000)
INSERT [dbo].[ChiTietHDN] ([SoHDN], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDN02', N'SP05', 3, 100000, 0, 300000)
INSERT [dbo].[ChiTietHDN] ([SoHDN], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDN02', N'SP06', 3, 100000, 0, 300000)
INSERT [dbo].[ChiTietHDN] ([SoHDN], [MaSP], [SLBan], [DonGia], [GiamGia], [ThanhTien]) VALUES (N'HDN03', N'SP09', 2, 100000, 0, 200000)
GO
INSERT [dbo].[HoaDonBan] ([SoHDB], [NgayBan], [TriGia], [MaNV], [MaKH]) VALUES (N'HDB01', CAST(N'2022-10-24' AS Date), 300000, N'NV01', N'KH01')
INSERT [dbo].[HoaDonBan] ([SoHDB], [NgayBan], [TriGia], [MaNV], [MaKH]) VALUES (N'HDB02', CAST(N'2022-10-24' AS Date), 600000, N'NV02', N'KH02')
INSERT [dbo].[HoaDonBan] ([SoHDB], [NgayBan], [TriGia], [MaNV], [MaKH]) VALUES (N'HDB03', CAST(N'2022-10-24' AS Date), 150000, N'NV03', N'KH03')
INSERT [dbo].[HoaDonBan] ([SoHDB], [NgayBan], [TriGia], [MaNV], [MaKH]) VALUES (N'HDB04', CAST(N'2022-10-25' AS Date), 1500000, N'NV01', N'KH01')
GO
INSERT [dbo].[HoaDonNhap] ([SoHDN], [NgayNhap], [TriGia], [MaNV], [MaNCC]) VALUES (N'HDN01', CAST(N'2021-10-24' AS Date), 300000, N'NV01', N'NCC01')
INSERT [dbo].[HoaDonNhap] ([SoHDN], [NgayNhap], [TriGia], [MaNV], [MaNCC]) VALUES (N'HDN02', CAST(N'2021-10-24' AS Date), 600000, N'NV02', N'NCC02')
INSERT [dbo].[HoaDonNhap] ([SoHDN], [NgayNhap], [TriGia], [MaNV], [MaNCC]) VALUES (N'HDN03', CAST(N'2021-10-24' AS Date), 200000, N'NV03', N'NCC03')
GO
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH01', N'Nguyễn Văn A', N'Thanh Xuân, Hà Nội', N'0123456789')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH02', N'Nguyễn Văn B', N'Cầu Giấy, Hà Nội', N'0126985631')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH03', N'Nguyễn Văn C', N'Nam Từ Liêm, Hà Nội', N'0998765432')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH04', N'Nguyễn Văn D', N'Hoàng Mai, Hà Nội', N'0369874125')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH05', N'Nguyễn Văn E', N'Đống Đa, Hà Nội', N'0555986314')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH06', N'Nguyễn Văn F', N'Tả Thanh Oai, Hà Nội', N'0339687415')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH07', N'Nguyễn Văn G', N'Bắc Từ Liêm, Hà Nội', N'0369877778')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH08', N'Nguyễn Văn H', N'Cấu Giấy, Hà Nội', N'0333999874')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (N'KH09', N'Nguyễn Văn J', N'Thanh Xuân, Hà Nội', N'0123555987')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC01', N'May10', N'Gò Vấp, TP. Hồ Chí Minh', N'0288888888')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC02', N'Coolmate', N'Vạn Phúc, Hà Đông', N'0369147258')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC03', N'Uniqlo', N'Quận 1, TP. Hồ Chí Minh', N'0357159842')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC04', N'COS', N'Ngô Quyền, Hải Phòng', N'0222229874')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (N'NCC05', N'Bitis', N'Thanh Xuân, Hà Nội', N'0269696969')
GO
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV01', N'Phạm Văn X', CAST(N'2002-01-01' AS Date), 0, N'Thanh Xuân, Hà Nội', N'0123999874')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV02', N'Phạm Văn Y', CAST(N'2001-05-05' AS Date), 1, N'Nam Từ Liêm, Hà Nội', N'0999888777')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV03', N'Phạm Văn Z', CAST(N'2003-05-06' AS Date), 0, N'Nam Từ Liêm, Hà Nội', N'0369369369')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV04', N'Phạm Văn W', CAST(N'2004-05-19' AS Date), 1, N'Nam Từ Liêm, Hà Nội', N'0147147147')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV05', N'Phạm Văn T', CAST(N'2005-05-25' AS Date), 0, N'Thanh Xuân, Hà Nội', N'0258258258')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV06', N'Phạm Văn Y', CAST(N'1990-03-05' AS Date), 1, N'Thanh Xuân, Hà Nội', N'0123123123')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV07', N'Phạm Văn U', CAST(N'1997-02-05' AS Date), 0, N'Cầu Giấy, Hà Nội', N'0456456456')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV08', N'Phạm Văn J', CAST(N'1998-01-05' AS Date), 1, N'Thanh Xuân, Hà Nội', N'0789789789')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NgaySinh], [GioiTinh], [DiaChi], [SDT]) VALUES (N'NV09', N'Phạm Văn K', CAST(N'1999-09-05' AS Date), 1, N'Thanh Xuân, Hà Nội', N'0159159159')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP01', N'Burgundy T-shirt', 100000, 150000, 100, N'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Đen', N'BST04', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP02', N'Jean Long Sleeve', 100000, 150000, 100, N'https://i.ibb.co/VpW4x5t/roll-up-jean-shirt.png', N'Đen', N'BST04', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP03', N'Pink T-shirt', 100000, 150000, 100, N'https://i.ibb.co/RvwnBL8/pink-shirt.png', N'Hồng', N'BST04', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP04', N'Black & White Longsleeve', 100000, 150000, 100, N'https://i.ibb.co/55z32tw/long-sleeve.png', N'Đen', N'BST04', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP05', N'Floral T-shirt', 100000, 150000, 100, N'https://i.ibb.co/qMQ75QZ/floral-shirt.png', N'Đen', N'BST04', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP06', N'Camo Down Vest', 100000, 150000, 100, N'https://i.ibb.co/xJS0T3Y/camo-vest.png', N'Đen', N'BST04', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP07', N'White Blouse', 100000, 150000, 100, N'https://i.ibb.co/qBcrsJg/white-vest.png', N'Trắng', N'BST05', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP08', N'Yellow Track Suit', 100000, 150000, 100, N'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Vàng', N'BST05', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP09', N'Striped Sweater', 100000, 150000, 100, N'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Đen', N'BST05', N'NCC02', N'AOL', N'CL01')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [DonGiaNhap], [DonGiaBan], [SoLuongTonKho], [Anh], [MauSac], [MaBST], [MaNCC], [MaSize], [MaChatLieu]) VALUES (N'SP10', N'Red Dots Dress', 100000, 150000, 100, N'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', N'Đen', N'BST05', N'NCC02', N'AOL', N'CL01')
GO
INSERT [dbo].[Size] ([MaSize], [ChieuDai], [ChieuRong]) VALUES (N'AO2XL', 74, 60)
INSERT [dbo].[Size] ([MaSize], [ChieuDai], [ChieuRong]) VALUES (N'AOL', 70, 56)
INSERT [dbo].[Size] ([MaSize], [ChieuDai], [ChieuRong]) VALUES (N'AOM', 68, 54)
INSERT [dbo].[Size] ([MaSize], [ChieuDai], [ChieuRong]) VALUES (N'AOXL', 72, 58)
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD FOREIGN KEY([SoHDB])
REFERENCES [dbo].[HoaDonBan] ([SoHDB])
GO
ALTER TABLE [dbo].[ChiTietHDB]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD FOREIGN KEY([SoHDN])
REFERENCES [dbo].[HoaDonNhap] ([SoHDN])
GO
ALTER TABLE [dbo].[ChiTietHDN]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonNhap]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaBST])
REFERENCES [dbo].[BoSuuTap] ([MaBST])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([MaChatLieu])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaSize])
REFERENCES [dbo].[Size] ([MaSize])
GO
USE [master]
GO
ALTER DATABASE [crown_store_dev] SET  READ_WRITE 
GO
