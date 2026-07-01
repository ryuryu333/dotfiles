{
  self,
  user,
  hostPlatform,
  ...
}:
{
  imports = [
    ./module/base.nix
    ./module/nixpkgs.nix
    ./module/homebrew.nix
    ./module/home_manager.nix
    ./module/system.nix
  ];
}
