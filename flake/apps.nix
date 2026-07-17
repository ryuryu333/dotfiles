{
  nixpkgs,
  system-manager,
}:
{
  x86_64-linux.system_manager =
    let
      sm_pkg = system-manager.packages.x86_64-linux.default;
      sm_bin = nixpkgs.lib.getExe' sm_pkg "system-manager";
    in
    {
      type = "app";
      program = sm_bin;
    };
}
