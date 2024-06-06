{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "appcleaner"
      "obsidian"
      "raycast"
      "spotify"
      "vscode"
    ];
}
