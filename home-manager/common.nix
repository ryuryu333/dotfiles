{ config, pkgs, nix-versions, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
  
  xdg.enable = true;

  home.packages = with pkgs; [
    git
    nixfmt
    tree # ディレクトリ構造を表示
    go-task # task runner
  ]
  ++ [
    nix-versions.packages.${pkgs.stdenv.hostPlatform.system}.nix-versions
  ];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  imports = [
    ../app-config/zsh/common.nix
  ];

  xdg.configFile = {
    "git/config".source = ../app-config/git/.gitconfig;
  };

  nix.registry = {
    templates = {
      from = { type = "indirect"; id = "templates"; };
      to = { type = "github"; owner = "ryuryu333"; repo = "nix_template"; };
    };
  };
}
