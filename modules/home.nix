{ config, lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.stateVersion = "24.05";

  home.shellAliases = {
      cat = "lscat";
      hg = "history | grep";
      gcmsg = "git commit -m";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gco = "git checkout";
      gpu = "git pull";
      l = "lscat";
      ll = "eza --long --git --hyperlink";
      lt = "eza --tree --hyperlink";
      md = "mkcdir";
      nb = "npm run build";
      ni = "npm install";
      ns = "npm start";
      p = "python";
      s = "kitten ssh";
      sv = "sudoedit";
      yt = "yt-dlp";
      v = "nvim";
      venv = "python -m venv .venv && source .venv/bin/activate";

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
    "$HOME/.config/emacs" # doom
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

  xdg.configFile."nvim".source = ../nvim;
  xdg.configFile."aerospace/aerospace.toml" = (lib.mkIf pkgs.stdenv.isDarwin {
    source = ../config/aerospace.toml;
  });
  xdg.configFile."borders/bordersrc" = (lib.mkIf pkgs.stdenv.isDarwin {
    source = ../config/bordersrc;
  });
  xdg.configFile."karabiner/karabiner.edn" = (lib.mkIf pkgs.stdenv.isDarwin {
    source = ../config/karabiner.edn;
  });

  imports = [ ./fd.nix ./git.nix ./packages.nix ./programs.nix ];
}

