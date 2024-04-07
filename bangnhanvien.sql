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
('HD11', 'SP11', 77, 500);
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
