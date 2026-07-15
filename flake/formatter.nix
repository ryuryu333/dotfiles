{
  nixpkgs,
  flake-utils,
  supportSystems,
}:
flake-utils.lib.eachSystem supportSystems (system: {
  formatter = nixpkgs.legacyPackages.${system}.nixfmt-tree;
})
