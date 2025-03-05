{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "appcleaner"
      "google-chrome"
      "jetbrains-toolbox"
      "obsidian"
      "raycast"
      "signal-desktop"
      "slack"
      "spotify"
      "vscode"
      "zoom"
    ];
}
