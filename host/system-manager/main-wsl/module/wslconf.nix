{ ... }:
{
  config.environment.etc."wsl.conf" = {
    text = builtins.readFile ./wsl/wsl.conf;
    replaceExisting = true;
  };
}
