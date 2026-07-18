let
  { PackageResourceSchema, PackageUserInputSchema, .. } = import "../schema/package.ncl",
in
{
  to_resources
    | PackageUserInputSchema -> Array PackageResourceSchema
    = fun packages =>
      packages
      |> std.record.to_array
      |> std.array.map (fun package => {
        name = package.field,
        properties.id = package.value,
      }),
}
