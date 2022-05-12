# các lỗi backend

-   sập nguồn
-   database lỗi
-   mất kết nối db
-   role truy cập
-   đường truyền mạng (chậm, close)
-   time out
-   quá tải hệ thống (băng thông, bộ nhớ, ram, ddos, flood)

# backend design

## config

-   runtime (key, ...)
-   startup (ENV: port, database, address, ...)
-   hàm auto config, tự duyệt thư mục config và load ứng với tên file [tự chế]
-   có hàm get, set tùy ý biến runtime

## api query các api khác (tự chế)

api gốc query các api khác để frontend adapt vs thay đổi url của backend

## dynamic webapp update frontend (tự chế)

-   webapp đóng gói = file zip rồi up lên backend
-   có thể fix nóng mà không cần phải commit backend
-   nhiều server sẽ update từng server

## backup, loging - monitor

-   theo ngày
-   nhiều version

# microservice

-   không bắt service phải biết về thông tin của các service khác nếu không cần thiết
-   không chia nhỏ quá, đcm code khổ hơn thay vào đó cố gắng co chúng lại

# scale solution in a nutshell

![](./scale-solution-in-nutshell.PNG)
