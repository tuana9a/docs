-- VD:
SELECT id AS 'ma_so' FROM khach_hang AS 'khach'
-- khi ra màn hình sẽ là đổi tên id thành ma_so tương tự cho tên bảng và viết tắt thì bỏ qua từ AS và hai dấu nháy trong từ muốn thay thế

-- VD: cái này sẽ thay tên cột id bằng ma_so_hs, đã viết tắt và bỏ AS
SELECT id ma_so_hs FROM info_hs

-- VD: vì khi đã đổi tên bảng info_hs thành info thì tên cột lấy theo bảng cũng phải đổi theo
SELECT info.ho_ten FROM info_hs AS info;

-- VD: ko thể (ERROR)
SELECT info_hs.ho_ten FROM info_hs AS info;