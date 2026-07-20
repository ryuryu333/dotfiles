let { SingleElementArray } = import "../../../util/contract.ncl",
in
{
  GithubRepositoryRulesetSchema = {
    repository | String,
    name | String,
    target
      | [| 'branch, 'tag, 'push |],
    enforcement
      | std.contract.Equal 'active
      | default
      = 'active,
    conditions
      | Array {
        ref_name
          | Array {
            "include" | Array String,
            "exclude" | Array String,
          }
          | SingleElementArray,
      }
      | SingleElementArray,
    rules
      | Array {
        deletion | Bool,
        non_fast_forward | Bool,
      }
      | SingleElementArray,
  },
}
