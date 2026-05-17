export EDITOR=nvim
export BROWSER=firefox

# enable Ctrl + R
bindkey -v
bindkey '^R' history-incremental-search-backward

# Load Homebrew shell completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache


# aliases
alias v=vim
alias n=nvim
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

alias rg="rg --smart-case --hidden --glob '!.git'"
alias ..="cd .."
alias ...="cd ../.."
alias ports="lsof -i -P -n | grep LISTEN"

alias g="git"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git commit --all"
alias gam="git commit --all --message"
alias gcm="git commit -m"
alias gph="git push"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gf="git fetch --all"
alias gfp="git fetch --all --prune"
alias gr="git rebase -i"
alias gro="git rebase -i origin/main"
alias gl="git log --oneline --graph -20"
alias gb="git branch"
alias gco="git checkout"
alias gst="git stash"
alias gstp="git stash pop"

alias copy="pbcopy"
alias paste="pbpaste"
alias oc="opencode"

alias k="kubectl"
alias ktx="kubectx"
alias kns="kubens"

alias dpu="devpod up ."
alias dpd="devpod delete ."
alias dp="devpod ssh ."

alias dot="cd ~/.dotfiles"
alias dotn="nvim ~/.dotfiles/nvim/.config/nvim"
alias dotz="nvim ~/.dotfiles/zsh"
alias dott="nvim ~/.dotfiles/tmux/.tmux.conf"

# aws
awsp() {
  if ! command -v aws &>/dev/null; then
    echo "awsp: aws CLI is not installed" >&2
    return 1
  fi
  local profile=$(aws configure list-profiles | fzf --height 40% --prompt="AWS Profile> ")
  [[ -n "$profile" ]] && export AWS_PROFILE="$profile" && echo "→ $profile"
}

# suffix aliases
alias -s html=w3m
alias -s txt=${EDITOR}
alias -s go=${EDITOR}
alias -s py=${EDITOR}
alias -s md=${EDITOR}
alias -s markdown=${EDITOR}


# widgets

# edit my current command line in my $EDITOR with <ctrl-x ctrl-e>
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# enable the magic-space key, expand globs when pressing space
# bindkey ' ' magic-space

eval "$(starship init zsh)"

