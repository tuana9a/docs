# Best Practice

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

[docker-layers-explain.md](./docker-layers-explain.md)

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
