let contract_util = import "../../../../../util/contract.ncl",
in
{
  BranchRulesSchema = {
    creation
      | Array {}
      | contract_util.SingleElementArray,
  },
}
