let
  { PackageResourceSchema, .. } = import "package.ncl",
in
{
  ResourceSchema = PackageResourceSchema,
}