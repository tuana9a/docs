# Docker

## Install docker-compose

```bash
curl -SL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose
```

```bash
chmod +x /usr/local/bin/docker-compose
```

## Networking

[https://www.youtube.com/watch?v=bKFMS5C4CG0](https://www.youtube.com/watch?v=bKFMS5C4CG0)

## Architecture

## Khởi động

khởi chạy một container nhỏ

sau đó bạn mở trình duyệt vào địa chỉ localhost:PORT

```bash
docker run -d -p 80:80 docker/getting-started
```

```bash
docker run -dp 8080:80 getting-started
```

## công nghệ container

bản chất container là một process chạy trên linux và

**đặc biệt được "isolate"** khỏi các process khác

cái này đã có trên linux từ rất lâu

## container image là gì

do container muốn hoạt động được như một "máy ảo" thì cần phải có filesystem

và filesystem này phải khác với filesystem của máy host cũng như các container khác

từ đó cần một hệ thống file system rành riêng cho container đó

đó chính là container image chứa toàn bộ source, binary để container có thể chạy được

## Luôn sử dụng offical image

luôn sử dụng các image chính thống nếu có sẵn

và luôn luôn có thêm version tag

vì có thể lần build tiếp theo phiên bản latest sẽ break thing

## cố gắng giảm size image càng tốt

việc này vừa tăng khả năng luân chuyển image, build time

hơn thế gián tiếp giảm khả năng bị hack do số package giảm đi

### multi-stage build

cực kì hữu dụng do có rất nhiều app sau khi build

thì không cần dùng các tool trước đó nữa

ví dụ với java servlet

sau khi đóng gói với maven thì chỉ cần file war là chạy app

cỏn maven thì vứt được

```dockerfile
# bước đầu chỉ cần tải maven và build file war
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

# bước 2 copy file war ở bước 1 và cho vào tomcat image
# để ý --from là build ứng với alias maven ở trên
FROM tomcat:10.0-jdk8-openjdk-slim
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps 
```

react thi cung tuong tu

```dockerfile
# đại loại là build
FROM node:12 AS build
WORKDIR /app
COPY package* yarn.lock ./
RUN yarn install
COPY public ./public
COPY src ./src
RUN yarn run build

# sau đó copy toàn bộ file build vào image cuối
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
```

## cố gắng sử dụng docker caching càng nhiều càng tốt

khi build image sẽ có các layer không thay đổi như

- install dependency
- inject config file

thì nên cho các layer này lên trước thì khi build sẽ đc cache lại

còn nếu cho sau thì mỗi lần chỉnh sửa file lại build lại toàn bộ image

## Giới hạn quyền truy cập của user trong container

nên giới hạn quyền truy cập user (do mặc định là user root)

nếu app có bị hack thì hacker không chiếm toàn quyền root

để cài bot hay đào coin được

```dockerfile
# create user
FROM node:12-alpine

# create group and user
RUN groupadd -r tuana9a && useradd -g tuana9a tuana9a

# set ownership and permission
RUN chown -R tuana9a:tuana9a /app

# switch user
USER tuana9a

# run
CMD node index.js
```

## Sử dụng docker scan để scan các vấn đề về bảo mật

```bash
docker scan
```

## Tìm hiểu về Overlay filesystem

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
