-- chèn thêm cột vào bảng đã tồn tại
alter table tên_bảng add tên_cột kiểu_dữ_liệu_cột

-- xóa một cột ngược với cái ngay trên	
alter table tên_bảng drop column tên_cột

-- chuyển kiểu dữ liệu cột đã tồn tại
alter table tên_bảng modify column tên_cột kiểu_dữ_liệu_mới 

-- rename bảng
alter table tên_bảng rename to tên_mới