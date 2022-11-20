# Các loại JDBD Driver

# Type 1: JDBC - ODBC Driver

![](./img/jdbc-odbc-driver.jpg)

## Ưu điểm

dễ sử dụng (client chỉ cần gõ lệnh rồi các thành phần sau nó tự thực thi) <br>
có thể sử dụng với mọi loại database (do đều có chung call chỉ riêng về cuối)

## Nhược điểm

tốc độ chậm do nhiều layer, mà thông tin 2 chiều nên nặng gấp đôi <br>
OBDC phải cài đặt ở client (không thuộc Java nên phụ thuộc) <br>
portable kém (như đã nói phải cần cài đặt driver) <br>
không phù hợp với Applets

# Type 2: Native - API Driver

![](./img/jdbc-native-api-driver.jpg)

## Ưu điểm

nhanh hơn loại 1 (do đã bớt layer)

## Nhược điểm

rõ ràng vẫn portable kém <br>
không hỗ trợ applet <br>
not thread safe

# Type 3: Network Protocol Driver

![](./img/jdbc-network-protocol-driver.jpg)

## Ưu điểm

không cần cài trên client (vì các server bị dependent) <br>
khi tương tác với nhiều loại database (middleware lo tất) <br>
hỗ trợ Caching, LoadBalancing, Loggìng, ...

## Nhược điểm

tốc độ chậm vì có network calls <br>
nặng bên server, do đó chi phí bảo trì, nâng cấp tăng vọt

# Type 4: Thin Driver

![](./img/jdbc-thin-driver.jpg)

## Ưu điểm

hoàn toàn là platform independent (vì bh nó sẽ thuộc sở hữu của java <br>
kết nối trực tiếp tới database (do không cnà trung gian làm mối nữa) <br>
tốc độ sẽ được đẩy lên khá caa (do kết nói trưc tiếp mà) <br>
JVM sẽ lo tất

## Nhược điểm

nặng nhà sản xuất, mọi người cùng vui

# Tổng Kết

-   Type 4: chỉ accesss một database thì ưu tiên type 4<br>
    vì nó cụ thể mà mang tính local
-   Type 3: nếu acess nhiều loại database thì ưu tiên type 3<br>
    vì nó chơi tất và do có trung gian nên handle được chia đều (load balancing)

-   Type 2: nếu Type 3 và Type 4 không hỗ trợ db bạn sử dụng
-   Type 1: mục đích test và thử nghiệm không deploy

# Một vài [ví dụ](./examples/README.md) khởi đầu
