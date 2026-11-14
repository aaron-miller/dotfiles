# Shared home-manager config for every machine (macOS and Linux).
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Editors
    neovim
    vim

    # Shell and prompt
    starship
    tmux
    tmuxp
    fzf
    zsh-syntax-highlighting

    # Git and network
    git
    git-lfs
    gh
    curl
    wget
    msmtp

    # Core CLI
    bat
    fd
    ripgrep
    jq
    yq-go
    dasel
    yj
    tree
    htop
    hyperfine
    pass
    w3m
    newsboat
    aerc
    himalaya
    rclone
    yt-dlp
    ffmpeg
    exiftool
    hugo
    lychee

    # Kubernetes and containers
    kubectl
    kubectx
    kubernetes-helm
    argocd
    k9s
    operator-sdk
    doctl
    podman
    lazydocker
    lazygit

    # Development
    gnumake
    cmake
    go-task
    pre-commit
    rustup
    uv
    typescript
    renovate
    html-tidy

    # AI tools
    opencode
    ollama
    llm
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # zsh/.zshrc already runs `direnv hook zsh`.
    enableZshIntegration = false;
  };
}
