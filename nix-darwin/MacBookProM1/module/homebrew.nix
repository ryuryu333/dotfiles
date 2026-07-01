{
  user,
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    inherit user;
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    inherit user;
    onActivation = {
      cleanup = "uninstall";
      upgrade = true;
      autoUpdate = false;
    };
    global.autoUpdate = false;
    brews = [
    ];
    casks = [
      "linearmouse"
      "elecom-mouse-util"
      "discord"
      "visual-studio-code"
    ];
  };
}
