{
  user,
  home,
  lib,
  ...
}:
{
  programs.home-manager.enable = true;
  home.stateVersion = "26.11";
  news.display = "silent";

  home.activation.configureBackups = lib.hm.dag.entryBefore [
    "checkLinkTargets"
  ] "export HOME_MANAGER_BACKUP_EXT=backup";

  home.username = user;
  home.homeDirectory = home;
  xdg.enable = true;
}
