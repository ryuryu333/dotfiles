{
  pkgs,
  self,
  ...
}:

{
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (pkgs.lib.getName pkg) [
        "vscode"
        "discord"
      ];
  };

  homebrew = {
    enable = true;
    brews = [
    ];
    casks = [
        "discord"
    ];
  };

  system.primaryUser = "ryu"; # Need for using homebrew.enable
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;

  users.users.ryu.home = "/Users/ryu";

  # environment.systemPackages =
  #   [ pkgs.vim
  #   ];
  # avoid conflicts with Determinate-Nix
  nix.enable = false;
}
