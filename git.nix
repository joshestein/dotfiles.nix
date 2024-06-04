{
  programs.git = {
    enable = true;
    userName = "Josh";
    userEmail = "josh.e.stein@gmail.com";
    ignores = [ "*~" ".DS_Store" ".direnv" ".venv" ];
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = { ff = "only"; };
    };
    aliases = {
      diff = "diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'";
      last = "log -1 HEAD";
      unstage = "reset HEAD --";
    };
  };
}
