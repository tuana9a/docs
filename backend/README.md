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

## auto update

-   cần phải có chức năng auto update
    -   CI / CD, docker, k8s

# microservice

-   không bắt service phải biết về thông tin của các service khác nếu không cần thiết
-   không chia nhỏ quá, đcm code khổ hơn thay vào đó cố gắng co chúng lại

# scale solution in a nutshell

| Problems:                    | Solutions:                |
| ---------------------------- | ------------------------- |
| 1. Cascading Failure         | 1. Rate Limiting          |
| 2. Going viral               | 2. Pre Scale              |
| 3. Predictable load increase | 3. Auto Scale             |
| 4. Bulk Job Scheduling       | 4. Batch Processing       |
| 5. Popular Posts             | 5. Approximate Statistics |

