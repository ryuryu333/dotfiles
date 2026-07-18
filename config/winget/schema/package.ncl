let
  type = "Microsoft.WinGet/Package",
  source = "winget",
  useLatest = true,
in
{
  PackageResourceSchema = {
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
