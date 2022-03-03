UPDATE SET SQL_SAFE_UPDATES = 0
UPDATE tên_bảng SET vị_trí_cột=giá_trị_mới WHERE(vị_trí_cột=vị_trí_hàng) nôm na là SET giá trị mới vào ô có vị trí cột là trước WHERE và hàng là trong WHERE

-- VD:
UPDATE lich_hoc SET ten_lop='lop cua Tuan và Quynh Anh' WHERE(ma_lop=101)
-- <span class="color-red">chú ý</span>: nếu muốn UPDATE nhiều trên cùng một hàng thì các giá trị muốn UPDATE chỉ cần cách nhau dấu phẩy

-- VD:
UPDATE lich_hoc SET ma_lop=1,ten_lop=dai1_1 WHERE(ma_lop=11)	