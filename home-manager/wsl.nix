{ config, pkgs, lazynix, ... }:

{
  home.username = "ryu";
  home.homeDirectory = "/home/ryu";

  home.packages = with pkgs; [
    docker
    colima # for docker
  ];

  # 将来的には system manager で起動シェルを zsh にしたい
  home.file.".profile".text = ''
    if [[ $- == *i* ]] \
      && [[ "''${SHLVL:-0}" -eq 1 ]] \
      && [[ -n "''${WSL_DISTRO_NAME:-}" ]] \
      && [[ -x "$HOME/.nix-profile/bin/zsh" ]]; then
      exec "$HOME/.nix-profile/bin/zsh"
    fi
  '';
  
  # manual command
  # for colima usage (for docker)
  # sudo usermod -aG kvm $USER
  # sudo apt install uidmap
}
