{
  description = "Aaron's machines: macOS (nix-darwin) and Linux (home-manager).";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Same Homebrew revision nix-homebrew builds from, for its zsh completions.
    brew-src.follows = "nix-homebrew/brew-src";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, nix-homebrew, ... }@inputs:
    let
      primaryUser = "aaron";

      # One entry per Linux machine. The key is the home-manager config name
      # (`home-manager switch --flake ~/.dotfiles#<key>`).
      linuxHosts = {
        "aaron@linux" = {
          username = "aaron";
          system = "x86_64-linux";
        };
      };

      mkPkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      darwinConfigurations.proteus = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit inputs self primaryUser; };
        modules = [ ./darwin ];
      };

      homeConfigurations = nixpkgs.lib.mapAttrs (_: host:
        home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs host.system;
          extraSpecialArgs = { primaryUser = host.username; };
          modules = [
            ./home
            ./home/linux.nix
            {
              home = {
                homeDirectory = "/home/${host.username}";
              };
            }
          ];
        }) linuxHosts;

      templates = {
        go = {
          path = ./templates/go;
          description = "Go development shell";
        };
        python = {
          path = ./templates/python;
          description = "Python development shell (uv)";
        };
        node = {
          path = ./templates/node;
          description = "Node/TypeScript development shell";
        };
        rust = {
          path = ./templates/rust;
          description = "Rust development shell";
        };
      };
    };
}
