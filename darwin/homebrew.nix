# GUI apps and the few formulae nixpkgs doesn't provide. Homebrew is installed
# and managed by nix-homebrew (see darwin/default.nix).
{ inputs, primaryUser, ... }:
{
  home-manager.users.${primaryUser}.home.file.".zfunc/_brew".source =
    "${inputs.brew-src}/completions/zsh/_brew";

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # Set to "zap" once this list matches what's installed, to remove
      # anything installed by hand.
      cleanup = "none";
    };

    # Formulae from third-party taps, which nixpkgs doesn't provide.
    brews = [
      "pi-coding-agent"
      "hermes-agent"
      "hf"
      "antoniorodr/memo/memo"
      "nano-collective/nanocoder/nanocoder"
      "omlahore/tap/removemacai"
      "steipete/tap/remindctl"
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
      "ghostty"
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
