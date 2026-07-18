let {
  PackageResourceSchema = package_resource_schema,
  PackageUserInputSchema = package_user_input_schema,
  ..
} = import "../schema/package.ncl",
in
{
  to_resources
    | package_user_input_schema -> Array package_resource_schema
    = fun packages =>
      packages
      |> std.record.to_array
      |> std.array.map (fun package =>
        {
          name = package.field,
          properties.id = package.value,
        }
      ),
}
