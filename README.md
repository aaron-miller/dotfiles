# dotfiles
My personal dotfiles to be used with GNU Stow.

## Quickstart

```
brew install awscli gh go helm hugo k9s kubectx kubernetes-cli neovim nvm ollama openjdk pyenv rbenv s3cmd ruby-build starship stow tmux && \
brew install --cask 1password aerospace dbeaver-community firefox firefox@developer-edition font-hack-nerd-font font-inconsolata-go-nerd-font google-chrome macvim obsidian sanesidebuttons secretive slack unnaturalscrollwheels visual-studio-code wezterm

```

### Requirements
- GNU stow
- Hack Nerd Font
- nvm, rbenv

1. `git clone https://github.com/aaron-miller/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. Link an app using `stow <dir>`
