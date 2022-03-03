-- (join lấy phần chung)
INNER JOIN

SELECT * FROM tên_bảng1 INNER JOIN tên_bảng2 USING(khóa_chính_chung_2_bảng) WHERE ...
-- VD:
SELECT * FROM info_hs INNER JOIN diem_toan USING(id) WHERE(diem_toan.dai1>=7)
-- sẽ trả về nối 2 bảng với khóa chính chung là id cách này chỉ sử dụng khi có khóa chính chung

-- VD: 
SELECT * FROM info_hs INNER JOIN diem_toan USING(id) INNER JOIN dang_ky USING(id)	
-- <span class="color-red">chú ý</span> là tương ứng USING là phải theo thứ tự INNER JOIN và kết quả nối bảng cũng theo thứ tự INNER JOIN
-- với mỗi một INNER JOIN chỉ có một bảng tham gia thôi chứ không thể có nhiều bảng

SELECT * FROM tên_bảng1,tên_bảng2 INNER JOIN ON tên_cột.tên_bảng1 = tên_cột.tên_bảng2
-- cái này sẽ tiện hơn cái USING vì nó ko cần phải là khóa chính