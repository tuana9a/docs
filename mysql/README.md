# MySQL

## mysql allow remote login root

If you've got access to the mysql database, you can change the grant tables directly:

```sql
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';
```

Also you might need to make changes to the mysql.db table as well:

```sql
UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='username';
```

and then flush to apply the privileges:

```sql
FLUSH PRIVILEGES;
```

## mysql allow root auth login plugin

lại ván đề liên quan tới quyền trong mysql và authentication

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
