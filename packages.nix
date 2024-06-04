{ pkgs, ... }: {
  home.packages = [
    pkgs.ffmpeg
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.jq
    pkgs.lf
    pkgs.neovim
    pkgs.ripgrep
    pkgs.volta
  ];
}
