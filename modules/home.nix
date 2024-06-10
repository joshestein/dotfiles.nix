{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.stateVersion = "24.05";

  home.shellAliases = {
      cat = "bat";
      hg = "history | grep";
      gcmsg = "git commit -m";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gco = "git checkout";
      gpu = "git pull";
      l = "eza --long --all --git --hyperlink";
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
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.config/emacs" # doom
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
    # TODO: fix these colours not working
    LESS_TERMCAP_mb = "\E[1;32m";
    LESS_TERMCAP_md = "\E[1;32m";
    LESS_TERMCAP_me = "\E[0m";
    LESS_TERMCAP_se = "\E[0m";
    LESS_TERMCAP_so = "\E[01;47;34m";
    LESS_TERMCAP_ue = "\E[0m";
    LESS_TERMCAP_us = "\E[1;36m";

    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  xdg.configFile."nvim".source = ../nvim;

  imports = [ ./fd.nix ./git.nix ./packages.nix ./programs.nix ];
}

