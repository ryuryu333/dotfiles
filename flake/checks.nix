{ self }:
{
  x86_64-linux.wsl = self.systemConfigs.main_wsl;

  aarch64-darwin.mac = self.darwinConfigurations.MacBook.system;
}
