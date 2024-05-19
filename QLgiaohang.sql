create database QLgiaohang
use QLgiaohang
create table KV (
makv varchar (5),
constraint pk_makv primary key (makv),
tenkh nvarchar (25)
)
create table khachhang (
makh varchar (5),
constraint pk_makh primary key (makh),
makv varchar(5),
tenkh nvarchar (25),
tench nvarchar (25),
sdt_kh int,
email nvarchar(30),
dc_nhanhang nvarchar (30)
)
create table dv (
madv varchar(5),
constraint pk_madv primary key (madv),
tendv Nvarchar(25)
)
create table ktg (
ma_khoang_tg_gh varchar (5),
constraint pk_ma_khoang_tg_gh1 primary key (ma_khoang_tg_gh),
mota nvarchar (25)
)
create table dk_gh (
matv_gh varchar(5),
ma_khoang_tg_gh varchar(5),
constraint pk_dk_gh primary key (matv_gh,ma_khoang_tg_gh )
)
create table tv_gh (
matv_gh varchar(5),
constraint pk_matv_gh primary key (matv_gh),
tentv_gh nvarchar (25),
ngaysinh datetime,
gt varchar(5),
sdt_tv int,
dc_tv nvarchar (25)
)
create table dh_gh (
madh_gh varchar(5),
constraint pk_madh_gh primary key (madh_gh),
makh varchar(5),
matv_gh varchar(5),
madv varchar (5),
makv varchar(5),
ten_ng_nhan nvarchar (25),
dc_gh nvarchar (25),
sdt_ng_nhan int,
ma_khoang_tg_gh varchar(5),
ngay_gh datetime,
pttt nvarchar(20),
tt_pheduyet nvarchar(20),
tt_gh nvarchar (25)
)
create table lmh (
malmh varchar(5),
constraint pk_malmh primary key (malmh),
tenlmh nvarchar (25)
)
create table cthd (
madh_gh varchar (5),
tenspgiao nvarchar (5),
soluong int,
trongluong varchar(5),
malmh varchar (5),
tienth int
)
----------- tạo key ngoại =)))
alter table khachhang
add constraint fk_makv foreign key (makv) references kv(makv)
alter table dh_gh
add constraint fk_makv1 foreign key (makv) references kv(makv)
alter table dh_gh
add constraint fk_makh foreign key (makh) references khachhang(makh)
alter table dh_gh
add constraint fk_madv foreign key (madv) references dv(madv)
alter table dh_gh
add constraint fk_matv_gh foreign key (matv_gh) references tv_gh(matv_gh)
alter table dh_gh
add constraint fk_ktg foreign key (ma_khoang_tg_gh) references ktg(ma_khoang_tg_gh)
alter table dk_gh
add constraint fk_ma_khoang_tg_gh foreign key (ma_khoang_tg_gh) references ktg(ma_khoang_tg_gh)
alter table dk_gh
add constraint fk_matv_gh2 foreign key (matv_gh) references tv_gh(matv_gh)
alter table cthd
add constraint fk_malmh foreign key (malmh) references lmh(malmh)
alter table cthd
add constraint fk_madh_gh foreign key (madh_gh) references dh_gh(madh_gh)
----bài 1: tạo ràng buộc
alter table dh_gh
add constraint phuong_thuc_thanh_toan check (pttt in (N'Chuyển khoảng',N'Tiền mặt'))
alter table cthd
add constraint so_luong check (soluong >=1)
alter table dh_gh
add constraint trangthai_giaohang check (tt_gh in (N'Nhận hàng',N'Không nghe điện thoại',N'Không nhận'))
-- nhập dữ liệu
insert into kv values ('kv01',N'Lê Quốc Cường')
insert into kv values ('kv02',N'Lê Văn An')
insert into kv values ('kv03',N'Mai Thị Đào')
select * from kv

