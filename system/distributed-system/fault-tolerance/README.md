# distributed commit

làm sao để đảm bảo yêu cầu khi được gửi đi được thực hiện đúng bởi số lượng node yêu cầu

# fault tolerance

## che giấu lỗi = dư thừa

-   dư thừa thông tin

    hamming code, gửi gói tin kèm theo các bit dự phòng, <br>
    các bit dự phòng này sẽ được sử dụng khi có sai sót về dữ liệu

-   dư thừa thời gian
    giao thức TCP có cơ chế chờ gói tin ACK sau đó mới gửi tiếp, nếu không sẽ gửi lại

-   dư thừa thiết bị vật lý
    VD: cơ chế RAID 1: duplicate dữ liệu ra nhiều ổ cứng

## che giấu lỗi = sao lưu

# keywords

`k fault tolerance`

`atomic multicasting`

`distributed commit`

`distributed aggrement`

`distributed concensous`
