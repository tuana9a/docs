-- nhóm các bản ghi có cùng giá trị của cột đó VD:
GROUP BY(tên_cột)
SELECT count(ten_KH) FROM KH GROUP BY -- dia chi đếm số khách hàng ở cùng một địa chỉ kết quả ra màn hình có dạng         
-- +-----------+---+
-- | HCM       | 5 |
-- +-----------+---+
-- | Hải Phòng | 4 |
-- +-----------+---+
-- | Hà Nội    | 3 |      	
-- +-----------+---+

SELECT sum(gia_tien),ten_sp FROM san_pham GROUP BY ten_sp --sẽ tính tổng tiền của đơn hàng mà tên sản phẩm giống nhau

HAVING
-- bắt buộc đứng sau GROUP BY 
-- tương tự WHERE

-- VD:
SELECT * FROM info_hs,diem_toan WHERE(info_hs.id=2000 AND info_hs.id=diem_toan.id) -- show info và điểm toán của hs có id 2000
-- chú ý: ví dụ ngay trên phải có điều kiện hai cái id bằng nhau vì hai cái id này ko liên quan đến nhau và nếu không có sẽ là tích đề các