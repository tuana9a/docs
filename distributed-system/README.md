# Distributed System

## 1. fault tolerance

### 1.1 distributed commit

làm sao để đảm bảo yêu cầu khi được gửi đi được thực hiện đúng bởi số lượng node yêu cầu

### 1.2 che giấu lỗi = dư thừa

- dư thừa thông tin
hamming code, gửi gói tin kèm theo các bit dự phòng,

các bit dự phòng này sẽ được sử dụng khi có sai sót về dữ liệu

- dư thừa thời gian
giao thức TCP có cơ chế chờ gói tin ACK sau đó mới gửi tiếp, nếu không sẽ gửi lại

- dư thừa thiết bị vật lý
VD: cơ chế RAID 1: duplicate dữ liệu ra nhiều ổ cứng

### 1.3 che giấu lỗi = sao lưu

### 1.4 keywords

`fault tolerance`

`atomic multicasting`

`distributed commit`

`distributed aggrement`

`distributed concensous`

## Dồng bộ hoá xử lý trong hệ phân tán

### bài toán vấn đề đồng bộ trong hệ phân tán

nguồn: *Thầy Trần Hải Anh: giảng viên đại học bách khoa hà nội (2021)*

để đảm bảo logic trong hệ phân tán xảy ra theo mong muốn

sẽ cần một (nhiềU) cơ chế đồng bộ để đảm bảo rắng các node sẽ hoạt động theo các trình tự nhất định

từ đó cũng sinh ra vô số các thuật toán đề đáp ứng tuỳ thuộc vào nhu cầu, nghiệp vụ của bài toán tương ứng

ngoài ra hệ phân tán cũng có thể sử dụng chung tài nguyên

từ đó vấn đề về đồng bộ (trước sau) của hệ phân tán cũng được chú ý

### Đồng bộ hoá đồng hồ vật lý

đồng bộ hoá luôn đồng hồ vật lý

cho các chương trình sử dụng thời gian để chạy

xem [tại đây](./physical-clock-sync/README.md)

### đồng bộ hoá đồng hồ logic

chỉ đảm bảo dúng thứ tự về thời gian

chứ không đảm bảo là đúng với thời gian thực tế

xem [tại đây](./logic-clock-sync/README.md)

### thuật toán loại trừ lẫn nhau

như tên gọi của chúng, các node sẽ phải chờ đợi để dược sử dụng tài nguyên

xem [tại đây](./mutual-exclusion/README.md)

### thuật toán bầu chọn

như tên gọi, thuật toán này sẽ bầu chọn ra người được chọn,

người được chọn sẽ làm điều được chọn

xem [tại đây](./election/README.md)
