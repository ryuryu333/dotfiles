{
  hostPlatform,
  modulePaths,
  ...
}:
{
  config = {
    nixpkgs.hostPlatform = hostPlatform;

    environment.etc."nix/nix.custom.conf".text =
      builtins.readFile (modulePaths.appConfig + /nix/wsl/custom.conf);
  };
}
