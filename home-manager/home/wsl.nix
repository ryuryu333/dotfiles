{ config, pkgs, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.packages = with pkgs; [
    bash
    devenv
    jq # JSONデータを操作
    tree # ディレクトリ構造を表示
    openjdk # java PlantUML 利用に必要
    graphviz # PlantUML 利用に必要
  ];

  home.file = {
    ".bashrc".source = ../bash/.bashrc;
    ".profile".source = ../bash/.profile;
  };
}
