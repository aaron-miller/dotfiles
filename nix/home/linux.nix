# Linux-only home-manager config. Non-NixOS hosts keep the distro's system
# (kernel, drivers, systemd); Nix manages only the user environment.
{ pkgs, ... }:
{
  dotfiles.homePackages = with pkgs; [
    zsh
  ];
}
