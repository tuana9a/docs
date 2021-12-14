docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=12345678 -d mysql:5.7

docker run -p 27017:27017 --name mongo -d mongo:5.0

docker run -d -p 15672:15672 -p 5672:5672 --name rabbitmq rabbitmq:3.8-management

# mysql
sudo docker run \
--name mysql-8.0 \
-dp 3306:3306 \
-v /mnt/sda1/Docker/volumes/mysql-8.0/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=1234 \
-d mysql:8.0 \
--character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

# mongodb
sudo docker run \
--name mongo-4.2 \
-dp 27017:27017 \
-v /mnt/sda1/Docker/volumes/mongo-4.2/data:/data/db \
-d mongo:4.2-bionic