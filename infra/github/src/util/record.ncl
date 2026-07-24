{
  merge_record_values
    | { _ : { _ : Dyn } } -> { _ : Dyn }
    = fun input =>
      input
        |> std.record.values
        |> std.record.merge_all,

  set_priority_negative_1_top_field
    : { _ : Dyn } -> { _ : Dyn }
    = fun record =>
      record
        |> std.record.to_array
        |> std.array.map (fun field =>
          {
            "%{field.field}" | priority -1 = field.value,
          }
        )
        |> std.record.merge_all,

  set_priority_negative_2_top_field
    : { _ : Dyn } -> { _ : Dyn }
    = fun record =>
      record
        |> std.record.to_array
        |> std.array.map (fun field =>
          {
            "%{field.field}" | priority -2 = field.value,
          }
        )
        |> std.record.merge_all,
}
