-- cập chuyển authen từ auth_socket sang dùng password để cho phép đăng nhập từ xa
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your-password';

-- cho phép đăng nhập từ xa
UPDATE mysql.user SET host='%' WHERE host='localhost' AND user='root';

-- lệnh phía dưới không cần chạy, cơ mà nếu trên không được thì cứ chạy tiếp lệnh dưới
-- vì có thể user nằm ở trong đây
UPDATE mysql.db SET host='%' WHERE host='localhost' AND user='root';

-- reset quyền
FLUSH PRIVILEGES;