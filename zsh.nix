{
  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ./.zshrc;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };
  };
}
