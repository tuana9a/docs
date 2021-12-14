# #path cần phải sửa

sửa host file trên tất cả các node

`/etc/hosts`

đường dẫn mặc định của java 8 trên các OS
    
`/usr/lib/jvm/java-8-openjdk-amd64` # ubuntu

`/usr/lib/jvm/java-1.8.0-openjdk`   # fedora

đường dẫn nên giải nén, cài hadoop, spark theo chuẩn chung

`/opt/hadoop-3.2.2`

`/opt/spark-3.1.1-bin-hadoop3.2`

# #lưu ý

-   phải đảm bảo rằng các node có thể connect lẫn nhau mà <b style="color: red;">KHÔNG</b> cần nhập password (password less)

-   cách cài, dùng máy host là linux (máy laptop) làm master, các slave được cài trên máy ảo và network mode là NAT

    network này không cho phép slave có thể kết nối tới master
    
    do vậy cần chuyển network mode sang host-only hoặc các loại network khác
    
    và cập nhật lại /etc/hosts của từng thằng

# #note

-   setup hiện tại thì spark chỉ cần thêm vào path

    tất cả config về spark là mặc định (template, defaults, ...)
