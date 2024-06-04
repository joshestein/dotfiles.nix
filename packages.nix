{ pkgs, ... }: {
  home.packages = [
    pkgs.ffmpeg
    pkgs.jq
    pkgs.lf
    pkgs.neovim
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.ripgrep
    pkgs.yt-dlp-light
    pkgs.volta
  ];
}
