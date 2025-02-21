{ config, lib, pkgs, username, homeDirectory, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.stateVersion = "24.11";

  home.shellAliases = {
      cat = "lscat";
      hg = "history | grep";
      l = "lscat";
      ll = "eza --long --git --hyperlink";
      lt = "eza --tree --hyperlink";
      md = "mkcdir";
      nb = "npm run build";
      ni = "npm install";
      ns = "npm start";
      s = "kitten ssh";
      sv = "sudoedit";
      yt = "yt-dlp";
      v = "nvim";

      # Python stuff
      activate = "source .venv/bin/activate";
      p = "python";
      pip = "uv pip";
      venv = "uv venv && source .venv/bin/activate";

      # git
      g = "git";
      ga = "git add";
      gaa = "git add all";
      gcmsg = "git commit -m";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gco = "git checkout";
      gf = "git fetch";
      gp = "git push";
      gpu = "git pull";
      gst = "git status";
      glog = "git log --oneline --decorate --graph";
      gloga = "git log --oneline --decorate --graph --all";

      bc = "bc -ql";
      cp = "cp -iv";
      df = "df -h";
      free = "free -h";
      grep = "grep --color=auto";
      mv = "mv -iv";
      rm = "rm -iv";

      "..." = "../..";
      "...." = "../../..";
      "....." = "../../../..";
  } // lib.optionalAttrs pkgs.stdenv.isLinux {
      pbcopy = "xclip -selection clipboard";
      pbpaste = "xclip -selection clipboard -o";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/share/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin/"
    "$HOME/.local/share/JetBrains/Toolbox/apps/pycharm-professional/bin/"
    "$HOME/.local/share/JetBrains/Toolbox/apps/webstorm/bin/"
    "$HOME/.local/share/nvim/mason/bin/" # All the LSPs live here
    "$HOME/.config/emacs/bin" # doom
    "$HOME/.volta/bin"
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    "$HOME/Applications/flameshot.app/Contents/MacOS"
  ];

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CACHE_HOME = "$HOME/.cache";

    EDITOR = "nvim";
    VISUAL = "nvim";

    PAGER = "less";
    LESS = "-R";
    LESS_ADVANCED_PREPROCESSOR = "yes";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";

    MANPAGER="sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT="-c";
  } // lib.optionalAttrs pkgs.stdenv.isDarwin {
    GOKU_EDN_CONFIG_FILE = "$HOME/.config/karabiner/karabiner.edn";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  xdg.configFile = 
    let
      shared = [
        "doom"
        "ideavim"
        "kitty"
        "nvim"
        "shell"
        "yazi"
      ];

      darwin = [
        "aerospace"
        "karabiner"
      ];

      linux = [
        "i3"
        "i3status"
        "kmonad"
        "redshift"
        "zathura"
      ];

      mkFileSet = files: 
        lib.attrsets.listToAttrs (map
          (name: {
            inherit name;
            value = {
              source = ../config/${name};
              recursive = true;
            };
          })
          files);

    in
      mkFileSet shared //
      (lib.optionalAttrs pkgs.stdenv.isDarwin (mkFileSet darwin)) //
      (lib.optionalAttrs pkgs.stdenv.isLinux (mkFileSet linux));

  imports = [ ./fd.nix ./git.nix ./packages.nix ./programs.nix ];
}

