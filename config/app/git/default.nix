{ modulePaths, ... }:
{
  imports = [
    ./base.nix
    modulePaths.gitEmail
  ];
}
