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
    | hkcu_registry_user_input_schema -> { _ : registry_resource_schema }
    = fun registries =>
      registries
      |> std.record.map (fun field_name value_data =>
        {
          name = field_name,
          properties = {
            keyPath = key_path,
            valueName = field_name,
            valueData = value_data,
          },
        }
      ),
}
