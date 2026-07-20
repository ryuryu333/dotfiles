{
  SingleElementArray =
    std.contract.from_predicate (fun value =>
      std.is_array value
      && std.array.length value == 1
    ),
}
