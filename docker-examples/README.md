# Docker Examples

## Tutorial Container

```bash
docker run -d -p 80:80 docker/getting-started
```

```bash
docker run -dp 8080:80 getting-started
```

## Dev Container Java

ví dụ về app docs của mình

mình chạy sử dụng raw image java mà không tự build image

volune mount từ localfile vào app từ đó

không cần rebuild image nếu docs có thay đổi

ngoài ra secret mình có thể để vào env trong .env file

.env file đang ở trong thư mục hiện tại

nên có thể truy cập bởi người ngoài

tuy nhiên nếu muốn có thể chỉ định ngay trên câu lệnh

hoặc để ở một chỗ khác

```bash
docker run --name docs \
-p 127.0.0.1:4000:4000 \
-w /app -v "$(pwd):/app" \
--env-file .env \
openjdk:8u322-jdk-oraclelinux8 \
sh -c "java -jar docs-1.0.0.jar"
```

## Dev Container NodeJS

add simple volume to container

```bash
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started
```

map current folder which command is run to container

and after container is run

run following command after "sh" keyword

```bash
docker run -dp 3000:3000 \
-w /app \
-v "$(pwd):/app" \
node:12-alpine \
sh -c "yarn install && yarn run dev"
```

## how to assign static ip to container

### 1. with inline cmd

create new separate network

```bash
docker network create --subnet=172.20.0.0/16 customnetwork
```

trong đó

- 127.20.0.0/16 là card mạng + subnet
- customnetwork là tên network mà bạn muốn tạo

attach new container to network above

```bash
docker run --net customnetwork --ip 172.20.0.9 -d mongo:5.0
```

let's check it

kiểm tra lại ip của container xem có chuẩn không

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' name_or_id
```

### 2. with docker-compose

```yaml
version: "2"

services:
  webserver:
    image: nginx
    networks:
      customnetwork:
        ipv4_address: 172.20.0.2

networks:
  customnetwork: # name of docker network
    ipam:
      config:
        - subnet: 172.20.0.0/16
```

## Refs

[https://www.cloudsavvyit.com/14508/how-to-assign-a-static-ip-to-a-docker-container/](https://www.cloudsavvyit.com/14508/how-to-assign-a-static-ip-to-a-docker-container/)

## how to copy docker image from computer to computer

[https://stackoverflow.com/a/23938978/10459230](https://stackoverflow.com/a/23938978/10459230)

You will need to save the Docker image as a tar file:

```bash
docker save -o path_for_generated_tar_file image_name
```

Then copy your image to a new system with regular file transfer tools such as cp, scp or rsync(preferred for big files). After that you will have to load the image into Docker:

```bash
docker load -i path_to_image_tar_file
```

PS: You may need to sudo all commands.# How To Manage Secret In Docker

các thông tin như

- tài khoản + mật khẩu db
- ssl key
- credential

không thể inject lúc build

- một phần vì lý do sau này nếu thay đổi phải build lại
- một phần do vấn đề nếu build xong thì image đó sẽ public
  - và ai sử dụng sẽ nắm được tất

từ đó sinh ra việc cần phải quản lý các thông tin này một cách hợp lý

## Sau đây là một vài hướng có thể xem xét

sử dụng env variable tại thời điểm chạy

```bash
docker run -e key value ...
```

sử dụng mount volumes nếu các credential nằm trên file

```bash
docker run -v /path/to/secret/file:/app/secret
```

sử dụng db, secret store, (key-value db) để fetch dữ liệu

side car pattern

(cơ mả vấn đề giờ lại sao để bảo mật cái dữ liệu để kết nối ??? :))

mình nghĩ cái này thay vì kéo dữ liệu

thì mình sẽ push cấu hình cho con đó, đồng thời khởi tạo các kết nối luôn

như này thì chỉ cần quản lý secret của app đang chạy là đượ

## ubuntu

chạy một container ubuntu

lệnh tail để giữ cho container chạy

```bash
docker run -d \
ubuntu \
bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
```
