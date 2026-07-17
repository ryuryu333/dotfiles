{
  description = "Dotfiles configuration";
  
  nixConfig = {
    extra-substituters = [ "https://cache.numtide.com" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    system-manager = {
      url = "github:numtide/system-manager";
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
      system-manager,
      nix-darwin,
      nix-homebrew,
      nix-versions,
    }:
    let
      supportSystems = with flake-utils.lib.system; [
        x86_64-linux
        aarch64-darwin
      ];
      my_pc = {
        # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
        wsl = {
          hostPlatform = "x86_64-linux";
          user = "ryu";
          hostname = "main";
          home = "/home/ryu";
        };
        # MacBook Pro M1
        mac = {
          hostPlatform = "aarch64-darwin";
          user = "ryu";
          hostname = "MacBook"; # home-manger 単独の時：MacBook.local
          # todo home = 
        };
      };
    in
    {
      systemConfigs.default = system-manager.lib.makeSystemConfig {
        specialArgs = {
          inherit (my_pc.wsl) user hostPlatform home;
          inherit nix-versions;
        };
        modules = [
          ./system-manager
          home-manager.nixosModules.home-manager
        ];
      };

      homeConfigurations = {
        # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
        "${my_pc.wsl.user}@${my_pc.wsl.hostname}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${my_pc.wsl.hostPlatform};
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

      apps.x86_64-linux.system_manager =
        let
          sm_pkg = system-manager.packages.x86_64-linux.default;
          sm_bin = nixpkgs.lib.getExe' sm_pkg "system-manager";
        in
        {
          type = "app";
          program = sm_bin;
        };

      checks = import ./flake/checks.nix { inherit self; };
    }
    // import ./flake/formatter.nix {
      inherit nixpkgs flake-utils supportSystems;
    };
}
