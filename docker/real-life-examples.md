# debug = bind mount

```bash
# ví dụ về app docs của mình
# mình chạy sử dụng raw image java mà không tự build image

# volune mount từ localfile vào app từ đó
# không cần rebuild image nếu docs có thay đổi

# ngoài ra secret mình có thể để vào env trong .env file

# .env file đang ở trong thư mục hiện tại
# nên có thể truy cập bởi người ngoài

# tuy nhiên nếu muốn có thể chỉ định ngay trên câu lệnh
# hoặc để ở một chỗ khác
docker run --name docs \
    -p 127.0.0.1:4000:4000 \
    -w /app -v "$(pwd):/app" \
    --env-file .env \
    openjdk:8u322-jdk-oraclelinux8 \
    sh -c "java -jar docs-1.0.0.jar"
```

# ubuntu

```bash
# chạy một container ubuntu
# lệnh tail để giữ cho container chạy
docker run -d \
    ubuntu \
    bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
```

# static ip


[link tham khảo](https://www.cloudsavvyit.com/14508/how-to-assign-a-static-ip-to-a-docker-container/)

```bash
docker network create --subnet=172.20.0.0/16 test1
# trong đó
#   127.20.0.0/16 là card mạng + subnet
#   test1 là tên network mà bạn muốn tạo

docker run --net test1 --ip 172.20.0.3 --name test2 -d mongo:5.0

# kiểm tra lại ip của container xem có chuẩn không
docker inspect \
    -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' \
    name_or_id
```

`docker-compose.yaml`

```yaml
version: "2"

services:
    webserver:
        image: nginx
        container_name: web-server
        networks:
            customnetwork:
                ipv4_address: 172.20.0.10

networks:
    customnetwork: # name of docker network
        ipam:
            config:
                - subnet: 172.20.0.0/16
```

# mongodb

```bash
# simple mongodb
docker run -p 27017:27017 --name mongo -d mongo:5.0

# map with volume
sudo docker run \
    --name mongo-4.2 \
    -dp 27017:27017 \
    -v /mnt/sda1/Docker/volumes/mongo-4.2/data:/data/db \
    -d mongo:4.2-bionic
```

`docker-compose.yaml`
```yaml
version: "3.1"

services:
    mongo:
        container_name: mongo
        image: mongo:4.4.8
        command:
            - --config
            - /etc/mongod.conf
        volumes:
            - /home/tuana9a/mongod.container.conf:/etc/mongod.conf
        ports:
            - 27017:27017
```

# mysql

```bash
# simple container
docker run -dp 3306:3306 \
    --name mysql \
    -e MYSQL_ROOT_PASSWORD=12345678 \
    mysql:5.7

# mysql with password and default config
sudo docker run \
    --name mysql-8.0 \
    -dp 3306:3306 \
    -v /mnt/sda1/Docker/volumes/mysql-8.0/data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=12345678 \
    -d mysql:8.0 \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```

# rabbitmq

```bash
docker run -d \
    -p 15672:15672 \
    -p 5672:5672 \
    --name rabbitmq \
    rabbitmq:3.8-management
```

# nodejs

```bash
# add simple volume to container
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started

# map current folder which command is run to container
# and after container is run
# run following command after "sh" keyword
docker run -dp 3000:3000 \
    -w /app \
    -v "$(pwd):/app" \
    node:12-alpine \
    sh -c "yarn install && yarn run dev"
```