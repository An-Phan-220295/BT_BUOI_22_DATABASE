CREATE DATABASE BT_BUOI_22_DATABASE;
USE BT_BUOI_22_DATABASE;

CREATE TABLE SanPham(
	masanpham int auto_increment,
	tensanpham varchar(50),
	gianhap float(10),
	gianiemyet float(10),
	soluong int(50),
	`phantramgiamgia(%)` float(10),
	
	primary key(masanpham),
	manhacungcap_NhaCungCap varchar(50)
);

CREATE TABLE NhaCungCap(
	manhacungcap varchar(50),
	tennhacungcap varchar(50),
	maloaisanpham varchar (50),
	tenloaisanpham varchar(50),
	
	primary key(manhacungcap)
);

INSERT INTO SanPham (tensanpham,gianhap,gianiemyet,soluong,`phantramgiamgia(%)`,manhacungcap_NhaCungCap) 
VALUES ('SamSung',6000000,6000000,40,5,'SS');

INSERT INTO SanPham (tensanpham,gianhap,gianiemyet,soluong,`phantramgiamgia(%)`,manhacungcap_NhaCungCap) 
VALUES ('Macbook',9000000,9000000,300,10,'A');

INSERT INTO SanPham (tensanpham,gianhap,gianiemyet,soluong,`phantramgiamgia(%)`,manhacungcap_NhaCungCap) 
VALUES ('Vio',10000000,15000000,900,2,'SN');

INSERT INTO SanPham (tensanpham,gianhap,gianiemyet,soluong,`phantramgiamgia(%)`,manhacungcap_NhaCungCap) 
VALUES ('Iphone',7000000,10000000,60,12,'A');

INSERT INTO SanPham (tensanpham,gianhap,gianiemyet,soluong,`phantramgiamgia(%)`,manhacungcap_NhaCungCap) 
VALUES ('Samsung',10000000,20000000,300,20,'SS');

INSERT INTO NhaCungCap (manhacungcap,tennhacungcap,maloaisanpham,tenloaisanpham) VALUES ('SS','Samsung','VN','Smartphone');
INSERT INTO NhaCungCap (manhacungcap,tennhacungcap,maloaisanpham,tenloaisanpham) VALUES ('A','Apple','EU','Tablet');
INSERT INTO NhaCungCap (manhacungcap,tennhacungcap,maloaisanpham,tenloaisanpham) VALUES ('SN','Sony','CN','Laptop');

ALTER TABLE SanPham ADD CONSTRAINT FK_manhacungcap_NhaCungCap_SanPham 
FOREIGN KEY(manhacungcap_NhaCungCap) REFERENCES NhaCungCap(manhacungcap);

-- 1.1 Lấy danh sách tất cả sản phẩm
SELECT * FROM SanPham;

-- 1.2 Chỉ lấy các thông tin về mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán),
-- số lượng, % giảm giá của các sản phẩm
SELECT masanpham, tensanpham, gianhap, gianiemyet, soluong, `phantramgiamgia(%)` FROM SanPham;

-- 1.3. Lấy mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết 
-- (giá bán) của những sản phẩm có số lượng còn lại > 60
SELECT masanpham, tensanpham, gianhap, gianiemyet,soluong FROM SanPham WHERE soluong > 60;

-- 1.4. Lấy 3 sản phẩm mới nhất vừa được thêm vào Hệ thống
SELECT * FROM SanPham ORDER BY masanpham DESC LIMIT 0 , 3;

-- 1.5. Lấy sản phẩm mà tên sản phẩm có chứa chữ 'Samsung'
SELECT * FROM SanPham WHERE tensanpham = 'Samsung';

-- 1.6. Lấy các sản phẩm với tên có chứa 'MacBook' và giá niêm yết (giá bán) trên 7,000,000
SELECT * FROM SanPham WHERE tensanpham = 'Macbook' AND gianiemyet >7000000;

-- 1.7. Lấy các sản phẩm với tên có giá niêm yết (giá bán) từ 8,000,000 đến 10,000,000
SELECT * FROM SanPham WHERE  gianiemyet >=8000000 AND gianiemyet <= 10000000;

-- 2.1. Lấy mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán), số lượng, 
-- tên nhà cung cấp của tất cả sản phẩm
SELECT * FROM SanPham sp JOIN NhaCungCap ncc on sp.manhacungcap_NhaCungCap = ncc.manhacungcap ;

-- 2.2. Lấy mã sản phẩm, tên sản phẩm, giá nhập, giá niêm yết (giá bán), số lượng, mã nhà cung cấp, 
-- tên nhà cung cấp, mã loại sản phẩm, tên loại sản phẩm của những sản phẩm có giá lớn hơn 5.000.000.
SELECT masanpham, tensanpham , gianhap ,gianiemyet, soluong,manhacungcap, tennhacungcap,maloaisanpham, tenloaisanpham  
FROM SanPham sp JOIN NhaCungCap ncc on sp.manhacungcap_NhaCungCap = ncc.manhacungcap 
WHERE gianiemyet > 5000000;

-- 2.3. Lấy tất cả sản phẩm là máy tính bảng (tablet)
SELECT * FROM SanPham sp JOIN NhaCungCap ncc on sp.manhacungcap_NhaCungCap = ncc.manhacungcap 
WHERE tenloaisanpham = 'Tablet';
