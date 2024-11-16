{ lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "appcleaner"
      "jetbrains-toolbox"
      "obsidian"
      "raycast"
      "spotify"
      "vscode"
    ];
}
