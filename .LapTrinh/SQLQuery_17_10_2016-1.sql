CREATE DATABASE QLBH_1005_TEST
GO
-----------------------------------------------------
-----------------------------------------------------
USE QLBH_1005_TEST
GO
---------------------------------------------
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON DROP CONSTRAINT FK01_HD
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE HOADON DROP CONSTRAINT FK02_HD
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD DROP CONSTRAINT FK01_CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
ALTER TABLE CTHD DROP CONSTRAINT FK02_CTHD
-----------------------------------------------------
-----------------------------------------------------
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------
SELECT * FROM KHACHHANG
SELECT * FROM NHANVIEN
SELECT * FROM SANPHAM
SELECT * FROM HOADON
SELECT * FROM CTHD

-- 12. Tim mua cac hoa don  mua cac san pham 'BB01' va 'BB02' va so luong mua tu 10 den 20
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02') AND SL BETWEEN 10 AND 20

-- 13. Tim cac so hoa don mua cac san pham co 2 ma so tren, so luong tu 10 den 20
SELECT SOHD 
FROM CTHD
WHERE MASP = 'BB01'
INTERSECT 
SELECT SOHD
FROM CTHD
WHERE MASP = 'BB02'
INTERSECT
SELECT SOHD
FROM CTHD
WHERE SL BETWEEN 10 AND 20

-- CACH KHAC

SELECT SOHD
FROM CTHD
WHERE MASP = 'BB01' 
					AND SOHD IN (
									SELECT SOHD
									FROM CTHD
									WHERE MASP = 'BB02'
									)
					AND SL BETWEEN 10 AND 20

-- 14. IN RA DANH SACH CAC SAN PHAM (MASP, TENSP) DO "Trung Quoc" SAN XUAT HOAC CAC SAN PHAM DUOC BAN RA TRONG NGAY 1/1/2007
SELECT S.MASP, S.TENSP
FROM SANPHAM S, HOADON H, CTHD T
WHERE NUOCSX = 'Trung Quoc' AND NGHD = '1/1/2007' AND S.MASP = T.MASP AND H.SOHD = T.SOHD

-- 15. IN RA CAC SAN PHAM KHONG BAN DUOC (MASP, TENSP)
SELECT MASP, TENSP
FROM SANPHAM
EXCEPT
SELECT S.MASP, TENSP
FROM CTHD C, SANPHAM S -- HOAC CTHD C JOIN SANPHAM S ON S.MASP = C.MASP
WHERE C.MASP = S.MASP

-- CACH KHAC:
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD)

--16. CAU 15 THEM DIEU KIEN TRONG NAM 2006
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP NOT IN (
					SELECT MASP
					FROM CTHD C, HOADON H
					WHERE C.SOHD = H.SOHD
					) 

-- CACH KHAC: 

SELECT MASP, TENSP
FROM SANPHAM
EXCEPT
SELECT S.MASP, TENSP
FROM CTHD C, SANPHAM S, HOADON H -- HOAC CTHD C JOIN SANPHAM S ON S.MASP = C.MASP
WHERE C.MASP = S.MASP AND H.SOHD = C.SOHD AND YEAR(NGHD) = 2006

-- 18. 


-- 20. CO BAO NHIEU HOA DON KHONG PHAI LA CUA KHACH HANG DANG KY THANH VIEN
SELECT COUNT(SOHD)
FROM HOADON
WHERE MAKH IS NULL

-- 21. CO BAO NHIEU SAN PHAM KHAC NHAU DUOC BAN RA TRONG NAM 2006
SELECT COUNT (DISTINCT MASP)
FROM HOADON H, CTHD C
WHERE H.SOHD = C.SOHD AND YEAR(NGHD) = 2006

-- 22.
SELECT MAX(TRIGIA), MIN(TRIGIA)
FROM HOADON 

