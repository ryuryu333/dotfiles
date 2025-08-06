{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.git
  ];

  home.file = {
    ".gitconfig".source = ./.gitconfig;
  };

  programs.home-manager.enable = true;
}
