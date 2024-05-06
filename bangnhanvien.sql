CREATE DATABASE QUANLYBANHANG
go
use QUANLYBANHANG
CREATE TABLE sanpham 
(
masp char (10) NOT NULL,
CONSTRAINT pk_masp PRIMARY KEY (masp),
tensp nvarchar (50) NULL,
dvt nvarchar (30) NULL,
nuocsx nvarchar (50),
gia float NOT NULL,
soluong float NOT NULL
)
CREATE TABLE nhanvien 
(
manv char (10) NOT NULL,
CONSTRAINT pk_manv PRIMARY KEY (manv),
hoten nvarchar (60) NOT NULL,
ngaysinh date NULL,
gioitinh bit NULL,
ngaylamviec date NULL,
sodt char(11) NULL,
email char(30) NULL
)
go
CREATE TABLE khachhang
(
makh char(10) NOT NULL,
CONSTRAINT pk_makh PRIMARY KEY (makh),
hoten nvarchar (60) NOT NULL,
diachi nvarchar (100) NULL,
sodt char(11) NULL,
ngaysinh date NULL,
doanhso float NULL
)
go
CREATE TABLE hoadon 
(
soHD char(10) NOT NULL,
CONSTRAINT pk_soHD PRIMARY KEY (soHD),
ngayHD date NOT NULL,
makh char (10) NOT NULL,
manv char(10) NOT NULL,
trigia float NULL
)
go
CREATE TABLE CTHD
(
soHD char (10) NOT NULL,
masp char(10) NOT NULL,
CONSTRAINT pk_pk PRIMARY KEY (soHD,masp),
soluong float,
giaban float
)
ALTER TABLE hoadon
ADD CONSTRAINT fk1 FOREIGN KEY (manv) REFERENCES nhanvien (manv)
ALTER TABLE hoadon
ADD CONSTRAINT fk4 FOREIGN KEY (makh) REFERENCES khachhang(makh)
ALTER TABLE CTHD
ADD CONSTRAINT fk2 FOREIGN KEY (masp) REFERENCES sanpham (masp)
ALTER TABLE CTHD
ADD CONSTRAINT fk3 FOREIGN KEY (soHD) REFERENCES hoadon (soHD)
ALTER TABLE nhanvien
ADD CONSTRAINT c_tuoi CHECK (year(Getdate())-year(ngaysinh)>18)
ALTER TABLE khachhang
ADD CONSTRAINT sodt UNIQUE (sodt)
ALTER TABLE sanpham
ADD CONSTRAINT c_soluong CHECK (soluong >=50)
ALTER TABLE CTHD
ADD CONSTRAINT pk5 CHECK (soluong >0)
UPDATE sanpham
SET gia=gia*0.1 where soluong<20
ALTER TABLE khachhang 
ADD mail nvarchar (50)
select * from khachhang
ALTER TABLE khachhang
DROP column mail
select *from nhanvien
INSERT INTO NHANVIEN (MANV, HOTEN, NGAYSINH, GIOITINH, NGAYLAMVIEC, SODT, EMAIL)
VALUES
('NV001', N'Trần Thiên Thạch', '2002-02-12', 0, '2022-03-17', '01234576', 'Lasothidaolop 12c6@gmail.com'),
('NV002', N'Mai Nguyễn Anh Kiệt', '2002-12-11', 0, '2022-03-17', '345467343', 'mainguyenanhkiet0167@gmail.com'),
('NV003', N'Trần Lê Văn', '2002-12-11', 0, '2003-09-20', '345293477', 'levanhcb@gmail.com'),
('NV004', N'Trần Đinh Thị Kim Yến', '2003-09-23', 1, '2022-03-17', '328379251', 'tranthikimyen1111@gmail.com'),
('NV005', N'Lê Anh Tú', '2003-02-02', 0, '2022-03-12', '3925007007', 'cntt44dleanhtu0605@gmail.com'),
('NV006', N'Nguyễn Quang Dũng', '2002-02-06', 0, '2022-03-11', '395089035', 'cntt44quangdung0624@gmail.com'),
('NV007', N'Đặng Văn Dương', '2002-06-06', 0, '2022-03-23', '358036264', 'duongmap0396@gmail.com'),
('NV008', N'Hà Vĩ Quang', '2003-10-12', 0, '2022-05-12', '349324229', 'Cnttk44dhavi0631@gmail.com'),
('NV009', N'Hồ Xuân Hậu', '2003-09-24', 0, '2022-03-17', '369380853', 'Hoxuanhau0634@gmail.com'),
('NV010', N'Bùi Mai Hiên', '2003-07-07', 1, '2022-03-17', '865183128', 'cntt44dbuimaihien@gmail.com'),
('NV011', N'Nguyên Trọng', '2001-07-07', 1, '2022-03-17', '865183128', 'cntt43dbuimaihien@gmail.com'),
('NV012', N'Hồ Văn Nam', '1995-07-08', 1, '2003-09-10', '8651831288', 'cntt42dbuimaihien@gmail.com'),
('NV013', N'Hồ Hà', '1995-07-07', 1, '2005-10-20', '8651831888', 'cntt41dbuimaihien@gmail.com'),
('NV014', N'Nguyễn Hiền', '1995-07-07', 1, '2005-10-20', '8651831888', 'cntt41dbuimaihien@gmail.com')

