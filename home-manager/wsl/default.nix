{ pkgs,
  user,
  home,
  ... }:
{
  home.username = user;
  home.homeDirectory = home;
  
  home.sessionVariables = {
    DOCKER_HOST = "unix:///run/user/1000/docker.sock";
  };
}
