{
  description = "Aaron's dotfiles: packages installed inside Linux devcontainers.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    # Only Linux devcontainers are supported.
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = import nixpkgs { inherit system; };

        packages = with pkgs; [
          # Editors
          vim
          neovim

          # Shell & prompt
          zsh
          starship
          tmux

          # Dotfiles management
          stow

          # Core CLI tools
          git
          git-lfs
          gh
          curl
          wget
          jq
          yq-go
          ripgrep
          fd
          fzf
          bat
          tree
          htop
          direnv

          # Dev tooling
          gnumake
          coreutils
          gnused
          gawk
          pre-commit

          # Kubernetes
          kubectl
          kubectx
          kubernetes-helm
          argocd
        ];
      in {
        packages.default = pkgs.buildEnv {
          name = "dotfiles-env";
          paths = packages;
        };
      });
}
