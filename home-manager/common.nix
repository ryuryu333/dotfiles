{ config, pkgs, nix-versions, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "26.05";

  xdg.enable = true;

  home.packages = with pkgs; [
    nixfmt
    tree # ディレクトリ構造を表示
    go-task # task runner
    jq # JSONデータを操作
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
    ../app-config
  ];

  nix.registry = {
    templates = {
      from = { type = "indirect"; id = "templates"; };
      to = { type = "github"; owner = "ryuryu333"; repo = "nix_template"; };
    };
  };
}
