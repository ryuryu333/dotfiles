{
  nixpkgs,
  flake-utils,
  supportSystems,
}:
flake-utils.lib.eachSystemMap supportSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree)
