{
  programs.bat = {
    enable = true;
    config.theme = "gruvbox-dark";
  };

  programs.fd = {
    enable = true;
  };

  programs.pyenv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.rbenv = {
    enable = true;
    enableZshIntegration = true;
  };
}
