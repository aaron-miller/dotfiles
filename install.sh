#!/usr/bin/env bash
# Dotfiles installer for devpod / devcontainer environments (Linux only).
#
#   1. Install Nix (single-user, daemonless — works in any container).
#   2. Install all packages from this repo's flake into the user profile
#      (neovim, stow, git, tmux, etc.).
#   3. Use GNU stow to symlink config directories into $HOME.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Packages to stow (directories in this repo).
PACKAGES=(
  curl
  git
  nvim
  pre-commit
  starship
  tmux
  vim
  zsh
)

log() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$*" >&2; }
err() { printf '\033[1;31mxx\033[0m %s\n' "$*" >&2; }

# Source Nix into the current shell if it's installed but not on PATH yet.
load_nix_env() {
  if command -v nix >/dev/null 2>&1; then
    return 0
  fi
  if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    # shellcheck disable=SC1091
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
}

ensure_nix() {
  load_nix_env
  if command -v nix >/dev/null 2>&1; then
    log "Nix already installed ($(nix --version))"
    return 0
  fi

  log "Installing Nix (single-user, daemonless)..."
  # Single-user installer works in any Linux container: it puts /nix under
  # the current user's ownership and doesn't need systemd or root.
  curl --proto '=https' --tlsv1.2 -sSf -L https://nixos.org/nix/install |
    sh -s -- --no-daemon

  load_nix_env

  if ! command -v nix >/dev/null 2>&1; then
    err "Nix install completed but 'nix' is still not on PATH."
    exit 1
  fi
}

install_flake_packages() {
  log "Installing packages from flake into user profile..."
  # Enable flakes for this invocation regardless of user nix.conf.
  export NIX_CONFIG="${NIX_CONFIG:-}
experimental-features = nix-command flakes"

  # Re-running should upgrade in place rather than error on duplicate install.
  if nix profile list 2>/dev/null | grep -q 'dotfiles-env'; then
    log "Upgrading existing dotfiles profile entry..."
    nix profile upgrade --all || true
  else
    nix profile install "$DOTFILES_DIR#default"
  fi
}

# Back up any existing real files/dirs in $HOME that would conflict with
# the given stow package, so that `stow` can create its symlinks cleanly.
backup_conflicts() {
  local pkg="$1"
  local backup_dir="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

  local stow_output conflicts
  stow_output=$(stow --no --verbose=2 --target="$HOME" --restow "$pkg" 2>&1 || true)
  conflicts=$(printf '%s\n' "$stow_output" |
    awk '/cannot stow .* over existing target/ {
              for (i=1;i<=NF;i++) if ($i=="target") { print $(i+1); break }
          }' |
    sed 's/[[:space:]]*since.*$//' |
    sort -u || true)

  [ -z "$conflicts" ] && return 0

  mkdir -p "$backup_dir"
  while IFS= read -r rel; do
    [ -z "$rel" ] && continue
    local src="$HOME/$rel"
    if [ -e "$src" ] && [ ! -L "$src" ]; then
      warn "Backing up existing $src -> $backup_dir/$rel"
      mkdir -p "$(dirname "$backup_dir/$rel")"
      mv "$src" "$backup_dir/$rel"
    fi
  done <<<"$conflicts"
}

stow_packages() {
  cd "$DOTFILES_DIR"
  for pkg in "${PACKAGES[@]}"; do
    if [ ! -d "$pkg" ]; then
      warn "Skipping '$pkg' (directory not found)"
      continue
    fi
    log "Stowing $pkg -> $HOME"
    backup_conflicts "$pkg"
    stow --restow --target="$HOME" "$pkg"
  done
}

main() {
  ensure_nix
  install_flake_packages
  stow_packages
  log "All done."
}

main "$@"
