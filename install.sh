#!/usr/bin/env bash
# Install dotfiles via GNU stow.
# Supports Debian/Ubuntu (apt) and Alpine (apk).

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Packages to stow (directories in this repo).
PACKAGES=(
    aerospace
    curl
    git
    nvim
    pre-commit
    starship
    tmux
    vim
    wezterm
    zsh
)

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$*" >&2; }
err()  { printf '\033[1;31mxx\033[0m %s\n' "$*" >&2; }

# Run a command with sudo if available and not already root.
maybe_sudo() {
    if [ "$(id -u)" -eq 0 ]; then
        "$@"
    elif command -v sudo >/dev/null 2>&1; then
        sudo "$@"
    else
        err "Need root privileges to run: $*"
        err "Please install sudo or run this script as root."
        exit 1
    fi
}

install_stow() {
    log "GNU stow not found; attempting to install..."

    if [ -r /etc/os-release ]; then
        # shellcheck disable=SC1091
        . /etc/os-release
    else
        ID="unknown"
    fi

    case "${ID:-}${ID_LIKE:-}" in
        *debian*|*ubuntu*)
            maybe_sudo apt-get update
            maybe_sudo apt-get install -y stow
            ;;
        *alpine*)
            maybe_sudo apk add --no-cache stow
            ;;
        *)
            if command -v apt-get >/dev/null 2>&1; then
                maybe_sudo apt-get update
                maybe_sudo apt-get install -y stow
            elif command -v apk >/dev/null 2>&1; then
                maybe_sudo apk add --no-cache stow
            else
                err "Unsupported distribution. Please install GNU stow manually."
                exit 1
            fi
            ;;
    esac
}

ensure_stow() {
    if command -v stow >/dev/null 2>&1; then
        log "GNU stow already installed ($(stow --version | head -n1))"
    else
        install_stow
    fi
}

stow_packages() {
    cd "$DOTFILES_DIR"
    for pkg in "${PACKAGES[@]}"; do
        if [ ! -d "$pkg" ]; then
            warn "Skipping '$pkg' (directory not found)"
            continue
        fi
        log "Stowing $pkg -> $HOME"
        stow --restow --target="$HOME" "$pkg"
    done
}

main() {
    ensure_stow
    stow_packages
    log "All done."
}

main "$@"
