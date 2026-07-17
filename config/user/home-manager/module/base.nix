{
  user,
  home,
  ...
}:
{
  programs.home-manager.enable = true;
  home.stateVersion = "26.11";
  news.display = "silent";

  home.username = user;
  home.homeDirectory = home;
  xdg.enable = true;
}
