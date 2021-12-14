
docker run -d -p 80:80 docker/getting-started

docker run -dp 3000:3000 getting-started


docker ps			                    # list container

docker stop CONTAINER_ID	            # Once the container has stopped, you can remove it by using the docker rm command.

docker rm CONTAINER_ID	                # Remove container from list

docker rm -f CONTAINER_ID	            # Stop and Remove container


docker exec CONTAINER_ID cat /data.txt	# execute a command of running container

docker exec -it CONTAINER_ID sh	        # To get into bash shell

docker exec -it CONTAINER_ID bash	    # To get into bash shell


docker volume create todo-db

docker tag getting-started USERNAME/getting-started     # VD: docker tag getting-started tuana9a/getting-started


docker network create todo-app


docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started

docker run -dp 3000:3000 -w /app -v "$(pwd):/app" node:12-alpine sh -c "yarn install && yarn run dev"
