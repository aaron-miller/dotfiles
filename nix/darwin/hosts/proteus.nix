# nix-darwin overrides for proteus (personal Mac), layered onto nix/darwin/.
{ ... }:
{
  homebrew.casks = [
    "calibre"
    "discord"
    "transmit"
    "sublime-text"
    "steam"
  ];
}
