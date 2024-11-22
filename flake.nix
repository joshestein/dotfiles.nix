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

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    let
      # Systems
      darwinSystem = "aarch64-darwin";
      linuxSystem = "x86_64-linux";
      
      # Make config based on system
      mkConfig = system: rec {
        username = if system == darwinSystem then "joshstein" else "josh";
        homeDirPrefix = if system == darwinSystem then "/Users" else "/home";
        homeDirectory = "${homeDirPrefix}/${username}";
      };

      # Configs for each system
      darwinConfig = mkConfig darwinSystem;
      linuxConfig = mkConfig linuxSystem;
    in
    {
      # MacOS
      darwinConfigurations."joshstein-mac" = nix-darwin.lib.darwinSystem {
        system = darwinSystem;
        modules = [
          # The platform the configuration will be used on.
          { nixpkgs.hostPlatform = darwinSystem; }
 
          ./modules/darwin.nix 
          ./modules/unfree.nix
 
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
 # h ome-manager.useUserPackages = true; # this BREAKS EVERYTHING SO SAD WHY
            home-manager.users.${darwinConfig.username} = import ./modules/home.nix;
            home-manager.extraSpecialArgs = darwinConfig;
          }
        ];
        specialArgs = { inherit self; } // darwinConfig;
      };

      # Linux (not NixOS)
      homeConfigurations.${linuxConfig.username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${linuxSystem};
        modules = [
          ./modules/home.nix
          ./modules/unfree.nix
        ];
        extraSpecialArgs = linuxConfig;
      };
  };
}
