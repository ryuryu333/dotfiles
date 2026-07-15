{
  user,
  nix-versions,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit nix-versions user;
  };
  home-manager.users.${user} = {
    imports = [
      ../../../home-manager
      ../../../home-manager/mac
    ];
  };
}
