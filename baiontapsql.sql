use QUANLYBANHANG
--Câu 1: Liệt kê những khách hàng có địa chỉ ở Quy Nhơn
select makh,hoten,diachi from khachhang
where diachi =N'Quy Nhơn'
-- câu2: Liẹt kê những đơn hàng có trị giá > 100000 và nhỏ hơn 300000
select sohd,trigia from hoadon 
where trigia >100000 and trigia <300000
--Câu 3: Liệt kê những nhân viên có thâm niên công tác 20 năm và có họ bắt đầu bằng chữ N 
select * from nhanvien
select manv,hoten ,datediff (year,ngaylamviec,getdate()) as N'số năm thâm niên của nhân viên' from nhanvien
where datediff (year,ngaylamviec,getdate()) > 20 and hoten like N'N%'
-- câu 4: Liệt kê những sản phẩm có số lượng bán >20
select * from cthd
select c.masp,sp.tensp, sum(c.soluong) as N'tổng số lượng đã bán của sản phẩm' from sanpham as sp join cthd as c
on c.masp=sp.masp
group by c.masp,sp.tensp
having sum(c.soluong) >20
-- Câu 5: Liệt kê những khách hàng mua nước hoa thông tin gồm họ tên, địa chỉ, số hd, tên sản phẩm 
select * from khachhang
select * from hoadon
select kh.hoten,kh.diachi,c.sohd,sp.tensp from khachhang as kh join hoadon as hd 
on hd.makh = kh.makh
join cthd as c
on c.sohd=hd.sohd
join sanpham as sp
on c.masp=sp.masp
-- câu 6: Liệt kê những sản phẩm bán > 10 và nhỏ hơn 20
select masp, sum (soluong) as N'tổng số lượng đã bán' from cthd 
group by masp
having sum(soluong) > 10 and sum(soluong) <20
-- Câu 7: Cho biết khách hàng kh01 mua mấy đơn hàng
select * from hoadon
select count(*) as N'Tổng số đơn của khách hàng mã kh01 '
from hoadon
where makh='kh01'
group by makh
-- Câu 8: Cho biết những nhân viên bán được 2 hóa đơn
select manv, count(*) as N'số đơn hàng mà nhân viên đó đã bán' from hoadon 
group by manv
having count(*) =2
-- Không có nhân viên nào nên không ra dữ liệu
-- Câu 9: Cho biết số lần bán của sản phẩm sp01
select count(*) as N'số lần bán của sản phẩm sp01 ' from cthd
where masp ='sp01'
group by masp
-- Câu 10: cho biết mặt hàng nào bán số lượng nhiều nhất
select top 1 c.masp,sp.tensp, sum(c.soluong) as N'Tổng số lượng bán nhiều nhất' from cthd as c join sanpham as sp
on c.masp= sp.masp
group by c.masp,tensp
order by sum(c.soluong) desc
-- Câu 11: chp biết những sản phẩm nào xuất nhiều lần nhất
select top 1 c.masp,sp.tensp, sum(c.soluong) as N'Tổng số lượng bán nhiều nhất' from cthd as c join sanpham as sp
on c.masp= sp.masp
group by c.masp,tensp
order by sum(c.soluong) desc
-- câu 12: cho biết khách hàng nào chưa mua hàng
select kh.makh , kh.hoten from khachhang as kh left join hoadon as hd
on hd.makh = kh.makh
where hd.makh is null
-- Câu 13: Cho biết những khách hàng nào mua nhiều đơn nhất
select * from hoadon
select top 1 makh, count(*) as  N'Số đơn hàng của khách hàng mua nhiều nhất' from hoadon
group by makh
order by count(*) desc
-- Câu 14: cấp nhập dữ liệu trên trường Gia giảm 10 % so với giá hiện tại, chỉ cạp nhập những sản phẩm có số lần bán nhỏ hơn 3
select * from sanpham
update sanpham
set gia =gia*0.1
where masp in (select masp from cthd group by masp having count(*) <3)
-- Câu 15: Liệt kê thông tin chi tiết các đơn hàng của khách hàng mà từ ngày 10/12/2022 đến nay không mua hàng nữa
select * from hoadon
where ngayhd < '2022-12-10'
-- Câu 16 Truy vấn tạo bảng nhanvientot, dữ liệu lấy từ bảng nhân viên, gồm 20 % số nhân viên có từ 2 đơn hàng trở lên
select * from hoadon
select * from nhanvien
select * into nhanvientot from nhanvien
where manv in (select top 2 manv from hoadon group by manv having count(*) >=2 )
select * from nhanvientot
-- Câu 17: Thống kê số lượng bán của mỗi sản phẩm nếu tổng số lượng > 100 thì xuất ra bán đắt và ngược lại là bình thường
create function funsoluong (@masp varchar(5))
returns nvarchar(20)
as
begin
declare @trangthai nvarchar(40)
declare @tongsoluongban int
select @tongsoluongban= sum(soluong) from cthd 
where masp= @masp
if (@tongsoluongban > 100)
set @trangthai = N'Bán đắt'
else
set @trangthai =N'Bán bình thường'
return @trangthai
end
select dbo.funsoluong ('SP01') as N'trạng thái'
--Câu 18: tỷ lệ % của tổng số lượng bán so với số lượng hiện có của từng sản phẩm
create function funtyle (@masanpham varchar (10))
returns float
as
begin
declare @tongsoluongban int
select @tongsoluongban = sum(soluong) from cthd
where masp=@masanpham
group by masp
declare @soluongnhap int
select @soluongnhap= soluong from sanpham
where masp= @masanpham
declare @soluonghientai float
set @soluonghientai= @soluongnhap - @tongsoluongban
return @soluonghientai /@tongsoluongban *100
end
select dbo.funtyle ('Sp07') as N'Tỷ lệ tổng số lượng bán với số lượng hiện tại (%)'
--19.Xóa những bản ghi có số lượng bán <15 và bán trong tháng 2
delete from cthd
where sohd in (select sohd from hoadon where month (ngayhd) =2 ) and soluong <15
--20.Xóa những đơn hàng có sản phẩm có tên bắt đầu bằng chữ N
select * from cthd
select * from sanpham
delete from cthd
where masp in (select masp from sanpham where tensp like N'N%')
-- 21.Viết thủ tục Cho biết chi tiết danh sách các đơn hàng của nhân viên x(x tham số đầu vào)
select * from hoadon
create procedure pronhanvienx (@manhanvien varchar(5)) 
as
begin
select * from hoadon where manv=@manhanvien
end
execute pronhanvienx 'nv001'
--22. 22.Viết thủ tục cho biết danh sách những mặt hàng bán với số lượng thuộc đoạn [a..b] (a, b là tham số đầu vào)
select * from cthd
create procedure promathang (@soluonga int, @soluongb int)
as
begin
select * from cthd where soluong between @soluonga and @soluongb
end
execute promathang'100','200'
--23.Viết thủ tục in ra chi tiết các sản phẩm có số lượng =20
select * from sanpham
create procedure prcsanpham
as
begin
select * from sanpham where soluong =20
end
execute prcsanpham
--24.Viết hàm cho biết tổng số lượng bán của mặt hàng x(x là mã sản phâm tham số đầu vào)
select * from cthd
create function funtongsoluongban (@masp varchar(5))
returns int
as
begin
return (select sum(soluong) as[Tổng số lượng bán] from cthd where masp =@masp group by masp )
end
select dbo.funtongsoluongban('sp05') as N'Tổng số lượng bán'
-- 25.Viết hàm cho biết số đơn hàng bán được trong ngày x (x tham số đầu vào)
select * from hoadon
select * from cthd
create function fundonhang (@ngay int)
returns int
as
begin
declare @sodonhang int
select @sodonhang=count(*) from hoadon as hd join cthd as c 
on hd.sohd=c.sohd 
where day(hd.ngayhd) =@ngay group by day(hd.ngayhd)
return @sodonhang
end
select dbo.fundonhang ('12') as 'Số đơn hàng được bán trong ngày x'
-- 26.Hàm ôn các hàm trong bài tập thực hành
--chưa hiểu đề kêu làm gì lắm :v
--27.Viết trigger không cho phép nhân viến lập thêm hóa đơn nếu nhân viên đã có 2 đơn hàng trong ngày.
select * from cthd
select * from hoadon
drop trigger trignhanvien on cthd
for insert
as
begin
declare @manv_co2donhang varchar(5)
select @manv_co2donhang = hd.manv from hoadon as hd join cthd as c
on c.sohd=hd.sohd 
group by day(hd.ngayhd),manv
having count(*) =2
declare @manvhd varchar(5)
select @manvhd = manv from hoadon
if (@manvhd = @manv_co2donhang)
begin
rollback tran
print(N'Không thể thêm vì nhân viên này đã lập hoá đơn 2 lần trong 1 ngày')
end
end
---test
insert into cthd values ('HD07','Sp02',123,23)
--28.Viết trigger chỉ cho xóa những sản phẩm bán từ 2 lần trở xuống (bảng Sản phẩm)
alter trigger trigsanpham on cthd
after delete
as
begin
declare @a char(10)
select @a=count(*) from deleted
group by masp
if (@a >=2)
begin
rollback transaction
print(N'Không được xoá những sản phẩm đã được bán từ 2 lần trở lên')
end
end
----test
delete from cthd
where masp='sp01'
select * from cthd
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
-- 29.Viêt trigger chỉ cho bán số lượng nhỏ hơn số lượng của sản phẩm hiện có trong công ty
create trigger trigban on cthd
for insert
as
begin
declare @addsoluong int
select @addsoluong=soluong from inserted
declare @soluongnhap int
select @soluongnhap=soluong from sanpham
where masp = (select masp from inserted)
declare @soluongdaban int
select @soluongdaban= sum(soluong) from cthd
where masp= (select masp from inserted)
group by masp
declare @soluonghienco int
set @soluonghienco=@soluongnhap-@soluongdaban
if (@addsoluong > @soluonghienco)
begin
rollback tran
print(N'sản phẩm bán phải bé hơn sản phẩm hiện có')
end
end
-- tets
insert into cthd values ('HD12','sp11',88888,10000000)
-- 30.Viết trigger kiểm soát việc cập nhật thông tin sản phẩm: không cho phép cập 
-- nhật thông tin của sản phẩm nếu sản phẩm đó đã được bán.
select * from cthd
select * from sanpham
alter trigger trigupdate on sanpham
for update
as
begin
if exists(select masp from cthd
where masp in (select masp from inserted))
begin
rollback tran
print(N'Không cho phép update các sản phẩm đã được bán trong bảng cthd')
end
end
--- test
update sanpham
set soluong=77
where masp='sp02'