let contract_util = import "../../../../../util/contract.ncl",
in
{
  BranchRulesSchema = {
    deletion
      | Bool
      | optional,
    nonFastForward
      | Bool
      | optional,
    requiredLinearHistory
      | Bool
      | optional,
    requiredLinearHistory
      | Bool
      | optional,
    pull_request | {
      allowed_merge_methods
        | Array [| 'merge, 'squash, 'rebase ||]
        | optional,
    }
    | optional,
  },
}
