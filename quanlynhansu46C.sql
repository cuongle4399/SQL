-- câu1: xem thông tin nam nhỏ hơn 30 tuổi
select ho,ten,ngaysinh,maphong,mapxuong, diachi,datediff(year,ngaysinh,getdate()) as 'tuoi' from nhanvien
where gioitinh=1 and datediff(year,ngaysinh,getdate()) <30
--Caau2:
select ho,ten,ngaysinh,maphong maxuong, diachi, datediff(year,ngaysinh,getdate()) as 'tuoi' from nhanvien
order by datediff(year,ngaysinh,getdate()) asc
-- Câu 3:
select top 3 manv, thue as N'Tổng Số thuế'from thunhap_nv 
order by thue desc
select * from nhanvien
--cau4: 
update thunhap_nv
set phucap=500000
where thamnien >=1 and thamnien <5
update thunhap_nv
set phucap=1000000
where thamnien >=5 and thamnien <10
update thunhap_nv
set phucap=1500000
where thamnien >=10
-- câu 5:
select manv,ho,ten,ngaysinh from nhanvien
where day(ngaysinh)=day(getdate()) and month(ngaysinh)=month(getdate())
-- câu 6:
select mapxuong, count(*) as N'số lượng nhân viên theo mã phân xưởng' from nhanvien
group by mapxuong 
-- Câu 7:
select mapxuong from nhanvien
group by mapxuong
having count(manv) >=5
-- Câu 8:
create procedure prcphanxuong (@maphanxuong nvarchar(5))
as
begin
select nv.mapxuong,ds.tenxuong,ds.sodt,count(*) as N'số nhân viên' from nhanvien as nv join dspxuong as ds
on nv.mapxuong=ds.mapxuong
where ds.mapxuong= @maphanxuong
group by nv.mapxuong,ds.tenxuong,ds.sodt
end
exec prcphanxuong 'x1' 
-- câu 9:
create function funtongtienluong (@maphong nvarchar(5))
returns int
as
begin
declare @tongtienluong int
select @tongtienluong = sum(tongluong) from thunhap_nv as thunhap join nhanvien as nv
on thunhap.manv=nv.manv
join dsphong as ds
on ds.maphong=nv.maphong
where @maphong =ds.maphong
group by nv.maphong
return @tongtienluong
end
select dbo.funtongtienluong ('p1') as N'Tổng tiền lương của phòng'
-- Câu 10:
select * from thunhap_nv
select * from nhanvien
alter trigger trignhanvien on nhanvien
for delete
as
begin
declare @sothamnien int
select @sothamnien= thamnien  from thunhap_nv
where manv in (select manv from deleted)
if (@sothamnien >20)
begin
Rollback tran
print(N'Không được xoá nhân viên có thâm niên trên 20 ')
end
end
select * from nhanvien
delete from nhanvien
where manv='n6'