{
  pkgs,
  self,
  user,
  system,
  ...
}:

{
  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  # avoid conflicts with Determinate-Nix
  nix.enable = false;

  users.users.ryu.home = "/Users/${user}";

  programs.zsh.enable = true;

  imports = [
    ./nixpkgs.nix
    ./homebrew.nix
    ./home_manager.nix
  ];
}