insert into khachhang values ('kh01','kv03', N'Nguyễn Văn Minh', N'Đào Minh',085134328,'a@gmail.com',N'Ngô Mây')
insert into khachhang values ('kh02','kv01', N'Nguyễn Tuấn Anh', N'Long An',085134327,'b@gmail.com',N'Trương Thị Định')
insert into khachhang values ('kh03','kv01', N'Nguyễn Thị Phương Sao', N'Mai Anh Lan',085134326,'c@gmail.com',N'Cần Vương')
insert into khachhang values ('kh04','kv01', N'Lê Thị An', N'Chiến Thần',085134325,'d@gmail.com',N'Đống đa')
insert into khachhang values ('kh05','kv01', N'Nguyễn Thị Phương Sao', N'Mai Anh Lan',085134326,'c@gmail.com',N'An Dương Vương')
insert into khachhang values ('kh06','kv01', N'Nguyễn Thị Phương', N'Mai Anh Lan',085134324,'k@gmail.com',N'Cần Vương')
insert into khachhang values ('kh07','kv01', N'Nguyễn Trúc Anh', N'Lê Khải',0851343224,'f@gmail.com',N'Lê Hồng Phong')
select * from khachhang

insert into ktg values ('ktg01',N'Chuyển hàng hơi mệt')
insert into ktg values ('ktg02',N'Nhanh gọn lẹ kkk ')
select * from ktg

insert into tv_gh values ('tv01',N'Huỳnh Văn A','05-07-2005','Nam',090902,N'An Dương Vương')
insert into tv_gh values ('tv02',N'Nguyễn Thị Lan','05-04-2004','Nu',0909802,N'Ngô Mây')
insert into tv_gh values ('tv03',N'Trần Anh Bảo','01-12-2002','nam',0909022,N'Đống đa')
insert into tv_gh values ('tv04',N'Nguyễn Thị Mai','05-04-2003','Nu',090980277,N'Ngô Mây')
select * from tv_gh

insert into dk_gh values ('tv01','ktg01')
insert into dk_gh values ('tv02','ktg01')
select * from dk_gh

insert into dh_gh values ('DH01','kh01','tv01','dv01','kv01',N'Nguyễn Văn Minh',N'Ngô Mây',090902,'ktg01','2022-02-04',N'Chuyển khoảng',N'Chưa duyệt',N'Nhận hàng')
insert into dh_gh values ('DH02','kh02','tv02','dv02','kv02',N'Nguyễn Tuấn Anh',N'Cần Vương',0909022,'ktg02','4-14-2024',N'Tiền mặt',N'duyệt rồi',N'không nghe điện thoại')
insert into dh_gh values ('DH03','kh02','tv02','dv02','kv02',N'Nguyễn Tuấn Anh',N'Cần Vương',0909022,'ktg02','4-14-2024',N'Tiền mặt',N'duyệt rồi',N'Không nhận')
insert into dh_gh values ('DH04','kh01','tv04','dv01','kv01',N'Nguyễn Văn Minh',N'Đống Đa',09090277,'ktg01','2022-02-04',N'Chuyển khoảng',N'duyệt rồi',N'Nhận hàng')
insert into dh_gh values ('DH05','kh02','tv04','dv01','kv01',N'Nguyễn Tuấn Anh',N'Đống Đa',09090277,'ktg01','2022-02-04',N'Chuyển khoảng',N'duyệt rồi',N'Nhận hàng')
insert into dh_gh values ('DH06','kh03','tv04','dv01','kv01',N'Nguyễn Thị Phương Sao',N'Đống Đa',09090277,'ktg01','2022-02-04',N'Chuyển khoảng',N'duyệt rồi',N'Nhận hàng')
insert into dh_gh values ('DH07','kh07','tv04','dv01','kv01',N'Nguyễn Trúc Anh',N'Đống Đa',090902877,'ktg01','2022-02-04',N'Chuyển khoảng',N'duyệt rồi',N'Nhận hàng')
select * from dh_gh

insert into dv values ('dv01',N'giao siêu tốc')
insert into dv values ('dv02',N'giao bình thường')
select * from dv

insert into lmh values ('lmh01',N'liếm mặt hàng 1')
insert into lmh values ('lmh02',N'liếm mặt hàng 2')
insert into lmh values ('lmh03',N'liếm mặt hàng 3')
select * from lmh

