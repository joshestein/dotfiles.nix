{ lib, pkgs, ... }: {
  home.packages = [
    pkgs.coreutils
    pkgs.curl
    pkgs.ffmpeg
    pkgs.jq
    pkgs.lf
    pkgs.neovim
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.obsidian
    pkgs.spotify
    pkgs.ripgrep
    pkgs.rustup
    pkgs.yt-dlp-light
    pkgs.vscode
    pkgs.volta
  ];
}
