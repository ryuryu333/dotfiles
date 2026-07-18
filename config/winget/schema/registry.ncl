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
}
