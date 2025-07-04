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
    tmux = { enableShellIntegration = true; };
  };

  programs.kitty = {
    enable = false;
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

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../config/tmux/tmux.conf;
  };

  programs.zsh = {
    enable = true;
    initContent = builtins.readFile ../config/.zshrc;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };
  };
}
