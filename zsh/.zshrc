export PATH="/Users/amill248/bin:$PATH"

# Load Homebrew shell completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Create a minimal prompt
export PS1="%~ %% "

alias ls="ls -G"
alias ll="ls -lG"
alias lla="ls -laG"
alias la="la -aG"

alias k="kubectl"
alias ktx="kubectx"
alias kns="kubens"

