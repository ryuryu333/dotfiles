let
  { ResourceSchema = resource_schema, .. } = import "resource.ncl",
  schema = "https://raw.githubusercontent.com/PowerShell/DSC/main/schemas/2023/08/config/document.json",
  identifier = "dscv3",
in
{
  WinGetSchema = {
    "$schema"
      | std.contract.Equal schema
      | default = schema,
    metadata.winget.processor.identifier
      | std.contract.Equal identifier
      | default = identifier,
    resources
      | Array resource_schema,
  },
}
