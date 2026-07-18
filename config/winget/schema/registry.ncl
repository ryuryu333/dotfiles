let
  { ResourceSchema, .. } = import "resource.ncl",
  reg_type = "Microsoft.Windows/Registry",
in
{
  RegistryResourceSchema =
    ResourceSchema
    & {
      type
        | std.contract.Equal reg_type
        | default
        = reg_type,
      name
        | String,
      properties
        | {
          keyPath
            | String,
          valueName
            | String,
          valueData
            | Dyn,
        },
    },

  HKCURegistryUserInputSchema
    | doc "Registry name, type & value. e.g. AppsUseLightTheme.DWord = 0"
    =
      {
        _ : { _ : Dyn }
      },
}
