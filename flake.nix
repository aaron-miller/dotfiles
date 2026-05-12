{
  description = "Aaron's dotfiles: packages I always want installed.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Packages I always want available, regardless of OS.
        commonPackages = with pkgs; [
          # Editors
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
          eza
          tree
          htop
          tldr
          direnv

          # Dev tooling
          gnumake
          coreutils
          gnused
          gawk
          pre-commit

          # Deployments
          kubectl
          argocd
          argo-rollouts

        ];

        # Linux-only packages (skip GUI-on-mac, etc.)
        linuxPackages = with pkgs; [ ];

        # macOS-only packages
        darwinPackages = with pkgs; [ ];

        platformPackages =
          if pkgs.stdenv.isDarwin then darwinPackages
          else if pkgs.stdenv.isLinux then linuxPackages
          else [ ];

        allPackages = commonPackages ++ platformPackages;
      in {
        packages.default = pkgs.buildEnv {
          name = "dotfiles-env";
          paths = allPackages;
        };

        # Expose the raw list too, for `nix profile install`.
        packages.dotfiles = self.packages.${system}.default;
      });
}
