{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "appcleaner"
      "google-chrome"
      "jetbrains-toolbox"
      "obsidian"
      "raycast"
      "signal-desktop-bin"
      "slack"
      "spotify"
      "vscode"
      "zoom"
    ];
}
