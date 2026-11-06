{
  set_name_from_fieldname
    | { _ : { name | optional, .. } } -> { _ : { name | String, .. } }
    = fun input =>
      input
      |> std.record.map (fun field_name value =>
        value
        & { name | default = field_name, }
      ),
}
