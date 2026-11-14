# Linux-only home-manager config. Non-NixOS hosts keep the distro's system
# (kernel, drivers, systemd); Nix manages only the user environment.
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xclip
    wl-clipboard
  ];

  # Flakes are off by default on a plain Nix install. This file turns them on
  # for every machine, so `home-manager switch --flake` works after bootstrap.
  xdg.configFile."nix/nix.conf".text = ''
    experimental-features = nix-command flakes
  '';
}
