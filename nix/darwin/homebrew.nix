# GUI apps and CLI tools managed by Homebrew through nix-homebrew.
{ hostName, ... }:
let
  # Put formulae and casks shared by the Macs in the lists below. Host-only
  # Homebrew packages belong in the matching list here.
  hostHomebrew = {
    proteus = {
      brews = [ ];
      casks = [
        "calibre"
        "discord"
        "transmit"
        "sublime-text"
        "steam"
      ];
    };
    work = {
      brews = [
        "aqua"
        "crossplane"
        "jira-cli"
        "kargo"
        "upbound/tap/up"
      ];
      casks = [
      ];
    };
  };
  hostHomebrewPackages = hostHomebrew.${hostName};
in
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      upgrade = false;
      # "uninstall" fails here: the switch runs brew cleanup as root, which
      # can't load the tap. Clean up by hand with `brew bundle cleanup --force`.
      cleanup = "none";
    };

    # CLI tools intentionally managed by Homebrew.
    brews = [
      "telnet"
    ] ++ hostHomebrewPackages.brews;

    taps = [
      "nikitabobko/tap"
      "upbound/tap"
    ];

    casks = [
      "1password"
      "aerospace"
      "dbeaver-community"
      "dotnet-sdk"
      "firefox"
      "firefox@developer-edition"
      "font-hack-nerd-font"
      "font-inconsolata-go-nerd-font"
      "google-chrome"
      "obsidian"
      "sanesidebuttons"
      "smcfancontrol"
      "unnaturalscrollwheels"
      "vlc"
      "wezterm"
    ] ++ hostHomebrewPackages.casks;
  };
}
