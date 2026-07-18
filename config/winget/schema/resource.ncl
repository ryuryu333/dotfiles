let
  { PackageResourceSchema, .. } = import "package.ncl",
  { RegistryResourceSchema, .. } = import "registry.ncl",
in
{
  ResourceSchema = std.contract.any_of [
    PackageResourceSchema,
    RegistryResourceSchema,
  ],
}
