{
  user,
  home,
  modulePaths,
  nix-versions,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit modulePaths nix-versions user home;
  };
  home-manager.users.${user} = {
    imports = [
      modulePaths.homeManager
      (modulePaths.homeManager + /mac)
    ];
  };
}
