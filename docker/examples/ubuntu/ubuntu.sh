# chạy một container ubuntu
docker run -d ubuntu bash -c "shuf -i 1-10000 -n 1 -o /data.txt && tail -f /dev/null"
# lệnh tail để giữ cho container chạy

