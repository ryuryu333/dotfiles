{
  user,
  home,
  nix-versions,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = {
      inherit nix-versions user home;
    };
    users.${user} = {
      imports = [
        ../../home-manager
        ../../home-manager/wsl
      ];
    };
  };
}
