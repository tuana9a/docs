# add simple volume to container
docker run -dp 3000:3000 -v todo-db:/etc/todos getting-started

# map current folder which command is run to container
# and after container is run
# run following command after "sh" keyword
docker run -dp 3000:3000 -w /app -v "$(pwd):/app" node:12-alpine sh -c "yarn install && yarn run dev"