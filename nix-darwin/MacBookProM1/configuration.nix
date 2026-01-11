{
  pkgs,
  self,
  ...
}:

{
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  # environment.systemPackages =
  #   [ pkgs.vim
  #   ];
  # avoid conflicts with Determinate-Nix
  nix.enable = false;
}
