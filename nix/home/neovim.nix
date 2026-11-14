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
      # Runtimes
      nodejs
      go
      python3

      # Go
      # gopls
      # golangci-lint
      # gotools
      # gofumpt

      # TypeScript and JavaScript
      # vtsls
      # prettier
      # eslint

      # Python
      # pyright
      # ruff

      # Lua
      # lua-language-server
      # stylua

      # Data and config formats
      # vscode-langservers-extracted
      # yaml-language-server
      # taplo
      # sqls

      # Infra
      # terraform-ls
      # tflint
      # helm-ls
      # docker-language-server
      #
      # Docs
      # marksman

      # Nix
      # nil
    ];
  };
}
