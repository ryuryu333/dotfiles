{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    git
    direnv
    nix-direnv
  ];

  home.file = {
    ".gitconfig".source = ../git/.gitconfig;
  };
}
