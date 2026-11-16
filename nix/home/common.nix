# Shared home-manager config for every machine (macOS and Linux).
{ pkgs, hostName, ... }:
let
  # Put packages common to the Macs in home.packages below. Host-only packages
  # belong in the matching list here; Linux uses its separate module.
  hostPackages = {
    proteus = with pkgs; [ ];
    scout = with pkgs; [ ];
    linux = with pkgs; [ ];
  };
in
{
  home.packages = (with pkgs; [
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
  ]) ++ hostPackages.${hostName};
}
