{ self, config, pkgs, ... }: {
  users.users.joshstein = {
    name = "joshstein";
    home = "/Users/joshstein/";
    isHidden = false;
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.configurationRevision = self.rev or self.dirtyRev or null;

  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    enable = true;

    casks = [
      "emacs-app-monthly"
      "firefox"
      "keycastr"
      "vlc"
    ];
    taps = [
      "jimeh/emacs-builds"
    ];
  };
}

