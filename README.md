# dotfiles
My personal dotfiles to be used with GNU Stow.

## Quickstart

### Requirements
- GNU stow
- Hack Nerd Font

1. `git clone https://github.com/aaron-miller/dotfiles.git ~/.dotfiles`
2. `cd ~/.dotfiles`
3. Link an app: `stow <dir>` or install everything: `for app in $(ls -d */ | sed 's;/;;g'); do stow $app; done`
