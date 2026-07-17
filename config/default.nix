{
  self,
  home-manager,
  system-manager,
  nix-darwin,
  nix-homebrew,
  nix-versions,
}:
let
  modulePaths = {
    appConfig = ./app;
    homeManager = ./user/home-manager;
  };
  my_pc = {
    # Main desktop PC, Windows 11, WSL (Ubuntu 22.04.5 LTS)
    wsl = {
      hostPlatform = "x86_64-linux";
      user = "ryu";
      hostname = "main";
      home = "/home/ryu";
    };
    # MacBook Pro M1
    mac = {
      hostPlatform = "aarch64-darwin";
      user = "ryu";
      hostname = "MacBook"; # home-manger 単独の時：MacBook.local
      home = "/Users/ryu";
    };
  };
in
{
  systemConfigs = {
    main_wsl = system-manager.lib.makeSystemConfig {
      specialArgs = {
        inherit (my_pc.wsl) user hostPlatform home;
        inherit modulePaths nix-versions;
      };
      modules = [
        ./host/system-manager/main-wsl
        home-manager.nixosModules.home-manager
      ];
    };
  };

  darwinConfigurations = {
    # MacBook Pro M1
    "${my_pc.mac.hostname}" = nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit self modulePaths nix-versions;
        inherit (my_pc.mac) user hostPlatform home;
      };
      modules = [
        ./host/nix-darwin/main-mac
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
      ];
    };
  };
}
