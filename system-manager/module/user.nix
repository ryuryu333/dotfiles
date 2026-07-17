{ pkgs, ... }:
{
  users.groups.ryu.gid = 1000;

  users.users.ryu = {
    uid = 1000;
    isNormalUser = true;
    group = "ryu";
    home = "/home/ryu";
    createHome = false;
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
