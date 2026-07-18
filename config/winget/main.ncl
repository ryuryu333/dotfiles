let
  package_data = import "data/package.ncl",
  registry_data = import "data/registry.ncl",
  package_lib = import "lib/package.ncl",
  registry_lib = import "lib/registry.ncl",
  resource_schema = import "schema/resource.ncl",
  winget_schema = import "schema/winget.ncl",
in
let integrated_resources
  | Array resource_schema.ResourceSchema
  =
    (package_data.packages |> package_lib.to_resources)
    & (registry_data.registries |> registry_lib.to_resources)
    |> std.record.to_array
    |> std.array.map (fun resource => resource.value),
in
let configuration
  | winget_schema.WinGetSchema
  = {
    resources = integrated_resources,
  },
in
configuration
