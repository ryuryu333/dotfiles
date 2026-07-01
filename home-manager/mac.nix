{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/Users/ryu";
  home.packages = with pkgs; [
    zsh
    slack
  ];

  home.file = {
    ".zshrc".source = ../app-config/zsh/.zshrc;
    ".zprofile".source = ../app-config/zsh/.zprofile;
  };
}
