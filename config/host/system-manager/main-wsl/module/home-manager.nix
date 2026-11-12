{
  user,
  home,
  modulePaths,
  nix-versions,
  llm-agents,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    extraSpecialArgs = {
      inherit
        modulePaths
        nix-versions
        llm-agents
        user
        home
        ;
    };
    users.${user} = {
      imports = [
        modulePaths.homeManager
        (modulePaths.homeManager + /wsl)
      ];
    };
  };
}
