# Links the stow-style package directories into $HOME as editable symlinks.
#
# Each package dir mirrors $HOME (`zsh/.zshrc` -> `~/.zshrc`). Files link
# one by one, so the repo copy is what you edit and changes apply without a
# rebuild. Adding a new file to a package needs `git add` and a switch.
{ config, lib, ... }:
let
  cfg = config.dotfiles;
  repo = ../..;
  dotfilesDir = "${config.home.homeDirectory}/.dotfiles";

  # Gitignored directories that hold plugins or runtime state. They aren't in
  # git, so the flake can't see their files, and they're linked whole instead.
  linkedDirs = [
    "opencode/.config/opencode"
    "pi/.pi/agent"
    "tmux/.config/tmux-bootstrap"
    "vim/.vim/plugged"
    "wrk/.config/workspace/spaces"
  ];

  isLinkedDir = rel: builtins.elem rel linkedDirs;

  # Tracked files under a package directory. Stops at linked directories.
  listFiles = rel:
    lib.concatLists (lib.mapAttrsToList (name: type:
      let child = "${rel}/${name}";
      in if type == "directory" && !isLinkedDir child
         then listFiles child
         else [ child ]
    ) (builtins.readDir (repo + "/${rel}")));

  # "zsh/.zshrc" -> ".zshrc"
  targetOf = rel: lib.concatStringsSep "/" (lib.tail (lib.splitString "/" rel));

  linkOf = rel: lib.nameValuePair (targetOf rel) {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDir}/${rel}";
  };

  inPackages = rel:
    builtins.elem (builtins.head (lib.splitString "/" rel)) cfg.packages;
in {
  options.dotfiles.packages = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "Package directories in the repo to link into $HOME.";
  };

  config = {
    dotfiles.packages = [
      "aerc"
      "curl"
      "devenv"
      "git"
      "nvim"
      "opencode"
      "pi"
      "pre-commit"
      "prettier"
      "shell"
      "starship"
      "tmux"
      "vim"
      "wezterm"
      "wrk"
      "zsh"
    ];

    home.file = builtins.listToAttrs (map linkOf (lib.unique (
      lib.concatMap listFiles cfg.packages
      ++ lib.filter inPackages linkedDirs
    )));
  };
}
