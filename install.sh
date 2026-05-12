#!/usr/bin/env bash
# This file is intended to be used by devpods' dotfiles feature.
# You could probably run this on your own Linux/macOS machine
# but that isn't the intention nor probably what you'd want
# if you are just checking out some dotfiles.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Packages to stow (directories in this repo).
PACKAGES=(
  curl
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
  # Determinate Systems / multi-user installer
  if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    # shellcheck disable=SC1091
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
  fi
  # Single-user installer
  if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    # shellcheck disable=SC1091
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
  fi
}

install_nix() {
  log "Nix not found; installing via the Determinate Systems installer..."
  if ! command -v curl >/dev/null 2>&1; then
    err "curl is required to install Nix. Please install curl and re-run."
    exit 1
  fi
  # The DS installer handles macOS and Linux, multi-user by default, and
  # enables flakes + the nix command out of the box.
  curl --proto '=https' --tlsv1.2 -sSf -L \
    https://install.determinate.systems/nix |
    sh -s -- install --no-confirm

  load_nix_env

  if ! command -v nix >/dev/null 2>&1; then
    err "Nix install completed but 'nix' is still not on PATH."
    err "Open a new shell and re-run this script."
    exit 1
  fi
}

ensure_nix() {
  load_nix_env
  if command -v nix >/dev/null 2>&1; then
    log "Nix already installed ($(nix --version))"
  else
    install_nix
  fi

  # Make sure flakes + nix-command are usable for this invocation, even if
  # the user's nix.conf doesn't enable them.
  export NIX_CONFIG="${NIX_CONFIG:-}
experimental-features = nix-command flakes"
}

install_flake_packages() {
  log "Installing packages from flake into user profile..."
  cd "$DOTFILES_DIR"

  # Use `nix profile install` with a stable name so re-running upgrades in
  # place instead of erroring on "already installed".
  if nix profile list 2>/dev/null | grep -qE '(^|[[:space:]])dotfiles([[:space:]]|$)|dotfiles-env'; then
    log "Upgrading existing dotfiles profile entry..."
    nix profile upgrade --all || true
  else
    nix profile install --impure "$DOTFILES_DIR#default"
  fi
}

ensure_stow() {
  if command -v stow >/dev/null 2>&1; then
    log "GNU stow available ($(stow --version | head -n1))"
    return 0
  fi
  err "stow not found on PATH even after installing the flake."
  err "Make sure ~/.nix-profile/bin is on your PATH and re-run."
  exit 1
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

  if [ -z "$conflicts" ]; then
    return 0
  fi

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
  ensure_stow
  stow_packages
  log "All done."
}

main "$@"
