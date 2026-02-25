{
  pkgs,
  hostPlatform,
  ...
}:
{
  nixpkgs = {
    inherit hostPlatform;
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (pkgs.lib.getName pkg) [
        "slack"
      ];
  };
}
