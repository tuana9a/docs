-- chèn thêm cột vào bảng đã tồn tại
ALTER TABLE tên_bảng ADD tên_cột kiểu_dữ_liệu_cột

-- xóa một cột ngược với cái ngay trên	
ALTER TABLE tên_bảng DROP column tên_cột

-- chuyển kiểu dữ liệu cột đã tồn tại
ALTER TABLE tên_bảng MODIFY column tên_cột kiểu_dữ_liệu_mới 

-- rename bảng
ALTER TABLE tên_bảng RENAME TO tên_mới