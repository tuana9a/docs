# how to assign static ip to container

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

## docker-compose

[`docker-compose.yaml`](./docker-compose.yaml)
