# How To Manage Secret In Docker

các thông tin như

-   tài khoản + mật khẩu db
-   ssl key
-   credential

không thể inject lúc build

-   một phần vì lý do sau này nếu thay đổi phải build lại
-   một phần do vấn đề nếu build xong thì image đó sẽ public
    -   và ai sử dụng sẽ nắm được tất

từ đó sinh ra việc cần phải quản lý các thông tin này một cách hợp lý

# Sau đây là một vài hướng có thể xem xét

sử dụng env variable tại thời điểm chạy

```bash
docker run -e key value ...
```

sử dụng mount volumes nếu các credential nằm trên file

```bash
docker run -v /path/to/secret/file:/app/secret
```

sử dụng db, secret store, (key-value db) để fetch dữ liệu <br>
side car pattern <br>
(cơ mả vấn đề giờ lại sao để bảo mật cái dữ liệu để kết nối ??? :)) <br>
mình nghĩ cái này thay vì kéo dữ liệu <br>
thì mình sẽ push cấu hình cho con đó, đồng thời khởi tạo các kết nối luôn <br>
như này thì chỉ cần quản lý secret của app đang chạy là được
