{
  config,
  pkgs,
  nix-versions,
  user,
  home,
  ...
}:
{
  imports = [
    ./module/base.nix
    ./module/nixconf.nix
    ./module/app.nix
  ];
}
