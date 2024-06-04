{ lib, pkgs, ... }: {
  home.packages = [
    pkgs.coreutils
    pkgs.curl
    pkgs.ffmpeg
    pkgs.jq
    pkgs.lf
    pkgs.neovim
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.ripgrep
    pkgs.rustup
    pkgs.yt-dlp-light
    pkgs.vscode
    pkgs.volta
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
    ];
}
