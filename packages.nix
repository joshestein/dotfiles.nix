{ pkgs, ... }: {
  home.packages = [
    pkgs.ffmpeg
    pkgs.jq
    pkgs.lf
    pkgs.neovim
    pkgs.ripgrep
    pkgs.volta
  ];
}
