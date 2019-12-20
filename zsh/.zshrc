# Load Homebrew shell completion
#if type brew &>/dev/null; then
#  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
#fi

# Create a minimal prompt
export PS1="%~ %% "

alias ls="ls -G"
alias ll="ls -lG"
alias lla="ls -laG"
alias la="la -aG"

# pyenv
eval "$(pyenv init -)"

# Activate pyenv-virtualwrapper
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PYENV_VERSION=3.7.5

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

