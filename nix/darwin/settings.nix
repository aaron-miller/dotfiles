# macOS system defaults and preferences. Changes apply on switch; some need a
# logout or restart to take effect.
{ self, primaryUser, ... }:
{
  # Touch ID for sudo.
  security.pam.services.sudo_local.touchIdAuth = true;

  power.sleep = {
    computer = 1;
    display = 10;
    harddisk = 10;
    allowSleepByPowerButton = true;
  };

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;

    startup.chime = false;

    defaults = {
      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };

      dock = {
        autohide = true;
        tilesize = 46;
        show-recents = false;
        mru-spaces = false;
        minimize-to-application = false;
        mineffect = "scale";
        expose-group-apps = true;
        wvous-br-corner = 14; # bottom-right hot corner: Quick Note

        persistent-apps = [
          "/Applications/Safari.app"
          "/Applications/Firefox.app"
          "/Applications/Ghostty.app"
          "/System/Applications/Messages.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Calendar.app"
          "/System/Applications/Notes.app"
          "/Applications/Obsidian.app"
          "/System/Applications/Reminders.app"
        ];

        persistent-others = [
          { folder = { path = "/Applications"; displayas = "folder"; }; }
          { folder = { path = "/Users/${primaryUser}/Documents"; displayas = "folder"; showas = "list"; }; }
          { folder = { path = "/Users/${primaryUser}/Downloads"; displayas = "folder"; arrangement = "date-added"; showas = "fan"; }; }
        ];
      };

      finder = {
        AppleShowAllExtensions = true; # file extensions
        _FXShowPosixPathInTitle = true; # title bar full path
        ShowPathbar = true; # breadcrumb nav at bottom
        ShowStatusBar = true; # file count & disk space
        FXPreferredViewStyle = "Nlsv"; # list view
        FXDefaultSearchScope = "SCev"; # search this Mac
        NewWindowTarget = "Home";
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleIconAppearanceTheme = "RegularDark";
        AppleShowScrollBars = "Always";
        AppleScrollerPagingBehavior = true; # jump to the clicked spot
        AppleSpacesSwitchOnActivate = true;
        NSWindowShouldDragOnGesture = true;
        NSTableViewDefaultSizeMode = 2; # medium sidebar icons

        KeyRepeat = 2;
        InitialKeyRepeat = 15;

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;

        "com.apple.swipescrolldirection" = true; # natural scrolling
        "com.apple.trackpad.scaling" = 1.5;
        "com.apple.trackpad.forceClick" = true;
        "com.apple.springing.enabled" = true;
        "com.apple.springing.delay" = 0.5;
      };

      CustomUserPreferences.NSGlobalDomain = {
        AppleAccentColor = 4;
        AppleActionOnDoubleClick = "Minimize";
        NSSmartReplyEnabled = false;
        WebAutomaticSpellingCorrectionEnabled = false;
        "com.apple.mouse.scaling" = 2;
      };

      menuExtraClock = {
        ShowAMPM = true;
        ShowDate = 0;
        ShowDayOfWeek = true;
      };

      screencapture = {
        target = "file";
        location = "/Users/${primaryUser}/Desktop";
      };

      spaces.spans-displays = false;
    };
  };
}
