let
  { ResourceSchema, .. } = import "resource.ncl",
  pkg_type = "Microsoft.WinGet/Package",
  pkg_source = "winget",
  pkg_use_latest = true,
in
{
  PackageResourceSchema =
    ResourceSchema
    & {
      type
        | std.contract.Equal pkg_type
        | default
        = pkg_type,
      name
        | String,
      properties
        | {
          id
            | String,
          source
            | std.contract.Equal pkg_source
            | default
            = pkg_source,
          useLatest
            | std.contract.Equal pkg_use_latest
            | default
            = pkg_use_latest,
        },
    },

  PackageUserInputSchema
    | doc "WinGet package ID. e.g. Microsoft.VisualStudioCode"
    =
      {
        _ : String
      },
}