select * from khachhang
INSERT INTO KHACHHANG (MAKH, HOTEN, DIACHI, SODT, NGAYSINH, DOANHSO)
VALUES
('KH01', N'NGUYỄN VĂN AN', N'HÙNG VƯƠNG, GIA LAI', '01234567', '1999-02-14', 10),
('KH02', N'NGUYỄN ANH TÀI', N'TRẦN VĂN ƠN, BÌNH ĐỊNH', '01234523', '1989-05-21', 8),
('KH03', N'NGUYỄN ĐẶNG TRƯỞNG THÀNH', N'PHÚ HÒA, ĐỒNG THÁP', '01235667', '1990-03-12', 2),
('KH04', N'NGUYỄN THỊ THU', N'PHÚ THỌ', '012467567', '1989-04-13', 5),
('KH05', N'NGUYỄN MINH TUẤN', N'LAI CHU', '01214567', '1969-05-10', 7),
('KH06', N'TRẦN LẺ TUẤN VŨ', N'SAPA', '01254567', '1999-06-11', 11),
('KH07', N'NGUYỄN HOÀI LINH', N'HÀ NỘI', '01424567', '2000-07-21', 21),
('KH08', N'NGUYỄN THU SƯƠNG', N'TP HCM', '0104567', '2002-08-24', 22),
('KH09', N'ĐẶNG VĂN LINH', N'CẦN THƠ', '01098567', '2001-09-23', 11),
('KH10', N'NGUYỄN HÙNG DŨNG', N'ĐIỆN BIÊN', '09894567', '1994-10-14', 9),
('KH11', N'ĐẶNG VĂN LINH', N'CẦN THƠ', '01234576', '2001-09-23', 11)

select * from SANPHAM
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA, SOLUONG)
VALUES
('SP01', N'NƯỚC HOA', N'Chai', N'VIỆT NAM', 100, 55),
('SP02', 'OSHI', N'Thùng', N'HÀ LAN', 100, 120),
('SP03', N'NƯỚC LỌC', N'Thùng', N'VIỆT NAM', 150, 230),
('SP04', 'COCA COLA', 'Chai', N'HÀN QUỐC', 200, 150),
('SP05', 'PANADOL', N'Viên', 'CAMPUCHIA', 20000, 1250),
('SP06', N'ĐƯỜNG', 'Kg', N'VIỆT NAM', 20000, 90),
('SP07', N'ẨM TRÀ', N'Bộ', N'VIỆT NAM', 20000, 1230),
('SP08', N'QUẠT', N'Cái', N'VIỆT NAM', 20000, 131),
('SP09', N'MŨ', N'Cái', N'TRUNG QUỐC', 20000, 122),
('SP10', N'ÁO', N'Cái', N'ẤN ĐỘ', 20000, 736),
('SP11', N'SỮA', N'Thùng', N'ẤN ĐỘ', 20000, 736);

select * from  hoadon
INSERT INTO HOADON (SOHD, NGAYHD, MAKH, MANV, TRIGIA)
VALUES
('HD01', '2022-02-02', 'KH01', 'NV001', 100000),
('HD02', '2022-02-12', 'KH02', 'NV002', 200000),
('HD03', '2022-02-12', 'KH03', 'NV003', 300000),
('HD04', '2022-02-18', 'KH03', 'NV004', 400000),
('HD05', '2022-02-18', 'KH04', 'NV005', 500000),
('HD06', '2022-02-20', 'KH05', 'NV006', 600000),
('HD07', '2022-02-22', 'KH06', 'NV007', 700000),
('HD08', '2022-02-27', 'KH07', 'NV008', 800000),
('HD09', '2022-03-02', 'KH08', 'NV009', 900000),
('HD10', '2022-03-12', 'KH09', 'NV010', 1000000),
('HD11', '2022-03-22', 'KH06', 'NV007', 1100000),
('HD12', '2022-04-12', 'KH01', 'NV007', 1200000),
('HD13', '2024-03-12', 'KH01', 'NV007', 1200000)
select* from CTHD
INSERT INTO CTHD (SOHD, MASP, SOLUONG, GIABAN) 
VALUES
('HD01', 'SP01', 55, 400),
('HD01', 'SP05', 120, 1200),
('HD02', 'SP01', 120, 1200),
('HD03', 'SP02', 100, 13),
('HD04', 'SP03', 200, 10),
('HD05', 'SP01', 50, 100),
('HD06', 'SP02', 9010, 10),
('HD07', 'SP05', 1230, 20),
('HD08', 'SP07', 131, 100),
('HD09', 'SP04', 122, 30),
('HD10', 'SP06', 736, 200),
('HD11', 'SP11', 77, 500),
('HD12', 'SP01', 55, 400),
('HD13', 'SP01', 55, 400)
--thực hành 2:
-- 1.truy vấn mã sản phẩm , tên sản phẩm và số lượng sản phẩm hiện có trong công ty
SELECT masp, tensp, soluong FROM sanpham
-- 2.Địa chỉ, điện thoại của các khách hàng ở Bình Định
SELECT diachi, sodt FROM khachhang 
WHERE diachi like N'%BÌNH ĐỊNH%'
-- 3.Mã và tên sản phẩm có giá lớn hơn 100000 và số lượng hiện có ít hơn 50
SELECT masp,tensp FROM sanpham
WHERE gia >100000 and soluong <50
-- 4.Những sản phẩm nào được sản xuất ở Việt Nam
SELECT tensp,nuocsx FROM sanpham
WHERE nuocsx=N'VIỆT NAM'
-- 5.Những khách hàng nào đã mua sữa của công ty
SELECT k.hoten FROM CTHD as c ,hoadon as h,khachhang as k
where c.masp ='SP11' and h.sohd = c.sohd and h.makh = k.makh

