{ pkgs, ... }: {
  home.packages = [
    pkgs.bat
    pkgs.jq
    pkgs.lf
    pkgs.ripgrep
  ];
}
