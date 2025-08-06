{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    git
    bash
    direnv
    nix-direnv
  ];

  home.file = {
    ".gitconfig".source = ./.gitconfig;
    ".bashrc".source = ./.bashrc;
    ".profile".source = ./.profile;
  };

  programs.home-manager.enable = true;
}
