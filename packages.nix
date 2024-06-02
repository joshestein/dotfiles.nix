{ pkgs, ... }: {
  home.packages = [
    pkgs.jq
    pkgs.lf
    pkgs.ripgrep
    pkgs.volta
  ];
}
