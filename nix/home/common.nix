# Shared home-manager config for every machine (macOS and Linux).
{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  # Flakes are off by default on a plain Nix install. This turns them on for
  # the nix CLI on every machine, so `home-manager switch --flake` works.
  xdg.configFile."nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';

  dotfiles.homePackages = with pkgs; [
    # Editors
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
    awscli2

    # Core CLI
    bat
    fd
    ripgrep
    jq
    tree
    htop
    rclone
    yt-dlp
    ffmpeg
    exiftool

    # k8s


    podman
    lazydocker
    kubectx
    kubectl
    kubernetes-helm
    argocd

    # Development
    go-task
    devenv
    devbox
    lazygit

    # AI tools
    opencode
    pi-coding-agent
    python3Packages.huggingface-hub
    (llm.withPlugins { llm-openrouter = true; })

    # Terminal apps (tmux-bootstrap sessions)
    weechat
    profanity
    aerc
    newsboat
    rmpc
    k9s
  ];
}