--6.Đơn hàng số HD01 do ai đặt và do nhân viên nào lập, trị giá là bao nhiêu?
SELECT * FROM CTHD
where soHD='HD01'
--7.Hãy cho biết có những nhân viên nào lại chính là khách hàng của công ty (có cùng
sodt)
SELECT * from nhanvien,khachhang
where nhanvien.sodt=khachhang.sodt
--8.Họ tên, địa chỉ và ngày bắt đầu làm việc của các nhân viên trong công ty có ngày bắt đầu là ngày 17/3/2022?
SELECT hoten,ngaylamviec FROM nhanvien
where ngaylamviec >='20220317'
--9.Liệt kê danh sách những nhân viên có cùng ngày sinh.
select  * into nhanvien1 from nhanvien
select * into nhanvien2 from nhanvien
select nhanvien1.hoten,nhanvien1.ngaysinh from nhanvien1,nhanvien2
where nhanvien1.manv <> nhanvien2.manv and nhanvien1.ngaysinh = nhanvien2.ngaysinh
--10.Những nhân viên nào của công ty có thâm niên cao nhất?
select top (5) hoten, ngaylamviec from nhanvien order by ngaylamviec asc
--11.Cho biết thông tin TENSP, SOLUONG, DVT, SOHD, HOTEN của những khách hàng có địa chỉ ở BÌNH ĐỊNH săp xếp tăng dần theo SOHD
select s.tensp,s.soluong,s.dvt,h.sohd,k.hoten from khachhang as k,sanpham as s, hoadon as h, CTHD as c
where k.diachi like N'%Bình Định%' and h.soHD=c.soHD and c.masp = s.masp order by (h.sohd)
-- 12.Cho biết thông tin TENSP, SOLUONG, DVT, SOHD của những hóa đơn có ngày và tháng trùng với ngày và tháng của ngày hiện tại (ngày đang làm thực hành)
select s.tensp,c.soluong,s.dvt,c.sohd from sanpham as s, cthd as c, hoadon as h
where day(getdate())=day(h.ngayHD) and month(getdate())=month (h.ngayHD) and c.sohd=h.sohd and c.masp=s.masp
--13.Cho biết thông tin của những sản phẩm bán trong tháng 2, 3.
select s.tensp,h.ngayhd from sanpham as s,hoadon as h
where month(h.ngayhd) IN (2,3)
--14.Hiển thị những thông tin: Masp, TenSP, NuocSX, số lượng bán, (Những sản phẩm nào chưa được bán cũng được hiển thị thông tin).
--c1: nối trái
select sp.masp, sp.tensp,sp.nuocsx, c.soluong from sanpham as sp left join cthd as c
on sp.masp=c.masp
--c2: nối phải
select sp.masp, sp.tensp,sp.nuocsx,c.soluong from cthd as c right join sanpham as sp
on sp.masp=c.masp
--15.Hiển thị những thông tin: TenKH, Địa chỉ, SoDT, SoHD, (Những khách hàng chưa mua lần nào cũng được hiển thị thông tin).
select kh.hoten, kh.diachi, kh.sodt, hd.sohd from khachhang as kh left join hoadon as hd
on kh.makh=hd.makh
--16.Tạo bảng LUU những sản phẩm được mua trong tháng 3 năm 2022.
select s.tensp into luu from sanpham as s,hoadon as h
where month(h.ngayhd) in (3) and year (h.ngayhd) in (2022)
select * from luu
--17.Xóa những hóa đơn của khách hàng có địa chỉ ở Côn Đảo
select h.SOHD, h.NGAYHD, h.MAKH, h.MANV, h.TRIGIA from hoadon as h,khachhang as k
where k.diachi<>N'Côn Đảo' and h.makh= k.makh
--18.Cập nhật lại giá tăng lên 10% so với giá hiện tại cho những sản phẩm có tên bắt đầu bằng chữ N.
update sanpham  set gia=gia*0.1
where tensp like N'N%'
select s.tensp,s.gia from sanpham as s
-- 19.Đơn hàng hd01 do nhân viên nào lập và địa chỉ giao hàng ở dâu.
select n.hoten,k.diachi from hoadon as h, nhanvien as n, khachhang as k
where h.sohd='hd01' and h.manv =n.manv and h.makh= k.makh
--20.Liệt kê những sản phẩm bán trong ngày 18/2.
select s.tensp from sanpham as s, hoadon as h, cthd as c
where day(h.ngayhd) in (18) and month (h.ngayhd) in (2) and h.sohd =c.sohd and s.masp=c.masp
--xuất ra tên sản phẩm có tổng số sản phẩm bán nhiều nhất
--test
select sp.tensp,count (c.soluong)  as so from cthd as c, sanpham as sp
where sp.masp=c.masp and sp.masp in (select masp from cthd)
 group by sp.tensp, sp.masp
