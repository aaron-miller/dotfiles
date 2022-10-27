# dotfiles
My personal dotfiles to be used with GNU Stow.

## Quickstart
1. Clone this repo to ~/.dotfiles. You can rename the directory to whatever you'd like, but it must be in your $HOME
  `git clone https://github.com/aaron-miller/dotfiles.git ~/.dotfiles`
2. Make sure GNU Stow is installed.
  ```
  # Debians
  sudo apt-get install stow
  
  # Red Hats
  sudo dnf install stow
  ```
3. Link dir of settings to home directory. Each dir in the repo contains a set of configuration file(s) for a given program. Run `stow` on the dir that you want to link into your $HOME dir, thus "installing" them.
  `stow <dir>`
4. All done. `ls -la $HOME` to see for yourself. 
