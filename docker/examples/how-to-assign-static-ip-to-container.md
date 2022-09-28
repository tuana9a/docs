# how to assign static ip to container

## 1. with inline cmd

create new separate network

```bash
docker network create --subnet=172.20.0.0/16 customnetwork
# trong đó
#   127.20.0.0/16 là card mạng + subnet
#   customnetwork là tên network mà bạn muốn tạo
```

attach new container to network above

```bash
docker run --net customnetwork --ip 172.20.0.9 -d mongo:5.0
```

let's check it

```bash
# kiểm tra lại ip của container xem có chuẩn không
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' name_or_id
```

## 2. with docker-compose

```yaml
version: "2"

services:
  webserver:
    image: nginx
    networks:
      customnetwork:
        ipv4_address: 172.20.0.10

networks:
  customnetwork:
    # name of docker network
    ipam:
      config:
        - subnet: 172.20.0.0/16
```

# Refs

[https://www.cloudsavvyit.com/14508/how-to-assign-a-static-ip-to-a-docker-container/](https://www.cloudsavvyit.com/14508/how-to-assign-a-static-ip-to-a-docker-container/)
