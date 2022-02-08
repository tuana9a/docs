# simple container
docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=12345678 -d mysql:5.7

# mysql with password and default config
sudo docker run \
--name mysql-8.0 \
-dp 3306:3306 \
-v /mnt/sda1/Docker/volumes/mysql-8.0/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=12345678 \
-d mysql:8.0 \
--character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci