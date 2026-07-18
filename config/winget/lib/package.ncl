let {
  PackageResourceSchema = package_resource_schema,
  PackageUserInputSchema = package_user_input_schema,
  ..
} = import "../schema/package.ncl",
in
{
  to_resources
    | package_user_input_schema -> { _ : package_resource_schema }
    = fun packages =>
      packages
      |> std.record.map (fun resource_name id =>
        {
          name = resource_name,
          properties.id = id,
        }
      ),
}
