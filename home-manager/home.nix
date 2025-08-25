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
    jq # JSONデータを操作
    tree # ディレクトリ構造を表示
    openjdk # java PlantUML 利用に必要
    graphviz # PlantUML 利用に必要
  ];

  home.file = {
    ".gitconfig".source = git/.gitconfig;
    ".bashrc".source = bash/.bashrc;
    ".profile".source = bash/.profile;
  };

  programs.home-manager.enable = true;
}
