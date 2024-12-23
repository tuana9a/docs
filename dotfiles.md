# Table of Contents
- [Table of Contents](#table-of-contents)
- [.zshrc](#zshrc)
- [.vimrc](#vimrc)
- [.tmux.conf](#tmuxconf)

# .zshrc

Then add the following lines to `~/.zshrc` file

```bash
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin

export LANG="en_US.UTF-8"
export LC_ALL="en_US.utf-8"

HISTSIZE=9999

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=("gentoo")
plugins=(git zsh-autosuggestions kubectl kubectx aws gcloud)
source $ZSH/oh-my-zsh.sh

eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"
alias cd=z

alias k='kubectl'
alias ktx='kubectx'
alias kns='kubens'
alias r2='aws s3api --endpoint-url "$S3_ENDPOINT_URL"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
