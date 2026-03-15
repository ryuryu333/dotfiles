{
  user,
  nix-versions,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit nix-versions;
  };
  home-manager.users.${user} = {
    imports = [
      ../../home-manager/home/common.nix
      ../../home-manager/home/mac.nix
    ];
  };
}
