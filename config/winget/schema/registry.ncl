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

  HKCURegistryUserInputSchema = {
    _ | {
      _
      | doc "Registry type & value e.g. DWord = 0"
      | Dyn,
    }
    | doc "Registry name e.g. AppsUseLightTheme"
  },
}
