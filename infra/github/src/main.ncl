let
  data = import "data/repository.ncl",
  lib = import "src/lib/repository.ncl",
  base = import "data/base.ncl",
in
let record_of_repositories =
  data
  |> std.record.map_values (fun group =>
    group
    & {
      repositories | force =
        group.repositories
        |> lib.set_name_from_fieldname
        |> std.record.values
    }
  ),
in
let output =
  record_of_repositories
  |> std.record.map_values (fun group =>
    group & base
  )
  |> std.record.values
in
output
