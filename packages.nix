{ pkgs, ... }: {
  home.packages = [
    pkgs.bat
    pkgs.jq
  ];
}
