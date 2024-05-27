--Câu 1. Liệt kê những máy bay có Maker là Boeing, Model 757 có LastMaint vào ngày 2
select * from plane
where Maker='Boeing' and Model=757 and day(LastMaint) =2
--Câu 2. cho biết những chuyến bay có mã FLNO=1010 có thời gian đến là ngày '1/1/2022 20:20' và có hút thuốc bằng N
select fl.FLNO,f.Smoking,fl.ArrTime from FlightLeg as fl join Flight as f
on fl.FLNO = f.FLNO
where fl.FLNO=1010 and fl.ArrTime= '1/1/2022 20:20' and f.smoking='N'
-- Câu 3: Câu 3. Xóa những chuyến bay có ActArr= null
delete from FlightLegInstance
where ActArr is null
-- Câu 4. Tạo view lưu những thông tin của chuyến bay có thành phố Chicago gồm các thông tin FLNo, FromA, ToA, FDate, Pilot
create view viwthongtin as
select fl.FLNO, fl.FromA, fl.ToA, fls.FDate,fls.Pilot from Airport as a join FlightLeg as fl
on a.Code= fl.ToA
join FlightLegInstance as fls
on fl.FLNO=fls.FLNO
where a.city='Chicago'
select * from viwthongtin
-- Câu 5. Thống kê những chuyến bay vào ngày 5 (FDate)
select * from  FlightLegInstance
where day(FDate) =5
--Câu 6. Cho biết những sân bay(FromA) có số lần đặt chỗ 3 lần trở lên
select FromA from Reservation
group by FromA
having count(*) >=3
--Câu 7. Cho biết sân bay nào có nhiều chuyến bay nhất?
select top 1 FromA from Reservation
group by fromA
order by count(*) desc
-- Câu 8. Viết thủ tục với tham số đầu vào là mã chuyến bay (LLNO) hiện thông tin của chuyến bay của mã đó
create procedure prcthongtin(@machuyenbay int )
as
begin
select * from FlightLeg
where FLNO = @machuyenbay
end
exec prcthongtin '1000'
-- Câu 9. Viêt hàm tính số lần cất cánh của sân bay x (X là tham số đầu vào và là tên của sân bay xuất phát (FromA))
create function funsolanbay (@tensanbay char(3))
returns int
as
begin
declare @solanbay int
select @solanbay= count(*) from FlightLeg
where fromA =@tensanbay
group by fromA
return @solanbay
end
select dbo.funsolanbay ('INT') as N'số lần bay '
-- Câu 10. Viết trigger không cho phép ngày đặt trùng với ngày bay
create trigger trigngaydat on Reservation
for insert , update
as
begin
declare @ngaydat varchar(10) 
select @ngaydat= DateBooked from Reservation
where PassID in (select PassID from inserted)
declare @ngaybay varchar(10)
select @ngaybay= FDate from Reservation
where PassID in (select PassID from inserted)
if (@ngaydat = @ngaybay)
begin
rollback tran
print(N'Không được phép đặt trùng với ngày bay')
end
end
-----test
INSERT INTO Reservation (PassID, FLNO, FDate, FromA, ToA, SeatClass, DateBooked) VALUES (1, 1000, '11/5/2022', 'DFW', 'LOG', 'E', '11/5/2022');