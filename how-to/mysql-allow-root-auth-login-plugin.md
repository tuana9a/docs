# mysql allow root auth login plugin

Tags: mysql

lại ván đề liên quan tới quyền trong mysql và authentication
[mysql-allow-remote-login-root](./2021.07.28.mysql-allow-remote-login-root.md)

nếu gặp vấn đề đăng nhập bằng `sudo mysql` được mà `mysql -u root -p` không được
thì cần xem lại plugin đăng nhập xem có là `unix_sock` không

chuyển authen từ auth_socket sang dùng password để cho phép đăng nhập từ xa

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your-password';
```

cho phép đăng nhập từ xa

```sql
UPDATE mysql.user SET host='%' WHERE host='localhost' AND user='root';

```

lệnh phía dưới không cần chạy, cơ mà nếu trên không được thì cứ chạy tiếp lệnh dưới

```sql
UPDATE mysql.db SET host='%' WHERE host='localhost' AND user='root';

```

reset quyền

```sql
FLUSH PRIVILEGES;

```