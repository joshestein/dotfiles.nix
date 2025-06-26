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
    pkgs.mosh
    pkgs.unstable.neovim
    pkgs.nerd-fonts.atkynson-mono
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.obsidian
    pkgs.poppler # PDF preview
    pkgs.ripgrep
    pkgs.rsync
    pkgs.rustup
    pkgs.shellcheck
    pkgs.signal-desktop-bin
    pkgs.slack
    pkgs.spotify
    pkgs.typescript
    pkgs.uv
    pkgs.volta
    pkgs.vscode
    pkgs.unstable.yazi
    pkgs.yt-dlp-light
    # pkgs.zoom-us

    # pyenv dependencies
    pkgs.openssl_3_4
    pkgs.readline
    pkgs.sqlite
    pkgs.xh # HTTPie alternative
    pkgs.xz
    pkgs.zlib
    pkgs.tcl
  ] ++ lib.optionals pkgs.stdenv.isDarwin [
    # pkgs.appcleaner
      # pkgs.karabiner-elements
    pkgs.goku
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    pkgs.acpilight
    pkgs.bluez
    pkgs.bluez-tools
    pkgs.blueman
    pkgs.firefox
    pkgs.flameshot
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
