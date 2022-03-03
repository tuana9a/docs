-- Là lệnh con trong lệnh bố
-- VD:
SELECT * FROM khach_hang WHERE ma_kh IN (SELECT ma_kh FROM gio_hang)
        
-- VD: 
-- trả về mã khách hàng đã mua hàng từ bảng gio_hang
SELECT ma_kh FROM gio_hang
-- SELECT ngoài cùng sẽ SELECT từ bảng khach_hang mà ma_kh có trong giá trị trả về của bảng gio_hang

-- VD:
-- cái này sẽ lấy cột ho_ten từ bảng trả về khi inner join 2 bảng trong ngoặc cùng với điều kiện dai1 trong bảng trả về có giá trị lớn hơn hoặc bằng 10
SELECT ho_ten FROM (SELECT ho_ten, dai1 FROM info_hs INNER JOIN diem_toan USING(id)) AS tuan WHERE(dai1 >= 10);

-- <span class="color-red">chú ý</span> là phải alias cho cho SELECT ngoài cùng (éo hiểu sao)
-- và nếu alias cho cột của SELECT con thì tên cột của SELECT bố cũng phải theo cái alias đó

-- <span class="color-red">?</span> del hiểu sao nếu alias tên có dấu cách cho các cột trong SELECT con
-- thì khi dùng tên cột đó cho SELECT bố thì đel được