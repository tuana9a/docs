-- thêm bản ghi lần lượt tương ứng với cột bao nhiêu cột bấy nhiêu giá trị values hoặc value	
INSERT INTO tên_bảng (tên_cột_bất_kỳ_1, ... ,tên_cột_bất_kỳ_n) VALUES (giá_trị_1, ... ,giá_trị_n)
        
-- <span class="color-red">chú ý</span>: nếu muốn thêm nhiều bản ghi chỉ cần thêm vào sau values tương ứng giá trị của bản ghi đó
-- <span class="color-red">chú ý</span>: nếu đã nhớ tên cột và thứ tự cột thì có thể bỏ phần mở ngoặc sau tên_bảng(..)
-- VD: thêm vào 2 record với cột ho_ten
INSERT information(ho_ten) VALUES ("Nguyen Minh Tuan"),("Nguyen Quynh Anh")