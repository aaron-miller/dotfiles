# Home-manager config for the macOS hosts only. Imported by the standalone
# homeConfigurations in flake.nix.
{ inputs, ... }:
{
  dotfiles.packages = [ "aerospace" ];

  home.file.".zfunc/_brew".source =
    "${inputs.brew-src}/completions/zsh/_brew";
}