insert into cthd values ('dh01',N'Áo',7,'15kg','lmh01',45000)
insert into cthd values ('dh02',N'váy',2,'5kg','lmh02',65000)
insert into cthd values ('dh01',N'Áo',2,'15kg','lmh01',12000)
insert into cthd values ('dh02',N'váy',49,'5kg','lmh02',159000)
select * from cthd
--bài 2: cập nhập và xoá dữ liệu
--Câu 1: Xoá những khách hàng có tên là "Lê Thị An"
select * from khachhang
delete from khachhang 
where tenkh=N'Lê Thị An'
--Câu 2: Cập nhật những khách hàng đang thường trú ở khu vực “Ngô mây” thành khu vực “Đống Đa”.
update khachhang
set dc_nhanhang=N'Đống Đa'
where dc_nhanhang =N'Ngô Mây'
--Câu 3: Xóa những khách hàng có địa chỉ ở đường “An Dương Vương”
delete from khachhang
where dc_nhanhang=N'An Dương Vương'
-- Câu 4: Xóa những khách hàng có trạng thái giao hàng là:”Không nhận”
select * from dh_gh
delete from dh_gh
where tt_gh=N'Không nhận'
----------------------bài 3: truy vấn
--Câu 1: Liệt kê những thành viên (shipper) có họ tên bắt đầu là ký tự ‘Tr’
select * from tv_gh
where tentv_gh like N'tr%'
--Câu 2: Liệt kê những đơn hàng có Ngày Giao Hàng nằm trong năm 2022 và có khu vực giao hàng là “Ngô Mây”.
select madh_gh from dh_gh
where year(ngay_gh) =2022 and dc_gh= N'Ngô Mây'
--Câu 3: Liệt kê MaDHG, MaTV, Ngày giao hàng, tên thành viên giao hàng, PhuongThucThanhToan của tất cả những đơn hàng có trạng thái là “Nhận hàng”.
--Kết quả hiển thị được sắp xếp tăng dần theo NgayGiaoHang và giảm dần theo PhuongThucThanhToan
select madh_gh,matv_gh,ngay_gh,ten_ng_nhan,pttt from dh_gh
where tt_gh=N'Nhận Hàng'
order by ngay_gh asc, pttt desc
--Câu 4: Liệt kê những thành viên có giới tính là “Nam” và chưa từng được giao hàng lần nào.
select tv.matv_gh from tv_gh as tv left join dh_gh as dh
on tv.matv_gh = dh.matv_gh
where dh.matv_gh is null
--Câu 5: Liệt kê họ tên của những khách hàng đang có trong hệ thống. Nếu họ tên
--trùng nhau thì chỉ hiển thị 1 lần. Học viên cần thực hiện yêu cầu này bằng 2 cách khác nhau
select tenkh from khachhang
group by tenkh
-- Câu 8: Liệt kê MaKH, TenKH, địa chỉ nhận hang, MaDHG, PhuongThucThanhToan, TrangThaiGiaoHang 
--của tất cả các khách hàng đang có trong hệ thống
select makh,ten_ng_nhan,dc_gh,pttt,tt_gh from dh_gh
--Câu 9: Liệt kê những thành viên giao hàng có giới tính là “Nu” và từng giao hàng cho 3 
--khách hàng khác nhau ở khu vực giao hàng là “Đống Đa”
select * from tv_gh
select * from dh_gh
select distinct tv.tentv_gh as N'Tên thành viên' from tv_gh as tv join dh_gh as dh
on tv.matv_gh=dh.matv_gh
where tv.gt='Nu' and dh.dc_gh=N'Đống Đa' and tv.matv_gh
in (select matv_gh from dh_gh group by makh,matv_gh having count(*)= 1 )
--Câu 10: Liệt kê những khách hàng đã từng yêu cầu giao hàng tại khu vực “Lê Hồng Phong” và
--chưa từng được một thành viên giao hàng nào có giới tính là “Nam” nhận giao hàng
select * from khachhang
select * from tv_gh
select * from dh_gh
select kh.makh,kh.tenkh from khachhang as kh join dh_gh as dh
on kh.makh=dh.makh
join tv_gh as tv
on tv.matv_gh=dh.matv_gh
where kh.dc_nhanhang=N'Lê Hồng Phong' and tv.gt='Nu' and tv.matv_gh in (select matv_gh from dh_gh)
--Câu 11: Cho biết những đơn hàng có tổng số lượng hàng giao >50
select * from cthd
select c.madh_gh,c.tenspgiao from dh_gh as dh join cthd as c
on dh.madh_gh=c.madh_gh
group by c.madh_gh,c.tenspgiao
having sum(soluong) >50
--Câu 12:Cho biết tháng 4 có bao nhiêu đơn hàng.
select * from dh_gh
select count(*) as N'Tổng số đơn hàng của tháng 4' from dh_gh
where month(ngay_gh)=4
group by month(ngay_gh)
--------------------- thủ tục
--Câu 1: Viết thủ tục đếm xem nhân viên A nào đó giao được bao nhiêu lần trong
--tháng này (nhân viên A là mã nhân viên giao hàng là tham số đầu vào)
select * from tv_gh
select * from dh_gh
create procedure prcnhanvien (@matv varchar(5))
as
begin
select count(*) as N'Số đơn mà nhân viên đã giao hàng' from tv_gh as tv join dh_gh as dh
on tv.matv_gh=dh.matv_gh
where @matv=tv.matv_gh
group by dh.matv_gh
end
exec prcnhanvien 'tv04'
--Câu 2: Viết thủ tục tính tổng số lượng hàng giao cho 1 mã loại hàng giao nào đó.
select * from cthd
create procedure prctongsoluong (@mahanggiao varchar(5))
as
begin
select sum(soluong) as 'Tổng số lượng hàng đã giao' from cthd
where @mahanggiao=madh_gh
group by madh_gh
end
exec prctongsoluong 'DH01' 
-- câu 3: Viết thủ tục cho biết số đơn hàng mỗi nhân viên giao được trong năm 2022
select * from dh_gh
create procedure prosodonhang as
begin
select matv_gh,count(*) as N'tổng số đơn hàng mà nhân viên đó đã giao trong năm 2022' from dh_gh
where year(ngay_gh)= 2022
group by matv_gh
end
exec prosodonhang
----------------------------hàm
--Câu 1: Viết hàm trả về tổng số lượng của 1 hóa đơn
select * from cthd
create function funtongsoluong (@mahoadon varchar(5))
returns int
as
begin
return (select sum(soluong) from cthd where madh_gh =@mahoadon group by madh_gh)
end
select dbo.funtongsoluong ('DH01') as N'tổng số đơn hàng'
--Câu 2: Viết hàm trả về một bảng gồm những thông tin, MADHG, ngày giao hàng, nhân viên giao hàng, trạng thái giao hàng.
select * from dh_gh
create function funthongtin ()
returns table
as
return (select madh_gh, ngay_gh,matv_gh,tt_gh from dh_gh)
select * from funthongtin()
--Câu 3: Viết hàm trả về 1 bảng gồm những thông tin MADHG, ngày giao hàng, nhân viên giao hàng, khảng thời gian giao hàng.
create function funthongtin3 ()
returns table
as
return (select dh.madh_gh, dh.ngay_gh,dh.matv_gh,dh.ma_khoang_tg_gh,k.mota from dh_gh as dh join ktg as k
on dh.ma_khoang_tg_gh=k.ma_khoang_tg_gh)
select * from funthongtin3()
-------------------------------bài 6: trigger
--Câu 1: Viết Trigger thực hiện công việc chỉ thêm dữ liệu cho bản CTHD khi mã
--giao hàng có trong bảng LMH nếu không có thì thông báo không có mã loại hàng này.
select * from lmh
select * from cthd
create trigger trigadd on cthd
for insert
as
begin
declare @magiaohang varchar(5)
select @magiaohang= malmh from inserted
if (@magiaohang not in (select malmh from lmh))
begin
rollback tran
print(N'Không được thêm mã dữ liệu vào cthd khi mã lmh không tồn tại trong bảng lmh')
end
end
-- check câu trigger
insert into cthd values ('dh01',N'Áo',7,'15kg','lmh05',45000)
-- Theo em thì câu này không cần trigger nó cũng sẽ không cho vào vì mã lmh khoá chính trong bảng lmh không tồn tại
--thì không thể thêm dữ liệu được vào bảng dh_gh

--Câu 2: Viết Trigger thực hiện công việc sửa số lượng thành 50 trong bảng CTHD
--cho đơn hàng “DH01”
select * from cthd
create trigger triggsua on cthd
for update, insert,delete
as
begin
declare @soluong int
select @soluong=soluong from cthd
where madh_gh='DH01'
if (@soluong != 50) 
begin
update cthd
set soluong =50
where madh_gh='DH01'
print(N'Đã update toàn bộ số lượng DH01 thành 50')
end
end
---test câu trigger
update cthd
set soluong =22
where madh_gh='DH01'
