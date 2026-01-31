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
    let
      my_pc =
        let
          pc_info = {
            # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
            wsl = {
              system = "x86_64-linux";
              user = "ryu";
              hostname = "main";
            };
            # MacBook Pro M1
            mac = {
              system = "aarch64-darwin";
              user = "ryu";
              hostname = "MacBook"; # home-manger 単独の時：MacBook.local
            };
          };
        in
        builtins.mapAttrs (
          name: pc:
          pc
          // {
            fullname = "${pc.user}@${pc.hostname}";
            pkgs = nixpkgs.legacyPackages.${pc.system};
          }
        ) pc_info;
    in
    {
      homeConfigurations = {
        # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
        ${my_pc.wsl.fullname} = home-manager.lib.homeManagerConfiguration {
          inherit (my_pc.wsl) pkgs;
          modules = [
            ./home-manager/home/common.nix
            ./home-manager/home/wsl.nix
          ];
        };
      };

      darwinConfigurations = {
        # MacBook Pro M1
        ${my_pc.mac.hostname} = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit self;
            inherit (my_pc.mac) user system;
          };
          modules = [
            ./nix-darwin/MacBookProM1/configuration.nix
            home-manager.darwinModules.home-manager
          ];
        };
      };
    };
}
