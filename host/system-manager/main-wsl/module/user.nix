{
  pkgs,
  user,
  home,
  ...
}:
{
  users.groups.${user}.gid = 1000;

  users.users.${user} = {
    uid = 1000;
    isNormalUser = true;
    group = user;
    inherit home;
    createHome = false; # WSL により作成済み想定
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
