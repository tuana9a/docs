# khởi động

khởi chạy một container nhỏ <br>
sau đó bạn mở trình duyệt vào địa chỉ localhost:PORT

```bash
# khởi chạy một container
docker run -d -p 80:80 docker/getting-started

# một câu lệnh khác
docker run -dp 8080:80 getting-started
```
    
# công nghệ container

bản chất container là một process chạy trên linux và <br>
**đặc biệt được "isolate"** khỏi các process khác <br>
cái này đã có trên linux từ rất lâu

# container image là gì

do container muốn hoạt động được như một "máy ảo" thì cần phải có filesystem <br>
và filesystem này phải khác với filesystem của máy host cũng như các container khác <br>
từ đó cần một hệ thống file system rành riêng cho container đó <br>
đó chính là container image chứa toàn bộ source, binary để container có thể chạy được <br>
