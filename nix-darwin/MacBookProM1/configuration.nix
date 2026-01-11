{
  pkgs,
  ...
}:

{
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  environment.etc."nix-darwin/flake.nix".source = ./flake.nix;
}