-- 23. TRI GIA TRUNG BINH CAC HOA DON BAN RA TRONG NAM 2006
SELECT AVG(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- 24. TINH DOANH THU BAN HANG TRONG NAM 2006
SELECT SUM(TRIGIA)
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- 25. TIM SO HOA DON CO TRI GIA CAO NHAT TRONG NAM 2006
SELECT SOHD
FROM HOADON
WHERE TRIGIA = (
				SELECT MAX(TRIGIA)
				FROM HOADON
				WHERE YEAR(NGHD) = 2006								
							)
			AND YEAR(NGHD) = 2006


--------------------------------------------------------


-- 1. LIET KE THONG TIN HOA DON(SOHD, NGHD) VA TONG SO LUONG SAN PHAM DA BAN
SELECT H.SOHD, H.NGHD, SUM(C.SL) TONGSL
FROM HOADON H, CTHD C
WHERE H.SOHD = C.SOHD
GROUP BY H.SOHD, H.NGHD

-- 2. KHACH HANG NAO DA MUA SAN PHAM CO MA SO 'BB01' VA 'BB02'
SELECT *
FROM KHACHHANG
WHERE MAKH IN 
(SELECT H.MAKH
FROM HOADON H JOIN CTHD C ON H.SOHD = C.SOHD
WHERE C.MASP = 'BB01' AND H.MAKH IN 
									(
										SELECT H.MAKH
										FROM HOADON H JOIN CTHD C  ON H.SOHD = C.SOHD
										WHERE C.MASP = 'BB02'
									)
									)
-- 3. KHACH HANG NAO DA MUA SAN PHAM CO MA SO 'BB01' KHONG MUA 'BB02'
SELECT H.MAKH
FROM HOADON H JOIN CTHD C ON H.SOHD = C.SOHD
WHERE C.MASP = 'BB01' AND H.MAKH NOT IN 
									(
										SELECT H.MAKH
										FROM HOADON H JOIN CTHD C  ON H.SOHD = C.SOHD
										WHERE C.MASP = 'BB02'
									)

-- 4. LIET KE THONG TIN KHACH HANG (MAKH) VA SO LUONG HOA DON MA NGUOI NAY DA MUA TRONG NAM 2006
SELECT MAKH, COUNT(SOHD) SLHD
FROM HOADON
WHERE YEAR(NGHD) = 2006 
GROUP BY MAKH

-- 5. LIET KE THONG TIN TAT CA KHACH HANG(MAKH, HOTEN) VA THONG TIN HOA DON(SOHD, NGHD) MA NGUOI NAY DA MUA (NEU CO)
SELECT K.MAKH, K.HOTEN, H.SOHD, H.NGHD
FROM KHACHHANG K LEFT JOIN HOADON H ON K.MAKH = H.MAKH

-- 6. LIET KE THONG TIN SAN PHAM(MASP, TENSP) VA TONG SO LUONG SAN PHAM DA DUOC BAN
SELECT S.TENSP, S.MASP, SUM(C.SL) TONGSL
FROM SANPHAM S JOIN CTHD C ON S.MASP = C.MASP
GROUP BY S.TENSP, S.MASP

-- 7. KHACH HANG NAO DUOC SINH NAM 1971 DA MUA HANG VOI GIA TRI HOA DON LON HON 300000 TRONG NAM 2007
SELECT K.MAKH
FROM KHACHHANG K JOIN HOADON H ON K.MAKH = H.MAKH
WHERE YEAR(K.NGSINH) = 1971 AND H.TRIGIA > 300000 AND YEAR(H.NGHD) = 2007

-- 8. HIEN THI THONG TIN HOA DON (SOHD, NGHD) VA NHAN VIEN (MANV, HOTEN) CUA NHUNG HOA DON CO GIA TRI LON HON 2.000.000
SELECT H.SOHD, H.NGHD, N.MANV, N.HOTEN
FROM HOADON H JOIN NHANVIEN N ON H.MANV = N.MANV
WHERE H.TRIGIA > 2000000
---------------------------------------
--TUAN SAU LAM TU 32->39

-- 26.khach hang da mua hoa don co tri so cao nhat
SELECT K.MAKH, HOTEN
FROM HOADON H, KHACHHANG K
WHERE H.MAKH=K.MAKH AND YEAR(NGHD)=2006 AND
	TRIGIA = (
				SELECT MAX(TRIGIA)
				FROM HOADON
				WHERE YEAR(NGHD)=2006
				)

-- 27. 3 KHACH HANG DOANH SO CAO NHAT
SELECT	TOP 3 MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
-- 28. DANH SACH SAN PHAM CO GIA BAN LA 1 TRONG 3 MUWC GIA CAO NHAT
SELECT	MASP, TENSP
FROM SANPHAM
WHERE GIA IN (	SELECT DISTINCT TOP 3 GIA
				FROM SANPHAM
				ORDER BY GIA DESC)
-- 29. DANH SACH SAM PHAM DO THAILAND SAN XUAT VA CO GIA LA 1 TRONG 3 GIA CAO NHAT
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX='Thai Lan' AND GIA IN (
										SELECT DISTINCT TOP 3 GIA
										FROM SANPHAM
										ORDER BY GIA DESC
									)
-- 30.  DANH SACH SAM PHAM DO TRUNG QUOC SAN XUAT VA CO GIA LA 1 TRONG 3 GIA CAO NHAT (CUA TRUNG QUOC)
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX='Trung Quoc' AND GIA IN (
										SELECT DISTINCT TOP 3 GIA
										FROM SANPHAM
										WHERE NUOCSX='Trung Quoc'
										ORDER BY GIA DESC
									)
-- 31. DANH SACH 3 KHACH HANG CO DOANH SO CAO NHAT
SELECT TOP 3 *
FROM KHACHHANG
ORDER BY DOANHSO DESC
-- 32. TINH TONG SO SAN PHAM DO CHINA SAN XUAT
SELECT COUNT(MASP)
FROM SANPHAM
WHERE NUOCSX='Trung Quoc'
-- 33. TONG SO SAN PHAM TUNG NUOC SAN XUAT
SELECT NUOCSX, COUNT(MASP)
FROM SANPHAM
GROUP BY NUOCSX
-- 34. VOI TUNG NUOC, TINH GIA CAO NHAT, THAP NHAT, TRUNG BINH
SELECT NUOCSX, MAX(GIA) GIACAONHAT, MIN(GIA) GIATHAPNHAT , AVG(GIA) GIATRUNGBINH 
FROM SANPHAM
GROUP BY NUOCSX
-- 35. DOANH THU BAN HANG MOI NGAY
SELECT NGHD, SUM(TRIGIA) DOANHTHU
FROM HOADON
GROUP BY NGHD
-- 36. TONG SO LUONG TUNG SAN PHAM BAN RA THANG 10/2006
SELECT C.MASP, SUM(SL)SOLUONG
FROM HOADON H, CTHD C
WHERE H.SOHD=C.SOHD AND MONTH(NGHD)=10 AND YEAR(NGHD)=2006
GROUP BY MASP
-- 37. DOANH THU BAN HANG TUNG THANG
SELECT MONTH(NGHD) THANG, SUM(TRIGIA) DOANHTHU
FROM HOADON
WHERE YEAR(NGHD)=2006
GROUP BY MONTH(NGHD)
-- 38. HOA DON CO MUA IT NHAT 4 SP KHAC NHAU
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP)>=4
-- 39. HOA DON MUA 3 SP DO VIETNAM SX (KHAC NHAU)
SELECT SOHD
FROM CTHD C, SANPHAM S
WHERE C.MASP=S.MASP AND NUOCSX='Viet Nam'
GROUP BY SOHD
HAVING COUNT(DISTINCT C.MASP)=3
-- 40. KHACH HANG CO SO LAN MUA HANG NHIEU NHAT
SELECT K.MAKH, HOTEN
FROM KHACHHANG K, HOADON H
WHERE K.MAKH=H.MAKH
GROUP BY K.MAKH, HOTEN
HAVING COUNT(SOHD) = (	SELECT TOP 1 COUNT(SOHD)
						FROM HOADON
						GROUP BY MAKH
						ORDER BY COUNT(SOHD) DESC
						)
