{ config, pkgs, nix-versions, ... }:
{
  imports = [
    ./module/base.nix
    ./module/nixconf.nix
    ./module/app.nix
  ];
}
