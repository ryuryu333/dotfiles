let
  { HKCURegistryUserInputSchema, RegistryResourceSchema, .. } =
    import "../schema/registry.ncl",
  key_path = "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize",
in
{
  to_resources
    | HKCURegistryUserInputSchema -> { _ : RegistryResourceSchema }
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
