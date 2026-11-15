# GUI apps and the few formulae nixpkgs doesn't provide. Homebrew is installed
# and managed by nix-homebrew (see nix/darwin/default.nix).
{ inputs, primaryUser, ... }:
{
  home-manager.users.${primaryUser}.home.file.".zfunc/_brew".source =
    "${inputs.brew-src}/completions/zsh/_brew";

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # "uninstall" fails here: the switch runs brew cleanup as root, which
      # can't load the tap. Clean up by hand with `brew bundle cleanup --force`.
      cleanup = "none";
    };

    # Formulae from third-party taps, which nixpkgs doesn't provide.
    brews = [
      # Not installed system-wide on macOS.
      "telnet"
    ];

    taps = [
      "nikitabobko/tap"
    ];

    casks = [
      "1password"
      "aerospace"
      "calibre"
      "dbeaver-community"
      "discord"
      "dotnet-sdk"
      "firefox"
      "firefox@developer-edition"
      "font-hack-nerd-font"
      "font-inconsolata-go-nerd-font"
      "google-chrome"
      "mullvad-vpn"
      "obsidian"
      "sanesidebuttons"
      "slack"
      "smcfancontrol"
      "steam"
      "sublime-text"
      "transmit"
      "unnaturalscrollwheels"
      "vlc"
      "wezterm"
    ];
  };
}
