# Desktop machines with a graphical session (Linux laptops and gaming PCs).
{ pkgs, ... }:
{
  dotfiles.homePackages = with pkgs; [
    xclip
    wl-clipboard
  ];
}
