{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/Users/ryu";
  home.packages = with pkgs; [
    slack
  ];
}
