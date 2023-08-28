# ssh

## prepare ssh on client

prepare directory

```bash
cd ~
mkdir .ssh
chmod 700 .ssh
```

create new client ssh key pair

```bash
ssh-keygen -t rsa
```

or copy existing ones

```bash
cp KEYFILE .ssh/id_rsa
cp PUBKEYFILE .ssh/id_rsa.pub
```

update permissions

```bash
chmod 600 .ssh/id_rsa
chmod 644 .ssh/id_rsa.pub
```

## prepare ssh on remote server

install ssh server

```bash
sudo apt install -y openssh-server
```

prepare directory

```bash
cd ~
mkdir .ssh
chmod 700 .ssh
```

inject ssh keys

```bash
echo PUBLICKEY >> .ssh/authorized_keys
# or
cat PUBLICKEY_FILE >> .ssh/authorized_keys
```

update permissions

```bash
chmod 600 .ssh/authorized_keys
```
