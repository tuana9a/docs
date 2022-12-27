# how to

## setup ssh

### prepare ssh on client

create new client ssh key pair

```bash
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

### prepare ssh on remote server

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

or

```bash
cat PUBLICKEY >> .ssh/authorized_keys
```

```bash
chmod 700 .ssh
```

```bash
chmod 600 .ssh/authorized_keys
```

## setup swap on linux

### create new swap

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

### **(optional)** make new swap pernament when reboot

```bash
sudo nano /etc/fstab
```

then add these new content

```text
/swapfile swap swap defaults 0 0
```

### remove a swap

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

### change swap size

```bash
sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
```

## how to locate installed deb package

```bash
dpkg -L package-name
```

refs [https://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installation](https://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installationhttps://askubuntu.com/questions/843294/where-does-a-deb-file-go-after-installation)

## get current ip of ubuntu

```bash
ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

```bash
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
```

```bash
ifconfig wlan0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'
```

## how to generate password

`$1` is param for length of password

```bash
date +%s | sha256sum | base64 | head -c $1 ; echo
```

```bash
openssl rand -base64 $1
```
