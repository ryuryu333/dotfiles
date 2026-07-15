{ self }:
{
  x86_64-linux.wsl = self.homeConfigurations."ryu@main".activationPackage;

  aarch64-darwin.mac = self.darwinConfigurations.MacBook.system;
}
