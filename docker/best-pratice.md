# Luôn sử dụng offical image

luôn sử dụng các image chính thống nếu có sẵn <br>
và luôn luôn có thêm version tag <br>
vì có thể lần build tiếp theo phiên bản latest sẽ break thing

# cố gắng giảm size image càng tốt

việc này vừa tăng khả năng luân chuyển image, build time <br>
hơn thế gián tiếp giảm khả năng bị hack do số package giảm đi

# cố gắng sử dụng docker caching càng nhiều càng tốt

[xem them](./docker-layers-explain.md)

khi build image sẽ có các layer không thay đổi như
- install dependency
- inject config file

thì nên cho các layer này lên trước thì khi build sẽ đc cache lại<br>
còn nếu cho sau thì mỗi lần chỉnh sửa file lại build lại toàn bộ image

# Giới hạn quyền truy cập của user trong container

nên giới hạn quyền truy cập user (do mặc định là user root) <br>
nếu app có bị hack thì hacker không chiếm toàn quyền root <br>
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

# Sử dụng docker scan để scan các vấn đề về bảo mật

```bash
docker scan
```