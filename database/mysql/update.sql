UPDATE SET SQL_SAFE_UPDATES = 0
update tên_bảng set vị_trí_cột=giá_trị_mới where(vị_trí_cột=vị_trí_hàng) nôm na là set giá trị mới vào ô có vị trí cột là trước where và hàng là trong where

-- VD:
update lich_hoc set ten_lop='lop cua Tuan và Quynh Anh' where(ma_lop=101)
-- <span class="color-red">chú ý</span>: nếu muốn update nhiều trên cùng một hàng thì các giá trị muốn update chỉ cần cách nhau dấu phẩy
-- VD:
update lich_hoc set ma_lop=1,ten_lop=dai1_1 where(ma_lop=11)	