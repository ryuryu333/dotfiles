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
    ./module/alias.nix
    ./module/base.nix
    ./module/nixconf.nix
    ./module/app.nix
  ];
}
