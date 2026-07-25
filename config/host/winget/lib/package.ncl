let { PackageResourceSchema, PackageUserInputSchema, .. } = import "../schema/package.ncl",
in
{
  to_resources
    | PackageUserInputSchema -> { _ : PackageResourceSchema }
    = fun packages =>
      packages
      |> std.record.map (fun field_name package_id =>
        {
          name = field_name,
          properties.id = package_id,
        }
      ),
}
