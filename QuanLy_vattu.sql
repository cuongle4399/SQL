CREATE DATABASE QUANLY_VatTu
GO 

USE QUANLY_VatTu
GO

CREATE TABLE Vat_Tu(
MaVTu CHAR(4) NOT NULL,
TenVTu NVARCHAR(100) NOT NULL,
DvTinh NVARCHAR(10) NOT NULL,
PhanTram INT,
CONSTRAINT pk_Vat_Tu PRIMARY KEY(MaVTu)
)

CREATE TABLE NHACC(
MaNhaCC CHAR(4) NOT NULL,
TenNhaCC NVARCHAR(100) NOT NULL,
DiaChi NVARCHAR(200),
DienThoai NVARCHAR(20) NOT NULL,
CONSTRAINT pk_NHACC PRIMARY KEY (MaNhaCC)
)

CREATE TABLE DONDH (
SoDH CHAR(4) NOT NULL,
NgayDH DATETIME ,
MaNhaCC CHAR (4),
CONSTRAINT pk_DONDH PRIMARY KEY (SoDH),
CONSTRAINT fk_NHACC_DONDH FOREIGN KEY (MaNhaCC) REFERENCES NHACC(MaNhaCC),
)

CREATE TABLE CTDONDH(
SoDH CHAR(4) NOT NULL,
MaVTu CHAR(4) NOT NULL,
SLDat INT,
CONSTRAINT pk_CTDONDH PRIMARY KEY (SoDH, MaVTu),
CONSTRAINT fk_DONDH_CTDONDH FOREIGN KEY (SoDH) REFERENCES DONDH(SoDH),
CONSTRAINT fk_Vat_Tu_CTDONDH FOREIGN KEY (MaVTu) REFERENCES Vat_Tu (MaVTu),
)

CREATE TABLE PNhap (
SoPN CHAR(4) NOT NULL,
NgayNhap DATETIME,
SoDH CHAR (4),
CONSTRAINT pk_PNhap PRIMARY KEY (SoPN),
CONSTRAINT fk_DONDH_PNhap FOREIGN KEY (SoDH) REFERENCES DONDH(SoDH),
)

CREATE TABLE CTPNhap(
SoPN CHAR(4) NOT NULL,
MaVTu CHAR(4) NOT NULL,
SLNhap INT,
DGNhap MONEY,
CONSTRAINT pk_CTPNhap PRIMARY KEY (SoPN, MaVTu),
CONSTRAINT fk_PNhap_CTPNhap FOREIGN KEY (SoPN) REFERENCES PNhap(SoPN),
CONSTRAINT fk_Vat_Tu_CTPNhap FOREIGN KEY (MaVTu) REFERENCES Vat_Tu(MaVTu),
)

CREATE TABLE PXuat(
SoPX CHAR(4) NOT NULL,
NgayXuat DATETIME,
TenKH NVARCHAR(100) NOT NULL,
CONSTRAINT pk_PXuat PRIMARY KEY (SoPX)
)

CREATE TABLE CTPXuat(
SoPX CHAR(4) NOT NULL,
MaVTu CHAR(4) NOT NULL,
SLXuat INT,
DGXuat MONEY,
CONSTRAINT pk_CTPXuat PRIMARY KEY (SoPX, MaVTu),
CONSTRAINT fk_PXuat_CTPXuat FOREIGN KEY (SoPX) REFERENCES PXuat(SoPX),
CONSTRAINT fk_Vat_Tu_CTPXuat FOREIGN KEY (MaVTu) REFERENCES Vat_Tu(MaVTu),
)

CREATE TABLE TONKHO(
NamThang CHAR(6),
MaVTu CHAR(4) NOT NULL,
SLDAU INT,
TONGSLN INT,
TONGSLX INT,
SLCuoi INT,
CONSTRAINT pk_TONKHO PRIMARY KEY (NamThang, MaVTu),
CONSTRAINT fk_Vat_Tu_TONKHO FOREIGN KEY (MaVTu) REFERENCES Vat_Tu(MaVTu),
)

