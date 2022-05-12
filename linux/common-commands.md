# how to run command in background

```bash
# pattern không log pid
nohup COMMAND >> run.log 2>&1 &

# pattern log cả pid
nohup COMMAND >> run.log 2>&1 & echo $! > run.pid

# example with python
nohup python main.py >> run.log 2>&1 &
nohup python main.py >> run.log 2>&1 & echo $! > run.pid

# example nodejs
nohup node dist/main.js >> run.log 2>&1 &
nohup node dist/main.js >> run.log 2>&1 & echo $! > run.pid

# example with java
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 &
nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
PORT=4000 ADDRESS=127.0.0.1 nohup java -jar docs-1.0.0.jar >> run.log 2>&1 & echo $! > run.pid
```

# cronjob

```bash
# mở editor để edit file này :V
crontab -e				

# sau đó sửa theo format sau ref: https://crontab.guru/
# m h dom mon dow command
# VD:
*/15 * * * * /bin/bash /home/tuana9a/somebashscript.sh

# save file lại và restart cronjob

# ubuntu
systemctl restart cron

# fedora
systemctl restart crond
```

# how to generate password

```bash
# $1 is param for length of password
date +%s | sha256sum | base64 | head -c $1 ; echo

# === or ===

# $1 is param for length of password
date +%s | sha256sum | base64 | head -c $1 ; echo
```

# set timezone

```bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
```

# setup ssh

```bash
# copy existing ssh keys to ssh directory
cd ~
mkdir .ssh
chmod 700 .ssh
cp KEYFILE .ssh/id_rsa
cp PUBKEYFILE .ssh/id_rsa.pub
chmod 600 .ssh/id_rsa
chmod 644 .ssh/id_rsa.pub

# cài ssh server
sudo apt install openssh-server

# inject ssh keys
# sau đó add public key của bạn vào server
cd ~
mkdir .ssh
chmod 700 .ssh
echo ssh-rsa PUBLICKEY > .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
```

# setup swap

```bash
# create new swap
SWAP_NAME=/swap.img
SWAP_NAME=/swapfile

sudo fallocate -l 1G $SWAP_NAME
sudo chmod 600 $SWAP_NAME
sudo mkswap $SWAP_NAME
sudo swapon $SWAP_NAME

# make new swap pernament
sudo nano /etc/fstab

# add these new content
/swap.img swap swap defaults 0 0
# change to /swapfile if you use /swapfile above
/swapfile swap swap defaults 0 0

# remove a swap
sudo swapoff -v $SWAP_NAME
sudo rm $SWAP_NAME

# if add to /etc/fstab so delete it also
sudo nano /etc/fstab
```

# journalctl

```bash
# xem thông tin một service
journalctl -u service-name.service
```

# apt

```bash
# tự động xóa các apt không cần thiết
sudo apt-get autoremove
sudo apt autoremove

# xem địa của của một package
whereis pkg_name
```

# tar

```bash
# zip toàn bộ thư mục, files từ thư mục .
tar czf resource.tar.gz *	

# unzip toàn bộ file vào thư mục hiện tại
tar -xvf archive.tar.gz
```

