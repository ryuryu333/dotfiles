{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    git
    direnv
    nix-direnv
    nixfmt
    tree # ディレクトリ構造を表示
    go-task # task runner
  ];

  home.file = {
    ".gitconfig".source = ../git/.gitconfig;
  };
}
