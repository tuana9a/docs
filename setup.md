# setup

# zsh

```bash
sudo apt install -y zsh
sudo chsh -s $(which zsh) $USER
```

# direnv

```bash
sudo apt install -y direnv
```

# zxodie

```bash
sudo apt remove zoxide # zoxide in apt repository is old and buggy
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

# fzf

```bash
sudo apt install -y fzf
```

# kubectx, kubens

```bash
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
```

# oh my zsh

install oh my zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
```

install plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
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

# argocd

```bash
ARGOCD_VERSION=v2.7.10
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_VERSION/argocd-linux-amd64
sudo chmod 755 /usr/local/bin/argocd
```

# corretto 8

```bash
wget https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.tar.gz -O /opt/corretto-8.tar.gz
tar xzf /opt/corretto-8.tar.gz -C /opt
ln -sf /opt/amazon-corretto-8*/bin/* /usr/local/bin
```

# awscli

```bash
wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -O /tmp/awscli.zip
unzip /tmp/awscli.zip -d /tmp/
sudo /tmp/aws/install -u > /tmp/awscli-install.log
```

# gcloud

```bash
sudo apt-get install apt-transport-https ca-certificates gnupg curl
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get update -y && sudo apt-get install -y google-cloud-cli
```

gke auth login

```bash
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
wget https://gitlab.com/gitlab-org/cli/-/releases/v1.39.0/downloads/glab_1.39.0_Linux_x86_64.tar.gz -O /tmp/glab.tar.gz
mkdir -p /tmp/glab/ && tar xzf /tmp/glab.tar.gz -C /tmp/glab
sudo install -o root -g root -m 0755 /tmp/glab/bin/glab /usr/local/bin/glab
```

# kubectl

```bash
KUBECTL_VERSION=v1.28.11
curl -L "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl" -o /tmp/kubectl
curl -L "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl.sha256" -o /tmp/kubectl.sha256
echo "$(cat /tmp/kubectl.sha256) /tmp/kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
```

# k9s

```bash
wget https://github.com/derailed/k9s/releases/download/v0.32.4/k9s_Linux_amd64.tar.gz -O /tmp/k9s.tar.gz
tar xzf /tmp/k9s.tar.gz -C /tmp/
sudo install -o root -g root -m 0755 /tmp/k9s /usr/local/bin/k9s
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

# .zshrc

Then add the following lines to `~/.zshrc` file

```bash
# bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin

# lang
export LANG=en_US.UTF-8

# history
HISTSIZE=9999

# zsh
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=("gentoo")

# plugins
plugins=(git zsh-autosuggestions kubectl kubectx aws gcloud)
source $ZSH/oh-my-zsh.sh

# direnv
eval "$(direnv hook zsh)"

# zoxide
eval "$(zoxide init zsh)"

alias cd=z

# k8s
alias k='kubectl'
alias ktx='kubectx'
alias kns='kubens'

# r2
alias r2='aws s3api --endpoint-url "$S3_ENDPOINT_URL"'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# prompt
PROMPT='%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ${vcs_info_msg_0_}%F{white}($(kubectx_prompt_info)) %F{blue}%(!.#.$)%k%b%f '
```

# .vimrc

```bash
set hlsearch
```

# .tmux.conf

```conf
set -g default-terminal 'screen-256color'

# change default prefix (hotkey) to Ctrl + t
set-option -g prefix C-t

# hotkey + a to sync typing between panes
bind a setw synchronize-panes

# vim mode
setw -g mode-keys vi
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R
```