--thực hành 3
select * from nhanvien
select * from khachhang
select * from sanpham
select *from hoadon
select *from cthd
-- 1.Tổng số tiền mà khách hàng phải trả cho các hóa đơn là bao nhiêu
select sohd,sum(soluong*giaban) as [số tiền mà khách cần phải trả]
from cthd
group by sohd
-- 2.tổng số sản phẩm của từng nước sản xuất
select nuocsx, count (*) as số from sanpham 
group by nuocsx
-- 3.với tùng nước sản xuất , tìm giá bán cao nhất , thấp nhất , trung bình của các sản phẩm
select nuocsx, max(gia) as [giá lớn nhất], min (gia) as [giá thấp nhất], avg(gia) as [trung bình giá] from sanpham
group by nuocsx
-- 4.cho biết các mặt hàng đã bán
select sp.tensp from sanpham as sp, cthd as c
where sp.masp=c.masp
group by sp.tensp
--5.Cho biết SOHD, TENSP, SOLUONG, DONGIA, THANHTIEN của hóa đơn số HD002.
select c.sohd, sp.tensp,c.soluong,hd.trigia,thanhtien = (c.giaban*c.soluong) from cthd as c, hoadon as hd, sanpham as sp
where c.sohd=hd.sohd and sp.masp= c.masp and c.sohd ='hd02'
group by c.sohd,sp.tensp,c.soluong,hd.trigia,c.giaban,c.soluong
--6.Cho biết SOHD, TENSP, SOLUONG, DONGIA, THANHTIEN có THANHTIEN trong đoạn 10.000 đến 20.000
select c.sohd,sp.tensp,c.soluong,hd.trigia, c.giaban*c.soluong as thanhtien from cthd as c, hoadon as hd, sanpham as sp
where c.sohd=hd.sohd and c.masp= sp.masp and c.giaban*c.soluong between 10000 and 20000
group by c.sohd,sp.tensp,sp.masp,c.soluong,hd.trigia,c.giaban,c.soluong
--7 số lượng bán của mỗi sản phẩm
select c.masp,sp.tensp, sum(c.soluong) as [số lượng bán của mỗi sản phẩm] from cthd as c inner join sanpham as sp
on c.masp=sp.masp
group by c.masp,sp.tensp
-- 8. Cho biết số lượng đơn hàng xuất vào tháng 3.
select c.sohd , sum(c.soluong) as [số lượng đơn hàng bán vào tháng 3] from cthd as c inner join hoadon as hd
on hd.sohd=c.sohd
where month (hd.ngayHD) in (3)
group by c.sohd
-- 9. Cập nhập cho giá trị trường trị giá trong bảng HOADON, trị giá là tổng soluong*dongia của từng hóa đơn
update hoadon set trigia=(select sum (soluong*giaban) from cthd, hoadon
where hoadon.sohd=cthd.sohd
group by cthd.sohd)
--khởi động lại trigia ve mat định
update hoadon set trigia=10000 where sohd='hd01'
update hoadon set trigia=20000 where sohd='hd02'
update hoadon set trigia=30000 where sohd='hd03'
update hoadon set trigia =40000 where sohd='hd04'
UPDATE hoadon SET trigia = 50000 WHERE sohd = 'hd05'
UPDATE hoadon SET trigia = 60000 WHERE sohd = 'hd06'
UPDATE hoadon SET trigia = 70000 WHERE sohd = 'hd07'
UPDATE hoadon SET trigia = 80000 WHERE sohd = 'hd08'
UPDATE hoadon SET trigia = 90000 WHERE sohd = 'hd09'
UPDATE hoadon SET trigia = 100000 WHERE sohd = 'hd10'
UPDATE hoadon SET trigia = 110000 WHERE sohd = 'hd11'
UPDATE hoadon SET trigia = 120000 WHERE sohd = 'hd12'
UPDATE hoadon SET trigia = 130000 WHERE sohd = 'hd13'
-- 10. tính trị giá cho mỗi hóa đơn
select hd.sohd,c.soluong*c.giaban as [trị giá]from hoadon as hd, cthd as c
where hd.sohd=c.sohd 
group by hd.sohd,c.soluong,c.giaban
-- 11.Mỗi nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu chưa từng lập hóa đơn nào thì cho kết quả là 0)?
select hd.manv ,nv.hoten,count(hd.manv) as [số đơn hàng nhân viên đã đặt] from nhanvien  as nv left join hoadon as hd
on nv.manv=hd.manv
group by hd.manv, nv.hoten
select * from hoadon
--cách 2:
select nv.hoten ,coalesce( count (hd.manv),0 )as [số đơn hàng mà nhân viên đã đặt] from hoadon as hd right join nhanvien as nv
on hd.manv=nv.manv
group by nv.manv, nv.hoten
--12 tính tổng số tiền mà mỗi mặt hàng được bán trong mỗi năm
select year(hd.ngayHD) as 'nam',sum (c.soluong*c.giaban) as [tổng số tiền bán trong năm]  from hoadon as hd inner join cthd as c
on hd.sohd=c.sohd
group by year(hd.ngayHD)
--13.trong năm 2022 những sản phẩm nào đặt mua đúng 1 lần
select c.masp from cthd as c inner join hoadon as hd
on c.sohd=hd.sohd
where year(hd.ngayHD) in (2022)
group by c.masp
having count (*) = 1
--14. số tiền nhiều nhất mà khách hàng bỏ ra để mua hàng là
select hd.makh,kh.hoten, max(c.soluong*c.giaban) as [số tiền nhiều nhất mà khách hàng bỏ ra mua hàng] from khachhang as kh join hoadon as hd
on kh.makh=hd.makh
join cthd as c
on c.sohd =hd.sohd
group by hd.makh,kh.hoten
select * from hoadon
select * from cthd
select * from sanpham
--15. xóa những đơn hàng có số lượng đặt nhỏ hơn 5
delete from cthd
where sohd= (select sohd from cthd group by sohd having sum(soluong) < 5)
--16.Cho biết tên sản phẩm, tổng số lượng bán theo từng ngày
select day(hd.ngayHD) as [ngày bán], sp.tensp, sum (c.soluong) as [tổng số lượng bán trong ngày ]from sanpham as sp join cthd as c
on sp.masp=c.masp 
join hoadon as hd
on c.sohd=hd.sohd
group by day(hd.ngayHD),sp.tensp
--17.Cho biết các sản phẩm có trung bình số lượng bán lớn hơn 15
select sp.tensp, avg(c.soluong)as[trung bình số lượng bán lớn hơn 15] from sanpham as sp inner join cthd as c
on sp.masp=c.masp
group by c.masp,sp.tensp
having avg(c.soluong) >15
--18.Cho biết những đơn đặt hàng có số sản phẩm < 4
select sohd, count(*) as[đơn đặt hàng có số sản phẩm] from cthd
where soluong < 4
group by sohd 
select * from cthd
select * from sanpham
--19. cho biết trị giá của HD05
select trigia from hoadon 
where sohd='HD05'
--20. cho biết đơn hàng nào có doanh thu cao nhất, biết doanh thu nhập bằng giá bán* số lượng bán- ja nhập*số lượng bán
select sp.tensp , sum(c.soluong*c.giaban)- sum (c.soluong*sp.gia) as[doanh thu lon] from sanpham as sp, cthd as c
where sp.masp=c.masp
group by sp.tensp, c.masp
having sum(c.soluong*c.giaban)-sum(c.soluong*sp.gia)= (select top (1) sum (c.soluong *c.giaban)-sum (c.soluong*sp.gia) as doanhthumax
from sanpham as sp, cthd as c
where sp.masp =c.masp group by sp.tensp,c.masp order by doanhthumax desc)
--c2:
select top (1) sp.tensp, sum (c.soluong* c.giaban) - sum (c.soluong*sp.gia) as [Doanh thu cao nhất]from sanpham as sp inner join cthd as c
on sp.masp=c.masp
group by sp.tensp,c.masp
order by [Doanh thu cao nhất] desc
--------------------------------------------------------------------------------------------------------------------
--thực hành 4
select * from nhanvien 
select * from khachhang
select * from sanpham 
select * from cthd
select * from hoadon
--1. cho biết những sản phẩm có giá bằng với giá lớn nhất.
select tensp, max(gia) as 'gia lon nhat' from sanpham
where gia in (select max(gia) from sanpham)
group by tensp
--2.Cho biết danh sách khách hàng chưa từng mua hàng của công ty
select kh.hoten, kh.makh from khachhang as kh left join hoadon as hd
on kh.makh=hd.makh
where kh.makh not in (select makh from hoadon)
--3. cho viết MASP,TENSP chưa được bán
select sp.masp,sp.tensp from sanpham as sp left join cthd as c
on sp.masp= c.masp
where sp.masp not in (select masp from cthd)
--4.cho biết thông tin sản phẩm chưa được bán vào tháng 2
select sp.tensp,sp.masp,sp.nuocsx, sp.soluong, sp.gia from sanpham as sp left join cthd as c
on sp.masp= c.masp
left join hoadon as hd
on hd.soHD = c.sohd
where sp.masp not in (select c.masp from cthd as c join hoadon as hd on c.sohd=hd.sohd 
where month (hd.ngayhd) in (2) group by c.masp,c.sohd)
--5.Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và	số lượng hàng bán của những công ty này là bao nhiêu
select hd.manv,nv.hoten, sum(c.soluong) as [Nhân viên bán được nhiều hàng nhất] from nhanvien as nv join hoadon as hd
on nv.manv=hd.manv
join cthd as c
on c.sohd=hd.sohd
group by hd.manv,nv.hoten
having sum(c.soluong) in (select top 1 sum(c.soluong) as [soluong] from cthd
as c join hoadon as hd on hd.sohd = c.sohd group by hd.manv,c.sohd order by [soluong] desc )
--6.Đơn hàng nào có số lượng đặt mua ít nhất
select top 1 c.sohd,sum(c.soluong) as [số lượng đặt hàng ít nhất] from cthd as c
group by c.sohd
order by sum(c.soluong)
--7.số tiền nhiều nhất mà khách hàng từng bỏ ra để đặt hàng trong các đơn hàng là bao nhiêu. (trị giá)
select top 1 hd.makh,kh.hoten, sum(hd.trigia) as[số tiền nhiều nhất mà khách từng đặt mua hàng] from hoadon as hd join khachhang as kh
on kh.makh =hd.makh
group by hd.makh,kh.hoten
order by sum(hd.trigia) desc
--8.Những sản phầm nào bán được số lượng ít nhất
select top 1 sp.tensp ,sp.masp,sum (c.soluong) as 'so luong ban it nhat'from cthd as c join sanpham as sp
on c.masp=sp.masp
group by sp.tensp, c.masp,sp.masp
order by sum(c.soluong)
--9.Cho biết những mặt hàng có số lượng bán nhỏ hơn số lượng bán của mặt hàng nước lọc
select sp.tensp,sp.masp from sanpham as sp join cthd as c
on sp.masp=c.masp
group by c.masp,sp.tensp,sp.masp
having sum(c.soluong) < (select sum(c.soluong) from cthd as c join sanpham as sp
on c.masp=sp.masp where sp.tensp like N'NƯỚC LỌC'
group by c.masp)
--10.Những nhân viên nào chưa từng lập hóa đơn đến thời điểm hiện tại
select nv.hoten,nv.manv from nhanvien as nv 
where nv.manv not in (select manv from hoadon)
--11.Những nhân viên nào của công ty có thâm niên cao nhất
select manv,hoten,ngaylamviec from nhanvien
where ngaylamviec in (select top 1 ngaylamviec from nhanvien order by ngaylamviec)
group by manv,hoten,ngaylamviec
--12.Những khách nào mua số lượng hàng nhiều nhất, số lượng đó là bao nhiêu
select top 1 kh.makh,kh.hoten,sum(c.soluong) as[số lượng hàng nhiếu nhất] from khachhang as kh join hoadon as hd
on kh.makh=hd.makh
join cthd as c
on hd.sohd=c.sohd
group by hd.makh,kh.hoten,kh.makh
order by sum(c.soluong) desc
--13.cho biết nhân viên có ngày sinh trùng với ngày sinh của bất kỳ khách hàng
select nv.manv,nv.hoten from nhanvien as nv full join hoadon as hd 
on nv.manv=hd.manv
full join khachhang as kh
on kh.makh=hd.makh
where day(nv.ngaysinh) in (select day(ngaysinh) from khachhang)
--14.cho biết những mặt hàng nào có tổng số lượng bán nhỏ hơn trung bình số lượng bán các mặt hàng
select sp.tensp,sp.masp, sum (c.soluong) as [số lượng bán của sản phẩm]
from sanpham as sp join cthd as c
on c.masp=sp.masp
group by c.masp,sp.tensp,sp.masp
having sum(c.soluong) < (select avg(c.soluong) from cthd as c)
----------------------------- thực hành 5
--1. cho biết danh sách những sản phẩm có mã sản phẩm sp01,sp05
create view banview as
select *from sanpham
where masp='sp01' or masp='sp05'
select * from banview
drop view banview
--2.cho biết những sản phẩm bán trong tháng 3 năm 2022
select * from cthd
select * from hoadon
create view banview2 as
select sp.masp,sp.tensp ,hd.ngayhd from sanpham as sp join cthd as c
on c.masp=sp.masp 
join hoadon as hd
on hd.sohd=c.sohd
where month(hd.ngayhd) in (3) and year(hd.ngayhd) in (2022)
select * from banview2
--3. tạo view gồm các thông tin masp,soluongban,giaban,sohd,ngayhd,thanhtien
create view thongtin as
select c.masp,c.soluong,c.giaban,c.sohd,hd.ngayhd,c.soluong *c.giaban as 'thanhtien' from cthd as c join hoadon as hd
on c.sohd=hd.sohd
select * from thongtin
--4. Ấn độ đã cung cấp những mặt hàng nào
select * from sanpham 
create view ando as select * from sanpham
where nuocsx name like'Ấn Độ'
select * from ando
--5.Sản Phẩm điện thoại di động do nước nào sản xuất
-- đang quản lý bán hàng tự nhiên điện thoại di động đâu ra z má
--6.Những khách hàng nào có doanh số mua hàng cao nhất
select * from cthd
select * from hoadon
create view doanhsomax as
select top (1) hd.makh, sum( c.soluong * c.giaban ) as[doanh số max] from hoadon as hd join cthd as c
on c.sohd=hd.sohd
group by hd.makh,c.sohd
order by [doanh số max] desc 
select * from doanhsomax
--7.Cho biết những hóa đơn (sohd,ngayhd,trị giá) cho những hóa đơn có trị giá < trị giá trung bình
select * from hoadon
create view hoadonview as
select hd.sohd,hd.ngayhd,hd.trigia from hoadon as hd
where hd.trigia < (select avg(trigia) from hoadon )
select * from hoadonview
--8.Hãy cho biết tổng số lượng sản phẩm do Việt Nam sản xuất
select * from cthd
create view vietnamview as
select sum(soluong) as[tổng số lượng sản phẩm do Việt nam sản xuất] from sanpham
where nuocsx like N'VIỆT NAM'
group by nuocsx
select * from vietnamview
--9.Trong đơn hàng số 3 đặt mua những mặt hàng nào và tổng số tiền là bao nhiêu
create view donhang3view
as select masp,sum(soluong*giaban) as[tổng số tiền cho hóa đơn 3]  from cthd
where sohd ='HD03'
group by sohd,masp
select * from donhang3view
--10.hãy cho biết những khách hàng nào chưa có số điện thoại
select * from khachhang
create view dienthoaiview as select makh from khachhang
where sodt like N''
select * from dienthoaiview
--11. Trong công ty có những nhân viên nào cùng ngày sinh
select * from nhanvien
create view ngaysinhview as
select manv, day(ngaysinh) as [ngày sinh trùng] from nhanvien 
where day(ngaysinh) in (select day(ngaysinh) from nhanvien group by day(ngaysinh) having count(*) >=2)
select * from ngaysinhview
--12.Những nhân viên nào chưa xuất được hóa đơn trong 30 ngày
select * from nhanvien
select * from hoadon
select * from cthd
create view nhanvienview30day as
select manv from nhanvien
where manv not in (select manv from hoadon where datediff (day,ngayhd,getdate()) <=30)
---
select manv,datediff (day,ngayhd,getdate()) from hoadon --test xem ngày
drop view nhanvienview30day
select * from nhanvienview30day
--13.Cho biết những sản phẩm có số lượng ít hơn 10
select * from sanpham
create view sanphamview1 as
select masp,tensp from sanpham 
where soluong < 10
select * from sanphamview1
--14.Tạo view lưu thông tin khách hàng có số đơn hàng >=3
select * from hoadon
create view thongtinkhview as
select makh,hoten,diachi,sodt,ngaysinh,doanhso from khachhang
where makh in (select makh from hoadon group by makh having count(*) >=3)
select * from thongtinkhview
---------------------------thực hành 6
--1. Viết thủ tục cho biết doanh số mua hàng của khách hàng có mã x nào đó (x là tham số thủ tục) 
select * from cthd
select * from hoadon
create procedure doanhsovoid (@x char(10)) as
begin
select hd.makh,sum(c.soluong*c.giaban) as [doanh số] from cthd as c join hoadon as hd
on c.sohd=hd.sohd
where hd.makh=@x
group by hd.makh
end
execute doanhsovoid 'KH04'
--2.Viết thủ tục để xem masp và tensp của các sản phẩm có giá lớn hơn x và số lượng hiện có ít hơn y (x,y là tham số)
select * from sanpham
create procedure sanphamvoid (@x int , @y int) as
select masp,tensp from sanpham
where gia > @x and soluong < @y
execute sanphamvoid '10000','100'
--3.Viết thủ tục cho biết nhân viên X đã lập bao nhiêu hóa đơn (tham số x là manv)
select * from hoadon
create procedure nhanvienvoid (@x char(10))as
begin 
select manv, count(*) as [số hóa đơn đã lập] from hoadon
where @x=manv
group by manv
end
execute nhanvienvoid 'NV007'
--4.Viết thủ tục X do nhân viên nào lập , có bao nhiêu sản phẩm trên hóa đơn đó (tham số x là số HD)
select * from hoadon
select * from cthd
create procedure nhanvienlapvoid (@x varchar(10) )as
select hd.manv,count (*) as [số sản phẩm trên hóa đơn đó] from cthd as c join hoadon as hd
on c.sohd=hd.sohd
where @x=hd.manv
group by c.sohd,hd.manv
drop procedure nhanvienlapvoid 
execute nhanvienlapvoid 'NV001'
--5.Viết thủ tục để xem những sản phẩm nào đã được mua với số lượng nhiều nhất
select * from cthd
create procedure topsanpham as
select top 1 c.masp, sum(c.soluong) as [số lượng của sản phẩm đã được mua nhiều nhất] from cthd as c
group by c.masp
order by [số lượng của sản phẩm đã được mua nhiều nhất] desc
execute topsanpham
--6. Viết thủ tục cho biết thông tin của những sản phẩm có tổng số lượng bán lớn hơn 30
select * from cthd
create procedure thongtinvoid as
begin 
select * from sanpham
where masp in (select masp from cthd group by masp having sum(soluong) >30)
end
execute thongtinvoid
----- thực hành 7
select * from hoadon
--1. Viết hàm trả về tổng tiền (giá trị) mà khách hàng phải trả cho hoá đơn 
create function funtongtien (@makhachhang char (5))
returns int 
as
begin
declare @tongtien int 
select @tongtien = sum(trigia) from hoadon group by makh
return @tongtien
end
select dbo.funtongtien ('KH01') as [Tổng tiền của khách hàng trả cho hoá đơn]
--2.Viết hàm trả về tình trạng bán của sản phẩm . Nếu số lượng của sản phẩm (trong bản cthd) > 100 thì bán chạy , ngược lại là bán chậm .
select * from cthd
create function funtinhtrang (@masanpham char (4))
returns Nvarchar(20)
as
begin
declare @soluong int 
declare @tinhtrang nchar(20)
select @soluong = sum(soluong) from cthd 
where masp= @masanpham
group by masp
if (@soluong > 100)
set @tinhtrang =N'bán nhanh';
else
set @tinhtrang =N'bán chậm'
return @tinhtrang
end
select dbo.funtinhtrang ('SP01') as [tình trạng sản phẩm]
--3. Viết hàm trả về một bảng gồm các thông tin masp,tensp và soluong của các sản phẩm hiện có trong công ty
select * from sanpham
create function funthongtin ()
returns table 
as
return (select masp,tensp,soluong from sanpham)
select * from funthongtin ()
--4. Viết hàm trả về một bảng gồm danh sách khách hàng có doanh số mua hàng cao nhất tính đến thời điểm này
select * from cthd
select * from hoadon
create function fundoanhso ()
returns table
as
return (select top 1 sum(c.soluong *c.giaban) as [doanh số] from cthd as c join hoadon as hd
on hd.sohd=c.sohd
group by hd.makh)
select * from fundoanhso()
--5.Viết hàm trả về số lượng sản phẩm bán chạy nhất trong tháng 2/2022
select * from cthd
select * from hoadon
create function funsoluongmax ()
returns int
as
begin
declare @soluongmax int 
select top (1) @soluongmax=sum(c.soluong) from cthd as c join hoadon as hd
on hd.sohd =c.sohd
where month(ngayhd)=2 and year (ngayhd) =2022
group by c.masp
order by sum(c.soluong) desc
return @soluongmax
end
drop function funsoluongmax
select dbo.funsoluongmax() as [số lượng sản phẩm bán chạy nhất]
--6. Viết hàm tính tiền bán được của sản phẩm x(x là mã sản phẩm, tham số đầu vào)
select * from cthd
create function funtinhtien (@x char(4))
returns int
as
begin
declare @tien int
select @tien = sum(soluong *giaban) from cthd
where @x=masp
group by masp
return @tien
end
drop function funtinhtien
select dbo.funtinhtien('SP01') as N'Tiền bán được của sản phẩm'
--7.Viết hàm cho biết trung bình số lượng bán được của mỗi sản phẩm tron ngày x(x là tham số đầu vào của hàm)
select * from cthd
select * from hoadon
create function funavg (@x int)
returns table 
as
return (select c.masp, avg (c.soluong) as[số lượng trung bình] from cthd as c join hoadon as hd
on c.sohd=hd.sohd
where @x= day(ngayhd)
group by c.masp
)
drop function funavg
select * from funavg ('2')
--9. Viết hàm trả về tổng số lượng bán của mã sản phẩm x (x là MaSP, x là tham số của hàm)
create function funtong (@x char(4) )
returns int
as
begin
declare @tong int
select @tong =sum(soluong) from cthd where @x=masp group by masp
return @tong
end
drop function funtong
select dbo.funtong('SP01') as[Tổng số lượng bán của sản phẩm ]
--10.Viết hàm trả về số hóa đơn của khách hàng x (x là MaKH, x là tham số của hàm)
select * from hoadon
create function funhoadon (@makhachhang char(4))
returns int
as
begin
declare @sohoadon int
select @sohoadon = count (*) from hoadon where @makhachhang =makh group by makh
return @sohoadon
end
select dbo.funhoadon ('KH02') as [số hoá đơn]
--11.Viết hàm TrangThai(x) trong đó x là tham số. Hàm trả về một trong các loại sau:
--Nếu x>=300 thì bán chạy
--Nếu 100<=x<300 trung bình
--Nếu x<100 thì bán ít
--Vận dụng để đánh giá trạng thái của các sản phấm bán được , giá trị truyền cho x là tổng số lượng đã bán của các sản phẩm.
select * from cthd
select sum(c.soluong) from cthd as c group by c.masp
create function funtrangthaivip (@tongsoluong int )
returns Nchar(20)
as
begin
declare @trangthai Nchar(20)
if (@tongsoluong >=300)
set @trangthai=N'Bán chạy'
if (@tongsoluong >=100 and @tongsoluong <300)
set @trangthai=N'bán trung bình'
else 
set @trangthai=N'Bán ít'
return @trangthai
end
select dbo.funtrangthaivip ('3') as[tình trạng của tổng số lượng bán]
---------------------------------------------  Bài thực hành 8 TRIGGER----------------------------------------------------
--1. Tạo Trigger ràng buộc soluong trong bảng sanpham >= soluong nhập vào bảng CTHD (cùng mã hàng)
-- cái đề đọc hơi cấn, sửa lại như z sẽ hợp lý hơn
--1. Tạo Trigger ràng buộc soluong trong bảng sanpham >= soluong bán vào bảng CTHD (cùng mã hàng)
select * from sanpham
select * from cthd
drop trigger trgsoluong
alter trigger trgsoluong 
on cthd
for insert,update
as
begin
declare @mahang varchar(5)
select @mahang = masp from inserted
declare @soluongsp int
select @soluongsp = soluong from sanpham
where masp= @mahang
declare @soluongnhap int
select @soluongnhap = sum(soluong) from cthd
where masp= @mahang
group by masp
if (@soluongnhap >= @soluongsp)
begin
rollback tran
PRINT(N'Không được thêm số lượng hàng nhập < số lượng đã bán')
end
end
-- test trigger
insert into cthd values ('HD01','SP09','200','5000') 
--2. Tạo trigger không cho phép nhập vào bảng Sanpham những mặt hàng có số lượng <= 10
select * from sanpham
create trigger trgsanpham on sanpham
for insert
as
begin
declare @soluong int
select @soluong= soluong from inserted
if (@soluong <=10)
begin
rollback tran
PRINT(N'Không được thêm những sản phẩm có số lượng nhỏ hơn hoặc bằng 10')
end
end
--3.Viết trigger khi sửa giá cho một (hoặc nhiều) masp thì in ra: 
--  +Danh sách các sản phẩm vừa được sửa giá
--  +Danh sách các masp vừa được sửa cùng giá cũ và giá mới
select * from sanpham
create trigger trggia on sanpham
for update
as
begin
declare @masp varchar(4)
select masp as [Danh sách các sản phẩm vừa được sửa giá] from inserted 
select gia as N'giá cũ' from deleted
select gia as N'giá mới' from inserted
PRINT (N'trigger thành công')
end
--test 
update sanpham
set gia='200'
where masp='SP02'
--trả về như cũ
update sanpham
set gia='100'
where masp='SP02'
--4. Tạo trigger không cho phép xoá những nhân viên có thâm niên trên 10 năm 
select * from nhanvien
create trigger trgnhanvien on nhanvien
after delete 
as
begin
declare @manv varchar(5)
select @manv =manv from deleted
declare @sonamlam int
select @sonamlam = datediff(year,ngaylamviec,getdate()) from deleted
where manv = @manv
if (@sonamlam >10) 
begin
rollback tran
PRINT (N'Bậy rồi bạn ơi . Đừng xoá người ta chớ. không được xoá những người có thâm niên trên 10 năm')
end
end
--test
delete from nhanvien
where manv='NV014'
-- trả về như cũ :)
insert into nhanvien values
('NV014', N'Nguyễn Hiền', '1995-07-07', 1, '2005-10-20', '8651831888', 'cntt41dbuimaihien@gmail.com')
---- truy vấn số thâm niên của nhân viên
select datediff(year,ngaylamviec,getdate()) as[số năm thâm niên] from nhanvien
--5.Viết trigger cập nhập lại số lượng ở bảng sản phẩm khi khách hàng không mua mặt hàng hay thay đổi số lượng đặt hàng trong CTHD
drop trigger trgdathang on cthd
after update,delete
as
begin
-- Không mua mặt hàng tức là đặt xok boom đéo chịu lấy, tức là phải trả về kho (deleted)
-- Thay đổi số lượng đặt hàng (inserted)
declare @soluongthaydoi int 
select @soluongthaydoi from inserted
where masp = (select masp from inserted)
declare @soluongspcuakho int
select @soluongspcuakho= soluong from sanpham
where masp = (select masp from inserted) or masp = (select masp from deleted)
--số lượng đặt hàng trước đó của khách khách trc khi chưa bị thay đổi
declare @soluongdattruocdo int 
select @soluongdattruocdo = sum(soluong) from cthd
where masp = (select masp from inserted) or masp = (select masp from deleted)
group by masp
if Exists(select * from deleted) 
begin
print(N'trả số lượng về kho')
set @soluongspcuakho =@soluongspcuakho+@soluongdattruocdo
update sanpham
set soluong= @soluongspcuakho
where masp in (select masp from inserted) or masp in (select masp from deleted)
end
if exists(select * from inserted)
begin
print(N'Số lượng của kho đã trừ cho số lượng thay đổi')
set @soluongspcuakho=@soluongspcuakho-@soluongthaydoi
update sanpham
set soluong= @soluongspcuakho
where masp = (select masp from inserted) or masp = (select masp from deleted)
end
end
select * from sanpham
select * from cthd
--test boomhang
update cthd
set soluong =600
where masp ='Sp11'