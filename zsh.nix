{
  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./.zshrc;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };
    shellAliases = {
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
  };
}
