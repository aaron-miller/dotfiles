export EDITOR=nvim
export BROWSER=firefox

# Nix user profile on non-NixOS Linux (nix-darwin sets this up on macOS)
[[ $OSTYPE == linux* && -d ~/.nix-profile/bin ]] && export PATH="$HOME/.nix-profile/bin:$PATH"

export PATH="$HOME/.scripts:$PATH"

# machine-local settings, not committed (e.g. WT_BRANCH_PREFIX)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Disable Pi version update check on startup
export PI_SKIP_VERSION_CHECK=1

# enable Ctrl + R
bindkey -v
bindkey '^R' history-incremental-search-backward

# Completions from the home-manager profile (/etc/profiles on macOS, ~/.nix-profile on Linux)
for profile in /etc/profiles/per-user/$USER ~/.nix-profile; do
  [[ -d $profile/share/zsh/site-functions ]] && FPATH=$profile/share/zsh/site-functions:$FPATH
done

# completion
fpath=(~/.zfunc $fpath)
autoload -U compinit; compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' completer _extensions _complete _approximate

# podman
# podman completion -f "${fpath[1]}/_podman" zsh

# kubectl
source <(command kubectl completion zsh)


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

for profile in /etc/profiles/per-user/$USER ~/.nix-profile; do
  if [[ -r $profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source $profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    break
  fi
done
source <(fzf --zsh)

eval "$(direnv hook zsh)"
