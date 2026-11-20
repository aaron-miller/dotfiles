# Home-manager config shared by every machine. Imported by flake.nix for each
# host, alongside its platform module and role profile.
{ primaryUser, ... }:
{
  imports = [
    ./common.nix
    ./files.nix
    ./neovim.nix
    ./packages.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
  };
}
