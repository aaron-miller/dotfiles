# Neovim, wrapped so its language servers, formatters, and runtimes are on
# PATH no matter how nvim is launched (terminal, GUI, or a tool spawning it).
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    # init.lua comes from the stow-linked nvim/.config/nvim, not from here.
    sideloadInitLua = true;
    withRuby = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      nodejs
      go
      python3
      cargo
    ];
  };
}
