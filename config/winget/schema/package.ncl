let
  { ResourceSchema = resource_schema, .. } = import "resource.ncl",
  type = "Microsoft.WinGet/Package",
  source = "winget",
  useLatest = true,
in
{
  PackageResourceSchema = resource_schema & {
    type
      | std.contract.Equal type
      | default = type,
    name
      | String,
    properties | {
      id
        | String,
      source
        | std.contract.Equal source
        | default = source,
      useLatest
        | std.contract.Equal useLatest
        | default = useLatest,
    },
  },

  PackageUserInputSchema
    | doc "WinGet package ID. e.g. Microsoft.VisualStudioCode"
    = {
      _ : String
    },
}
