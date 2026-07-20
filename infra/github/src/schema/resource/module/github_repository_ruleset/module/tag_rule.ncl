let contract_util = import "../../../../../util/contract.ncl",
in
{
  TagRulesSchema = {
    creation
      | Array {}
      | contract_util.SingleElementArray,
  },
}
