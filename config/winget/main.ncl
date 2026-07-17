let packages = import "data/package.ncl" in
let build_package_resources = import "lib/package.ncl" in
{
  "$schema" = "https://raw.githubusercontent.com/PowerShell/DSC/main/schemas/2023/08/config/document.json",
  metadata = {
    winget = {
      processor = {
        identifier = "dscv3",
      },
    },
  },
  resources = build_package_resources packages,
}
