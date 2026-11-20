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
      inherit (nixpkgs) lib;

      # One entry per machine. The key is the hostname, which is also the
      # name of its file in nix/hosts/. `role` picks a profile from
      # nix/home/profiles/ and is optional.
      hosts = {
        proteus = {
          system = "aarch64-darwin";
          user = "aaron";
        };
        work = {
          system = "aarch64-darwin";
          user = "aaron.miller";
        };
        neptune = {
          system = "x86_64-linux";
          user = "aaron";
          role = "desktop";
        };
        thinkpad = {
          system = "x86_64-linux";
          user = "aaron";
          role = "desktop";
        };
        ubuntu = {
          system = "x86_64-linux";
          user = "aaron";
          role = "headless";
        };
      };

      isDarwin = host: lib.hasSuffix "-darwin" host.system;

      mkPkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkHome = name: host: home-manager.lib.homeManagerConfiguration {
        pkgs = mkPkgs host.system;
        extraSpecialArgs = {
          inherit inputs;
          hostName = name;
          primaryUser = host.user;
        };
        modules = [
          ./nix/home
          (if isDarwin host then ./nix/home/darwin.nix else ./nix/home/linux.nix)
          (./nix/hosts + "/${name}.nix")
          {
            home.homeDirectory =
              if isDarwin host then "/Users/${host.user}" else "/home/${host.user}";
          }
        ] ++ lib.optional (host ? role) (./nix/home/profiles + "/${host.role}.nix");
      };
    in {
      darwinConfigurations = lib.mapAttrs (name: host:
        nix-darwin.lib.darwinSystem {
          inherit (host) system;
          specialArgs = {
            inherit inputs self;
            hostName = name;
            primaryUser = host.user;
          };
          modules = [ ./nix/darwin ];
        }) (lib.filterAttrs (_: isDarwin) hosts);

      # Keyed as user@host, e.g. `home-manager switch --flake ~/.dotfiles#aaron@neptune`.
      homeConfigurations = lib.mapAttrs' (name: host:
        lib.nameValuePair "${host.user}@${name}" (mkHome name host)) hosts;
    };
}
