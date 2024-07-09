{ lib, pkgs, ... }: {
  home.packages = [
    pkgs.coreutils
    pkgs.curl
    pkgs.ffmpeg
    pkgs.go
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

    # LSP stuff
    # It is possible to install these manually, or with Mason, but having them here is easiest
    pkgs.black
    pkgs.isort
    pkgs.prettierd
    pkgs.typescript

    # pyenv dependencies
    pkgs.openssl_3_3
    pkgs.readline
    pkgs.sqlite
    pkgs.xz
    pkgs.zlib
    pkgs.tcl
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    pkgs.appcleaner
    pkgs.karabiner-elements
    pkgs.goku
  ];
}
