let contract_util = import "../../../../../util/contract.ncl",
in
{
  PushRulesSchema = {
    file_path_restriction
      | Array {
        restricted_file_paths | Array String,
      }
      | contract_util.SingleElementArray,
  },
}
