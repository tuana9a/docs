# install python 3.6.13

installation process is same in other python versions

install necessary packages for building python

```bash
sudo apt-get install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

```bash
wget https://www.python.org/ftp/python/3.6.13/Python-3.6.13.tgz
```

```bash
tar xzf Python-3.6.13.tgz
```

```bash
cd Python-3.6.13/
```

```bash
./configure --prefix=/opt/python-3.6.13
```

```bash
sudo make
```

```bash
sudo make install
```
