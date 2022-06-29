# dev container

## Java

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

## NodeJS

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
