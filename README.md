# dotfiles

Personal machine config, managed with Nix.

## Requirements

- Nix
- Git, with the repo at `~/.dotfiles`.

```bash
sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- \
  switch --flake ~/.dotfiles#<target>
```

Later rebuilds use `sudo darwin-rebuild switch --flake ~/.dotfiles#<target>`

## First-time setup on Linux

```bash
cd ~/.dotfiles
nix --extra-experimental-features 'nix-command flakes' run home-manager/master -- \
  switch --flake .#aaron@{HOSTNAME}
```

Later rebuilds use `home-manager switch --flake ~/.dotfiles#aaron@{HOSTNAME}`.
