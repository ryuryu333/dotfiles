{
  user,
  home,
  modulePaths,
  nix-versions,
  llm-agents,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit
      modulePaths
      nix-versions
      llm-agents
      user
      home
      ;
  };
  home-manager.users.${user} = {
    imports = [
      modulePaths.homeManager
      (modulePaths.homeManager + /mac)
    ];
  };
}
