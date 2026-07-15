{ config, pkgs, lazynix, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.packages = with pkgs; [
    devenv
    jq # JSONデータを操作
    openjdk # java PlantUML 利用に必要
    graphviz # PlantUML 利用に必要
    docker
    colima # for docker
  ];

  # 将来的には system manager で起動シェルを zsh にしたい
  xdg.configFile."bash/profile".text = ''
    if [[ $- == *i* ]] \
      && [[ "''${SHLVL:-0}" -eq 1 ]] \
      && [[ -n "''${WSL_DISTRO_NAME:-}" ]] \
      && [[ -x "$HOME/.nix-profile/bin/zsh" ]]; then
      exec "$HOME/.nix-profile/bin/zsh"
    fi
  '';

  home.file.".profile".text = ''
    if [ -n "''${BASH_VERSION:-}" ]; then
      source "''${XDG_CONFIG_HOME:-$HOME/.config}/bash/profile"
    fi
  '';
  
  # manual command
  # for colima usage (for docker)
  # sudo usermod -aG kvm $USER
  # sudo apt install uidmap
}
