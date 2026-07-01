{ config, pkgs, lazynix, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.packages = with pkgs; [
    bash
    devenv
    jq # JSONデータを操作
    openjdk # java PlantUML 利用に必要
    graphviz # PlantUML 利用に必要
    docker
    colima # for docker
  ];

  home.file = {
    ".bashrc".source = ../bash/.bashrc;
    ".profile".source = ../bash/.profile;
  };

  # manual command
  # for colima usage (for docker)
  # sudo usermod -aG kvm $USER
  # sudo apt install uidmap
}
