{
  description = "Dotfiles configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-versions.url = "github:vic/nix-versions";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      home-manager,
      nix-darwin,
      nix-homebrew,
      nix-versions,
    }:
    let
      supportSystems = with flake-utils.lib.system; [
        x86_64-linux
        aarch64-darwin
      ];
      my_pc =
        let
          pc_info = {
            # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
            wsl = {
              hostPlatform = "x86_64-linux";
              user = "ryu";
              hostname = "main";
            };
            # MacBook Pro M1
            mac = {
              hostPlatform = "aarch64-darwin";
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
            pkgs = nixpkgs.legacyPackages.${pc.hostPlatform};
          }
        ) pc_info;
    in
    {
      homeConfigurations = {
        # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
        "${my_pc.wsl.fullname}" = home-manager.lib.homeManagerConfiguration {
          inherit (my_pc.wsl) pkgs;
          extraSpecialArgs = {
            inherit (my_pc.wsl) user;
            inherit nix-versions;
          };
          modules = [
            ./home-manager
            ./home-manager/wsl
          ];
        };
      };

      darwinConfigurations = {
        # MacBook Pro M1
        "${my_pc.mac.hostname}" = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit self nix-versions;
            inherit (my_pc.mac) user hostPlatform;
          };
          modules = [
            ./nix-darwin/MacBookProM1
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
          ];
        };
      };

      checks = {
        x86_64-linux.wsl = self.homeConfigurations."ryu@main".activationPackage;

        aarch64-darwin.mac = self.darwinConfigurations.MacBook.system;
      };
    }
    // flake-utils.lib.eachSystem supportSystems (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = pkgs.nixfmt-tree;
      }
    );
}
