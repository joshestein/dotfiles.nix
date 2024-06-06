{
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
  };

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./.kitty.conf;
    shellIntegration = { enableZshIntegration = true; };
    theme = "Gruvbox Dark";
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
    initExtra = builtins.readFile ./.zshrc;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };
  };
}
