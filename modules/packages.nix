{ lib, pkgs, ... }: {
  home.packages = [
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.calibre
    pkgs.coreutils
    pkgs.curl
    pkgs.fd
    pkgs.ffmpeg
    pkgs.git-credential-manager
    pkgs.go
    pkgs.jetbrains-toolbox
    pkgs.jq
    pkgs.neovim
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.obsidian
    pkgs.spotify
    pkgs.ripgrep
    pkgs.ruff
    pkgs.rustup
    pkgs.uv
    pkgs.yazi
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
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    pkgs.firefox
    pkgs.hunspell
    pkgs.hunspellDicts.en_US-large
    pkgs.hunspellDicts.en_GB-large
    pkgs.libreoffice-qt
    pkgs.libcanberra-gtk3 # needed for some GTK things (e.g. redshift-gtk)
    pkgs.kmonad
    pkgs.mesa
    pkgs.redshift
    pkgs.udiskie
    pkgs.unzip
    pkgs.vlc
    pkgs.zathura
  ];
}
