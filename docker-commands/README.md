# Docker Commands

## exec

execute a command of running container

```bash
docker exec CONTAINER_ID cat /data.txt
```

To get into bash shell

```bash
docker exec -it CONTAINER_ID sh
```

or

```bash
docker exec -it CONTAINER_ID bash
```

## image

print local image

```bash
docker image ls
```

## logs

xem logs của một container

```bash
docker logs -f <container-id>
```

## network

```bash
docker network create todo-app
```

```bash
docker network create --subnet=172.20.0.0/16 test1
```

trong đó

- 127.20.0.0/16 là card mạng + subnet
- test1 là tên network mà bạn muốn tạo

sau đó có thể dùng

```bash
docker run --net test1 --ip 172.20.0.3 --name test2 -d mongo:5.0
```

## ps

list container

```bash
docker ps
```

list all container

```bash
docker ps -a
```

## rm

Remove container from list

```bash
docker rm CONTAINER-ID
```

Stop and Remove container

```bash
docker rm -f CONTAINER-ID
```

## stop

Once the container has stopped, you can remove it by using the docker rm command.

```bash
docker stop CONTAINER-ID
```

## tag

```bash
docker tag getting-started USERNAME/getting-started
```

VD:

```bash
docker tag getting-started tuana9a/getting-started
```

## volume

```bash
docker volume create todo-db
```