ALTER TABLE Vat_Tu ADD CONSTRAINT PhanTram CHECK (PhanTram>=0  AND PhanTram<=100)
ALTER TABLE Vat_Tu ADD CONSTRAINT TenVTu UNIQUE ( TenVTu)
ALTER TABLE Vat_Tu ADD CONSTRAINT DvTinh DEFAULT N'Tấn' FOR DvTinh

ALTER TABLE NHACC ADD CONSTRAINT TenNhaCC UNIQUE (TenNhaCC)
ALTER TABLE NHACC ADD CONSTRAINT DiaChi UNIQUE (DiaChi)
ALTER TABLE NHACC ADD CONSTRAINT DEFAULT_DienThoai DEFAULT N'Chưa có' FOR DienThoai

ALTER TABLE DONDH ADD CONSTRAINT DEFAULT_NgayDH DEFAULT GETDATE() FOR NgayDH

ALTER TABLE CTDONDH ADD CONSTRAINT SLDat CHECK (SLDat>0)

ALTER TABLE CTPNhap ADD CONSTRAINT SLNhap CHECK (SLNhap>0 )
ALTER TABLE CTPNhap ADD CONSTRAINT DGNhap CHECK (DGNhap>0)

ALTER TABLE CTPXuat ADD CONSTRAINT SLXuat CHECK (SLXuat>0)
ALTER TABLE CTPXuat ADD CONSTRAINT DGXuat CHECK (DGXuat>0)
ALTER TABLE TONKHO ADD CONSTRAINT SLDAU CHECK (SLDAU>=0)
ALTER TABLE TONKHO ADD CONSTRAINT TONGSLN CHECK (TONGSLN>=0)
ALTER TABLE TONKHO ADD CONSTRAINT TONGSLX CHECK (TongSLX>=0)
ALTER TABLE TONKHO ADD CONSTRAINT DEFAULT_SLDAU DEFAULT 0 FOR SLDAU
ALTER TABLE TONKHO ADD CONSTRAINT DEFAULT_TONGSLN DEFAULT 0 FOR TONGSLN
ALTER TABLE TONKHO ADD CONSTRAINT DEFAULT_TONGSLX DEFAULT 0 FOR TONGSLX



INSERT INTO NHACC VALUES ('C01',N'Lê Minh Trí', N'54 Hậu Giang Q6 HCM', '8781024')
INSERT INTO NHACC VALUES ('C02', N'Trần Minh Thạch', N'145 Hùng Vương Mỹ Tho', '7698154')
INSERT INTO NHACC VALUES ('C03', N'Hồng Phương', N'154/85 Lê Lai Q1 HCM', '9600125')
INSERT INTO NHACC VALUES ('C04', N'Nhật Thắng', N'198/40 Hương Lộ 14 QTB HCM', '8757757')
INSERT INTO NHACC VALUES ('C05', N'Lưu Nguyệt Quế', N'178 Nguyễn Văn Luông Đà Lạt', '7964251')
INSERT INTO NHACC VALUES ('C06', N'Cao Minh Trung', N'125 Lê Quang Sung Nha Trang', N'chưa có')
select * from NHACC

INSERT INTO Vat_Tu VALUES ('DD01', N'Đầu DVD Hitachi 1 đĩa', N'Bộ', 40)
INSERT INTO Vat_Tu VALUES ('DD02', N'Đầu DVD Hitachi 3 đĩa', N'Bộ', 40)
INSERT INTO Vat_Tu VALUES ('TL15', N'Tủ lạnh Sanyo 150 lit', N'Cái', 25)
INSERT INTO Vat_Tu VALUES ('TL90', N'Tủ lạnh Sanyo 90 lit', N'Cái', 20)
INSERT INTO Vat_Tu VALUES ('TV14', N'Tivi Sony 14 inches', N'Cái', 15)
INSERT INTO Vat_Tu VALUES ('TV21', N'Tivi Sony 21 inches', N'Cái', 10)
INSERT INTO Vat_Tu VALUES ('TV29', N'Tivi Sony 29 inches', N'Cái', 10)
INSERT INTO Vat_Tu VALUES ('VD01', N'Đầu VCD Sony 1 đĩa',N'Bộ', 30)
INSERT INTO Vat_Tu VALUES ('VD02', N'Đầu VCD Sony 3 đĩa',N'Bộ', 30)
select * from Vat_Tu

