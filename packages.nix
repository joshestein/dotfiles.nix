{ pkgs, ... }: {
  home.packages = [
    pkgs.curl
    pkgs.ffmpeg
    pkgs.jq
    pkgs.lf
    pkgs.neovim
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.ripgrep
    pkgs.rustup
    pkgs.yt-dlp-light
    pkgs.volta
  ];
}
