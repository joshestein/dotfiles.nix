{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Josh Stein";
    userEmail = "josh.e.stein@gmail.com";
    ignores = [ "*~" ".DS_Store" ".direnv" ".venv" ".idea" ".vscode" ];
    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = { ff = "only"; };
      push = { autoSetupRemote = "true"; };
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
    delta = { enable = true; };
    aliases = {
      diff = "diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'";
      last = "log -1 HEAD";
      unstage = "reset HEAD --";
    };
  };
}
