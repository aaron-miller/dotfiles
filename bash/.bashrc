# Distro defaults (Fedora): system bashrc and per-user drop-ins
[[ -f /etc/bashrc ]] && . /etc/bashrc
[[ -d ~/.bashrc.d ]] && for rc in ~/.bashrc.d/*; do [[ -f $rc ]] && . "$rc"; done
unset rc

export EDITOR=nvim
export BROWSER=firefox

# Nix user profile on non-NixOS Linux
[[ -d ~/.nix-profile/bin ]] && export PATH="$HOME/.nix-profile/bin:$PATH"
[[ -d ~/.local/bin ]] && export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.scripts:$PATH"

# Completions from the home-manager profile (bash-completion lives there)
[[ -d ~/.nix-profile/share ]] && export XDG_DATA_DIRS="$HOME/.nix-profile/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"
[[ -r ~/.nix-profile/share/bash-completion/bash_completion ]] && . ~/.nix-profile/share/bash-completion/bash_completion

# machine-local settings, not committed (e.g. WT_BRANCH_PREFIX)
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

# Disable Pi version update check on startup
export PI_SKIP_VERSION_CHECK=1

# vi keys at the prompt, Ctrl-R reverse search, Ctrl-X Ctrl-E edit command line
set -o vi
bind -m vi-insert '"\C-r": reverse-search-history'
bind -m vi-insert '"\C-x\C-e": edit-and-execute-command'

# aliases and functions (shell/ is shared with zsh)
. ~/.aliases
. ~/.functions

# bash doesn't have zsh's noglob; unmatched globs already pass through literally
alias ai='ask-llm'

eval "$(starship init bash)"
eval "$(fzf --bash)"
eval "$(devenv hook bash -- --quiet)"
