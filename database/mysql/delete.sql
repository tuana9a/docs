-- xóa bản ghi cần xóa (xóa hàng)
delete from tên_bảng where(cột=hàng_cần_xóa) 
-- nhưng khi dùng nên thêm limit 1 ở cuối để an toàn 
-- nếu không có where thì sẽ xóa toàn bộ dữ liệu trong bảng (truncate)