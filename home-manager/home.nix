{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    git
    direnv
    nix-direnv
  ];

  home.file = {
    ".gitconfig".source = ./.gitconfig;
  };

  programs.home-manager.enable = true;
}
