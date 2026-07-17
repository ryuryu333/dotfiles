{
  user,
  home,
  modulePaths,
  nix-versions,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = {
      inherit modulePaths nix-versions user home;
    };
    users.${user} = {
      imports = [
        modulePaths.homeManager
        (modulePaths.homeManager + /wsl)
      ];
    };
  };
}
