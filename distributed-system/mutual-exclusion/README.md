# mutual exclusion

**nhóm thuật toán loại trừ lẫn nhau**

tài nguyên khi được sử dụng chung cần có cơ chế locking, waiting, ... <br>
sau đây sẽ là các thuật toán

-   giải thuật tập trung: có một master, monitor quản lý ai vào, ai ra, ai đợi, đến lượt ai (sử dụng hàng đợi)
-   giải thuật phân tán: khi cần sử dụng sẽ broadcast hỏi toàn bộ
    ![](./img/noname1.PNG)
-   giải thuật token ring: xem phía dưới
-   giải thuật bầu chọn: xem phía dưới

# giải thuật token ring

đại loại các node form thành vòng tròn<br>
và lần lượt truyền tay nhau chiếc vé (token) để sử dụng tài nguyên

![](./img/token-ring-1.PNG)
![](./img/token-ring-2.PNG)

giải thuật khá đơn giản và dễ sử dụng<br>
tuy nghiên cũng có vài điểm cần phải lưu ý

-   hiện tượng mất token
    -   mất do bên gửi đã gửi nhưng bên nhận ko nhận được (mạng, đứt cáp):<br>
        giải pháp thêm cơ chế ACK
    -   cần có monitor sinh lại token,<br>
        nhưng phải đảm bảo không có 2 token một lúc
-   nếu kết nối của bất kì node nào mất thì gián đoạn toàn bộ mạng
-   hiện tượng deadlock trên một node:<br>
    dẫn tới token mãi không được truyền đi: timeout, monitor
