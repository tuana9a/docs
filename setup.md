# Table of Contents

- [Table of Contents](#table-of-contents)
- [zsh](#zsh)
- [oh my zsh](#oh-my-zsh)
- [zsh-autosuggestions](#zsh-autosuggestions)
- [direnv](#direnv)
- [zxodie](#zxodie)
- [fzf](#fzf)
- [kubectx](#kubectx)
- [kubectl](#kubectl)
- [k9s](#k9s)
- [helm](#helm)
- [nvm](#nvm)
- [tfenv](#tfenv)
- [terraform](#terraform)
- [argocd](#argocd)
- [corretto 8](#corretto-8)
- [doctl](#doctl)
- [awscli](#awscli)
- [gcloud](#gcloud)
  - [gke auth plugin](#gke-auth-plugin)
- [gh](#gh)
- [glab](#glab)
- [mvn](#mvn)
- [coder](#coder)
- [python](#python)
- [go](#go)
- [vault](#vault)
- [docker](#docker)
- [ansible](#ansible)


# zsh

```bash
sudo apt install -y zsh
sudo chsh -s $(which zsh) $USER
```

See [dotfiles.md#zshrc](./dotfiles.md#zshrc)

# oh my zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
```

# zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

# direnv

TODO: install in `$HOME/.local`

```bash
sudo apt install -y direnv
```

# zxodie

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

remove old and buggy zoxide in apt repository

```bash
sudo apt remove zoxide
```

# fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

# kubectx

```bash
# Ensure ~/.local/bin exists
mkdir -p ~/.local/bin

git clone https://github.com/ahmetb/kubectx ~/.local/kubectx
ln -s ~/.local/kubectx/kubectx ~/.local/bin/kubectx
ln -s ~/.local/kubectx/kubens ~/.local/bin/kubens
```

# kubectl

```bash
curl -sL "https://dl.k8s.io/release/v1.33.4/bin/linux/amd64/kubectl" -o ~/.local/bin/kubectl
chmod 0755 ~/.local/bin/kubectl
```

# k9s

```bash
curl -sSL https://github.com/derailed/k9s/releases/download/v0.50.9/k9s_Linux_amd64.tar.gz -o /tmp/k9s.tar.gz
tar xzf /tmp/k9s.tar.gz -C /tmp/
cp /tmp/k9s ~/.local/bin/
rm /tmp/k9s*
```

# helm

TODO: install to `$HOME/.local`

```bash
wget https://get.helm.sh/helm-v3.16.3-linux-amd64.tar.gz -O /tmp/helm-v3.16.3-linux-amd64.tar.gz
tar -zxvf /tmp/helm-v3.16.3-linux-amd64.tar.gz -C /tmp
sudo cp /tmp/linux-amd64/helm /usr/local/bin/helm
```

# nvm

```bash
NVM_VERSION=v0.39.7
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash
```

```bash
nvm install 20
```

```bash
node -v # should print `v20.12.2`
npm -v # should print `10.5.0`
```

# tfenv

```bash
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
ln -sf ~/.tfenv/bin/* ~/.local/bin
```

# terraform

terraform module cache plugin

```bash
mkdir -p ~/.terraform.d/plugin-cache
echo 'plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"' >> ~/.terraformrc
```

# argocd

```bash
curl -sL "https://github.com/argoproj/argo-cd/releases/download/v2.7.10/argocd-linux-amd64" -o ~/.local/bin/argocd
chmod 0755 ~/.local/bin/argocd
```

# corretto 8

TODO: install to `$HOME/.local`

```bash
wget https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.tar.gz -O /opt/corretto-8.tar.gz
tar xzf /opt/corretto-8.tar.gz -C /opt
ln -sf /opt/amazon-corretto-8*/bin/* /usr/local/bin
```

# doctl

```bash
curl -sSL https://github.com/digitalocean/doctl/releases/download/v1.124.0/doctl-1.124.0-linux-amd64.tar.gz -o /tmp/doctl.tar.gz
tar xzf /tmp/doctl.tar.gz -C /tmp
mv mv /tmp/doctl ~/.local/bin/
```

# awscli

TODO: install to `$HOME/.local`

```bash
wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -O /tmp/awscli.zip
unzip /tmp/awscli.zip -d /tmp/
sudo /tmp/aws/install -u > /tmp/awscli-install.log
```

# gcloud

```bash
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz -C $HOME/.local
$HOME/.local/google-cloud-sdk/install.sh
```

Add gcloud CLI to PATH

```bash
export PATH="$PATH:$HOME/.local/google-cloud-sdk/bin"
```

## gke auth plugin

TODO: install to `$HOME/.local`

```bash
sudo apt-get install -y google-cloud-cli-gke-gcloud-auth-plugin
```

# gh

TODO: install to `$HOME/.local`

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

TODO: install to `$HOME/.local`

```bash
wget https://gitlab.com/gitlab-org/cli/-/releases/v1.39.0/downloads/glab_1.39.0_Linux_x86_64.tar.gz -O /tmp/glab.tar.gz
mkdir -p /tmp/glab/ && tar xzf /tmp/glab.tar.gz -C /tmp/glab
sudo install -o root -g root -m 0755 /tmp/glab/bin/glab /usr/local/bin/glab
```

# mvn

```bash
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -O /opt/maven-3.tar.gz
tar xzf /opt/maven-3.tar.gz -C /opt/
sudo ln -sf /opt/apache-maven-3*/bin/* /usr/local/bin
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

# go

```bash
wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz -O /tmp/go.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/go.tar.gz
```

# vault

```bash
wget https://releases.hashicorp.com/vault/1.18.1/vault_1.18.1_linux_amd64.zip -O /tmp/vault.zip
unzip /tmp/vault.zip -d /tmp/
sudo install -o root -g root -m 0755 /tmp/vault /usr/local/bin/vault
```

# docker

https://docs.docker.com/engine/install/ubuntu/

```bash
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh
```

# ansible

NOTE: using python of the os, change the 3.10 if necessary

```bash
sudo apt install -y python3.10-venv
mkdir -p ~/ansible && cd ~/ansible
python3 -m venv .venv
.venv/bin/pip install ansible ansible-core ansible-lint
ln -sf $PWD/.venv/bin/ansible* ~/.local/bin
```

verify ansible installation

```bash
ansible --version
```
