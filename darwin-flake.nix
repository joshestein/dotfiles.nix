{
  description = "Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#joshstein-mac
    darwinConfigurations."joshstein-mac" = nix-darwin.lib.darwinSystem {
      modules = [ ./darwin.nix ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."joshstein-mac".pkgs;
  };
}

# CASKS (TODO):
# google-chrome, vlc, spotify, notion, slack, zoom, raycast, appcleaner, firefox
