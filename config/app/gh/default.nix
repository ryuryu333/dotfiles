{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = [
      (pkgs.callPackage ./package.nix { })
    ];
    settings.git_protocol = "https";
  };
}
