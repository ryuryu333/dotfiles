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
        # MacBook Pro M1
        "ryu@MacBook.local" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [
            ./home-manager/home/common.nix
            ./home-manager/home/mac.nix
          ];
        };
      };
    };
}
