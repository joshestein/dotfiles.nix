{ pkgs, ... }: {
  home.packages = [
    pkgs.ffmpeg
    pkgs.jq
    pkgs.lf
    pkgs.ripgrep
    pkgs.volta
  ];
}
