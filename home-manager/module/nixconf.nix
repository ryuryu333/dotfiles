{ pkgs, ... }:
{
  nix.package = pkgs.nix;

  nix.settings = {
    extra-substituters = [ "https://cache.numtide.com" ];
    extra-trusted-public-keys = [
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
    ];
  };

  nix.registry = {
    templates = {
      from = {
        type = "indirect";
        id = "templates";
      };
      to = {
        type = "github";
        owner = "ryuryu333";
        repo = "nix_template";
      };
    };
  };
}
