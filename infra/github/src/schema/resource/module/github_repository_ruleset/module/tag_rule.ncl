let contract_util = import "../../../../../util/contract.ncl",
in
{
  TagRulesSchema = {
    deletion
      | Bool
      | optional,
    update
      | Bool
      | optional,
  },
}
