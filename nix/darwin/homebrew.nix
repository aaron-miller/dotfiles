# GUI apps and CLI tools managed by Homebrew through nix-homebrew. Packages
# shared by every Mac go here; host-only packages go in nix/darwin/hosts/.
{ ... }:
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
    ];

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
    ];
  };
}
