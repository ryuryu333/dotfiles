{
  self,
  user,
  home,
  hostPlatform,
  ...
}:
{
  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    primaryUser = user;
  };

  nix.enable = false;

  users.users.${user}.home = home;

  programs.zsh.enable = true;
}
