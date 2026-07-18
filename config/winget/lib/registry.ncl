let
  {
    HKCURegistryUserInputSchema = hkcu_registry_user_input_schema,
    RegistryResourceSchema = registry_resource_schema,
    ..
  } = import "../schema/registry.ncl",
  key_path = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
in
{
  to_resources
    | hkcu_registry_user_input_schema -> Array registry_resource_schema
    = fun registries =>
      registries
      |> std.record.to_array
      |> std.array.map (fun registry =>
        {
          name = registry.field,
          properties = {
            keyPath = key_path,
            valueName = registry.field,
            valueData = registry.value,
          },
        }
      ),
}
