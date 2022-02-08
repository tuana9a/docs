# execute a command of running container
docker exec CONTAINER_ID cat /data.txt

# To get into bash shell
docker exec -it CONTAINER_ID sh

# To get into bash shell
docker exec -it CONTAINER_ID bash