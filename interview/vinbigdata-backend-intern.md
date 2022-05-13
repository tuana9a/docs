# vinbigdata backend internship

## 1. mảng vs list

|                  | mảng                          | list                                 |
| ---------------- | ----------------------------- | ------------------------------------ |
| tổ chức dữ liệu: | các phần tử liên tiếp kề nhau | không liên tiếp mà được link vs nhau |
| kích thước       | kích thước cố định            | kích thước thay đổi được             |
| insert vào đầu:  | O(n): vì phải dịch tất về sau | O(1): vì chỉ cần thay trỏ            |

## 2. hash map, hash table

tổ chức dữ liệu:

-   mảng của các hash key (indexes)
-   các phần tử trong mảng trỏ tới giá trị or link list

xử lí same hash key

-   cách1: ghi đè
-   cách2: nối tiếp vào link list đó

## 3. OOP

-   **ecapsulation**: <br>
    đóng gói, <br>
    clean code, tìm kiếm class <br>
    các code cùng chức năng nằm trong package <br>
    public private, hạn chế truy cập

-   **inheritance**: <br>
    kế thừa: <br>
    tái sử dụng code <br>
    VD: `List<Dad>` chứa được cả Child

-   **abstraction**: <br>
    cái này k rõ lắm <br>
    VD: abstract class, interface <br>
    cùng class, cùng phương thức nhiều thể hiện <br>
    VD: HinhTron, HinhChuNhat cùng triển khai Shape <br>
    cùng là Shape nhưng cách tính chu vi, diện tích khác nhau

-   **polymophyism**: <br>
    đa hình <br>
    một con người có thể implements vận động và suy nghĩ, <br>
    từ đó vừa là vật thể có thể chuyển động, cũng có thể suy nghĩ cùng lúc

## 4. index trong database

tổ chức dữ liệu: B-tree, thời gian thêm (sửa, xóa) là O(log(n)) <br>
B-tree: + một dạng của cây cân bằng (giống cây nhị phân) có nhiều hơn 2 nút con <br>
`+` trong 1 node có nhiều key, giữa 2 key vs nhau là con trỏ <br>
trỏ tới 1 node khác mà các key trong này nằm giữa 2 key ở trên

## 5. transaction trong database

lý thuyết: <br>
start: bắt đầu transaction <br>
rollback: reset tất cả nếu có bất kì lỗi nào <br>
commit: ghi vào db, thành công thì ms đc update

## 6. ACID: atomic: không thể bị can thiệp

consistency: read luôn được giá trị mới nhất <br>
isolation: với transaction: sẽ độc lập không liên quan tới transaction khác và DB <br>
ngoài ra việc conflict giữa 2 transaction cùng read hoặc write 1 value trong DB <br>
được xử lí với các phương thức khác nhau (TÌM HIỂU THÊM)</p>

## 7. process vs thread

-   process > thread, process chứa thread, process là "cha" thread
-   thread nhẹ hơn process: thời gian: khởi tạo, shutdown,... nhanh
-   2 thread có thể chia sẻ code, vùng nhớ (biến toàn cục) rất tiện và nhanh
-   2 process không chia sẻ gì cả: muốn trao đổi phải qua socket, thiết lập IPC
    (Inter Process Communication) và sau đó gửi message qua lại

## 8. CPU, RAM, HDD

## 9. RAID

-   RAID_1: duplicate dữ liệu 2 đĩa <br>
    -> không cải thiện tốc độ đọc <br>
    được mỗi cái là mất 1 thì còn 1

-   RAID_5: chia nhỏ + dải đều lên các đĩa <br>
    một part đặc biệt, trên các đĩa giúp restore <br>
    part đặc biệt này kích thước lớn hơn các phần chia nhỏ <br>
    mất 1 đĩa k sao, mất 2 trở nên là mất sạch

-   RAID_6: chơi 2 part đặc biệt nên cho phép mất 2 cùng lúc <br>
    -> vửa cải thiện tốc độ đọc, vừa backup khá tốt

## 10. OSI model

-   tầng vật lí: vận chuyển các bit 0, 1
-   tầng liên kết dữ liệu: kiểm soát lỗi, ...
-   tầng mạng: IP, MAC
    IP: định tuyến, tìm đường, (giữa 2 mạng khác nhau, hà nội to sài gòn)
    MAC: cho router biết là chuyển tới máy nào tiếp theo (vật lí)
-   tầng vận chuyển: TCP, UDP: ...
-   tầng ứng dụng: HTTP, HTTPS, FTP, SMTP, ...
