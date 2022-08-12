# Prepare client

## Create new ssh key pair

```
ssh-keygen -t rsa
```

## Copy existing ssh files

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

# Prepare SSH server

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
