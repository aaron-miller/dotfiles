# nix-darwin config for the Mac (hostname: proteus).
{ inputs, self, primaryUser, ... }:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  system = {
    stateVersion = 6;
    primaryUser = primaryUser;
  };

  users.users.${primaryUser}.home = "/Users/${primaryUser}";

  # Homebrew's binaries, without `brew shellenv` in ~/.zprofile.
  environment.systemPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  # Installs Homebrew, or adopts an existing install at /opt/homebrew.
  nix-homebrew = {
    enable = true;
    user = primaryUser;
    autoMigrate = true;
    # Keeps `brew shellenv` out of /etc/zshrc. Completions come from home/zfunc below.
    enableZshIntegration = false;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # Existing files that block a link are moved aside as <name>.hm-backup.
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit primaryUser; };

    users.${primaryUser} = {
      imports = [ ../home ];

      dotfiles.packages = [ "aerospace" ];
    };
  };
}
