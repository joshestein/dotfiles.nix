{ pkgs, ... }: {
  home.packages = [
    pkgs.bat
    pkgs.fd
    pkgs.jq
    pkgs.lf
    pkgs.pyenv
    pkgs.rbenv
    pkgs.ripgrep
  ];
}
