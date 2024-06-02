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
  };
}
