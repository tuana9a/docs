# can client socket use same port

Created: February 10, 2022
Tags: network

hôm trước mình đọc docs của cloud flare thì cũng tương tự như server, để định danh một kết nối thì chỉ 4 tham số gồm

ip source + port source

ip destination + port destination

là đủ do vậy nếu vẫn sử dụng port source mà phân biệt được (sử dụng logic xử lý) thì không cần thiết phải tạo thêm connection, từ đó có thể tối ưu tài nguyên sử dụng

connection pool, ... các thứ các thứ đại loại khá mệt mấy vụ liên quan tới network này