# Distributed Lock - Red Lock

cái này mình học được khi đọc thêm về redis,

trong đó redis có nói thêm về cách implement red lock, distributed lock với các ứng dụng có sử dụng redis [https://redis.io/topics/distlock](https://redis.io/topics/distlock)

## Safety and Liveness guarantees

We are going to model our design with just three properties (minimum in our point of view)

- Safety property: Mutual exclusion. At any given moment, only one client can hold a lock.
- Liveness property A: Deadlock free. Eventually it is always possible to acquire a lock, even if the client that locked a resource crashes or gets partitioned.
- Liveness property B: Fault tolerance.As long as the majority of Redis nodes are up, clients are able to acquire and release locks.

Một vài vấn đề nếu chỉ có failover là không đủ. Xét cách implement distributed lock trường hợp sau:

- để lock một resource thì mình tạo một KEY với EXPIRE cho mỗi một instance (đảm bảo thuộc tính 2)
- khi client dùng xong thì xoá key đó đi

Cách này sẽ có 1 vấn đề: single point of failure, OK có thể add replica nhưng replication là async do vậy không đảm bảo việc ? mutual exclusion
Cụ thể xét VD sau:

- client A lấy lock
- master down trước khi lock được replicate sang slave
- slave promote tới master
- client B lấy lock trên resource mà client A đã lấy (toang)

Tương đối việc failover thì nhiều client lấy đc lock chấp nhận được tuỳ yêu cầu nghiệp vụ

Tuy nhiên nếu cần implement chặt hơn thì xem phía dưới

## Correct implementation with a single instance

để lấy được lock thì implement kiểu này chuẩn hơn

- SET resource_name my_random_value NX PX 30000
các option

- NX để đảm bảo key chưa tồn tại
- PX 30000 để expire sau 30_000 milisecs
- my_random_value là duy nhất trên các client và các lock request
    random_value để đảm bảo việc release khoá xảy ra an toàn
    cần phải thêm code phía client để đảm bảo chỉ xoá

khi key và value ở DB match với key và my_random_value mà instance đang giữ

VD:

```js
if (redis.get(YOUR_KEY) == LOCAL_RANDOM_VALUE) redis.delete(YOUR_KEY)
else throw Error
```

ý nghĩa của random value để client tránh remove nhầm lock của client khác và tự chịu lỗi (rollback)

TH1: client lấy lock, và chạy code lâu hơn thời gian expire

- dẫn tới lock thì đã bị xoá, giả sử có lock của client khác
- thì khi thực thi xong lại xoá nhầm lock của bạn khác 😀
- do vậy random value như một id, chữ ký, của client hiện tại và chỉ xoá khi nó là của mình

## Red Lock Algorithm

Thuật toán đặt ra kịch bản set up như sau:

- hệ thống là phân tán và có N redis master
- Các redis master này là độc lập, fail cũng độc lập

để client có thể lấy được lock phải làm đủ các bước sau:

- B1: lấy current milisecs
- B2: cố gắng lấy N (=5) khoá trên các master một cách tuần tự các key và my_random_value là giống nhau trên mọi instance
  - chú ý: để triển khai thì cần có timeout cho mỗi lần set lock trên mỗi instance con só time out này cần nhỏ hơn đủ nhiều so với thời gian expire của lock skip các redis master down, chuyển tiếp tới các node sau node bị die

- B3: client tính tổng thời gian lấy khoá = cách lấy hiện tại - thời điểm ở bước 1
  - chỉ khi số khoá được set là major (quá bán VD: 5/2 = 3)
  - và tổng thời gian lẩy khoá nhỏ hơn thời gian expire (đã nói ở trên)

- B4: nếu B3 hợp lệ thì việc lấy lock thành công, làm bước tiếp theo
  - nếu B3 không hợp lệ thì client sẽ cố unlock toàn bộ instance (kể cả instance không có lock)
