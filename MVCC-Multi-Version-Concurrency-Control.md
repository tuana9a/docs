# MVCC - Multi Version Concurrency Control

[https://en.wikipedia.org/wiki/Multiversion_concurrency_control](https://en.wikipedia.org/wiki/Multiversion_concurrency_control)

Là một cơ chế của database giúp dữ liệu trở nên nhất quán khi có 2 hoặc nhiều transaction(s) cùng thao tác chỉnh sửa trên cùng 1 một bản ghi dữ liệu.

## Vấn đề

Lấy ví dụ: Một bạn sinh viên **A** được bố mẹ cấp tiền vào tài khoản ngân hàng **TK** để nộp học phí. Bạn này ở trên đại học được tự do nên đã có người yêu **NY_A**, do tin tưởng nên bạn này đưa thẻ rút tiền cho người yêu của bạn để chi tiêu cho cả 2.

Một ngày đẹp trời, số tiền trong **TK** là 3.000.000 (3 triệu đồng).

| Thời gian | Hành động  | Ghi chú  |
|-----------|------------|----------|
| 2h 00p 00s  | **NY_A** rút 2.000.000 để chi tiêu sinh hoạt cá nhân |   |
| 2h 00p 00s  | **A** nộp tiền học phí 2.500.000    | (Đồng thời) |

Giả sử phía ngân hàng logic code của họ như sau

```python
if balance > with_draw:
    balance = balance - with_draw
    db.save(balance)
    return
```

Như vậy do 2 người cùng rút tại một thời điểm nên điều kiện số tiền lớn hơn số tiền rút đều thoả mãn, và giao dịch thành công ?

```python
if 3000000 > 2000000 # NY_A
if 3000000 > 2500000 # A
```

Và số dư cuối cùng là một trong các giá trị sau 500.000, 1.000.000 hoặc -1.500.000:

- 500.000 nếu **A** giao dịch xong cuối dùng 3.000.000 - 2.500.000 = 500.000
- 1.000.000 nếu **NY_A** giao dịch xong cuối dùng 3.000.000 - 2.000.000 = 1.000.000
- -1.500.000 khi trước khi **A** thực hiện lệnh trừ tiền thì **balance** = 3.000.000 - 2.000.000 = 1.000.000 (lệnh trừ tiền của **NY_A**) sau đó 1.000.000 - 2.500.000 = -1.500.000

Việc giá trị của dữ liệu không chắc chắn như này rõ ràng với ngân hàng thì đây là một lỗi không thể chấp nhận được. Điều chúng ta mong muốn là một trong 2 giao dịch phải thất bại và số dư là số dư của giao dịch thành công.

Trên đây là một trong rất nhiều vấn đề khi cho phép đọc ghi dữ liệu đồng thời. Có rất nhiều cách xử lý:

- Đơn giản nhất là block toàn bộ reader khi có writer (read-write lock), toàn bộ quá trình đọc sẽ phải chờ dữ liệu được ghi xuống, việc locking này thường không tốt cho hiệu năng và trải nghiệm người dùng khi phải chờ việc ghi dữ liệu thành công
- Ngoài locking người ta có các cơ chế non-locking và mvcc là một trong các cơ chế đó, ngoài mvcc còn: optimistic locking (ừ có lock mà không phải lock)

## Ý tưởng MVCC

MVCC có các "triết lý sau":

- Không lock dữ liệu
- Mọi thay đổi sẽ không thực hiện trực tiếp trên dữ liệu mà tạo ra một phiên bản mới của dữ liệu, dẫn tới ý tiếp theo
- Một bản ghi có thể có nhiều phiên bản
- Mỗi kết nối tới db thấy một phiên bản dữ liệu tương ứng
- Mọi thay đổi trong transaction thì các transaction khác không biết và chỉ có thể đọc được khi transaction kết thúc và thành công, việc này còn gọi là _transaction isolation_

Nhận xét qua:

- Việc isolation nếu áp dụng vào ví dụ rút tiền thì loại trừ được tình huống số tiền là -1.500.000 nhưng đều rút tiền thành công và số tiền còn lại thì vẫn có thể là 1 triệu hoặc 500k. Vấn đề này sẽ được giải quyết trong phần [triển khai](#triển-khai) phía dưới
- Không lock và mỗi kết nối tới db đều có thể xem dữ liệu tại thời điểm tương ứng cho phép đọc, xem dữ liệu tại mọi lúc, tăng hiệu năng và trải nghiệm người dùng
- Mỗi bản ghi có nhiều phiên bản sinh ra vấn đề dọn dẹp những dữ liệu cũ (out of date). Việc này thường dẫn tới vấn đề "**STOP THE WORLD**" để bắt đầu quá trình dọn dẹp dữ liệu, db sẽ phải dừng lại để tìm kiếm và xoá bỏ các dữ liệu cũ. Với [PostgreSQL](https://www.postgresql.org/) quá trình này được gọi là [VACUUM FREEZE](https://www.postgresql.org/docs/14/sql-vacuum.html). Ngoài stop-the-world các db có các cơ chế khác nhau để phục vụ vấn đề này

## Triển khai

MVCC sử dụng timestamp và incrementing transaction ID, cụ thể như sau:

Trước khi vào chi tiết có một vài từ khoá được định nghĩa như sau

- **T** : viết tắt cho transaction
- **$T_k$** : viết tắt cho transaction **i**
- **D** : viết tắt cho dữ liệu mới nhất
- **$D_k$** : dữ liệu phiên bản k
- **RTS** : (Read Timestamp) thời điểm đọc dữ liệu
- **WTS** : (Write Timestamp) thời điểm ghi dữ liệu
- **$RTS(T_k)$** : Thời điểm đọc dữ liệu của transaction $T_k$
- **$WTS(T_k)$** : Thời điểm ghi dữ liệu của transaction $T_k$
- RTS, WTS tương tự cho dữ liệu
- **RTS(D)** : thời gian đọc dữ liệu của D mới nhất
- **$TS(T_i)$** : timestamp của transaction i (tạm hiểu: thời điểm begin transaction)
- **$TS(D)$** : timestamp của dữ liệu mới nhất được lưu thành công

Khi bắt đầu transaction trên một dữ liệu thì $RTS(T_i) > RTS(D)$ với D là dữ liệu mới nhất tại thời điểm $T_i$ được bắt đầu có thể gán thành $D_i$: dữ liệu mới nhất mà $T_i$ nhìn thấy, cùng lúc này có một transac khác là $T_k$ cùng đang thao tác trên D (chưa kết thúc)

- Để $T_i$ có thể ghi dữ liệu **D** thành công thì điều kiện là $RTS(T_i) < RTS(T_k)$ với **k** là các active transac đang thao tác trên cùng bản ghi (**1**)
- Để $T_i$ có thể ghi dữ liệu thì $TS(T_i) > $RTS(D)$, tức trước khi ghi dữ liệu thì điều kiện là sau thời điểm đọc dữ liệu thì dữ liệu không được thay đổi (**2**) thể hiện bằng điều kiện: thời điểm đọc của dữ liệu mới nhất trước thời điểm đọc dữ liệu của transaction

Thường các tình huống xảy ra khi 2 hoặc nhiều transaction cùng thực hiện thay đổi trên cùng một bản ghi dữ liệu, các trường hợp có thể xảy ra như sau

$RTS(T_1)$ -> $RTS(T_2)$ -> $WTS(T_2)$ -> $WTS(T_1)$

Trong trường hợp này thì $T_2$ sẽ bị drop vì vi phạm (**1**): do khi $T_2$ ghi dữ liệu thì vẫn có $T_1$ active và $RTS(T_1) < RTS(T_2)$

$RTS(T_1)$ -> $RTS(T_2)$ -> $WTS(T_1)$ -> $WTS(T_2)$

Trong trường hợp này thì $T_2$ sẽ bị drop vì vi phạm (**2**): do khi $T_1$ ghi dữ liệu thì $RTS(D) = RTS(T_1)$ khi $WTS(T_2)$ sẽ check thì được $TS(T_2) < RTS(D) = RTS(T_1)$ do vậy $T_2$ đang xử lý trên dữ liệu cũ. Lưu ý là $T_1$ được phép ghi dữ liệu do thoả mãn (**1**). Khi $T_2$ ghi dữ liệu thì $T_1$ đã hoàn thành và do vậy thoả mãn (**1**), cơ mà tạch (**2**)
