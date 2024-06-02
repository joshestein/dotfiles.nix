{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "joshstein";
  home.homeDirectory = "/Users/joshstein/";

  home.stateVersion = "24.05";

  home.shellAliases = {
      cat = "bat";
      hg = "history | grep";
      gcmsg = "git commit -m";
      gcm = "git commit -m";
      gca = "git commit --amend";
      gco = "git checkout";
      gpu = "git pull";
      l = "eza --long --all --git";
      ll = "eza --long --git";
      lt = "eza --tree";
      md = "mkcdir";
      nb = "npm run build";
      ni = "npm install";
      ns = "npm start";
      p = "python";
      sv = "sudoedit";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [ ./git.nix ./packages.nix ./programs.nix ];
}

