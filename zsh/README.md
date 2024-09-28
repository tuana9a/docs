# zsh

# oh-my-zsh

install oh my zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

install plugins

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```bash
sudo apt install direnv
brew install direnv
```

following lines is for `~/.zshrc` file

```bash
export LANG=en_US.UTF-8

# history
HISTSIZE=9999

# zsh
export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=("gentoo")

# plugins
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# ~/.local/bin
export PATH=$PATH:~/.local/bin

# direnv
eval "$(direnv hook zsh)"

# zoxide
eval "$(zoxide init zsh)"

alias cd=z
```