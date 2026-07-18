let
  { PackageResourceSchema = package_resource_schema, .. } = import "package.ncl",
  { RegistryResourceSchema = registry_resource_schema, .. } = import "registry.ncl",
in
{
  ResourceSchema = std.contract.any_of [
    package_resource_schema,
    registry_resource_schema,
  ],
}
