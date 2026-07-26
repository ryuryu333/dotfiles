{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = [
      (pkgs.callPackage ./package.nix { })
    ];
    settings = {
      editor = "code --wait";
      accessible_prompter = "enabled";
      spinner = "disabled";
      git_protocol = "ssh";
    };
  };
}
