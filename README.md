# dotfiles

Personal machine config, managed with Nix.

## Requirements

- Nix (multi-user install on macOS, single-user or multi-user on Linux)
- Git, with the repo at `~/.dotfiles`.

## First-time setup on macOS

```bash
sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.before-nix-darwin
```

Then run the first switch with flakes enabled for that one command:

```bash
nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- \
  switch --flake ~/.dotfiles#{HOSTNAME}
```

Later rebuilds use `darwin-rebuild switch --flake ~/.dotfiles#{HOSTNAME}`.

## First-time setup on Linux

```bash
git clone https://github.com/aaron-miller/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
nix --extra-experimental-features 'nix-command flakes' run home-manager/master -- \
  switch --flake .#aaron@{HOSTNAME}
```

Later rebuilds use `home-manager switch --flake ~/.dotfiles#aaron@{HOSTNAME}`.

To add another Linux machine, add an entry to `linuxHosts` in `flake.nix`. Use
its username and system (`x86_64-linux` or `aarch64-linux`).

## Everyday use

- Edit a config file in the repo. The link updates immediately, with no rebuild.
- Add a package: edit `home/common.nix` (both OSes) or `home/linux.nix`, then rebuild. Add a GUI app or tap formula to `darwin/homebrew.nix`.
- Add a new config file: `git add` it, then rebuild, because links are created
  per file.
- Update pinned versions: `nix flake update`, then rebuild and commit
  `flake.lock`.
- Start a project shell: `nix flake init -t ~/.dotfiles#go && direnv allow`.

## Homebrew on macOS

Homebrew is installed and managed by nix-homebrew, which adopts an existing
install at `/opt/homebrew`. Homebrew is only used for casks and the few
formulae from third-party taps listed in `darwin/homebrew.nix`.
`onActivation.cleanup` is `"none"`, so anything installed by hand is kept. Once
the lists are complete, change it to `"zap"` to remove the rest.
