let
  type = "Microsoft.Windows/Registry",
in
{
  RegistryResourceSchema = {
    type
      | std.contract.Equal type
      | default = type,
    name
      | String,
    properties | {
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
    = {
      _ : { _ : Dyn }
    },
}
