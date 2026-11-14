# Home-manager config shared by every machine. Imported by nix/darwin/default.nix
# on macOS and by flake.nix for Linux.
{ primaryUser, ... }:
{
  imports = [
    ./common.nix
    ./files.nix
  ];

  home = {
    username = primaryUser;
    stateVersion = "25.11";
  };
}