INSERT INTO DONDH VALUES ('D001', '2007-01-15', 'C03')
INSERT INTO DONDH VALUES ('D002', '2007-01-30', 'C01')
INSERT INTO DONDH VALUES ('D003', '2007-02-10', 'C02')
INSERT INTO DONDH VALUES ('D004', '2007-02-17', 'C05')
INSERT INTO DONDH VALUES ('D005', '2007-01-03', 'C02')
INSERT INTO DONDH VALUES ('D006', '2007-12-03', 'C05')
select * from DONDH

INSERT INTO CTDONDH VALUES ('D001', 'DD01', 10)
INSERT INTO CTDONDH VALUES ('D001', 'DD02', 15)
INSERT INTO CTDONDH VALUES ('D002', 'VD02', 30)
INSERT INTO CTDONDH VALUES ('D003', 'TV14', 10)
INSERT INTO CTDONDH VALUES ('D003', 'TV29', 20)
INSERT INTO CTDONDH VALUES ('D004', 'TL90', 10)
INSERT INTO CTDONDH VALUES ('D005', 'TV14', 10)
INSERT INTO CTDONDH VALUES ('D005', 'TV29', 20)
INSERT INTO CTDONDH VALUES ('D006', 'TV14', 10)
INSERT INTO CTDONDH VALUES ('D006', 'TV29', 20)
INSERT INTO CTDONDH VALUES ('D006', 'VD01', 20)
select * from CTDONDH

INSERT INTO PNhap VALUES ('N001', '2007-01-17', 'D001')
INSERT INTO PNhap VALUES ('N002', '2007-01-20', 'D001')
INSERT INTO PNhap VALUES ('N003', '2007-01-31', 'D002')
INSERT INTO PNhap VALUES ('N004', '2007-02-15', 'D003')
select * from PNhap
INSERT INTO CTPNhap VALUES ('N001', 'DD01', 8,2500000)
INSERT INTO CTPNhap VALUES ('N001', 'DD02',10,3500000)
INSERT INTO CTPNhap VALUES ('N002', 'DD01', 2,2500000)
INSERT INTO CTPNhap VALUES ('N002', 'DD02', 5,3500000)
INSERT INTO CTPNhap VALUES ('N003', 'VD02',30,2500000)
INSERT INTO CTPNhap VALUES ('N004', 'TV14', 5,2500000)
INSERT INTO CTPNhap VALUES ('N004', 'TV29',12,3500000)
select * from CTPNhap

INSERT INTO PXuat VALUES ('X001', '2007-01-17', N'Nguyễn Ngọc Phương Nhi')
INSERT INTO PXuat VALUES ('X002', '2007-01-25', N'Nguyễn Hồng Phương')
INSERT INTO PXuat VALUES ('X003', '2007-01-31', N'Nguyễn Tuấn Tú')
select * from PXuat

INSERT INTO CTPXuat VALUES ('X001', 'DD01',  2, 3500000)
INSERT INTO CTPXuat VALUES ('X002', 'DD01',  1, 3500000)
INSERT INTO CTPXuat VALUES ('X002', 'DD02',  5, 4900000)
INSERT INTO CTPXuat VALUES ('X003', 'DD01',  2, 3500000)
INSERT INTO CTPXuat VALUES ('X003', 'DD02',  2, 3500000)
INSERT INTO CTPXuat VALUES ('X003', 'VD02', 10, 3250000)
select * from CTPXuat

