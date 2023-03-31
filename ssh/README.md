# ssh

## prepare ssh on client

create new client ssh key pair

```bash
ssh-keygen -t rsa
cd ~
mkdir .ssh
# copy existing ssh files (if has)
cp KEYFILE .ssh/id_rsa
cp PUBKEYFILE .ssh/id_rsa.pub
# change to correct permissions
chmod 700 .ssh
chmod 600 .ssh/id_rsa
chmod 644 .ssh/id_rsa.pub
```

## prepare ssh on remote server

install ssh server

```bash
# install if not
sudo apt install openssh-server
# inject ssh keys
cd ~
mkdir .ssh
# copy client public key
echo PUBLICKEY >> .ssh/authorized_keys
# or
cat PUBLICKEY >> .ssh/authorized_keys
# change to correct permissions
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
```
