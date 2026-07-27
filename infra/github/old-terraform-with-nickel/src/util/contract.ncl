{
  allowedValues : Array Dyn -> Dyn = fun allowed_vales =>
    std.contract.from_predicate (fun value =>
      std.array.elem value allowed_vales
    ),
}
