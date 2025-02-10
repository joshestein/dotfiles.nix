{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
    config.theme = "gruvbox-dark";
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd --type d --hidden --follow";
    defaultCommand = "fd --hidden --follow";
    fileWidgetCommand = "fd --hidden --follow";
  };

  programs.kitty = {
    enable = true;
    shellIntegration = { enableZshIntegration = true; };
    themeFile = "gruvbox-dark";
  };

  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.rbenv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    initExtra = builtins.readFile ../config/.zshrc;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };
  };
}
