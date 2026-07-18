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

  PackageUserInputSchema = {
    _
    | doc "WinGet pacakage ID. e.g. Microsoft.VisualStudioCode"
    | String,
  },
}
