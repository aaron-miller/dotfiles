# Shared home-manager config for every machine (macOS and Linux).
{ pkgs, ... }:
{
  home.packages = with pkgs; [
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

    podman
    lazydocker
    lazygit

    # Development
    go-task
    devenv

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
