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
      darwinHosts = {
        proteus = {
          primaryUser = "aaron";
          system = "aarch64-darwin";
        };
        scout = {
          primaryUser = "aaron.miller";
          system = "aarch64-darwin";
        };
      };

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
      darwinConfigurations = nixpkgs.lib.mapAttrs (hostName: host:
        nix-darwin.lib.darwinSystem {
          inherit (host) system;
          specialArgs = {
            inherit inputs self hostName;
            primaryUser = host.primaryUser;
          };
          modules = [ ./nix/darwin ];
        }) darwinHosts;

      homeConfigurations = nixpkgs.lib.mapAttrs (_: host:
        home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs host.system;
          extraSpecialArgs = {
            hostName = "linux";
            primaryUser = host.username;
          };
          modules = [
            ./nix/home
            ./nix/home/linux.nix
            {
              home = {
                homeDirectory = "/home/${host.username}";
              };
            }
          ];
        }) linuxHosts;
    };
}
