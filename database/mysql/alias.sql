-- VD:
select id as 'ma_so' from khach_hang as 'khach'
-- khi ra màn hình sẽ là đổi tên id thành ma_so tương tự cho tên bảng và viết tắt thì bỏ qua từ as và hai dấu nháy trong từ muốn thay thế

-- VD: cái này sẽ thay tên cột id bằng ma_so_hs, đã viết tắt và bỏ as
select id ma_so_hs from info_hs

-- VD: vì khi đã đổi tên bảng info_hs thành info thì tên cột lấy theo bảng cũng phải đổi theo
select info.ho_ten from info_hs as info; thì ko thể select info_hs.ho_ten from info_hs as info;