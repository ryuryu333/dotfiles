let { HKCURegistryUserInputSchema = hkcu_registry_user_input_schema, .. } =
  import "../schema/registry.ncl",
in
{
  registries
    | hkcu_registry_user_input_schema
    = {
      AppsUseLightTheme.DWord = 0,
      SystemUsesLightTheme.DWord = 0,
    },
}
