let util = import "util/contract.ncl",
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
      | {
        allowed_merge_methods
          | Array String
          | util.allowedValues ["merge", "squash", "rebase"]
          | optional,
      }
      | optional,
  },
}
