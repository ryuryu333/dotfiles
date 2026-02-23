{
  pkgs,
  system,
  ...
}:
{
  nixpkgs = {
    hostPlatform = system;
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (pkgs.lib.getName pkg) [
        "slack"
      ];
  };
}
