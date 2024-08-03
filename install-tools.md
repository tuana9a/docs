# install-tools

# argocd

```bash
ARGOCD_VERSION=v2.7.10
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_VERSION/argocd-linux-amd64
chmod 755 /usr/local/bin/argocd
```

# corretto 8

```bash
wget https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.tar.gz -O /opt/corretto-8.tar.gz
tar xzf /opt/corretto-8.tar.gz -C /opt
ln -sf /opt/amazon-corretto-8*/bin/* /usr/local/bin
```

# direnv

```bash
apt install direnv
```

# gcloud

```bash
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update -y && sudo apt-get install -y google-cloud-cli
sudo apt-get install -y google-cloud-cli-gke-gcloud-auth-plugin
```

# gh

```bash
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
```

# glab

```bash
wget https://gitlab.com/gitlab-org/cli/-/releases/v1.39.0/downloads/glab_1.39.0_Linux_x86_64.tar.gz -O /opt/glab.tar.gz
mkdir -p /opt/glab/ && tar xzf /opt/glab.tar.gz -C /opt/glab
sudo install -o root -g root -m 0755 /opt/glab/bin/glab /usr/local/bin/glab
```

# k9s

```bash
wget https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz -O /opt/k9s.tar.gz
mkdir -p /opt/k9s/ && tar xzf /opt/k9s.tar.gz -C /opt/k9s
sudo install -o root -g root -m 0755 /opt/k9s/k9s /usr/local/bin/k9s
```

# kubectl

```bash
KUBECTL_VERSION=v1.28.11
curl -L "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" -o /opt/kubectl
curl -L "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256" -o /opt/kubectl.sha256
echo "$(cat /opt/kubectl.sha256) /opt/kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 /opt/kubectl /usr/local/bin/kubectl
```

# mvn

```bash
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -O /opt/maven-3.tar.gz
tar xzf /opt/maven-3.tar.gz -C /opt/
sudo ln -sf /opt/apache-maven-3*/bin/* /usr/local/bin
```

# nvm

```bash
NVM_VERSION=v0.39.7
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
```

```bash
nvm install 20
node -v # should print `v20.12.2`
npm -v # should print `10.5.0`
```

# tfenv

```bash
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
sudo ln -sf ~/.tfenv/bin/* /usr/local/bin
```

# zxodie

```bash
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

# coder

```bash
curl -L https://coder.com/install.sh | sh
```

# python

```bash
# Install neccessary dev tools to build
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Choose the version of python you want, here is the list I tested
PYTHON_VERSION=3.6.13
PYTHON_VERSION=3.8.16
PYTHON_VERSION=3.12.3

wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar xzf Python-$PYTHON_VERSION.tgz
cd Python-$PYTHON_VERSION/
./configure --prefix=/opt/python-$PYTHON_VERSION --enable-shared LDFLAGS=-Wl,-rpath=/opt/python-$PYTHON_VERSION/lib
sudo make
sudo make install
```
