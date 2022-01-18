-- Là lệnh con trong lệnh bố
-- VD:
select * from khach_hang where ma_kh in (select ma_kh from gio_hang)
        
-- VD: 
-- trả về mã khách hàng đã mua hàng từ bảng gio_hang
select ma_kh from gio_hang
-- select ngoài cùng sẽ select từ bảng khach_hang mà ma_kh có trong giá trị trả về của bảng gio_hang

-- VD:
-- cái này sẽ lấy cột ho_ten từ bảng trả về khi inner join 2 bảng trong ngoặc cùng với điều kiện dai1 trong bảng trả về có giá trị lớn hơn hoặc bằng 10
select ho_ten from (select ho_ten, dai1 from info_hs inner join diem_toan using(id)) as tuan where(dai1 >= 10);

-- <span class="color-red">chú ý</span> là phải alias cho cho select ngoài cùng (éo hiểu sao)
-- và nếu alias cho cột của select con thì tên cột của select bố cũng phải theo cái alias đó

-- <span class="color-red">?</span> del hiểu sao nếu alias tên có dấu cách cho các cột trong select con
-- thì khi dùng tên cột đó cho select bố thì đel được