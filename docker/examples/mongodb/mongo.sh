# simple mongodb
docker run -p 27017:27017 --name mongo -d mongo:5.0

# map with volume
sudo docker run \
--name mongo-4.2 \
-dp 27017:27017 \
-v /mnt/sda1/Docker/volumes/mongo-4.2/data:/data/db \
-d mongo:4.2-bionic