--  ALL
SELECT	K.MAKH, HOTEN
FROM	KHACHHANG K, HOADON H
WHERE	K.MAKH=H.MAKH
GROUP BY K.MAKH, HOTEN
HAVING	COUNT(SOHD) >= ALL	(	
							SELECT COUNT(SOHD)
							FROM HOADON
							GROUP BY MAKH
							)
--  ALL
-- 41. THANG CO DOANH SO BAN HANG CAO NHAT TRONG NAM 2006
SELECT MONTH(NGHD)
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
HAVING SUM(TRIGIA) >= ALL (	
						SELECT SUM(TRIGIA)
						FROM HOADON
						GROUP BY MONTH(NGHD)
						)
-- 42. SAN PHAM CO SO LUONG BAN RA THAP NHAT TRONG NAM 2006
SELECT S.MASP, TENSP
FROM SANPHAM S, CTHD C, HOADON H
WHERE S.MASP=C.MASP AND C.SOHD=H.SOHD AND YEAR(NGHD)=2006
GROUP BY S.MASP, TENSP
HAVING SUM(SL) <= ALL (	
							SELECT SUM(SL)
							FROM HOADON H, CTHD C
							WHERE H.SOHD=C.SOHD AND YEAR(NGHD)=2006
							GROUP BY MASP
							)
-- 43. SAN PHAM CO GIA BAN CAO NHAT CUA MOI NUOC
SELECT S.NUOCSX,S.MASP, S.TENSP 
FROM SANPHAM S, (	SELECT NUOCSX, MAX(GIA) MAXGIA
					FROM SANPHAM
					GROUP BY NUOCSX) A
WHERE S.NUOCSX=A.NUOCSX AND S.GIA=A.MAXGIA
-- 44. NUOC SX RA 3 SAN PHAM CO GIA BAN KHACH NHAU
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3
-- 45. TRONG 10 KHACH HANG CO DOANH SO CAO NHAT, TIM KHACH HANG CO SO LAN MUA HANG NHIEU NHAT
SELECT		H.MAKH
FROM		HOADON H,	(	SELECT TOP 10 DOANHSO, MAKH
							FROM KHACHHANG
							ORDER BY DOANHSO DESC) A
WHERE		H.MAKH=A.MAKH
GROUP BY	H.MAKH	
HAVING		COUNT(H.SOHD) >= ALL (	SELECT COUNT(H.SOHD)
									FROM	HOADON H,	(	SELECT TOP 10 DOANHSO, MAKH
															FROM KHACHHANG
															ORDER BY DOANHSO DESC) A
									WHERE H.MAKH=A.MAKH
									GROUP BY H.MAKH
								)
								

--I: Ngon ngu dunh nghia du lieu:
-- CAU 11: ------------
CREATE TRIGGER TR_NGHD_NGDK
ON HOADON
FOR INSERT
AS
	DECLARE @V_MAKH CHAR(4), @V_NGHD SMALLDATETIME, @V_NGDK SMALLDATETIME
	SELECT @V_MAKH=MAKH, @V_NGHD=NGHD FROM INSERTED
	SELECT @V_NGDK=NGDK FROM KHACHHANG WHERE MAKH=@V_MAKH
	IF (@V_NGHD < @V_NGDK)
		BEGIN
			PRINT 'NGHD PHAI LON HON HOAC BANG NGAY DANG KY'
			ROLLBACK TRANSACTION
		END
SET DATEFORMAT DMY;
INSERT INTO HOADON VALUES (1024, '11-11-2000', 'KH01', 'NV01', 32222);
-- CACH KHAC:
CREATE TRIGGER TR_NGHD_NGDK
ON HOADON
FOR INSERT
AS
	IF EXISTS (	SELECT *
				FROM KHACHHANG K, INSERTED I
				WHERE K.MAKH=I.MAKH AND I.NGHD < K.NGDK)
		BEGIN
			PRINT 'NGHD PHAI LON HON HOAC BANG NGAY DANG KY'
			ROLLBACK TRANSACTION
		END 
-- UPDATE:
CREATE TRIGGER TR_NGHD_NGDK
ON HOADON
FOR UPDATE
AS
	DECLARE @V_MAKH CHAR(4), @V_NGHD SMALLDATETIME, @V_NGDK SMALLDATETIME
	SELECT @V_MAKH=MAKH, @V_NGHD=NGHD FROM INSERTED
	SELECT @V_NGDK=NGDK FROM KHACHHANG WHERE MAKH=@V_MAKH
	IF (@V_NGHD < @V_NGDK)
		BEGIN
			PRINT 'NGHD PHAI LON HON HOAC BANG NGAY DANG KY'
			ROLLBACK TRANSACTION
		END
SET DATEFORMAT DMY;
INSERT INTO HOADON VALUES (1024, '11-11-2000', 'KH01', 'NV01', 32222);

-- INSERT AND UPDATE
CREATE TRIGGER TR_NGHD_NGDK
ON HOADON
FOR INSERT, UPDATE
AS
	DECLARE @V_MAKH CHAR(4), @V_NGHD SMALLDATETIME, @V_NGDK SMALLDATETIME
	SELECT @V_MAKH=MAKH, @V_NGHD=NGHD FROM INSERTED
	SELECT @V_NGDK=NGDK FROM KHACHHANG WHERE MAKH=@V_MAKH
	IF (@V_NGHD < @V_NGDK)
		BEGIN
			PRINT 'NGHD PHAI LON HON HOAC BANG NGAY DANG KY'
			ROLLBACK TRANSACTION
		END
SET DATEFORMAT DMY;
INSERT INTO HOADON VALUES (1024, '11-11-2000', 'KH01', 'NV01', 32222);
-- UPDATE NGDK
CREATE TRIGGER TR_NGDK_KHACHHANG
ON KHACHHANG
FOR UPDATE
AS
	IF (UPDATE(NGDK))
	BEGIN
		IF EXISTS ( 	SELECT *
						FROM HOADON H, INSERTED I
						WHERE H.MAKH=I.MAKH AND I.NGDK < H.NGHD)
			BEGIN
				PRINT 'NGHD PHAI LON HON HOAC BANG NGAY DANG KY'
				ROLLBACK TRANSACTION
			END
	END
-- CAU13: MOI HOA DON PHAI CO IT NHAT 1 CHI TIET HOA DON
CREATE TRIGGER TR_SOHD_HOADON
ON CTHD
FOR DELETE
AS
	IF NOT EXISTS	(	SELECT *
						FROM CTHD
						WHERE SOHD IN (	SELECT SOHD
										FROM DELETED)
					)
			BEGIN
				PRINT 'MOI HOA DON PHAI CO IT NHAT 1 CTDH'
				ROLLBACK TRANSACTION
			END
