{ config, pkgs, nix-versions, ... }:

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
  ]
  ++ [
    nix-versions.packages.${pkgs.system}.nix-versions
  ];

  xdg.configFile = {
    "git/config".source = ../git/.gitconfig;
  };

  nix.registry = {
    templates = {
      from = { type = "indirect"; id = "templates"; };
      to = { type = "github"; owner = "ryuryu333"; repo = "nix_template"; };
    };
  };
}
