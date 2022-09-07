# Setup SSH

## prepare SSH on client

create new client ssh key pair

```
ssh-keygen -t rsa
```

copy existing ssh files

```bash
cd ~
```

```bash
mkdir .ssh
```

```bash
cp KEYFILE .ssh/id_rsa
```

```bash
cp PUBKEYFILE .ssh/id_rsa.pub
```

```bash
chmod 700 .ssh
```

```bash
chmod 600 .ssh/id_rsa
```

```bash
chmod 644 .ssh/id_rsa.pub
```

## prepare SSH on remote server

install ssh server

```bash
sudo apt install openssh-server
```

inject ssh keys

```bash
cd ~
```

```bash
mkdir .ssh
```

```bash
echo PUBLICKEY >> .ssh/authorized_keys
```

**or**

```bash
cat PUBLICKEY >> .ssh/authorized_keys
```

```bash
chmod 700 .ssh
```

```bash
chmod 600 .ssh/authorized_keys
```

# Setup swap on linux

## create new swap

```bash
sudo fallocate -l 1G /swapfile
```

```bash
sudo chmod 600 /swapfile
```

```bash
sudo mkswap /swapfile
```

```bash
sudo swapon /swapfile
```

## **(optional)** make new swap pernament when reboot

```bash
sudo nano /etc/fstab
```

then add these new content

```text
/swapfile swap swap defaults 0 0
```

## remove a swap

```bash
sudo swapoff -v /swapfile
```

```bash
sudo rm /swapfile
```

delete entry in /etc/fstab if you added it

```bash
sudo nano /etc/fstab
```

# how to locate installed deb package

```bash
dpkg -L package-name
```

refs [https://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installation](https://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installationhttps://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installation)

# get current if of ubuntu

ifconfig

```bash
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

or

```bash
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
```

or

```bash
ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

# how to generate password

$1 is param for length of password

```bash
date +%s | sha256sum | base64 | head -c $1 ; echo
```

$1 is param for length of password

```bash
date +%s | sha256sum | base64 | head -c $1 ; echo
```

# mysql allow remote login root

Created: July 28, 2021
Tags: mysql

# root

If you've got access to the mysql database, you can change the grant tables directly:

```sql
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';
```

Also you might need to make changes to the mysql.db table as well:

```sql
UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='username';
```

and then flush to apply the privileges:

```sql
FLUSH PRIVILEGES;
```

# mysql allow root auth login plugin

Tags: mysql

lại ván đề liên quan tới quyền trong mysql và authentication
[mysql-allow-remote-login-root](#mysql-allow-remote-login-root)

nếu gặp vấn đề đăng nhập bằng `sudo mysql` được mà `mysql -u root -p` không được
thì cần xem lại plugin đăng nhập xem có là `unix_sock` không

chuyển authen từ auth_socket sang dùng password để cho phép đăng nhập từ xa

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your-password';
```

cho phép đăng nhập từ xa

```sql
UPDATE mysql.user SET host='%' WHERE host='localhost' AND user='root';

```

lệnh phía dưới không cần chạy, cơ mà nếu trên không được thì cứ chạy tiếp lệnh dưới

```sql
UPDATE mysql.db SET host='%' WHERE host='localhost' AND user='root';

```

reset quyền

```sql
FLUSH PRIVILEGES;
```

# how to add ssl to mongodb

Tags: mongodb

cert key file khi cấu hình ssl tls của mongodb có cấu trúc là phần đầu là cert phần cuối là key
tất cả cert và key phải trong cùng một file chứ không tách riêng

ví dụ `mongodb.pem`

```
-----BEGIN CERTIFICATE-----
cert content
-----END CERTIFICATE-----
-----BEGIN PRIVATE KEY-----
key content
-----END PRIVATE KEY-----
```

sau khi có key như trên thì add file đó vào trong config

```
# network interfaces
net:
  port: 27017
  bindIp: 0.0.0.0
  tls:
    mode: requireTLS
    certificateKeyFile: /home/ubuntu/ssl/mongodb.pem
```

như vậy đã thành công add ssl cho mongodb

# How to compy docker image from computer to computer

see **[here](https://github.com/tuana9a/infrastructure-as-code/tree/main/local/gitlab-server#how-to-transfer-docker-images-from-computers-to-computers)**

# Set up gitlab server

## Requirements

[https://docs.gitlab.com/ee/install/requirements.html](https://docs.gitlab.com/ee/install/requirements.html)

**minimum 4GB RAM** or your gitlab will crashes

## Install with docker

the docker-compose.yaml like below

```yaml
version: "3.6"
services:
  web:
    image: "gitlab/gitlab-ee:14.9.5-ee.0"
    hostname: "gitlab.local"
    container_name: "gitlab"
    environment:
      GITLAB_OMNIBUS_CONFIG: |
        external_url 'https://gitlab.local'
    ports:
      - "80:80"
      - "443:443"
      - "22:22"
    volumes:
      - "/srv/gitlab/config:/etc/gitlab"
      - "/srv/gitlab/logs:/var/log/gitlab"
      - "/srv/gitlab/data:/var/opt/gitlab"
    shm_size: "256m"
```

## Post installation

```bash
# add sudo if necessary
docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

## Issues

**remember** to add hostname to /etc/hosts or dns that point to server that host gitlab

"**gitlab.local**" is not a valid domain by letsencrypt

- output

  ```bash
  letsencrypt_certificate[gitlab.vacs.local] (letsencrypt::http_authorization line 5) had an error: Acme::Client::Error::RejectedIdentifier: acme_certificate[staging] (/opt/gitlab/embedded/cookbooks/cache/cookbooks/letsencrypt/resources/certificate.rb line 25) had an error: Acme::Client::Error::RejectedIdentifier: Error creating new order :: Cannot issue for “gitlab.vacs.local”: Domain name does not end with a valid public suffix (TLD)
  ```

- solution
  [https://forum.gitlab.com/t/domain-name-does-not-end-with-a-valid-public-suffix-tld/35902?u=tuana9a](https://forum.gitlab.com/t/domain-name-does-not-end-with-a-valid-public-suffix-tld/35902?u=tuana9a)

  add below code to git lab config file `/etc/gitlab/gitlab.rb`

  ```ruby
  letsencrypt['enable'] = false
  ```
