{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "appcleaner"
      "google-chrome"
      "jetbrains-toolbox"
      "obsidian"
      "raycast"
      "spotify"
      "vscode"
    ];
}