INSERT INTO TONKHO VALUES ('200701', 'DD01', 0, 10, 6, 4)
INSERT INTO TONKHO VALUES ('200701', 'DD02', 0, 15, 7, 8)
INSERT INTO TONKHO VALUES ('200701', 'VD01', 0, 30, 10, 20)
INSERT INTO TONKHO VALUES ('200702', 'DD01', 4, 0, 0, 4)
INSERT INTO TONKHO VALUES ('200702', 'DD02', 8, 0, 0, 8)
INSERT INTO TONKHO VALUES ('200702', 'VD02', 20, 0, 0, 20)
INSERT INTO TONKHO VALUES ('200702', 'TV14', 5, 0, 0, 5)
INSERT INTO TONKHO VALUES ('200702', 'TV29', 12, 0, 0, 12)
select * from TONKHO


-----truy vấn
------Câu 1. Tăng đơn giá lên 10%
UPDATE CTPXuat
SET DGXuat=DGXuat*0.1

------Câu 2: Thêm cột thành tiền vào bảng CTPNhap, Thiết lập ràng buộc thành tiền>=0 tính cột thành tiền =đơn giá nhập*số lượng nhập.
ALTER TABLE CTPNhap
ADD THANHTIEN FLOAT

UPDATE CTPNhap
SET THANHTIEN = DGNhap * SLNhap;


------Câu 3. Xóa cột thành tiền.
ALTER TABLE CTPNhap
DROP column THANHTIEN

--------------------Bài 2 câu lệnh truy vấn cơ bản:
------Câu 1. –Hiển thị tất cả dữ liệu của bảng TONKHO 
SELECT NamThang, MaVTu, SLDAU,TONGSLN ,TONGSLX ,SLCuoi FROM TONKHO

------Hiển thị thông tin những vật tư có đơn vị tính là Bộ
SELECT MaVTu, TenVTu, DvTinh, PhanTram FROM Vat_Tu WHERE DvTinh LIKE N'Bộ'

------Câu 2. Hiển thị thông tin của những đơn đặt hàng có ngày đặt hàng trong tháng 12
SELECT SoDH, NgayDH, MaNhaCC FROM DONDH WHERE MONTH(NgayDH)=12

------Câu 3. Cho biết có bao nhiêu nhà cung cấp ở Bình Dương
SELECT TenNhaCC, DiaChi FROM NHACC WHERE DiaChi LIKE N'% Bình Dương'

