{ pkgs, user, ... }:
{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  
  home.sessionVariables = {
    DOCKER_HOST = "unix:///run/user/1000/docker.sock";
  };
}
