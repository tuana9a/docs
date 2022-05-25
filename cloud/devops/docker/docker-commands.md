# exec

```bash
# execute a command of running container
docker exec CONTAINER_ID cat /data.txt

# To get into bash shell
docker exec -it CONTAINER_ID sh

# To get into bash shell
docker exec -it CONTAINER_ID bash
```

# image

```bash
# print local image
docker image ls
```

# logs

```bash
# xem logs của một container
docker logs -f <container-id
```

# network

```bash
docker network create todo-app

docker network create --subnet=172.20.0.0/16 test1
# trong đó  
#   127.20.0.0/16 là card mạng + subnet
#   test1 là tên network mà bạn muốn tạo

# sau do co the dung
docker run --net test1 --ip 172.20.0.3 --name test2 -d mongo:5.0
```

# ps

```bash
# list container
docker ps

# list all container
docker ps -a
```

# rm

```bash
# Remove container from list
docker rm CONTAINER-ID

# Stop and Remove container
docker rm -f CONTAINER-ID
```

# stop

```bash
# Once the container has stopped, you can remove it by using the docker rm command.
docker stop CONTAINER-ID
```

# tag

```bash
docker tag getting-started USERNAME/getting-started
# VD: 
docker tag getting-started tuana9a/getting-started
```

# volume

```bash
docker volume create todo-db
```