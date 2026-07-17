let { PackageResourceSchema } = import "package.ncl" in
{
  WinGetSchema = {
    "$schema"
      | String,
      | default = "https://raw.githubusercontent.com/PowerShell/DSC/main/schemas/2023/08/config/document.json",
    metadata.winget.processor.identifier
      | String,
      | default = dscv3,
    resources
      | Array PackageResourceSchema
  },
}
