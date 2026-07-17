{ pkgs, user, ... }:
{
  home.username = user;
  home.homeDirectory = "/home/${user}";

  # 将来的には system manager で起動シェルを zsh にしたい
  home.file.".profile".text = ''
    if [[ $- == *i* ]] \
      && [[ "''${SHLVL:-0}" -eq 1 ]] \
      && [[ -n "''${WSL_DISTRO_NAME:-}" ]] \
      && [[ -x "$HOME/.nix-profile/bin/zsh" ]]; then
      exec "$HOME/.nix-profile/bin/zsh"
    fi
  '';
}
