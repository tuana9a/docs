# ssh

## prepare ssh on client

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

## prepare ssh on remote server

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
