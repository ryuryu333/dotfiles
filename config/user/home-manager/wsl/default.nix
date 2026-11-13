{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # VSCode 拡張 Claude Code に必要、将来的には削除検討
    bubblewrap
    socat
  ];

  home.sessionVariables = {
    DOCKER_HOST = "unix:///run/user/1000/docker.sock";
  };
}
