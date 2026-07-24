{
  set_priority_1_top_field
    : { _ : Dyn } -> { _ : Dyn }
    = fun record =>
      record
        |> std.record.to_array
        |> std.array.map (fun field =>
          {
            "%{field.field}" | priority 1 = field.value,
          }
        )
        |> std.record.merge_all,

  set_priority_2_top_field
    : { _ : Dyn } -> { _ : Dyn }
    = fun record =>
      record
        |> std.record.to_array
        |> std.array.map (fun field =>
          {
            "%{field.field}" | priority 2 = field.value,
          }
        )
        |> std.record.merge_all,

  set_priority_3_top_field
    : { _ : Dyn } -> { _ : Dyn }
    = fun record =>
      record
        |> std.record.to_array
        |> std.array.map (fun field =>
          {
            "%{field.field}" | priority 3 = field.value,
          }
        )
        |> std.record.merge_all,
}
