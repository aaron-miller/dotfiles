# Shared nix-darwin config for the macOS hosts.
{ inputs, self, primaryUser, ... }:
{
  imports = [
    ./homebrew.nix
    ./settings.nix
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
    # Keeps `brew shellenv` out of /etc/zshrc. Completions come from nix/home/darwin.nix.
    enableZshIntegration = false;
  };
}
