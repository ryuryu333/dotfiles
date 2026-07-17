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
      configurations = import ./config {
        inherit
          self
          nixpkgs
          home-manager
          system-manager
          nix-darwin
          nix-homebrew
          nix-versions
          ;
      };
    in
    {
      # WSL/Mac の環境構築
      inherit (configurations)
        systemConfigs
        darwinConfigurations
        checks
        apps;
    }
    // flake-utils.lib.eachSystem supportSystems (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = pkgs.nixfmt-tree;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            go-task
          ];
        };
      }
    );
}
