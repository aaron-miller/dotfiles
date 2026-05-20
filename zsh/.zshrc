export EDITOR=nvim
export BROWSER=firefox

# Disable Pi version update check on startup
export PI_SKIP_VERSION_CHECK=1

# enable Ctrl + R
bindkey -v
bindkey '^R' history-incremental-search-backward

# Load Homebrew shell completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# completion
autoload -U compinit; compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' completer _extensions _complete _approximate


# aliases
source ~/.aliases

# functions
source ~/.functions

# suffix aliases
alias -s html=w3m
alias -s txt=${EDITOR}
alias -s go=${EDITOR}
alias -s py=${EDITOR}
alias -s md=${EDITOR}
alias -s markdown=${EDITOR}
alias -s json=${EDITOR}
alias -s yaml=${EDITOR}
alias -s toml=${EDITOR}


# widgets

# edit my current command line in my $EDITOR with <ctrl-x ctrl-e>
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# enable the magic-space key, expand globs when pressing space
# bindkey ' ' magic-space

eval "$(starship init zsh)"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
