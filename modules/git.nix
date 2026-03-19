{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    ignores = [ "*~" ".DS_Store" ".direnv" ".venv" ".idea" ".vscode" "**/.claude/settings.local.json" "**/CLAUDE.local.md" ];
    settings = {
      aliases = {
        diff = "diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
      init = { defaultBranch = "main"; };
      pull = { ff = "only"; };
      push = { autoSetupRemote = "true"; };
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
    user = {
      name = "Josh Stein";
      email = "josh.e.stein@gmail.com";
    };
  };
}
