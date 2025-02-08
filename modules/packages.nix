{ lib, pkgs, ... }: {
  home.packages = [
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.coreutils
    pkgs.curl
    pkgs.ffmpeg
    pkgs.git-credential-manager
    pkgs.glow # Markdown preview
    pkgs.go
    pkgs.google-chrome
    pkgs.imagemagick
    pkgs.jq
    pkgs.unstable.neovim
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
    pkgs.obsidian
    pkgs.poppler # PDF preview
    pkgs.shellcheck
    pkgs.signal-desktop
    pkgs.spotify
    pkgs.ripgrep
    pkgs.rustup
    pkgs.uv
    pkgs.typescript
    pkgs.yazi
    pkgs.yt-dlp-light
    pkgs.vscode
    pkgs.volta
    # pkgs.zoom-us

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
    pkgs.acpilight
    pkgs.bluez
    pkgs.bluez-tools
    pkgs.blueman
    pkgs.firefox
    pkgs.hunspell
    pkgs.hunspellDicts.en_US-large
    pkgs.hunspellDicts.en_GB-large
    pkgs.jetbrains-toolbox
    pkgs.libreoffice-qt
    pkgs.libcanberra-gtk3 # needed for some GTK things (e.g. redshift-gtk)
    pkgs.kmonad
    pkgs.mesa
    pkgs.pavucontrol
    pkgs.pulseaudioFull
    pkgs.playerctl
    pkgs.redshift
    pkgs.udiskie
    pkgs.unzip
    pkgs.vlc
    pkgs.xss-lock
    pkgs.zathura
  ];
}
