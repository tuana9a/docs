# ví dụ về app docs của mình
# mình chạy sử dụng raw image java mà không tự build image
# volumne mount từ localfile vào app từ đó không cần rebuild image nếu docs có thay đổi
# ngoài ra secret mình có thể để vào env trong .env file
# .env file đang ở trong thư mục hiện tại nên có thể truy cập bởi người ngoài
# tuy nhiên nếu muốn có thể chỉ định ngay trên câu lệnh hoặc để ở một chỗ khác
docker run --name docs \
    -p 127.0.0.1:4000:4000 \
    -w /app -v "$(pwd):/app" \
    --env-file .env \
    openjdk:8u322-jdk-oraclelinux8 \
    sh -c "java -jar docs-1.0.0.jar"