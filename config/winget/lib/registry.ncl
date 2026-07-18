let
  { HKCURegistryUserInputSchema, RegistryResourceSchema, .. } = import "../schema/registry.ncl",
  key_path = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
in
{
  to_resources
    | HKCURegistryUserInputSchema -> Array RegistryResourceSchema
    = fun registries =>
      registries
      |> std.record.to_array
      |> std.array.map (fun registry => {
        name = registry.field,
        properties = {
          keyPath = key_path,
          valueName = registry.field,
          valueData = registry.value,
        },
      }),
}
