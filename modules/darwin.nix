{ self, config, pkgs, username, homeDirectory, ... }:

{
  users.users.${username} = {
    name = username;
    home = homeDirectory;
    isHidden = false;
    shell = pkgs.zsh;
  };

  # Nix is managed by Determinate, not nix-darwin
  nix.enable = false;

  programs.zsh.enable = true;

  # Current karabiner service is broken
  # https://github.com/LnL7/nix-darwin/issues/1041
  # services.karabiner-elements.enable = true;

  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  system.configurationRevision = self.rev or self.dirtyRev or null;

  system.primaryUser = username;

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

  security.pam.services.sudo_local.touchIdAuth = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # cleanup = "uninstall";
      # upgrade = true;
    };

    brews = [
      "gettext" # Needed for git to correctly compile
      "goku"
      "postgresql@17"
      # {
      #   name = "emacs-plus@30";
      # }
    ];

    casks = [
      "emacs-app"
      "aerospace"
      "firefox"
      "keycastr"
      "raycast"
      "vlc"
      "zed"
    ];
    taps = [
      # This brew is leading to gcc native compilation errors
      "jimeh/emacs-builds" # for emacs-app
      # "d12frosted/emacs-plus" # for emacs-plus
      "nikitabobko/tap" # for Aerospace
      "yqrashawn/goku"
    ];
  };
}

