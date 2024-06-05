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

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: {
    darwinConfigurations."joshstein-mac" = nix-darwin.lib.darwinSystem {
      modules = [
        # The platform the configuration will be used on.
        { nixpkgs.hostPlatform = "aarch64-darwin"; }

        ./darwin.nix 
        ./unfree.nix

        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
# home-manager.useUserPackages = true; # this BREAKS EVERYTHING SO SAD WHY
          home-manager.users.joshstein = import ./home.nix;
        }
      ];
      specialArgs = { inherit self; };
    };

    # Expose the package set, including overlays, for convenience.
# darwinPackages = self.darwinConfigurations."joshstein-mac".pkgs;
  };
}
