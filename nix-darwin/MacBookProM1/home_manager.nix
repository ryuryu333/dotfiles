{
  pkgs,
  user,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${user} = {
    imports = [
      ../../home-manager/home/common.nix
      ../../home-manager/home/mac.nix
    ];
  };
}
