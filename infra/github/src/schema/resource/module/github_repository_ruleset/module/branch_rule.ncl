let contract_util = import "../../../../../util/contract.ncl",
in
{
  BranchRulesSchema = {
    deletion
      | Bool
      | optional,
    non_fast_forward
      | Bool
      | optional,
    required_linear_history
      | Bool
      | optional,
    pull_request
      | Array {
        allowed_merge_methods
          | Array [| 'merge, 'squash, 'rebase |]
          | optional,
      }
      | contract_util.SingleElementArray
      | optional,
  },
}
