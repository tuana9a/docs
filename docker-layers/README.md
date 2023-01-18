# Tìm hiểu về Overlay filesystem

các layer của docker hoạt động khá hay và hiệu quả

TODO: mình không nhớ nữa khá lâu rồi nếu cần thiết thì phải tìm hiểu lại, còn phía dưới chỉ là sơ lược

đại loại các layer là immutable

muốn thay đổi thêm sửa xoá chỉ chỉnh sửa ở layer cao nhất

việc immutable cho phép

- tối ưu bộ nhớ cho các ứng dụng sử dụng chung phần layer thấp hơn
- thậm chí cải thiện tốc độ build image kể cả với 2 image khác nhau Dockerfile
  - chỉ cần chung một or một vài layer sẽ share phần layer này

```Dockerfile
# syntax=docker/dockerfile:1

FROM python:slim-bullseye

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=80"]
```

## output

![docker-layers-log.PNG](./img/docker-layers-log.PNG)
