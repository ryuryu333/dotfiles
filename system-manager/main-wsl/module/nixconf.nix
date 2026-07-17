{ hostPlatform, ... }:
{
  config = {
    nixpkgs.hostPlatform = hostPlatform;

    environment.etc."nix/nix.custom.conf".text = builtins.readFile ../../../app-config/nix/wsl/custom.conf;
  };
}
