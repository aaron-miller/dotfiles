# Load zsh plugin manager zgem - https://github.com/qoomon/zgem
ZGEM_HOME="$HOME/.zsh.zgem"
# ZGEM_GEM_DIR="$ZGEM_HOME/gems"
# ZGEM_UTILS_DIR="$HOME"

[[ -e "$ZGEM_HOME" ]] || git clone 'https://github.com/qoomon/zgem.git' "$ZGEM_HOME"
source "$ZGEM_HOME/zgem.zsh" 

##### Plugins ######
#
# Lazy load nvm, pyenv, rbenv, etc.
zgem bundle 'https://github.com/qoomon/zsh-lazyload.git' from:'git' use:'zsh-lazyload.zsh'

# lazy load version managers

# nvm
lazyload nvm -- '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"'
lazyload npm -- '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"'
lazyload npx -- '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"'
lazyload node -- '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"'

# rbenv
lazyload rbenv -- 'eval "$(rbenv init - --no-rehash zsh)"'
lazyload ruby -- 'eval "$(rbenv init - --no-rehash zsh)" && ruby'
lazyload irb -- 'eval "$(rbenv init - --no-rehash zsh)" && irb'
lazyload gem -- 'eval "$(rbenv init - --no-rehash zsh)" && gem'
lazyload tmuxinator -- 'eval "$(rbenv init - --no-rehash zsh)" && tmuxintor'

# enable Ctrl + R
bindkey -v
bindkey '^R' history-incremental-search-backward

# Load Homebrew shell completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

alias ls="ls -G"
alias ll="ls -lG"
alias lla="ls -laG"
alias la="la -aG"

alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git commit --all"
alias gam="git commit --all --message"
alias gph="git push"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gf="git fetch --all"
alias gfp="git fetch --all --prune"
alias gr="git rebase -i"
alias gro="git rebase -i origin/main"

alias k="kubectl"
alias ktx="kubectx"
alias kns="kubens"

alias dot="cd ~/.dotfiles"
alias dotn="nvim ~/.dotfiles/nvim/.config/nvim"
alias dotz="nvim ~/.dotfiles/zsh"

eval "$(starship init zsh)"
