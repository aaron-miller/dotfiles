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

# devpods
alias dpu="devpod up ."
alias dpd="devpod delete ."
alias dp="devpod ssh ."

# alias dot="cd ~/.dotfiles"
# alias dotn="nvim ~/.dotfiles/nvim/.config/nvim"
# alias dotz="nvim ~/.dotfiles/zsh"

eval "$(starship init zsh)"

