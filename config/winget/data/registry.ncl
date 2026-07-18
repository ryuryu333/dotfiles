let { HKCURegistryUserInputSchema, .. } = import "../schema/registry.ncl",
in
{
  registries
    | HKCURegistryUserInputSchema
    = {
      AppsUseLightTheme.DWord = 0,
      SystemUsesLightTheme.DWord = 0,
    },
}
