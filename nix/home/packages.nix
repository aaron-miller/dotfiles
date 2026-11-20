# Home packages for every machine. Modules add to dotfiles.homePackages; a
# host drops packages by name with dotfiles.excludeHomePackages.
{ config, lib, ... }:
let
  cfg = config.dotfiles;
  names = map lib.getName cfg.homePackages;
  unknown = lib.filter (n: !lib.elem n names) cfg.excludeHomePackages;
in {
  options.dotfiles = {
    homePackages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Packages installed into the user environment.";
    };

    excludeHomePackages = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Package names to drop from dotfiles.homePackages on this host.";
    };
  };

  config = {
    assertions = [{
      assertion = unknown == [ ];
      message = "dotfiles.excludeHomePackages has names not in dotfiles.homePackages: ${lib.concatStringsSep ", " unknown}";
    }];

    home.packages =
      lib.filter (p: !lib.elem (lib.getName p) cfg.excludeHomePackages) cfg.homePackages;
  };
}
