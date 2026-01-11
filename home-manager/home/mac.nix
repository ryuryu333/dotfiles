{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/Users/ryu";
  home.packages = with pkgs; [
    zsh
    vscode
    discord
  ];

  home.file = {
    ".zshrc".source = ../zsh/.zshrc;
  };
}
