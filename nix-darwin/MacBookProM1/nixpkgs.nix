{
  lib,
  hostPlatform,
  ...
}:
{
  nixpkgs = {
    inherit hostPlatform;
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "slack"
      ];
  };
}
