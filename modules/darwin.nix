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

  # nix.gc is unavailable with nix.enable = false, so schedule GC by hand.
  # Runs as root, so nix-collect-garbage only prunes root/system profiles;
  # the user profile (home-manager-path) needs its generations pruned explicitly.
  launchd.daemons.nix-gc = {
    script = ''
      bin=/nix/var/nix/profiles/default/bin
      $bin/nix-env --profile ${homeDirectory}/.local/state/nix/profiles/profile --delete-generations 14d
      $bin/nix-collect-garbage --delete-older-than 14d
      $bin/nix store optimise
    '';
    serviceConfig = {
      StartCalendarInterval = [{ Weekday = 0; Hour = 3; Minute = 0; }];
      StandardErrorPath = "/var/log/nix-gc.log";
      StandardOutPath = "/var/log/nix-gc.log";
    };
  };

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
      "postgresql@17"
      "supabase/tap/supabase"
      "yqrashawn/goku/goku"
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
      "zed"
    ];
    taps = [
      # This brew is leading to gcc native compilation errors
      "jimeh/emacs-builds" # for emacs-app
      # "d12frosted/emacs-plus" # for emacs-plus
      "supabase/tap"
    ];

    extraConfig = ''
      tap "nikitabobko/tap", trusted: true
      tap "yqrashawn/goku", trusted: true
      tap "supabase/tap", trusted: true
    '';
  };
}

