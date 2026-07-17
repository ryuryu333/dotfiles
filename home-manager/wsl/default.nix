{ pkgs, user, ... }:
{
  home.username = user;
  home.homeDirectory = "/home/${user}";
  
  home.sessionVariables = {
    DOCKER_HOST = "unix:///run/user/1000/docker.sock";
  };

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