------Câu 4. Hiển thị thông tin của những vật tư có đơn vị tính là Cái và có phần trăm từ 25 trở lên
SELECT MaVTu, TenVTu, DvTinh, PhanTram FROM Vat_Tu WHERE DvTinh LIKE N'Cái' AND PhanTram>25
------Câu 5. Cho biết số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập (biết Thanhtien=số lượng nhập *đơn giá nhập
SELECT SoPN, MaVTu, SLNhap, DGNhap, THANHTIEN FROM CTPNhap 

------Câu 6. Cho biết số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5
SELECT SoPN, MaVTu, SLNhap, DGNhap, THANHTIEN FROM CTPNhap WHERE SLNhap >5

------Câu 7. Cho biết số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất

ALTER TABLE CTPXuat ADD THANHTIEN FLOAT
select *from CTPXuat

UPDATE CTPXuat
SET THANHTIEN = DGXuat * SLXuat;
SELECT SoPX, MaVTu, SLXuat, DGXuat, THANHTIEN FROM CTPXuat


------Câu 8. Cho biết số lượng đặt cao nhất và thấp nhất đối với vật tư có mã là TV14
SELECT MAX(SLDat) AS SoLuongDatCaoNhat, MIN(SLDat) AS SoLuongDatThapNhat
FROM CTDONDH
WHERE MaVTu = 'TV14';

------Câu 9. Cho biết tổng số lượng đặt đối với số đơn hàng là D006
SELECT SUM(SLDat) AS TongSoLuongDat
FROM CTDONDH
WHERE SoDH = 'D006'

------Câu 10. Cho biết những vật tư có số lượng xuất từ 2 trở lên và sắp xếp giảm dần theo đơn giá.
SELECT Vat_Tu.TenVTu,CTPXuat.MaVTu,Vat_Tu.MaVTu, DGXuat, SUM(SLXuat) AS TongSoLuongXuat
FROM CTPXuat, Vat_Tu WHERE CTPXuat.MaVTu=Vat_Tu.MaVTu
GROUP BY Vat_Tu.TenVTu, CTPXuat.MaVTu,Vat_Tu.MaVTu
HAVING SUM(SLXuat) >= 2
ORDER BY DGXuat DESC;

------Câu 11. Cho biết những vật tư có các thông tin: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
SELECT 
    SoPN, TenVTu, SLNhap, DGNhap, THANHTIEN
FROM CTPNhap
INNER JOIN Vat_Tu ON CTPNhap.MaVTu = Vat_Tu.MaVTu
WHERE DVTinh = 'Bộ'
ORDER BY SoPN ASC;

------Câu 12. Tính tổng số lượng nhập của từng mã vật tư (gồm nhưng thông tin số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập)
SELECT SoPN, Vat_Tu.MaVTu,CTPNhap.MaVTu ,SUM(SLNhap) AS TongSoLuongNhap
FROM CTPNhap, Vat_Tu WHERE Vat_Tu.MaVTu=CTPNhap.MaVTu
GROUP BY SoPN, Vat_Tu.MaVTu ,CTPNhap.MaVTu
ORDER BY SoPN ASC;

------Câu 13. Liệt kê những vật tư chưa xuất lần nào gồm các thông tin, mã vật tư, tên vật tư, đơn vị
SELECT MaVTu, TenVTu, DVTinh
FROM Vat_Tu
WHERE NOT EXISTS (
    SELECT *
    FROM CTPXuat
    WHERE CTPXuat.MaVTu = Vat_Tu.MaVTu
);

------Câu 14. Liệt kê những nhà cung cấp chưa có đơn hàng nào, gồm nhưng thông tin: tên nhà cung cấp, địa chỉ, số điện thoại.
SELECT TenNhaCC, DiaChi, DienThoai
FROM NHACC
WHERE NOT EXISTS (
    SELECT *
    FROM DONDH
    WHERE DONDH.MaNhaCC = NHACC.MaNhaCC
);
------Câu 15: Cho biết những mặt hàng có nhiều đơn hàng nhất.
SELECT CTDONDH.MaVTu,Vat_Tu.MaVTu,Vat_Tu.TenVTu,  COUNT(*) AS SoLuongDonHang
FROM CTDONDH, Vat_Tu WHERE CTDONDH.MaVTu=Vat_Tu.MaVTu
GROUP BY CTDONDH.MaVTu,Vat_Tu.MaVTu,Vat_Tu.TenVTu
ORDER BY SoLuongDonHang DESC;
----------Tạo bảng VIew
USE QUANLY_VatTu
GO
---------Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng,  mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP AS
SELECT SoPN, MaVTu, SLNhap, DGNhap, THANHTIEN
FROM CTPNhap
SELECT *FROM vw_CTPNHAP

---------Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập  hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. 
CREATE VIEW vw_CTPNHAP_VT AS
SELECT CTPN.SoPN, VT.MaVTu, VT.TenVTu, CTPN.SLNhap, CTPN.DGNhap, CTPN.THANHTIEN
FROM CTPNhap CTPN INNER JOIN Vat_Tu VT ON CTPN.MaVTu=VT.MaVTu 
SELECT* FROM vw_CTPNHAP_VT

---------Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu  nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá  nhập, thành tiền nhập. 
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT CTPN.SoPN, PN.NgayNhap, PN.SoDH, VT.MaVTu, VT.TenVTu, CTPN.SLNhap, CTPN.DGNhap, CTPN.THANHTIEN
FROM CTPNhap CTPN INNER JOIN Vat_Tu VT ON CTPN.MaVTu= VT.MaVTu INNER JOIN PNhap PN ON CTPN.SoPN=PN.SoPN
SELECT*FROM vw_CTPNHAP_VT_PN

---------Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu  nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số  lượng nhập, đơn giá nhập, thành tiền nhập. 
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT CTPN.SoPN, PN.NgayNhap, PN.SoDH, VT.MaVTu, VT.TenVTu, CTPN.SLNhap, CTPN.DGNhap, CTPN.THANHTIEN, DH.MaNhaCC
FROM CTPNhap CTPN INNER JOIN Vat_Tu VT ON CTPN.MaVTu= VT.MaVTu INNER JOIN PNhap PN ON CTPN.SoPN=PN.SoPN INNER JOIN DONDH DH ON PN.SoDH=DH.SoDH INNER JOIN NHACC CC ON DH.MaNhaCC= CC.MaNhaCC
SELECT *FROM vw_CTPNHAP_VT_PN_DH

---------Câu 5. Tạo view có tên vw_CTPNHAP_loc bao gồm các thông tin sau: số phiếu nhập  hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết  nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
SELECT CTPNhap.SoPN, MaVTu, SLNhap, DGNhap, THANHTIEN
FROM CTPNhap WHERE SLNhap>5
SELECT *FROM vw_CTPNHAP_loc

---------Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập  hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các  chi tiết nhập vật tư có đơn vị tính là Bộ. 
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT CTPN.SoPN, VT.MaVTu, VT.TenVTu, CTPN.SLNhap, CTPN.DGNhap, CTPN.THANHTIEN
FROM CTPNhap CTPN INNER JOIN Vat_Tu VT ON CTPN.MaVTu=VT.MaVTu 
WHERE DvTinh = N'Bộ'
SELECT *FROM vw_CTPNHAP_VT_loc

---------Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng,  mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất. 
CREATE VIEW vw_CTPXUAT AS
SELECT CTPXuat.SoPX, MaVTu, SLXuat, DGXuat, THANHTIEN
FROM CTPXuat
SELECT *FROM vw_CTPXUAT

---------Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất  hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất. 
CREATE VIEW vw_CTPXUAT_VT AS
SELECT CTPX.SoPX, VT.MaVTu, VT.TenVTu, CTPX.SLXuat, CTPX.DGXuat, CTPX.THANHTIEN
FROM CTPXuat CTPX INNER JOIN Vat_Tu VT ON CTPX.MaVTu=VT.MaVTu 
SELECT *FROM vw_CTPXUAT_VT

---------Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất  hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất. 
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT CTPX.SoPX, PX.TenKH , VT.MaVTu, VT.TenVTu, CTPX.SLXuat, CTPX.DGXuat, CTPX.THANHTIEN
FROM CTPXuat CTPX INNER JOIN Vat_Tu VT ON CTPX.MaVTu=VT.MaVTu INNER JOIN PXuat PX ON CTPX.SoPX= PX.SoPX
SELECT *FROM vw_CTPXUAT_VT_PX
use QUANLY_VatTu
-------------------------------------------PROCEDURE
--Câu 1. Tạo Stored procedure (SP) cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
create procedure prcsoluong (@mavattu varchar(5))
as
begin
select MaVTu,sum(slcuoi) as N'Tổng số lượng cuối' from tonkho
where MaVTu= @mavattu
group by MaVTu
end
exec prcsoluong 'DD01'
--Câu 2. Tạo SP cho biết tổng tiền xuất của vật tư với mã vật tư là tham số vào.
create procedure prctienxuat (@mavattu varchar(5))
as
begin
select MaVTu, sum(DGXuat) as N'Tổng tiền xuất' from CTPXuat
where @mavattu=MaVTu
group by MaVTu
end
exec prctienxuat'DD01'
--Câu 3. Tạo SP cho biết tổng số lượng đặt theo số đơn hàng với số đơn hàng là tham số vào
create procedure prcsoluongdat (@sodonhang varchar(5))
as
begin
select sodh, sum(SLdat) as N'Tổng ố lượng đơn hàng đã đặt' from CTDONDH
where sodh= @sodonhang
group by sodh
end
exec prcsoluongdat 'D001'
--Câu 4. Tạo SP dùng để thêm một đơn đặt hàng.
select * from CTDONDH
create procedure prcdonhang (@sodonhang1 char(4), @sodonhang datetime,@manhacc char(4))
as
begin
insert into DonDh values(@sodonhang1,@sodonhang,@manhacc)
end
exec prcdonhang 'D007', '2007-02-17', 'C05'
--Câu 5. Tạo SP dùng để thêm một chi tiết đơn đặt hàng.
select * from CTDONDH
create procedure prcchitietdonhang (@sodonhang char(4), @mavattu char(4),@soluongdat int)
as
begin
insert into CtDonDh values(@sodonhang,@mavattu,@soluongdat)
end
exec prcchitprcchitietdonhang'D006','TL90','10'
----------------------------FUNCTION
--Câu 1. Viết function tên fn_ThongKeSLDatTheoNhaCungCap, kiểu trả về là table: dùng để lấy tổng số lượng đặt theo từng nhà cung cấp.
create function fn_thongkesldattheonhacungcap (@manhacungcap char (4))
returns table
as
return (
select d.MaNhaCC,sum(ct.SLDat) as N'Tổng số lượng đặt của nhà cung cấp'from dondh as d join ctdondh as ct
on d.SoDH=ct.SoDH
where MaNhaCC =@manhacungcap
group by d.manhaCC
)
select * from fn_thongkesldattheonhacungcap ('C03')
-- Viết function tên fn_LayThongTinNhaCungCap, kiểu trả về là int và nhận tham số @MaNhaCC: dùng để đếm số hóa đơn của nhà cung cấp.
create function fn_laythongtinnhacungcap (@manhaCC char(4))
returns int
as
begin
declare @dem int
select @dem=count(*) from donDH 
where @manhaCC=MaNhaCC
group by ManhaCC
return @dem
end
select dbo.fn_laythongtinnhacungcap('C01') as N'Tống số đơn của nhà cung cấp'
--Câu 3. Viết function tên fn_LayThongTinPhieuNhap, kiểu trả về float và nhận tham số 
-- @SoPN: dùng để tính tổng số tiền nhập của @SoPN.
create function fn_laythongtinphieunhap (@soPn char(4))
returns float
as
begin
return (select sum(DGNhap) from CTPNhap
where @soPn=sopn
group by SoPn) 
end
select dbo.fn_laythongtinphieunhap('N001') as N'Tổng tiền'
--Câu 4. Viết function tên fn_LayThongTinPhieuXuat, kiểu trả về int và nhận tham số 
--@year: dùng để đếm số phiếu xuất được lập trong năm @year.
create function fn_laythongtinphieuxuat (@year int)
returns int
as
begin
return (select count(*) from PXuat
where @year= year(NgayXuat)
group by year(NgayXuat)
)
end
select dbo.fn_laythongtinphieuxuat ('2007') as [số phiếu xuất trong năm]
--Câu 5. Viết function tên fn_LayThongTinVatTuTheoPhieuXuat, kiểu trả về table: dùng 
--để đếm số vật tư theo từng phiếu xuất.
create function fn_laythongtinvattutheophieuxuat ()
returns table
as
return (select soPx,count(*) as[Số vật tư] from CTPXuat
group by soPx)
select * from fn_laythongtinvattutheophieuxuat ()
------------------------------------ TRIGGER-----------------------------------------
--Câu 1. Tạo trigger khi update hoặc insert dữ liệu của bảng TONKHO, cột SLCuoi được
--tính theo công thức SLCuoi = SLDau + TongSLN – TongSLX
create trigger trigtonkho on tonkho
after update, insert
as
begin
declare @mavattu char(4)
select @mavattu= MaVTu from inserted
declare @sldau int
select @sldau = SLDAU from inserted
where maVtu=@mavattu
declare @tongsln int
select @tongsln = TONGSLN from inserted
where maVtu=@mavattu
declare @tongslx int
select @tongslx = TONGSLX from inserted
where maVtu=@mavattu
if exists(select * from inserted)
begin
update tonkho
set slcuoi = @sldau+ @tongsln-@tongslx
where MaVTu = @mavattu and NamThang = (select NamThang from inserted)
print(N'Đã update slcuoi')
end
end
-- test
update tonkho
set SLDAU=12
where slcuoi= 5
-- Câu 2. Tạo trigger khi update cột SLNhap của bảng CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật theo.
drop trigger trigupdatenhap on ctpnhap
after update
as
begin
declare @soluongnhap_cukhac int
select @soluongnhap_cukhac = sum(slnhap) from CTPNhap
where sopn not in (select sopn from inserted) and MaVtu = (select MaVtu from inserted)
group by MaVtu
declare @soluongnhap_moi int
select @soluongnhap_moi = sum(slnhap) from inserted
group by MaVtu
update tonkho
set TONGSLN= @soluongnhap_moi + @soluongnhap_cukhac
where maVtu = (select maVtu from inserted)
print(N'Đã update tổng số lượng nhập trong bảng tồn kho thành cong')
end
-- test
update CTPNhap
set SLNhap=8
where MaVTu='DD01' and soPN='N001'
--Câu 3. Tạo trigger khi update cột SLXuat của bảng CTPXUAT thì cột TongSLX của bảng TONKHO được cập nhật theo.
drop trigger trigupdatexuat on ctpxuat
after update
as
begin
declare @soluongxuat_cukhac int
select @soluongxuat_cukhac = sum(slxuat) from CTPXuat
where SoPX not in (select SoPX from inserted) and MaVtu = (select MaVtu from inserted)
group by MaVtu
declare @soluongxuat_moi int
select @soluongxuat_moi = sum(SLXuat) from inserted
group by MaVtu
update tonkho
set TONGSLX= @soluongxuat_moi + @soluongxuat_cukhac
where maVtu = (select maVtu from inserted)
print(N'Đã update tổng số lượng xuat trong bảng tồn kho thành cong')
end
-- test 
update CTPXuat
set SLXuat=4
where maVtu='DD01' and SoPX='X001'
--Câu 4. Tạo trigger khi update hoặc insert cột SLNhap của bảng CTPNHAP thì tổng số
--lượng nhập <= tổng số lượng đặt của bảng CTDONDH.
create trigger trigconstraint on CTPNhap
for update,insert
as
begin
declare @soluongnhap_moi int
select @soluongnhap_moi = sum(SLNhap) from inserted
group by MaVTu
declare @soluongnhap_cu int
select @soluongnhap_cu = sum(SLNhap) from CTPNhap
where soPN not in (select soPN from inserted) and MaVTu = (select MaVTu from inserted)
group by MaVtu
declare @tongsoluongnhap int
set @tongsoluongnhap= @soluongnhap_cu+ @soluongnhap_moi
declare @tongsoluongdat int 
select @tongsoluongdat =sum(sldat) from CTDONDH
where MaVtu = (select MaVTu from inserted)
group by MaVTu
if (@tongsoluongnhap > @tongsoluongdat)
begin
rollback tran
print(N'tổng số lượng nhập phải nhỏ hơn hoặc bằng tổng số lượng đặt')
end
end
--test
INSERT INTO CTPNhap VALUES ('N003', 'DD01', 8999,2500000)
-- Câu 5. Tạo trigger khi delete một CTPNHAP thì cột TongSLN của bảng TONKHO được cập nhật tương ứng.
alter trigger trgdelete on CTPNhap
after delete
as
begin
declare @tongsoluonhnhap_conlai int
select @tongsoluonhnhap_conlai= sum(slnhap) from CTPNhap
where MaVTu = (select MaVtu from deleted) and soPn not in (select soPN from deleted)
group by MaVTu
update TONKHO
set TONGSLN= @tongsoluonhnhap_conlai 
where MaVtu = (select MaVtu from deleted)
print(N'Đã cập nhập lại tổng số lượng nhập trong bảng tồn kho')
end
--test
delete from CTPNhap
where SoPN= 'N004' and MaVtu ='TV14'