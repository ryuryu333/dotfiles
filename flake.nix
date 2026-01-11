{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }:
    {
      homeConfigurations = {
        # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
        "ryu@main" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            ./home-manager/home/common.nix
            ./home-manager/home/wsl.nix
          ];
        };
      };

      # MacBook Pro M1
      darwinConfigurations = {
        "MacBook" = nix-darwin.lib.darwinSystem {
          specialArgs = { self = self;};
          modules = [
            ./nix-darwin/MacBookProM1/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ryu = {
                imports = [
                  ./home-manager/home/common.nix
                  ./home-manager/home/mac.nix
                ];
              };
            }
          ];
        };
      };
    };
}
