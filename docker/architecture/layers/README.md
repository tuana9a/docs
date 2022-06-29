_các layer của docker hoạt động khá hay và hiệu quả_

# Tìm hiểu về Overlay filesystem

TODO: mình không nhớ nữa khá lâu rồi nếu cần thiết thì phải tìm hiểu lại, còn phía dưới chỉ là sơ lược

đại loại các layer là immutable <br>
muốn thay đổi thêm sửa xoá chỉ chỉnh sửa ở layer cao nhất <br>
việc immutable cho phép

- tối ưu bộ nhớ cho các ứng dụng sử dụng chung phần layer thấp hơn
- thậm chí cải thiện tốc độ build image kể cả với 2 image khác nhau Dockerfile

  - chỉ cần chung một or một vài layer sẽ share phần layer này

| app1                | app2                |
| ------------------- | ------------------- |
| [see here](./app1/) | [see here](./app2/) |

##  output

![](./img/docker-layers-log.PNG)
